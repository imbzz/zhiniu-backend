package com.itcast.bulls.stock.position.grpc;

import com.itcast.bull.stock.common.service.utils.BeanAssistant;
import com.itcast.bulls.stock.common.utils.GlobalConstants;
import com.itcast.bulls.stock.entity.trade.TradePosition;
import com.itcast.bulls.stock.position.service.IStockPositionService;
import com.itcast.bulls.stock.struct.grpc.trade.GetAllPositionData;
import com.itcast.bulls.stock.struct.grpc.trade.GetAllPositionReponse;
import com.itcast.bulls.stock.struct.grpc.trade.GetAllPositionRequest;
import com.itcast.bulls.stock.struct.grpc.trade.StockPositionServiceGrpc;
import io.grpc.stub.StreamObserver;
import lombok.extern.log4j.Log4j2;
import net.devh.boot.grpc.server.service.GrpcService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.CacheManager;
import org.springframework.data.redis.core.RedisTemplate;

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
public class GrpcStockPositionService extends StockPositionServiceGrpc.StockPositionServiceImplBase {

    @Autowired
    private RedisTemplate redisTemplate;

    @Autowired
    private CacheManager cacheManager;

    @Autowired
    private IStockPositionService stockPositionService;


    /**
     * 获取所有持仓数据
     * @param request
     * @param responseObserver
     */
    @Override
    public void getAllPositions(GetAllPositionRequest request,
                                StreamObserver<GetAllPositionReponse> responseObserver) {
        log.info("Process in GrpcStockPositionService.getAllPositions method. ");
        GetAllPositionReponse reponse = null;
        try {

            // 1. 根据账户ID获取所有持仓数据
            List<TradePosition> positionList = stockPositionService.getAllPositions(request.getAccountId());
            GetAllPositionReponse.Builder reponseBuilder = GetAllPositionReponse.newBuilder();
            // 2. 对持仓数据做非空判断处理
            if(null != positionList) {
                positionList.forEach(pos -> {
                    // 3. 遍历持仓数据, 将持仓对象转成PB对象进行输出
                    GetAllPositionData.Builder positionData = GetAllPositionData.newBuilder();
                    BeanAssistant.copyNotNullProps(pos, positionData, new String[]{"execTime"});
                    positionData.setExecTime(pos.getExecTime().getTime());
                    reponseBuilder.addGetAllPositionData(positionData);
                });
            }

            reponse = reponseBuilder.build();
        }
        catch (Exception e) {
            // 系统异常信息返回
            log.error(e.getMessage(), e);
            reponse = GetAllPositionReponse.newBuilder().setStatus(GlobalConstants.STATUS_ERROR).setMessage(e.getMessage()).build();
        }

        responseObserver.onNext(reponse);
        responseObserver.onCompleted();
    }

}