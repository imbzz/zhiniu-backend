package com.itcast.bulls.stock.starter.grpc;

import com.alibaba.cloud.nacos.registry.NacosRegistration;
import com.alibaba.nacos.client.naming.NacosNamingService;
import io.grpc.internal.GrpcUtil;
import net.devh.boot.grpc.common.util.GrpcUtils;
import net.devh.boot.grpc.server.config.GrpcServerProperties;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.condition.ConditionalOnClass;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.context.annotation.Configuration;

import javax.annotation.PostConstruct;

/**
 * <p>Description: </p>
 * @date 
 * @author 
 * @version 1.0
 * <p>Copyright:Copyright(c)2020</p>
 */
@Configuration
@EnableConfigurationProperties
@ConditionalOnClass(NacosNamingService.class)
public class GrpcNacosConfiguration {

    @Autowired(required = true)
    private NacosRegistration nacosRegistration;

    @Autowired
    private GrpcServerProperties grpcServerProperties;

    /**
     * 修改grpc服务信息注册至NACOS处理逻辑, 解决grpc组件不支持最新Spring Cloud Alibaba问题
     */
    @PostConstruct
    public void init() {
        if(this.nacosRegistration == null ) {
            return;
        }
        final int port = this.grpcServerProperties.getPort();
        if(port != -1 ){
            this.nacosRegistration.getMetadata().put(GrpcUtils.CLOUD_DISCOVERY_METADATA_PORT, Integer.toString(port));
        }

    }
}
