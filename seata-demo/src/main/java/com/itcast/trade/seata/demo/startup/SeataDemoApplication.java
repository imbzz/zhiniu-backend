package com.itcast.trade.seata.demo.startup;

import com.itcast.trade.seata.demo.entity.AssetAssign;
import com.itcast.trade.seata.demo.service.IAssignService;
import org.apache.commons.lang.exception.ExceptionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

/**
 * <p>Description: </p>
 * @date 2019/7/11
 * @author 贺锟 
 * @version 1.0
 * <p>Copyright:Copyright(c)2019</p>
*/
@SpringBootApplication(exclude = DataSourceAutoConfiguration.class)
@ComponentScan(basePackages = {"com.itcast"})
@EntityScan(basePackages = {"com.itcast"})
@EnableJpaRepositories(basePackages =  {"com.itcast"})
@RestController
@EnableTransactionManagement
public class SeataDemoApplication {

    final String ASSET_ID = "14070e0e3cfe403098fa9ca37e8e7e76";

    @Autowired
    private IAssignService assignService;

    public static void main(String[] args) {

        SpringApplication.run(SeataDemoApplication.class, args);
    }

    /**
     * 定义外部访问接口, 对主业务逻辑调用处理
     *
     * @return the string
     */
    @RequestMapping(value = "/asset/assign")
    @ResponseBody
    public String assetAssign() {

        String result;
        try {
            AssetAssign assetAssign = assignService.increaseAmount(
                    ASSET_ID);
            result = assetAssign.toString();
        } catch (Exception e) {
            result = ExceptionUtils.getMessage(e);
        }
        return result;
    }

}
