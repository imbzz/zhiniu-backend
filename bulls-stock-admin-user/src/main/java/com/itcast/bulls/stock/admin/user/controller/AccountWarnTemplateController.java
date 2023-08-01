package com.itcast.bulls.stock.admin.user.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.itcast.bulls.stock.admin.user.service.IAccountWarnTemplateService;
import com.itcast.bulls.stock.entity.user.AccountWarnTemplate;
import com.itcast.stock.common.web.vo.ApiRespResult;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.log4j.Log4j2;

@Api(value = "BOOT接口-账户预警通知模板管理接口",tags = "BOOT接口-账户预警通知模板管理接口")
@RestController
@RequestMapping("/accountWarnTemplate")
@Log4j2
public class AccountWarnTemplateController extends BaseController {

    @Autowired
    private IAccountWarnTemplateService accountWarnTemplateService;

    /**
     * 保存预警通知模板
     */
    @PostMapping(value = "/saveTemplate")
    @ApiOperation(value = "保存预警通知模板")
    public ApiRespResult<String> saveTemplate(AccountWarnTemplate accountWarnTemplate) {

        ApiRespResult result = null;
        try {
            // 保存通知模板
            accountWarnTemplateService.saveTemplate(accountWarnTemplate, getUser());
            result = ApiRespResult.success();
        }catch(Exception e) {
            log.error(e.getMessage(), e);
            result = ApiRespResult.sysError(e.getMessage());
        }
        return result;

    }

}
