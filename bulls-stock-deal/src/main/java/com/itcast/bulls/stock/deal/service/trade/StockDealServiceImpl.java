package com.itcast.bulls.stock.deal.service.trade;

import com.itcast.bulls.stock.common.exception.ComponentException;
import com.itcast.bulls.stock.common.exception.constants.ApplicationErrorCodeEnum;
import com.itcast.bulls.stock.common.math.MathUtils;
import com.itcast.bulls.stock.common.utils.GlobalConstants;
import com.itcast.bulls.stock.deal.dao.biz.ITradeAccountDao;
import com.itcast.bulls.stock.deal.dao.biz.ITradeStockDao;
import com.itcast.bulls.stock.deal.dao.trade.ITradeDealDao;
import com.itcast.bulls.stock.deal.dao.trade.ITradeOrderDao;
import com.itcast.bulls.stock.deal.dao.trade.ITradePositionDao;
import com.itcast.bulls.stock.entity.product.TradeStock;
import com.itcast.bulls.stock.entity.quote.TradeStockQuoteLast;
import com.itcast.bulls.stock.entity.trade.TradeDeal;
import com.itcast.bulls.stock.entity.trade.TradeOrder;
import com.itcast.bulls.stock.entity.trade.TradePosition;
import com.itcast.bulls.stock.entity.user.TradeAccount;
import com.itcast.bulls.stock.entity.user.TradeGroup;
import com.itcast.bulls.stock.struct.grpc.trade.PlaceOrderRequest;
import com.itcast.bulls.stock.struct.grpc.trade.StockFinanceServiceGrpc;
import com.itcast.bulls.stock.struct.grpc.trade.UpdateBalanceRequest;
import com.itcast.bulls.stock.struct.grpc.trade.UpdateBalanceResponse;
import io.seata.core.context.RootContext;
import io.seata.spring.annotation.GlobalTransactional;
import lombok.extern.log4j.Log4j2;
import net.devh.boot.grpc.client.inject.GrpcClient;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.cache.RedisCacheManager;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.swing.*;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.Map;

/**
 * <p>Description: </p>
 * @date 
 * @author 
 * @version 1.0
 * <p>Copyright:Copyright(c)2020</p>
 */
@Service
@Log4j2
public class StockDealServiceImpl implements IStockDealService {

    @Autowired
    private ITradeOrderDao tradeOrderDao;

    @Autowired
    private ITradeDealDao tradeDealDao;

    @Autowired
    private RedisCacheManager redisCacheManager;

    @Autowired
    private ITradeStockDao tradeStockDao;

    @Autowired
    private ITradeAccountDao tradeAccountDao;

    @Autowired
    private ITradePositionDao tradePositionDao;

    /**
     * 资金服务gRpc接口
     */
    @GrpcClient("grpc-finance-server")
    private StockFinanceServiceGrpc.StockFinanceServiceBlockingStub stockFinanceServiceBlockingStub;


    /**
     * 转换深度报价
     * @param quoteLast
     * @param direction
     * @return
     */
    private Map<Long, Long> cvtDeepOffer(TradeStockQuoteLast quoteLast, int direction ){

        Map<Long, Long> results = new LinkedHashMap<Long, Long>();
        if(direction == GlobalConstants.ORDER_DIRECTION_BUY) {
            // 买方向
            results.put(quoteLast.getPriceAsk1(), quoteLast.getVolumeAsk1());
            results.put(quoteLast.getPriceAsk2(), quoteLast.getVolumeAsk2());
            results.put(quoteLast.getPriceAsk3(), quoteLast.getVolumeAsk3());
            results.put(quoteLast.getPriceAsk4(), quoteLast.getVolumeAsk4());
            results.put(quoteLast.getPriceAsk5(), quoteLast.getVolumeAsk5());

        }else{
            // 卖方向
            results.put(quoteLast.getPriceBid1(), quoteLast.getVolumeBid1());
            results.put(quoteLast.getPriceBid2(), quoteLast.getVolumeBid2());
            results.put(quoteLast.getPriceBid3(), quoteLast.getVolumeBid3());
            results.put(quoteLast.getPriceBid4(), quoteLast.getVolumeBid4());
            results.put(quoteLast.getPriceBid5(), quoteLast.getVolumeBid5());
        }

        return results;
    }


