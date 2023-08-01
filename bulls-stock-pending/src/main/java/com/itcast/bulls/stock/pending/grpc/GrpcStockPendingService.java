package com.itcast.bulls.stock.pending.grpc;

import com.itcast.bulls.stock.common.exception.ComponentException;
import com.itcast.bulls.stock.common.exception.constants.ApplicationErrorCodeEnum;
import com.itcast.bulls.stock.common.utils.GlobalConstants;
import com.itcast.bulls.stock.entity.quote.TradeStockQuoteLast;
import com.itcast.bulls.stock.pending.mq.PendingQuoteConsumer;
import com.itcast.bulls.stock.pending.service.IStockTradePendingService;
import com.itcast.bulls.stock.pending.vo.LimitPlaceOrderRequestVo;
import com.itcast.bulls.stock.struct.grpc.trade.*;
import io.grpc.stub.StreamObserver;
import lombok.extern.log4j.Log4j2;
import net.devh.boot.grpc.server.service.GrpcService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.cache.Cache;
import org.springframework.cache.CacheManager;
import org.springframework.data.redis.core.RedisTemplate;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.Iterator;
import java.util.List;
import java.util.stream.Collectors;

/**
 * <p>Description: </p>
 * @date 
 * @author 
 * @version 1.0
 * <p>Copyright:Copyright(c)2020</p>
 */
@GrpcService
@Log4j2
public class GrpcStockPendingService extends StockPendingServiceGrpc.StockPendingServiceImplBase {
    /**
     * Redis缓存操作模板
     */
    @Autowired
    private RedisTemplate redisTemplate;

    /**
     * Spring缓存管理器
     */
    @Autowired
    private CacheManager cacheManager;


    /**
     * 挂单服务的实现类
     */
    @Autowired
    private IStockTradePendingService stockTradePendingService;


    /**
     * 以端口作为负载区分标识
     */
    @Value("${server.port}")
    private String serverPort;

    /**
     *  将下单请求重新排序（按价格优先, 时间优先原则）
     * @param placeOrderRequestVoList
     * @param placeOrderRequestVo
     * @return
     */
    private static List<LimitPlaceOrderRequestVo> sortPlaceOrderRequestVoList(List<LimitPlaceOrderRequestVo> placeOrderRequestVoList) {

        return placeOrderRequestVoList.stream().sorted(Comparator.comparing(LimitPlaceOrderRequestVo::getExecPrice)
                .reversed().thenComparing(LimitPlaceOrderRequestVo::getExecTime))
                .collect(Collectors.toList());
    }

    /**
     *  限价下单接口的处理
     * @param request
     * @param responseObserver
     */
    @Override
    public void limitPlaceOrder(LimitPlaceOrderRequest request, StreamObserver<LimitPlaceOrderReponse> responseObserver) {
        // 限价下单的返回对象
        LimitPlaceOrderReponse reponse = null;
        try {
            // 1. 根据股票ID, 获取实时行情的报价信息
            TradeStockQuoteLast stockQuoteLast = stockTradePendingService.getTradeStockQuoteLast(request.getStockId());
            // 2. 创建委托挂单的请求VO参数对象
            LimitPlaceOrderRequestVo placeOrderRequestVo = new LimitPlaceOrderRequestVo();
            // 3. 将gRpc接口的参数信息复制到VO对象中
            BeanUtils.copyProperties(request, placeOrderRequestVo);
            // 4. 调用挂单服务接口, 创建保存订单信息
            stockTradePendingService.createTradeOrder(placeOrderRequestVo);
            // 5. 放入缓存队列, 等待订单的撮合处理
            String cacheKey = GlobalConstants.STOCK_PENDING_LIMIT_ORDER + ":" + serverPort;
            Cache cache = cacheManager.getCache(cacheKey);
            if(null != cache.get(request.getStockId())) {
                // 缓存当中已经存在股票产品的委托下单数据
                List<LimitPlaceOrderRequestVo> placeOrderRequestVoList = (List<LimitPlaceOrderRequestVo>)cache.get(request.getStockId()).get();
                // 按照价格优先, 时间优先的原则, 重新排列下单数据
                if(null == placeOrderRequestVo.getExecPrice()) {
                    placeOrderRequestVo.setExecPrice(0L);
                }
                if(null == placeOrderRequestVo.getExecTime()) {
                    placeOrderRequestVo.setExecTime(System.currentTimeMillis());
                }
                placeOrderRequestVoList.add(placeOrderRequestVo);
                placeOrderRequestVoList = sortPlaceOrderRequestVoList(placeOrderRequestVoList);
                // 更新缓存
                cache.put(request.getStockId(), placeOrderRequestVoList);
            }else{
                // 不存在, 将当前请求数据放入缓存
                List<LimitPlaceOrderRequestVo> placeOrderRequestVoList = new ArrayList<>();
                placeOrderRequestVoList.add(placeOrderRequestVo);
                cache.put(request.getStockId(), placeOrderRequestVoList);
            }

            reponse = LimitPlaceOrderReponse.newBuilder().setStatus(GlobalConstants.STATUS_OK).setMessage("挂单处理成功!")
                    .setOrderId(placeOrderRequestVo.getOrderId()).build();


        }catch (ComponentException e) {
            // 业务异常返回
            log.error(e.getMessage(), e);
            reponse = LimitPlaceOrderReponse.newBuilder().setStatus(e.getErrorCodeEnum().getCode()).setMessage(e.getErrorCodeEnum().getMessage()).build();
        } catch (Exception e) {
            // 系统异常信息返回
            log.error(e.getMessage(), e);
            reponse = LimitPlaceOrderReponse.newBuilder().setStatus(GlobalConstants.STATUS_ERROR).setMessage(e.getMessage()).build();
        }

        responseObserver.onNext(reponse);
        responseObserver.onCompleted();
    }


