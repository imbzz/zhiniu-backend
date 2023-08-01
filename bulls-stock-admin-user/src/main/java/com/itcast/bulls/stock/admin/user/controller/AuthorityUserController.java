package com.itcast.bulls.stock.admin.user.controller;

import com.itcast.bulls.stock.admin.user.service.IAuthorityUserService;
import com.itcast.bulls.stock.common.exception.ComponentException;
import com.itcast.bulls.stock.entity.user.AuthorityUser;
import com.itcast.stock.common.web.vo.ApiRespResult;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.validation.Valid;
import javax.validation.constraints.Size;

/**
 * <p>Description: </p>
 * @date 2020/1/13
 * @author 贺锟 
 * @version 1.0
 * @name  Mirson
 * <p>Copyright:Copyright(c)2019</p>
 */
@Api(value = "用户管理接口",tags = "用户管理接口")
@RestController
@RequestMapping("/authorityUser")
@Log4j2
@Validated
public class AuthorityUserController extends BaseController {

    /**
     * 管理用户服务层接口
     */
    @Autowired
    private IAuthorityUserService authorityUserService;

    @PostMapping(value = "/addUser")
    @ApiOperation(value = "新建用户接口")
    public ApiRespResult addUser(@Valid AuthorityUser user) {

        ApiRespResult  result = null;
        try {
            AuthorityUser loginUser = getUser();
            // 用户登陆处理
            authorityUserService.addUser(user, loginUser);
            result = ApiRespResult.success();
        }catch(ComponentException e) {
            log.error(e.getMessage(), e);
            result = ApiRespResult.error(e.getErrorCodeEnum());
        }catch(Exception e) {
            log.error(e.getMessage(), e);
            result = ApiRespResult.sysError(e.getMessage());
        }
        return result;
    }

    @PostMapping(value = "/login")
    @ApiOperation(value = "用户登陆接口")
    @ApiImplicitParams({
            @ApiImplicitParam(value = "用户账号", name = "userAccount", dataType = "string", required = true),
            @ApiImplicitParam(value = "用户密码", name = "password", dataType = "string", required = true)
    })
    public ApiRespResult login(@Size(min = 1, max = 32,message = "账号长度必须为1到32")
                               @RequestParam("userAccount") String userAccount,
                               @Size(min = 1, max = 32,message = "密码长度必须为1到32")
                               @RequestParam("password")String password) {

        ApiRespResult  result = null;
        try {
            // 用户登陆处理
            AuthorityUser authorityUser = authorityUserService.userLogin(userAccount, password, getClientIP());
            // 保存用户登陆信息至session
            getSession().setAttribute(getSession().getId(), authorityUser);
            result = ApiRespResult.success();
        }catch(Exception e) {
            log.error(e.getMessage(), e);
            result = ApiRespResult.sysError(e.getMessage());
        }
        return result;
    }


    @PostMapping(value="/resetPwd")
    @ApiOperation(value = "重置密码接口")
    @ApiImplicitParam(value = "用户账号", name = "account", dataType = "string", required = true)
    public ApiRespResult resetPwd(String account) throws Exception{

        ApiRespResult  result = null;
        try {
            AuthorityUser loginUser = getUser();
            // 用户登陆处理
            authorityUserService.resetPwd(account, loginUser);
            result = ApiRespResult.success();
        }catch(Exception e) {
            log.error(e.getMessage(), e);
            result = ApiRespResult.sysError(e.getMessage());
        }
        return result;
    }
}
