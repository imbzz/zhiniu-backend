package com.itcast.bulls.stock.admin.user.repository.trade;

import java.util.List;

import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.querydsl.QuerydslPredicateExecutor;
import org.springframework.data.querydsl.binding.QuerydslBinderCustomizer;
import org.springframework.data.querydsl.binding.QuerydslBindings;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

import com.itcast.bulls.stock.entity.trade.AccountWarnNotifyMessage;
import com.itcast.bulls.stock.entity.trade.QAccountWarnNotifyMessage;
import com.querydsl.core.types.dsl.StringExpression;

import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;

/**
 * 账户预警模板数据层接口
 */
@RepositoryRestResource(path = "/authorityAccountNotifyMessage")
public interface AccountWarnNotifyMessageRepository extends QuerydslPredicateExecutor<AccountWarnNotifyMessage>, QuerydslBinderCustomizer<QAccountWarnNotifyMessage>,
        PagingAndSortingRepository<AccountWarnNotifyMessage, Long>, JpaSpecificationExecutor<AccountWarnNotifyMessage> {

    @Override
    default public void customize(QuerydslBindings bindings, QAccountWarnNotifyMessage obj) {
        bindings.bind(obj.notifyTitle).first(StringExpression::contains); // 模糊查询
        bindings.bind(obj.userName).first(StringExpression::contains); // 模糊查询
    }


    @ApiOperation(value = "根据账号ID获取所有预警通知信息")
    @ApiImplicitParams({
            @ApiImplicitParam(value = "账号ID", name = "accountId", dataType = "Long", required = true)
    })
    List<AccountWarnNotifyMessage> findAllByAccountId(@Param("accountId") Long accountId);


    @ApiOperation(value = "根据用户ID获取所有预警通知信息")
    @ApiImplicitParams({
            @ApiImplicitParam(value = "用户ID", name = "userId", dataType = "Long", required = true)
    })
    List<AccountWarnNotifyMessage> findAllByUserId(@Param("userId") Long userId);


}
