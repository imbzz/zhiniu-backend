package com.itcast.bulls.stock.admin.user.repository.biz;

import java.util.List;

import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.querydsl.QuerydslPredicateExecutor;
import org.springframework.data.querydsl.binding.QuerydslBinderCustomizer;
import org.springframework.data.querydsl.binding.QuerydslBindings;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

import com.itcast.bulls.stock.entity.user.AuthorityMenu;
import com.itcast.bulls.stock.entity.user.QAuthorityMenu;
import com.querydsl.core.types.dsl.StringExpression;

import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;

/**
 * <p>Description: </p>
 * @date 2019/7/29
 * @author 贺锟 
 * @version 1.0
 * <p>Copyright:Copyright(c)2019</p>
 */
@RepositoryRestResource(path = "/authorityMenu")
public interface AuthorityMenuRepository extends QuerydslPredicateExecutor<AuthorityMenu>, QuerydslBinderCustomizer<QAuthorityMenu>,
        PagingAndSortingRepository<AuthorityMenu, Long>, JpaSpecificationExecutor<AuthorityMenu> {

    @Override
    default public void customize(QuerydslBindings bindings, QAuthorityMenu menu) {

        bindings.bind(menu.menuName).first(StringExpression::contains); // 模糊查询
        bindings.bind(menu.menuCode).first(StringExpression::equalsIgnoreCase); // 忽略大小写
    }

    /**
     * 根据机构预置类型获取所有菜单
     * @param institutionTypeId
     * @return
     */
    @ApiOperation(value = "根据机构预置类型获取所有菜单")
    @ApiImplicitParams({
            @ApiImplicitParam(value = "机构预置类型编号", name = "institutionTypeId", dataType = "string", required = true)
    })
    List<AuthorityMenu> findByInstitutionTypeId(@Param("institutionTypeId") String institutionTypeId);


    @ApiOperation(value = "根据角色ID查找对应的菜单信息")
    @ApiImplicitParams({
            @ApiImplicitParam(value = "角色ID", name = "roleId", dataType = "string", required = true)
    })
    @Query("select menu from AuthorityMenu menu, AuthorityRoleMenu roleMenu " +
            " where roleMenu.roleId = ?1 and menu.status = 1" +
            " and roleMenu.menuId = menu.id")
    public List<AuthorityMenu> findByRoleId(@Param("roleId") Long roleId);

}
