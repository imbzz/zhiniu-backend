package com.itcast.bulls.stock.admin.user.service;

import com.itcast.bulls.stock.common.exception.ComponentException;
import com.itcast.bulls.stock.entity.user.AccountWarnTemplate;
import com.itcast.bulls.stock.entity.user.AuthorityUser;

/**
 * <p>Description: </p>
 * @date 2019/8/30
 * @author 贺锟 
 * @version 1.0
 * @name  Mirson
 * <p>Copyright:Copyright(c)2019</p>
 */
public interface IAccountWarnTemplateService {
    /**
     * 保存或更新模板
     * @param accountWarnTemplate
     * @param user
     * @throws ComponentException
     */
    void saveTemplate(AccountWarnTemplate accountWarnTemplate, AuthorityUser user) throws ComponentException;
}
