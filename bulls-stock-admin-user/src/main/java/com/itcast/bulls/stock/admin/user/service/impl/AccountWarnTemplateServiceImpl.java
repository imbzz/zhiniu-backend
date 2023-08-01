package com.itcast.bulls.stock.admin.user.service.impl;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itcast.bulls.stock.admin.user.repository.biz.AccountWarnTemplateRepository;
import com.itcast.bulls.stock.admin.user.service.IAccountWarnTemplateService;
import com.itcast.bulls.stock.common.exception.ComponentException;
import com.itcast.bulls.stock.common.exception.constants.ApplicationErrorCodeEnum;
import com.itcast.bulls.stock.entity.user.AccountWarnTemplate;
import com.itcast.bulls.stock.entity.user.AuthorityUser;


@Service
public class AccountWarnTemplateServiceImpl implements IAccountWarnTemplateService {

    @Autowired
    private AccountWarnTemplateRepository accountWarnTemplateRepository;

    /**
     * 保存或更新模板
     * @param accountWarnTemplate
     * @param user
     * @throws ComponentException
     */
    @Override
    public void saveTemplate(AccountWarnTemplate accountWarnTemplate, AuthorityUser user) throws ComponentException {

        if(null == accountWarnTemplate.getId()) {
            // 新增
            accountWarnTemplate.setCreateTime(new Date());

            // 校验数据的重复性
            AccountWarnTemplate  accountWarnTemplateDB = accountWarnTemplateRepository.getDistinctByWarnType(accountWarnTemplate.getWarnType());
            if(null != accountWarnTemplateDB) {
                throw new ComponentException(ApplicationErrorCodeEnum.ACCOUNT_WARN_TEMPLATE_TYPE_EXISTS);
            }
        }

        //保存或更新数据
        accountWarnTemplate.setLastUpdateBy(user.getId());
        accountWarnTemplate.setLastUpdateUser(user.getUserName());
        accountWarnTemplate.setUpdateTime(new Date());
        accountWarnTemplateRepository.save(accountWarnTemplate);

    }
}
