package com.itcast.bulls.stock.admin.user.service;

import com.itcast.bulls.stock.common.exception.BusinessException;
import com.itcast.bulls.stock.common.exception.ComponentException;
import com.itcast.bulls.stock.entity.user.AuthorityUser;
import com.itcast.bulls.stock.entity.user.AuthorityUserRole;
import org.springframework.transaction.annotation.Transactional;

/**
 * <p>Description: </p>
 * @date 2020/1/10
 * @author 贺锟 
 * @version 1.0
 * <p>Copyright:Copyright(c)2019</p>
 */
public interface IAuthorityLogicService {


    /**
     * 保存分配的角色与权限信息
     * @param roleAuth
     * @param roleIds
     * @throws BusinessException
     */
    @Transactional(rollbackFor = Exception.class)
    void saveProvileges(String roleAuth, String... roleIds) throws BusinessException;

    /**
     * 分配用户与角色的关联关系
     * @param authorityUserRole
     * @param authorityUser
     */
    void userAssignRoles(AuthorityUserRole authorityUserRole, AuthorityUser authorityUser) throws ComponentException;
}
