package com.itcast.bulls.stock.admin.user.service;

import com.itcast.bulls.stock.common.exception.ComponentException;
import com.itcast.bulls.stock.entity.user.AuthorityUser;

/**
 * <p>Description: </p>
 * @date 2020/1/13
 * @author 贺锟 
 * @version 1.0
 * @name  Mirson
 * <p>Copyright:Copyright(c)2019</p>
 */
public interface IAuthorityUserService {
    /**
     * 新增用户
     * @param user
     * @throws ComponentException
     */
    void addUser(AuthorityUser user, AuthorityUser loginUser) throws ComponentException;

    /**
     * 用户登陆接口处理逻辑
     * @param username
     * @param password
     * @param clientIp
     * @throws ComponentException
     */
    AuthorityUser userLogin(String userAccount, String password, String clientIp) throws ComponentException;

    /**
     * 重置用户密码接口, 新密码为"账号+123"
     * @param newPwd
     * @param userAccount
     * @param loginUser
     * @throws ComponentException
     */
    void resetPwd(String userAccount, AuthorityUser loginUser) throws ComponentException;
}