    /**
     * 用户撤单接口的处理
     * @param request
     * @param responseObserver
     */
    @Override
    public void recallOrder(RecallOrderRequest request, StreamObserver<RecallOrderResponse> responseObserver) {
        RecallOrderResponse response = null;
        try {

            // 1. 加锁处理, 防止队列缓存数据不一致问题
            synchronized (PendingQuoteConsumer.getLock(request.getStockId())) {
                // 2. 获取挂单服务对应缓存队列信息
                String cacheKey = GlobalConstants.STOCK_PENDING_LIMIT_ORDER + ":" + serverPort;
                Cache cache = cacheManager.getCache(cacheKey);
                if(null == cache) {
                    // 如果挂单缓存队列数据不存在, 订单已处理, 抛出异常提示信息
                    throw new ComponentException(ApplicationErrorCodeEnum.ORDER_HAS_PROCESSED);
                }

                // 3. 根据股票ID获取委托挂单信息的缓存操作对象
                Cache.ValueWrapper stockCache = cache.get(request.getStockId());
                if(null != stockCache && null != stockCache.get()) {
                    // 4. 获取委托挂单列表信息
                    List<LimitPlaceOrderRequestVo> placeOrderRequestVoList = (List<LimitPlaceOrderRequestVo>)stockCache.get();

                    // 5. 遍历挂单列表信息
                    boolean isModify = false;
                    for(Iterator<LimitPlaceOrderRequestVo> itr = placeOrderRequestVoList.iterator(); itr.hasNext();) {
                        // 6. 根据账户ID和订单ID匹配挂单信息, 如果匹配成功, 则进行清除
                        LimitPlaceOrderRequestVo placeOrder = itr.next();
                        if(placeOrder.getOrderId().equals(request.getOrderId()) && placeOrder.getAccountId().equals(request.getAccountId())) {
                            itr.remove();
                            isModify = true;
                            break;
                        }
                    }

                    // 7. 如果挂单队列发生了变更, 则需要更新缓存信息
                    if(isModify) {
                        cache.put(request.getStockId(), placeOrderRequestVoList);
                    }

                }

                // 8. 撤回数据库的订单信息
                stockTradePendingService.recallOrder(request);

            }

            response = RecallOrderResponse.newBuilder().setStatus(GlobalConstants.STATUS_OK)
                    .setMessage("撤单处理成功!").build();


        }catch (ComponentException e) {
            // 业务异常返回
            log.error(e.getMessage(), e);
            response = RecallOrderResponse.newBuilder().setStatus(e.getErrorCodeEnum().getCode()).setMessage(e.getErrorCodeEnum().getMessage()).build();
        } catch (Exception e) {
            // 系统异常信息返回
            log.error(e.getMessage(), e);
            response = RecallOrderResponse.newBuilder().setStatus(GlobalConstants.STATUS_ERROR).setMessage(e.getMessage()).build();
        }
        responseObserver.onNext(response);
        responseObserver.onCompleted();

    }
}
