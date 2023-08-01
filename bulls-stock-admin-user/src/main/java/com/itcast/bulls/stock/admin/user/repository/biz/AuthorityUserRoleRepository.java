package com.itcast.bulls.stock.admin.user.repository.biz;

import java.util.List;

import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;
import org.springframework.transaction.annotation.Transactional;

import com.itcast.bulls.stock.entity.user.AuthorityUserRole;

import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;

/**
 * <p>Description: </p>
 * @date 2019/7/30
 * @author 贺锟 
 * @version 1.0
 * @name mirson
 * <p>Copyright:Copyright(c)2019</p>
 */
@RepositoryRestResource(path = "/authorityUserRole")
public interface AuthorityUserRoleRepository extends PagingAndSortingRepository<AuthorityUserRole, Long>, JpaSpecificationExecutor<AuthorityUserRole> {

    @ApiOperation(value = "根据用户ID获取所有已分配的角色")
    @ApiImplicitParams({
            @ApiImplicitParam(value = "用户ID", name = "userId", dataType = "Long", required = true)
    })
    List<AuthorityUserRole> findAllByUserId(@Param("userId") Long userId);


    @ApiOperation(value = "根据角色ID获取所有用户与角色的关联关系")
    @ApiImplicitParams({
            @ApiImplicitParam(value = "角色ID", name = "roleId", dataType = "Long", required = true)
    })
    List<AuthorityUserRole> findAllByRoleId(@Param("roleId") Long roleId);


    /**
     * 根据角色ID删除用户和角色关联关系
     * @param roleId
     */
    @Transactional
    @Modifying
    @Query(" delete from AuthorityUserRole where roleId = :roleId")
    void deleteAllByRoleId(@Param("roleId") Long roleId);


}
