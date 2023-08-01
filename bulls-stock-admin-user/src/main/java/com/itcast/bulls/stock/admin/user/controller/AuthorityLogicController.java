package com.itcast.bulls.stock.admin.user.controller;

import com.itcast.bulls.stock.admin.user.service.IAuthorityLogicService;
import com.itcast.bulls.stock.common.exception.BusinessException;
import com.itcast.bulls.stock.entity.user.AuthorityUserRole;
import com.itcast.stock.common.web.vo.ApiRespResult;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/**
 * <p>Description: </p>
 * @date 2020/1/10
 * @author 贺锟 
 * @version 1.0
 * <p>Copyright:Copyright(c)2019</p>
 */
@RestController
@RequestMapping("/authorityLogic")
@Log4j2
public class AuthorityLogicController extends BaseController {

    /**
     * 权限逻辑信息处理业务层接口
     */
    @Autowired
    private IAuthorityLogicService authorityLogicService;


    /**
     * 保存角色权限
     */
    @PostMapping(value = "/savePrivileges")
    @ApiOperation(value = "保存角色权限")
    public ApiRespResult savePrivileges(@ApiParam(value = "权限列表",required = true) @RequestParam("roleAuth") String roleAuth,
                                        @ApiParam(value = "角色ID",required = true) @RequestParam("roleId") String roleId){

        ApiRespResult  result = null;
        try {
            // 调用角色与权限分配处理逻辑
            authorityLogicService.saveProvileges(roleAuth, roleId);
            result = ApiRespResult.success();
        }catch(BusinessException e) {
            log.error(e.getMessage(), e);
            result = ApiRespResult.error(e.getErrorCodeEnum());
        }catch(Exception e) {
            log.error(e.getMessage(), e);
            result = ApiRespResult.sysError(e.getMessage());
        }
        return result;

    }


    /**
     * 分配用户与角色的关联关系
     * @param authorityUserRole
     * @return
     */
    @PostMapping(value = "/userAssignRoles")
    @ApiOperation(value = "用户分配角色操作")
    public ApiRespResult userAssignRoles(AuthorityUserRole authorityUserRole) {

        ApiRespResult result = null;
        try {
            // 调用分配用户角色的业务接口
            authorityLogicService.userAssignRoles(authorityUserRole, getUser());
            result = ApiRespResult.success();
        }catch(Exception e) {
            log.error(e.getMessage(), e);
            result = ApiRespResult.sysError(e.getMessage());
        }
        return result;

    }


}
