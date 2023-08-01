package com.itcast.bulls.stock.admin.user.service.impl;

import java.util.*;
import java.util.stream.Collectors;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.Cache;
import org.springframework.cache.CacheManager;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import com.itcast.bulls.stock.admin.user.repository.biz.AuthorityMenuOperationRepository;
import com.itcast.bulls.stock.admin.user.repository.biz.AuthorityMenuRepository;
import com.itcast.bulls.stock.admin.user.repository.biz.AuthorityUserRepository;
import com.itcast.bulls.stock.admin.user.repository.biz.AuthorityUserRoleRepository;
import com.itcast.bulls.stock.admin.user.service.IAuthorityUserService;
import com.itcast.bulls.stock.common.encrypt.EncryptUtil;
import com.itcast.bulls.stock.common.exception.ComponentException;
import com.itcast.bulls.stock.common.exception.constants.ApplicationErrorCodeEnum;
import com.itcast.bulls.stock.common.utils.GlobalConstants;
import com.itcast.bulls.stock.entity.user.AuthorityMenuOperation;
import com.itcast.bulls.stock.entity.user.AuthorityUser;
import com.itcast.bulls.stock.entity.user.AuthorityUserRole;

/**
 * <p>Description: </p>
 * @date 2020/1/13
 * @author 贺锟 
 * @version 1.0
 * @name  Mirson
 * <p>Copyright:Copyright(c)2019</p>
 */
@Service
public class AuthorityUserServiceImpl implements IAuthorityUserService {

    /**
     * 后台管理用户数据层接口
     */
    @Autowired
    private AuthorityUserRepository authorityUserRepository;

    /**
     * 管理菜单的数据层接口
     */
    @Autowired
    private AuthorityMenuRepository authorityMenuRepository;

    /**
     * 管理菜单操作的数据层接口
     */
    @Autowired
    private AuthorityMenuOperationRepository authorityMenuOperationRepository;

    /**
     * 用户与角色关联的数据层接口
     */
    @Autowired
    private AuthorityUserRoleRepository authorityUserRoleRepository;

    /**
     * Spring Cache缓存
     */
    @Autowired
    private CacheManager cacheManager;

    /**
     * 新增用户
     * @param user
     * @throws ComponentException
     */
    @Override
    public void addUser(AuthorityUser user, AuthorityUser loginUser) throws ComponentException {
        // 1. 根据用户账号查找对应用户信息
        Optional<AuthorityUser> authorityUserOpt = authorityUserRepository.findOne(eqUserName(user.getUserAccount()));
        if(authorityUserOpt.isPresent()){
            throw new ComponentException(ApplicationErrorCodeEnum.ADMIN_USER_ACCOUNT_EXISTS);
        }
        // 2. 对后台管理用户密码加密处理
        user.setUserPassword(EncryptUtil.encryptSigned(user.getUserPassword()));
        // 3. 组装后台管理用户的信息
        Date curDate = new Date();
        // 冗余机构与用户的创建信息
        user.setInstitutionTypeId(loginUser.getInstitutionTypeId());
        user.setInstitutionId(loginUser.getInstitutionId());
        user.setCreatorUserAccount(loginUser.getUserAccount());
        user.setCreateTime(curDate);
        user.setLastLoginTime(curDate);
        user.setStatus(GlobalConstants.INT_YES);
        user.setAuthorityUserRoleVos(null);
        // 4. 保存后台管理用户的信息
        authorityUserRepository.save(user);

    }


