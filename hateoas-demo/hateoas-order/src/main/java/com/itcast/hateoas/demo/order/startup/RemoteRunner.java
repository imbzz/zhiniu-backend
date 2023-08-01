package com.itcast.hateoas.demo.order.startup;

import com.itcast.hateoas.demo.order.entity.OrderEntity;
import com.itcast.hateoas.demo.order.entity.StocksEntity;
import com.itcast.hateoas.demo.order.repository.OrderRepository;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.ApplicationArguments;
import org.springframework.boot.ApplicationRunner;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.hateoas.Link;
import org.springframework.hateoas.PagedResources;
import org.springframework.hateoas.Resource;
import org.springframework.hateoas.Resources;
import org.springframework.http.HttpMethod;
import org.springframework.http.RequestEntity;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestTemplate;

import java.net.URI;

/**
 * <p>Description: </p>
 * @date 2019/12/20
 * @author 贺锟 
 * @version 1.0
 * <p>Copyright:Copyright(c)2019</p>
 */
@Component
@Log4j2
public class RemoteRunner implements ApplicationRunner {

    /**
     * 指定的是股票服务接口地址
     */
    private static final URI ROOT_URI = URI.create("http://localhost:8080/");

    /**
     * RestTemplate 注入， 负责http远程调用
     */
    @Autowired
    private RestTemplate restTemplate;

    /**
     * order数据层操作接口
     */
    @Autowired
    private OrderRepository orderRepository;


    @Override
    public void run(ApplicationArguments args) throws Exception {

        Link stocksLink = getLink(ROOT_URI,"stocksEntities");
        // Step 1: 查询股票信息
        queryStocks(stocksLink);
        // Step 2: 更新股票价格
        Link updateLink= getLink(ROOT_URI.resolve("stocks/1"),"stocksEntity");
        Resource<StocksEntity> americano = updateStocks(updateLink);
        // Step 3: 重新查询打印所有的股票信息
        queryStocks(stocksLink);

        // Step 4: 生成订单信息
        OrderEntity order = OrderEntity.builder()
                .user("mirson")
                .stockName("建设银行")
                .volume(1000)
                .price(99.9)
                .build();

        orderRepository.save(order);

    }

    /**
     * 更新股票信息
     * @param link
     * @return
     */
    private Resource<StocksEntity> updateStocks(Link link) {

        // 1. 设定要更新的股票信息
        StocksEntity americano = StocksEntity.builder()
                .name("中国平安")
                .price(68.9)
                .build();
        // 2. 远程请求， 发送更新的数据
        RequestEntity<StocksEntity> req =
                RequestEntity.put(link.getTemplate().expand()).body(americano);
        // 3. 接收响应数据， 将数据进行打印
        ResponseEntity<Resource<StocksEntity>> resp =
                restTemplate.exchange(req,
                        new ParameterizedTypeReference<Resource<StocksEntity>>() {});
        log.info("add Stocks ==> {}", resp);
        return resp.getBody();
    }

    /**
     * 获取请求链接
     * @param uri
     * @param rel
     * @return
     */
    private Link getLink(URI uri, String rel) {
        ResponseEntity<Resources<Link>> rootResp =
                restTemplate.exchange(uri, HttpMethod.GET, null,
                        new ParameterizedTypeReference<Resources<Link>>() {});
        Link link = rootResp.getBody().getLink(rel);
        log.info("Link: {}", link);
        return link;
    }

    /**
     * 查询所有股票信息
     * @param stocksLink
     */
    private void queryStocks(Link stocksLink) {
        ResponseEntity<PagedResources<Resource<StocksEntity>>> stocksResp =
                restTemplate.exchange(stocksLink.getTemplate().expand(),
                        HttpMethod.GET, null,
                        new ParameterizedTypeReference<PagedResources<Resource<StocksEntity>>>() {});
        if(null != stocksResp.getBody() && null != stocksResp.getBody().getContent() ) {
            StringBuffer strs = new StringBuffer();
            stocksResp.getBody().getContent().forEach((s)->{
                strs.append(s.getContent().getName()).append(":").append(s.getContent().getPrice()).append( ",");
            });
            String resp = strs.toString().replaceAll(",$", "");
            log.info("query stocks ==> " + resp);
        }else {
            log.info("query stocks ==>  empty! ");
        }

    }
}