    /**
     * 计算订单状态
     * @param needVolume
     * @param dealVolume
     * @return
     */
    private int calcOrderStatus(long initVolume, long dealVolume) {
        // 判断请求数量与实际成交数量
        if(initVolume == dealVolume) {
            // 相等， 则代表完全成交
            return GlobalConstants.ORDER_STATUS_ALL;
        }else if(initVolume > dealVolume) {
            // 如果请求数量大于实际成交数量， 代表部分成交
            return GlobalConstants.ORDER_STATUS_PART;
        } else{
            log.error("Process in GrpcStockDealService.calcOrderStatus method, error: dealVolume{} > initVolume{}", dealVolume, initVolume );
        }
        //  默认给予等待成交的状态
        return GlobalConstants.ORDER_STATUS_WAIT;
    }


    /**
     * 获取额度调整金额
     * @param direction
     * @return
     */
    private long getAdjustBalance(int direction, long amount) {
        if(direction == GlobalConstants.ORDER_DIRECTION_BUY) {
            return  -amount;
        }
        return amount;
    }



    private void savePosition(TradePosition tradePosition) {
        if(tradePosition.getId() != null) {
            tradePositionDao.update(tradePosition);
        }else {
            tradePositionDao.insert(tradePosition);
        }

    }


    /**
     * 检查请求价格是否匹配当前行情
     * @param request
     * @param quoteLast
     * @return
     */
    private boolean checkMatchPrice(PlaceOrderRequest request,TradeStockQuoteLast quoteLast) {
        if(request.getDirection() == GlobalConstants.ORDER_DIRECTION_BUY) {
            // 买方向， 请求价格大于第一档买盘价格
            if(request.getExecPrice() >= quoteLast.getPriceBid1()) {
                return true;
            }

        }else{
            // 卖方向， 请求价格小于等于第一档卖盘价格
            if(request.getExecPrice() <= quoteLast.getPriceAsk1()) {
                return true;
            }
        }
        return false;
    }

    /**
     * 处理市价单接口
     * @param request
     * @param quoteLast
     * @return
     * @throws ComponentException
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
//    @GlobalTransactional(timeoutMills = 5000)
    public TradeOrder processMarketOrder(PlaceOrderRequest request, TradeStockQuoteLast quoteLast) throws ComponentException {
        log.info("Start Global Transaction, XID = " + RootContext.getXID());
        // 1. 获取交易账户信息
        TradeAccount tradeAccount = tradeAccountDao.getById(request.getAccountId());

        // 2. 获取股票产品信息
        TradeStock tradeStock = tradeStockDao.getById(request.getStockId());

        // 3. 生成成交记录
        TradeDeal tradeDeal = generateTradeDeal(quoteLast, request, tradeAccount, tradeStock);

        // 4. 生成持仓信息
        TradePosition tradePosition = generatePosition(tradeDeal, request, tradeAccount, tradeStock);

        // 5. 保存订单信息
        TradeOrder tradeOrder = saveTradeOrder(tradeDeal, request, tradeAccount, tradeStock);

        // 6. 保存持仓记录
        savePosition(tradePosition);

        // 7. 保存成交记录, 记录订单ID和持仓仓位的ID信息
        tradeDeal.setTradeOrderId(tradeOrder.getId());
        tradeDeal.setPositionId(tradePosition.getId());
        tradeDealDao.insert(tradeDeal);
        return tradeOrder;
    }

    /**
     * 生成订单记录
     * @param tradeDeal
     * @param request
     * @param tradeAccount
     * @param tradeStock
     * @return
     */
    private TradeOrder saveTradeOrder(TradeDeal tradeDeal, PlaceOrderRequest request, TradeAccount tradeAccount, TradeStock tradeStock) {
        // 保存订单信息
        TradeOrder order = new TradeOrder();
        order.setDirection(request.getDirection());
        order.setStockId(request.getStockId());
        order.setStockCode(tradeStock.getCode());
        order.setStockName(tradeStock.getName());
        order.setAccountId(request.getAccountId());
        order.setAccountNo(tradeAccount.getAccountNo());
        order.setRequestPrice(request.getExecPrice());
        order.setExecPrice(tradeDeal.getExecPrice());
        order.setExecVolume(tradeDeal.getExecVolume());
        // 计算订单状态
        order.setStatus(calcOrderStatus(request.getExecVolume(), tradeDeal.getExecVolume()));
        order.setType(request.getType());
        order.setInitVolume(request.getExecVolume());
        order.setExecTime(new Date());
        // 保存订单记录
        tradeOrderDao.insert(order);
        return order;
    }

