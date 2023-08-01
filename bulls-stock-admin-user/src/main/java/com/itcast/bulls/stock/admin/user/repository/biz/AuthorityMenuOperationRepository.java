package com.itcast.bulls.stock.admin.user.repository.biz;

import java.util.List;

import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

import com.itcast.bulls.stock.entity.user.AuthorityMenuOperation;

import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;

/**
 * <p>Description: </p>
 * @date 2019/7/30
 * @author 贺锟 
 * @version 1.0
 * @name  Mirson
 * <p>Copyright:Copyright(c)2019</p>
 */
@RepositoryRestResource(path = "/authorityMenuOperation")
public interface AuthorityMenuOperationRepository extends PagingAndSortingRepository<AuthorityMenuOperation, Long>, JpaSpecificationExecutor<AuthorityMenuOperation> {

    @ApiOperation(value = "根据角色ID查找对应的菜单操作信息")
    @ApiImplicitParams({
            @ApiImplicitParam(value = "角色ID", name = "roleId", dataType = "string", required = true)
    })
    @Query("select menuOpt from AuthorityMenuOperation menuOpt, AuthorityRoleOperation roleOpt " +
            " where roleOpt.roleId = ?1 and menuOpt.status = 1" +
            " and roleOpt.operationId = menuOpt.id")
    public List<AuthorityMenuOperation> findByRoleId(@Param("roleId") Long roleId);


    @ApiOperation(value = "根据机构类型查找对应的菜单操作信息")
    @ApiImplicitParams({
            @ApiImplicitParam(value = "机构类型", name = "institution", dataType = "string", required = true)
    })
    @Query("select menuOpt from AuthorityMenuOperation menuOpt, AuthorityMenu menu " +
            " where menu.institutionTypeId = ?1 " +
            " and menu.id = menuOpt.menuId ")
    public List<AuthorityMenuOperation> findByInstitution(@Param("institution") String institution);


    @ApiOperation(value = "根据菜单ID获取所有操作信息")
    @ApiImplicitParams({
            @ApiImplicitParam(value = "菜单ID", name = "menuId", dataType = "string", required = true)
    })
    public List<AuthorityMenuOperation> findByMenuId(@Param("menuId") Long menuId);

}
