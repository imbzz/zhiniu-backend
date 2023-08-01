package com.itcast.bulls.stock.admin.user.repository.biz;

import java.util.List;

import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.querydsl.QuerydslPredicateExecutor;
import org.springframework.data.querydsl.binding.QuerydslBinderCustomizer;
import org.springframework.data.querydsl.binding.QuerydslBindings;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

import com.itcast.bulls.stock.entity.user.AuthorityRole;
import com.itcast.bulls.stock.entity.user.QAuthorityRole;
import com.querydsl.core.types.dsl.StringExpression;

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
@RepositoryRestResource(path = "/authorityRole")
public interface AuthorityRoleRepository extends QuerydslPredicateExecutor<AuthorityRole>, QuerydslBinderCustomizer<QAuthorityRole>, PagingAndSortingRepository<AuthorityRole, Long>, JpaSpecificationExecutor<AuthorityRole> {

    @Override
    default public void customize(QuerydslBindings bindings, QAuthorityRole obj) {

        bindings.bind(obj.roleName).first(StringExpression::contains); // 模糊查询
    }


    @ApiOperation(value = "根据角色名称获取数据")
    @ApiImplicitParams({
            @ApiImplicitParam(value = "角色名称", name = "roleName", dataType = "string", required = true)
    })
    List<AuthorityRole> findByRoleName(@Param("roleName") String roleName, Pageable pageable);

    @ApiOperation(value = "根据机构ID获取所有角色")
    @ApiImplicitParams({
            @ApiImplicitParam(value = "机构ID", name = "institutionId", dataType = "long", required = true)
    })
    List<AuthorityRole> findByInstitutionId(@Param("institutionId") Long institutionId);

}
