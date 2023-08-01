package com.itcast.bulls.stock.admin.user.repository.biz;

import java.util.List;

import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.itcast.bulls.stock.entity.user.AuthorityRoleMenu;

/**
 * <p>Description: </p>
 * @date 2019/7/30
 * @author 贺锟 
 * @version 1.0
 * @name  Mirson
 * <p>Copyright:Copyright(c)2019</p>
 */
@Repository
public interface AuthorityRoleMenuRepository extends PagingAndSortingRepository<AuthorityRoleMenu, Long>, JpaSpecificationExecutor<AuthorityRoleMenu> {


    /**
     * 根据角色ID删除所有角色菜单对象
     * @param roleId
     * @return
     */
    @Transactional
    @Modifying
    @Query(" delete from AuthorityRoleMenu where roleId = :roleId")
    public int deleteAllByRoleId(@Param("roleId") Long roleId);


    /**
     * 根据角色ID获取所有数据
     * @param roleId
     * @return
     */
    public List<AuthorityRoleMenu> findAllByRoleId(@Param("roleId") Long roleId);

}
