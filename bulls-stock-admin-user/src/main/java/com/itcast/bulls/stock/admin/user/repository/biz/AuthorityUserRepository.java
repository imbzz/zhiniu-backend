package com.itcast.bulls.stock.admin.user.repository.biz;

import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.querydsl.QuerydslPredicateExecutor;
import org.springframework.data.querydsl.binding.QuerydslBinderCustomizer;
import org.springframework.data.querydsl.binding.QuerydslBindings;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;
import org.springframework.transaction.annotation.Transactional;

import com.itcast.bulls.stock.entity.user.AuthorityUser;
import com.itcast.bulls.stock.entity.user.QAuthorityUser;
import com.querydsl.core.types.dsl.StringExpression;

import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;

/**
 * <p>Description: </p>
 * @date 2019/8/2
 * @author 贺锟 
 * @version 1.0
 * @name  Mirson
 * <p>Copyright:Copyright(c)2019</p>
 */
@RepositoryRestResource(path = "/authorityUser")
public interface AuthorityUserRepository extends QuerydslPredicateExecutor<AuthorityUser>, QuerydslBinderCustomizer<QAuthorityUser>, PagingAndSortingRepository<AuthorityUser, Long>, JpaSpecificationExecutor<AuthorityUser> {

    @Override
    default public void customize(QuerydslBindings bindings, QAuthorityUser obj) {

        bindings.bind(obj.userName).first(StringExpression::contains); // 模糊查询
    }

    /**
     * 根据账号修改用户密码
     * @param account
     * @param password
     * @return
     */
    @Transactional
    @Modifying
    @Query("update AuthorityUser usr set usr.userPassword = :password where usr.userAccount = :account")
    int updateUserPwdByAccount(@Param("account") String account, @Param("password") String password);

    @ApiOperation(value = "根据用户账号获取用户信息")
    @ApiImplicitParams({
            @ApiImplicitParam(value = "用户账号", name = "userAccount", dataType = "string", required = true)
    })
    public AuthorityUser findByUserAccount(@Param("userAccount") String userAccount);


    /**
     * 根据机构类型删除所有用户
     * @param institutionId
     */
    @Transactional
    @Modifying
    @Query(" delete from AuthorityUser where institutionId = :institutionId")
    void deleteAllByInstitutionId(@Param("institutionId") Long institutionId);


}
