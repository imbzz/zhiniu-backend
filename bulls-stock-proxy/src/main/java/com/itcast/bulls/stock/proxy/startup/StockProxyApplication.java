package com.itcast.bulls.stock.proxy.startup;

import com.itcast.bulls.stock.proxy.netty.StockProxyServerInitializer;
import io.netty.bootstrap.ServerBootstrap;
import io.netty.channel.ChannelFuture;
import io.netty.channel.EventLoopGroup;
import io.netty.channel.nio.NioEventLoopGroup;
import io.netty.channel.socket.nio.NioServerSocketChannel;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.ApplicationArguments;
import org.springframework.boot.ApplicationRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.context.annotation.ComponentScan;

/**
 * <p>Description: </p>
 * @date 
 * @author 
 * @version 1.0
 * <p>Copyright:Copyright(c)2020</p>
 */
@SpringBootApplication
@EnableDiscoveryClient
@ComponentScan(basePackages = {"com.itcast"})
@Log4j2
@EnableCaching
public class StockProxyApplication implements ApplicationRunner {

    /**
     * Netty服务端口
     */
    @Value("${socket.netty.port:19999}")
    private int nettyPort;

    /**
     * 注入Netty初始化服务配置实现类
     */
    @Autowired
    private StockProxyServerInitializer stockProxyServerInitializer;


    public static void main(String[] args) {
        SpringApplication.run(StockProxyApplication.class, args);
    }

    /**
     * 服务启动完毕之后， 再启动Netty服务
     * @param args
     * @throws Exception
     */
    @Override
    public void run(ApplicationArguments args) throws Exception {

        // 启动网络服务器
        EventLoopGroup boss = new NioEventLoopGroup();
        EventLoopGroup worker = new NioEventLoopGroup();

        try {
            ServerBootstrap boot = new ServerBootstrap();
            boot.group(boss, worker).channel(NioServerSocketChannel.class).childHandler(stockProxyServerInitializer);
            ChannelFuture f = boot.bind(nettyPort).sync();
            log.info(" Stock Quote Proxy Netty Server Start!");
            f.channel().closeFuture().sync();

        } catch (InterruptedException e) {
            log.error("Can't start Netty Server Process", e);
            return;
        } finally {
            boss.shutdownGracefully();
            worker.shutdownGracefully();
        }

    }

}
