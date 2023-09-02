package com.itcast.trade.bulls.stock.user.controller;

import com.itcast.bulls.stock.common.exception.BusinessException;
import com.itcast.bulls.stock.common.exception.ComponentException;
import com.itcast.bulls.stock.entity.user.TradeUser;
import com.itcast.stock.common.web.vo.ApiRespResult;
import com.itcast.stock.common.web.vo.user.TradeUserVo;
import com.itcast.trade.bulls.stock.user.service.IStockUserService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import javax.validation.Valid;

/**
 * <p>Description: </p>
 * @date 
 * @author 
 * @version 1.0
 * <p>Copyright:Copyright(c)2020</p>
 */
@RestController
@Api(value = "用户开放接口",tags = "BOOT接口-用户开放接口")
@RequestMapping("/open")
@Log4j2
public class StockUserOpenController {

    /**
     * 用户的服务层接口
     */
    @Autowired
    private IStockUserService stockUserService;


    /**
     * 用户注册接口
     * @param tradeUser
     * @return
     */
    @ApiOperation(value = "用户注册接口")
    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public ApiRespResult register(@Valid TradeUserVo tradeUser) {

        ApiRespResult result = null;

        try {
            // 调用用户的注册接口方法
            TradeUser newTradeUser = stockUserService.userRegister(tradeUser);
            result = ApiRespResult.success(newTradeUser);
        } catch (BusinessException e) {
            log.error(e.getMessage(), e);
            result = ApiRespResult.error(e.getErrorCodeEnum());
        } catch (ComponentException e) {
            log.error(e.getMessage(), e);
            result = ApiRespResult.error(e.getErrorCodeEnum());
        } catch(Exception e) {
            log.error(e.getMessage(), e);
            result = ApiRespResult.sysError(e.getMessage());
        }
        return result;

    }
}