    /**
     * 生成并更新持仓记录信息
     * @param tradeDeal
     * @param request
     * @param tradeAccount
     * @param tradeStock
     * @return
     */
    private TradePosition generatePosition(TradeDeal tradeDeal, PlaceOrderRequest request, TradeAccount tradeAccount, TradeStock tradeStock) throws ComponentException{

        // 1. 根据交易账号ID和股票产品ID, 获取持仓记录
        TradePosition tradePosition = tradePositionDao.getByAccountIdAndStockId(request.getAccountId(), request.getStockId());
        if(request.getDirection() == GlobalConstants.ORDER_DIRECTION_BUY) {
            // 2. 买方向, 持仓处理逻辑实现
            if(null == tradePosition) {
                // 创建持仓记录, 组装仓位信息
                tradePosition = new TradePosition();
                tradePosition.setAccountId(request.getAccountId());
                tradePosition.setAccountNo(tradeAccount.getAccountNo());
                tradePosition.setStockId(request.getStockId());
                tradePosition.setStockCode(tradeStock.getCode());
                tradePosition.setStockName(tradeStock.getName());
                tradePosition.setStockMarket(tradeDeal.getStockMarket());
                tradePosition.setCostPrice(tradeDeal.getExecPrice());
                tradePosition.setAvgPrice(tradeDeal.getExecPrice());
                tradePosition.setVolume(tradeDeal.getExecVolume());
                // 默认采用股票CFD （T+0模式）
                tradePosition.setValidSellVolume(tradeDeal.getExecVolume());
                tradePosition.setExecTime(tradeDeal.getExecTime());
                tradePosition.setStatus(0);
            }else {
                // 仓位的合并更新处理
                // 更新成本价: (持仓成本价 * 持仓数量 + 本次成交均价 * 本次成交数量) / (持仓数量 + 本次成交数量)  == 总的成交金额 / 总的成交数量
                Long origiAmount = MathUtils.mul(tradePosition.getAvgPrice(), tradePosition.getVolume());
                Long curAmount = MathUtils.mul(tradeDeal.getExecPrice(), tradeDeal.getExecVolume());
                Long costPrice = MathUtils.divLong(MathUtils.add(origiAmount, curAmount), MathUtils.add(tradePosition.getVolume(), tradeDeal.getExecVolume()));
                tradePosition.setCostPrice(costPrice);
                // 更新成交均价:  (上一次成交均价 + 本次成交均价) / 2
                tradePosition.setAvgPrice(MathUtils.divLong(tradePosition.getAvgPrice() + tradeDeal.getExecPrice(), 2));
                tradePosition.setVolume(tradePosition.getVolume() + tradeDeal.getExecVolume());
                tradePosition.setValidSellVolume(tradePosition.getValidSellVolume() + tradeDeal.getExecVolume());
            }
        }else {
            // 3. 卖方向, 持仓处理逻辑
            if(null == tradePosition) {
                // 仓位为空， 直接抛出异常
                throw new ComponentException(ApplicationErrorCodeEnum.NO_STOCK_POSITION_DATA);
            }
            if(tradePosition.getValidSellVolume() < request.getExecVolume()) {
                // 可卖数量判断， 如果不充足， 抛出异常
                throw new ComponentException(ApplicationErrorCodeEnum.NO_ENOUGH_POSITION_VOLUME);
            }
            // 仓位合并处理
            // 更新成本价： (持仓成本价 * 持仓数量 - 本次成交均价 * 本次成交数量) / (持仓数量 - 本次成交数量)
            // 如果是足够多的盈利， 成本均价可以为负数
            Long origiAmount = MathUtils.mul(tradePosition.getAvgPrice(), tradePosition.getVolume());
            Long curAmount = MathUtils.mul(tradeDeal.getExecPrice(), tradeDeal.getExecVolume());
            Long costPrice = MathUtils.divLong(MathUtils.sub(origiAmount, curAmount), MathUtils.sub(tradePosition.getVolume(), tradeDeal.getExecVolume()));
            tradePosition.setCostPrice(costPrice);
            // 更新成交均价： (上一次成交均价 + 本次成交均价) / 2
            tradePosition.setAvgPrice(MathUtils.divLong(tradePosition.getAvgPrice() + tradeDeal.getExecPrice(), 2));

            tradePosition.setVolume(tradePosition.getVolume() - tradeDeal.getExecVolume());
            tradePosition.setValidSellVolume(tradePosition.getValidSellVolume() - tradeDeal.getExecVolume());
        }
        return tradePosition;
    }

