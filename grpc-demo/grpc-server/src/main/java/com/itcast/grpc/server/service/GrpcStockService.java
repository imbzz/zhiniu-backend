package com.itcast.grpc.server.service;

import com.itcast.grpc.lib.StockServiceGrpc;
import com.itcast.grpc.lib.StockServiceReply;
import com.itcast.grpc.lib.StockServiceRequest;
import io.grpc.stub.StreamObserver;
import net.devh.boot.grpc.server.service.GrpcService;

import java.util.Random;

/**
 * <p>Description: </p>
 * @date 2019/12/23
 * @author 贺锟 
 * @version 1.0
 * <p>Copyright:Copyright(c)2019</p>
 */
@GrpcService
public class GrpcStockService extends StockServiceGrpc.StockServiceImplBase {

    /**
     * 获取指定股票的价格
     * @param request
     * @param responseObserver
     */
    @Override
    public void getStockPrice(StockServiceRequest request, StreamObserver<StockServiceReply> responseObserver) {
        String msg = "股票名称: " + request.getName() + ", 股票价格: " + (new Random().nextInt(100 - 20 ) + 20 );
        StockServiceReply reply = StockServiceReply.newBuilder().setMessage(msg).build();
        responseObserver.onNext(reply);
        responseObserver.onCompleted();
    }
}
