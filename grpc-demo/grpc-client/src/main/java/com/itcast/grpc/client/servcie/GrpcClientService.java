package com.itcast.grpc.client.servcie;

import com.itcast.grpc.lib.StockServiceGrpc;
import com.itcast.grpc.lib.StockServiceReply;
import com.itcast.grpc.lib.StockServiceRequest;
import lombok.extern.log4j.Log4j2;
import net.devh.boot.grpc.client.inject.GrpcClient;
import org.springframework.stereotype.Service;

/**
 * <p>Description: </p>
 * @date 2019/12/23
 * @author 贺锟 
 * @version 1.0
 * <p>Copyright:Copyright(c)2019</p>
 */
@Service
@Log4j2
public class GrpcClientService {

    @GrpcClient("grpc-server")
    private StockServiceGrpc.StockServiceBlockingStub stockServiceBlockingStub;

    /**
     * 获取股票价格接口
     * @param name
     * @return
     */
    public String getStockPrice(String name) {
        try {
            //将远程调用的Grpc服务端接口信息, 返回给客户端。
            StockServiceRequest request  = StockServiceRequest.newBuilder().setName(name).build();
            final StockServiceReply response = stockServiceBlockingStub.getStockPrice(request);
            return response.getMessage();
        }catch (Exception e) {
            log.error(e.getMessage(), e);
            return "error! " + e.getMessage();
        }
    }

}