    /**
     * 生成成交记录
     * @param quoteLast
     * @param request
     * @param tradeAccount
     * @param tradeStock
     * @return
     */
    private TradeDeal generateTradeDeal(TradeStockQuoteLast quoteLast, PlaceOrderRequest request,
                                        TradeAccount tradeAccount, TradeStock tradeStock) throws ComponentException {
        // 1. 转换报价的深度, 组装为有序的MAP集合
        Map<Long, Long> deepOffers = cvtDeepOffer(quoteLast, request.getDirection());
        // 2. 记录成交总价
        long amount = 0;
        // 3. 记录成交总数
        long volume = 0l;
        // 记录剩余成交数量, 初始化为请求数量
        long needVolume = request.getExecVolume();
        // 4. 逐个档位遍历, 计算成交总价与总数量
        for(Map.Entry<Long, Long> deepOffer: deepOffers.entrySet()) {
            // 当前档位能否满足成交量需要
            if(needVolume <= deepOffer.getValue()) {
                amount += needVolume * deepOffer.getKey();
                volume += needVolume;
                needVolume = 0;
                break;
            }
            // 当前档位不能满足成交量需要
            else {
                needVolume = needVolume - deepOffer.getValue();
                // 累加计算成交总价与总数
                amount += deepOffer.getKey() * deepOffer.getValue();
                volume += deepOffer.getValue();

            }
        }

        // 5. 生成成交记录信息
        TradeDeal deal = new TradeDeal();
        deal.setAccountId(request.getAccountId());
        deal.setAccountNo(tradeAccount.getAccountNo());
        deal.setStockId(request.getStockId());
        deal.setStockCode(tradeStock.getCode());
        deal.setStockName(tradeStock.getName());
        deal.setStockMarket(tradeStock.getMarketNo());
        deal.setExecVolume(Long.valueOf(volume).intValue());
        deal.setExecPrice(MathUtils.divLong(amount, volume));
        deal.setExecTime(new Date());
        deal.setDirection(request.getDirection());
        // 获取账户组信息， 计算佣金比例
        TradeGroup tradeGroup = tradeAccountDao.getTradeGroupByAccountId(request.getAccountId());
        deal.setCommission(MathUtils.calcCommission(amount, tradeGroup.getCommissionRate()));
        deal.setStatus(GlobalConstants.INT_ENABLE);

        // 更新账户资金
        UpdateBalanceRequest updateBalanceRequest = UpdateBalanceRequest.newBuilder()
                .setAdjustBalance(getAdjustBalance(request.getDirection(), amount+ deal.getCommission()))
                .setAccountId(request.getAccountId()).setXid(RootContext.getXID() == null ? "0" : RootContext.getXID() ).build();
        UpdateBalanceResponse updateBalanceResponse = stockFinanceServiceBlockingStub.updateAccountBalance(updateBalanceRequest);
        if(!GlobalConstants.STATUS_OK.equals(updateBalanceResponse.getStatus())) {
            log.warn("update account balance error ==> code: {}, msg: {}", updateBalanceResponse.getStatus(), updateBalanceResponse.getMessage());
            throw new ComponentException(ApplicationErrorCodeEnum.parseByCode(updateBalanceResponse.getStatus()));
        }

        return deal;
    }

    /**
     * <pre>
     * 获取订单详情接口
     * </pre>
     */
    @Override
    public TradeOrder getOrder(Long orderId) {

        return tradeOrderDao.getById(orderId);
    }
}