    /**
     * 用户登陆接口处理逻辑
     * @param username
     * @param password
     * @param clientIp
     * @throws ComponentException
     */
    @Override
    public AuthorityUser userLogin(String userAccount, String password, String clientIp) throws ComponentException{

        // 1. 查找用户, 判断是否存在
        Optional<AuthorityUser> authorityUserOpt = authorityUserRepository.findOne(eqUserName(userAccount));
        if(!authorityUserOpt.isPresent()){
            throw new ComponentException(ApplicationErrorCodeEnum.ADMIN_USER_ACCOUNT_NOT_FOUND);
        }
        AuthorityUser authorityUser = authorityUserOpt.get();

        // 2. 对用户密码加密做校验判断
        String encryptPassword = EncryptUtil.encryptSigned(password);
        if(!authorityUser.getUserPassword().equals(encryptPassword)) {
            throw new ComponentException(ApplicationErrorCodeEnum.ADMIN_USER_ACCOUNT_PWD_ERROR);
        }

        //3. 记录用户的登陆信息
        authorityUser.setLastLoginTime(new Date());
        authorityUser.setLastLoginIp(clientIp);
        authorityUserRepository.save(authorityUser);

        //4. 保存用户的菜单权限信息至缓存
        List<AuthorityUserRole> roleList = authorityUserRoleRepository.findAllByUserId(authorityUser.getId());
        if(null == roleList || roleList.size() < 1) {
            throw new ComponentException(ApplicationErrorCodeEnum.ADMIN_USER_NOT_ASSIGN_ROLES);
        }
        //5. 获取用户的最大的角色权限
        Long roleId = getPriorityAuthorityUserRole(roleList).getRoleId();
        authorityUser.setRoleId(roleId);

        //6. 获取角色所对应的操作权限, 并进行组装保存之缓存当中
        List<AuthorityMenuOperation> optList = authorityMenuOperationRepository.findByRoleId(roleId);
        if(null != optList) {
            // 根据请求类型, 分组汇总为MAP结构, 比如: POST-{/add, /update...}
            Map<String, Set<String>> optUrlSets = optList.stream()
                    .collect(Collectors.groupingBy(AuthorityMenuOperation::getOperationIco, Collectors.mapping(AuthorityMenuOperation::getOperationUri, Collectors.toSet())));

            //遍历MAP结构数据, 按照指定格式保存至缓存当中
            // 格式说明: 键组装是由用户ID加上分隔符和请求类型, 值组装是由多个路径组装而成, 以逗号分隔.
            // 例如: key=userId + | + optType, value=uri, ...
            if(optUrlSets.size() > 0) {
                // 获取缓存操作对象
                Cache cache = cacheManager.getCache(GlobalConstants.AUTHORITY_MENU_KEY);
                // 根据请求类型整理放入缓存
                optUrlSets.forEach((opt, urls) -> {
                    // 支持多个URL层级操作
                    Set<String> levelUrls = urls.stream().flatMap(str -> Arrays.stream(str.split(",")).map(String::trim)).collect(Collectors.toSet());
                    cache.put(authorityUser.getId()+ GlobalConstants.SPLIT + opt, levelUrls);
                });
            }
        }

        return authorityUser;

    }


    /**
     * 重置用户密码接口, 新密码为"账号+123"
     * @param newPwd
     * @param userAccount
     * @param loginUser
     * @throws ComponentException
     */
    @Override
    public void resetPwd(String userAccount, AuthorityUser loginUser) throws ComponentException {

        // 1. 查找用户, 做必要性校验
        Optional<AuthorityUser> authorityUserOpt = authorityUserRepository.findOne(eqUserName(userAccount));
        if(!authorityUserOpt.isPresent()){
            throw new ComponentException(ApplicationErrorCodeEnum.ADMIN_USER_ACCOUNT_NOT_FOUND);
        }

        // 2. 非交易商的管理员用户， 不能进行此操作
        if(!GlobalConstants.STR_YES.equals(String.valueOf(loginUser.getIsAdmin()))) {
            throw new ComponentException(ApplicationErrorCodeEnum.ADMIN_USER_NOT_ADMIN);
        }

        // 3. 生成新的加密密码, 规则为新密码为"账号+123"
        String newPwd = EncryptUtil.encryptSigned(userAccount + "123");
        // 4. 更新用户密码
        authorityUserRepository.updateUserPwdByAccount(newPwd, userAccount);
    }


    /**
     * 获取最大权限的角色
     * @param userRoleList
     * @return
     */
    private AuthorityUserRole getPriorityAuthorityUserRole(List<AuthorityUserRole> userRoleList) {

        List<String> institutionTypes = Arrays.asList(GlobalConstants.INSTITUTION_TYPE_GROUPS, GlobalConstants.INSTITUTION_TYPE_SERVICE_OPERATE, GlobalConstants.INSTITUTION_TYPE_COMPANY);

        for(String institutionType: institutionTypes ) {
            Optional<AuthorityUserRole> usrRoleOptinal= userRoleList.stream().filter(item -> item.getInstitutionTypeId().equals(institutionType)).findFirst();
            if(usrRoleOptinal.isPresent()){
                return usrRoleOptinal.get();
            }
        }
        return userRoleList.get(0);
    }

    /**
     * 根据账号获取用户对象
     * @param userAccount
     * @return
     */
    private Specification<AuthorityUser> eqUserName(String userAccount) {
        return  new Specification<AuthorityUser>() {
            @Override
            public Predicate toPredicate(Root<AuthorityUser> root, CriteriaQuery<?> criteriaQuery, CriteriaBuilder criteriaBuilder) {
                return  criteriaBuilder.equal(root.get("userAccount"), userAccount);
            }
        };
    }



}
