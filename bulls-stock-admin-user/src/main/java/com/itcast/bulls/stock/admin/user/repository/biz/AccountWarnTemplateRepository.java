package com.itcast.bulls.stock.admin.user.repository.biz;

import org.springframework.cache.annotation.CachePut;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.querydsl.QuerydslPredicateExecutor;
import org.springframework.data.querydsl.binding.QuerydslBinderCustomizer;
import org.springframework.data.querydsl.binding.QuerydslBindings;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

import com.itcast.bulls.stock.common.utils.GlobalConstants;
import com.itcast.bulls.stock.entity.user.AccountWarnTemplate;
import com.itcast.bulls.stock.entity.user.QAccountWarnTemplate;
import com.querydsl.core.types.dsl.StringExpression;

import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;

/**
 * 账户预警模板数据层接口
 */
@RepositoryRestResource(path = "/authorityAccountNotifyTemplate")
public interface AccountWarnTemplateRepository extends QuerydslPredicateExecutor<AccountWarnTemplate>, QuerydslBinderCustomizer<QAccountWarnTemplate>,
        PagingAndSortingRepository<AccountWarnTemplate, Long>, JpaSpecificationExecutor<AccountWarnTemplate> {

    @Override
    default public void customize(QuerydslBindings bindings, QAccountWarnTemplate obj) {
        bindings.bind(obj.title).first(StringExpression::contains); // 模糊查询
    }

    /**
     * 根据消息类型获取对象
     * @return
     */
    AccountWarnTemplate getDistinctByWarnType(@Param("warnType") int warnType);

    @ApiOperation(value = "根据ID获取预警通知信息模板")
    @ApiImplicitParams({
            @ApiImplicitParam(value = "ID唯一标识", name = "id", dataType = "Long", required = true)
    })
    AccountWarnTemplate getById(@Param("id") Long id);

    /**
     * 保存数据， 更新缓存
     * @param entity
     * @param <S>
     * @return
     */
    @Override
    @CachePut(value = GlobalConstants.ACCOUNT_WARN_TEMPLATE_TYPE_KEY, key = "#a0.warnType")
    <S extends AccountWarnTemplate> S save(S accountWarnTemplate);
}
