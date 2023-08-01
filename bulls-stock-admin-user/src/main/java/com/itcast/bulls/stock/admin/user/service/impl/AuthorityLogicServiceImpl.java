package com.itcast.bulls.stock.admin.user.service.impl;

import java.util.Date;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.itcast.bulls.stock.admin.user.repository.biz.AuthorityRoleMenuRepository;
import com.itcast.bulls.stock.admin.user.repository.biz.AuthorityRoleOperationRepository;
import com.itcast.bulls.stock.admin.user.repository.biz.AuthorityRoleRepository;
import com.itcast.bulls.stock.admin.user.repository.biz.AuthorityUserRoleRepository;
import com.itcast.bulls.stock.admin.user.service.IAuthorityLogicService;
import com.itcast.bulls.stock.common.exception.BusinessException;
import com.itcast.bulls.stock.common.exception.ComponentException;
import com.itcast.bulls.stock.common.exception.constants.ApplicationErrorCodeEnum;
import com.itcast.bulls.stock.entity.user.*;

import lombok.extern.log4j.Log4j2;

/**
 * <p>Description: </p>
 * @date 2020/1/10
 * @author 贺锟 
 * @version 1.0
 * <p>Copyright:Copyright(c)2019</p>
 */
@Service
@Log4j2
public class AuthorityLogicServiceImpl implements IAuthorityLogicService {

    /**
     * 权限分配-菜单操作前缀标识
     */
    public final static String MENU_OPT_FLAG = "O_";
    /**
     * 权限分配-菜单标识
     */
    public final static String MENU_FLAG = "M_";

    /**
     * 角色操作接口
     */
    @Autowired
    private AuthorityRoleRepository authorityRoleRepository;

    /**
     * 角色与操作关联信息操作接口
     */
    private AuthorityRoleOperationRepository authorityRoleOperationRepository;

    /**
     * 角色与菜单的关联信息操作接口
     */
    private AuthorityRoleMenuRepository authorityRoleMenuRepository;

    /**
     * 用户与角色关联信息的数据层操作接口
     */
    private AuthorityUserRoleRepository authorityUserRoleRepository;


    /**
     * 保存分配的角色与权限信息
     * @param roleAuth
     * @param roleIds
     * @throws BusinessException
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public void saveProvileges(String roleAuth, String... roleIds) throws BusinessException {
        log.info("Process in AuthorityLogicServiceImpl.saveProvileges method params, roleAuth: " + roleAuth
                + ", roleIds: " + roleIds);
        // 保存多个角色权限信息， 支持批量处理， （由前端校验， 完全信赖前端传递的参数信息， 简化后端的校验处理）
        for(String roleId: roleIds) {
            //将roleId由字符类型转换为长整型
            Long roleIdLong = Long.valueOf(roleId);
            // 校验角色ID是否存在
            Optional<AuthorityRole> authorityRoleOpt = authorityRoleRepository.findById(roleIdLong);
            if(!authorityRoleOpt.isPresent()){
                throw new BusinessException(ApplicationErrorCodeEnum.USER_ROLE_NOT_FOUND);
            }
            // 保存角色与权限信息
            saveRolePrivileges(roleIdLong, roleAuth);
        }

    }

    /**
     * 保存角色分配的权限信息
     * @param roleId
     * @param roleAuth
     * @return
     */
    private void saveRolePrivileges(Long roleId, String roleAuth) {
        log.info("Process in AuthorityLogicServiceImpl.saveRolePrivileges method, roleId: " + roleId );
        // roleAuth 的规范,  格式: "M_ID, O_ID", 以M开头的, 代表的是菜单ID, 以O开头, 代表的是操作ID, 通过逗号进行分隔.
        String[] roleAuthArr = roleAuth.replace("-1", "").trim().split(", ");
        // 对传递的权限信息, 做过滤去重处理
        List<String> roleAuthList = Stream.of(roleAuthArr).distinct().collect(Collectors.toList());
        // 先删除角色原有的菜单和操作信息
        authorityRoleOperationRepository.deleteAllByRoleId(roleId);
        authorityRoleMenuRepository.deleteAllByRoleId(roleId);

        // 重新进行角色权限信息保存
        AuthorityRoleOperation authorityRoleOperation;
        AuthorityRoleMenu authorityRoleMenu;

        // 遍历权限信息, 进行保存处理
        for(String id: roleAuthList) {
            authorityRoleOperation = new AuthorityRoleOperation();
            authorityRoleMenu = new AuthorityRoleMenu();
            if(id.contains(MENU_OPT_FLAG)) {
                // 菜单的操作保存
                authorityRoleOperation.setOperationId(Long.parseLong(id.replace(MENU_OPT_FLAG, "").trim()));
                authorityRoleOperation.setRoleId(roleId);
                authorityRoleOperationRepository.save(authorityRoleOperation);

            }else if(id.contains(MENU_FLAG)) {
                // 菜单的操作保存
                authorityRoleMenu.setMenuId(Long.parseLong(id.replace(MENU_FLAG, "").trim()));
                authorityRoleMenu.setRoleId(roleId);
                authorityRoleMenuRepository.save(authorityRoleMenu);

            }else {
                log.warn("unknown menu opt ! id:" + id);
            }
        }
    }

    /**
     * 分配用户与角色的关联关系
     * @param authorityUserRole
     * @param authorityUser
     */
    @Override
    public void userAssignRoles(AuthorityUserRole authorityUserRole, AuthorityUser authorityUser) throws ComponentException {
        log.info("Process in AuthorityLogicServiceImpl.userAssignRoles method, authorityUserRole: " + authorityUserRole.toString() );
        // 1. 查找该用户已分配的机构类型
        List<AuthorityUserRole> authorityUserRoleList = authorityUserRoleRepository.findAllByUserId(authorityUserRole.getUserId());

        // 2. 获取需要分配的角色对象信息
        AuthorityRole authorityRole = authorityRoleRepository.findById(authorityUserRole.getRoleId()).get();

        // 3. 校验用户是否存在多个相同机构类型的角色
        for(AuthorityUserRole userRole : authorityUserRoleList) {
            if(userRole.getInstitutionTypeId().equals(authorityRole.getInstitutionTypeId())) {
                // 用户不能添加相同机构类型的角色
                throw new ComponentException(ApplicationErrorCodeEnum.ADMIN_USER_INSTITUTION_UNIQUE);
            }
        }

        // 4. 保存用户与角色的关联关系
        authorityUserRole.setRoleName(authorityRole.getRoleName());
        authorityUserRole.setInstitutionTypeId(authorityRole.getInstitutionTypeId());
        authorityUserRole.setInstitutionId(authorityRole.getInstitutionId());
        if(null != authorityRole.getInstitutionVo()) {
            authorityUserRole.setInstitutionName(authorityRole.getInstitutionVo().getDetailInstitutionName());
        }
        authorityUserRole.setCreateBy(authorityUser.getId());
        authorityUserRole.setCreateTime(new Date());
        authorityUserRole.setCreateUser(authorityUser.getUserName());
        authorityUserRole.setLastUpdateBy(authorityUser.getId());
        authorityUserRole.setLastUpdateUser(authorityUser.getUserName());
        authorityUserRole.setLastUpdateTime(new Date());
        // 5. 保存用户角色关联数据
        authorityUserRoleRepository.save(authorityUserRole);

    }
}
