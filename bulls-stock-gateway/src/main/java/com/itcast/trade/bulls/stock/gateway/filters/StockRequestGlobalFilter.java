package com.itcast.trade.bulls.stock.gateway.filters;

import io.netty.util.internal.StringUtil;
import lombok.extern.log4j.Log4j2;
import org.springframework.cloud.gateway.filter.GatewayFilterChain;
import org.springframework.cloud.gateway.filter.GlobalFilter;
import org.springframework.core.Ordered;
import org.springframework.stereotype.Component;
import org.springframework.web.server.ServerWebExchange;
import reactor.core.publisher.Mono;

/**
 * <p>Description: </p>
 * @date 2020/1/3
 * @author 贺锟 
 * @version 1.0
 * <p>Copyright:Copyright(c)2019</p>
 */
@Component
@Log4j2
public class StockRequestGlobalFilter implements GlobalFilter, Ordered {

    /**
     * 过滤器的处理逻辑
     * @param exchange
     * @param chain
     * @return
     */
    @Override
    public Mono<Void> filter(ServerWebExchange exchange, GatewayFilterChain chain) {
        String authentication = exchange.getRequest().getHeaders().getFirst("Authorization");
        if(!StringUtil.isNullOrEmpty(authentication)){
            log.info("enter stockRequestGlobalFilter filter method: " + authentication);
            exchange.getRequest().mutate().header("Authorization",authentication);
        }
        return chain.filter(exchange.mutate().build());
    }

    /**
     * 设置过滤器的处理顺序
     * @return
     */
    @Override
    public int getOrder() {
        return 0;
    }
}
