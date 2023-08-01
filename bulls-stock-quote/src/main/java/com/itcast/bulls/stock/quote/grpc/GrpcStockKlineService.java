package com.itcast.bulls.stock.quote.grpc;

import com.itcast.bull.stock.common.service.utils.BeanAssistant;
import com.itcast.bulls.stock.common.utils.GlobalConstants;
import com.itcast.bulls.stock.entity.quote.TradeStockKline;
import com.itcast.bulls.stock.quote.repository.trade.TradeStockKlineRepository;
import com.itcast.bulls.stock.struct.grpc.quote.GetKlineReponse;
import com.itcast.bulls.stock.struct.grpc.quote.GetKlineRequest;
import com.itcast.bulls.stock.struct.grpc.quote.KlineData;
import com.itcast.bulls.stock.struct.grpc.quote.StockKlineServiceGrpc;
import io.grpc.stub.StreamObserver;
import lombok.extern.log4j.Log4j2;
import net.devh.boot.grpc.server.service.GrpcService;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * <p>Description: </p>
 * @date 
 * @author 
 * @version 1.0
 * <p>Copyright:Copyright(c)2020</p>
 */
@GrpcService
@Log4j2
public class GrpcStockKlineService extends StockKlineServiceGrpc.StockKlineServiceImplBase {

    /**
     * 行情K线的数据层接口
     */
    @Autowired
    TradeStockKlineRepository tradeStockKlineRepository;

    /**
     * 获取K线行情数据接口
     * @param request
     * @param responseObserver
     */
    @Override
    public void getKline(GetKlineRequest request, StreamObserver<GetKlineReponse> responseObserver) {
        log.info("Process in GrpcStockKlineService.getKline method. request: " + request);
        // 1. 根据股票代码以及时间范围, 获取K线数据
        List<TradeStockKline> klineList = tradeStockKlineRepository.findAllByStockCodeAndTimeBetween(request.getStockCode(),
                request.getTimeStart(), request.getTimeEnd());

        // 2. 将K线数据做遍历处理, 转换PB对象
        GetKlineReponse.Builder response = GetKlineReponse.newBuilder().setStatus(GlobalConstants.STATUS_OK);
        if(null != klineList && !klineList.isEmpty()) {
            klineList.stream().forEach(kline -> {
                // 数据对象转换
                KlineData.Builder klineData = KlineData.newBuilder();
                // 对象复制, 排除NULL属性, 避免封装与基础类型转换时报错, 例如: Long(null) -> long (不支持null)
                BeanAssistant.copyNotNullProps(kline, klineData);
                response.addKlineData(klineData.build());
            });
        }

        // 3. 将数据返回给GRPC调用客户端
        responseObserver.onNext(response.build());
        responseObserver.onCompleted();
    }
}
