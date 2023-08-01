package com.itcast.bulls.stock.admin.user.repository.trade;

import java.util.List;

import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.querydsl.QuerydslPredicateExecutor;
import org.springframework.data.querydsl.binding.QuerydslBinderCustomizer;
import org.springframework.data.querydsl.binding.QuerydslBindings;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

import com.itcast.bulls.stock.entity.trade.QTradeDeal;
import com.itcast.bulls.stock.entity.trade.TradeDeal;
import com.querydsl.core.types.dsl.StringExpression;

import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;

/**
 * <p>Description: </p>
 * @date 2019/11/22
 * @author 贺锟 
 * @version 1.0
 * @name  Mirson
 * <p>Copyright:Copyright(c)2019</p>
 */
@RepositoryRestResource(path = "/authorityTradeDeal")
public interface TradeDealRepository extends QuerydslPredicateExecutor<TradeDeal>, QuerydslBinderCustomizer<QTradeDeal>,
        PagingAndSortingRepository<TradeDeal, Long>, JpaSpecificationExecutor<TradeDeal> {

    @Override
    default public void customize(QuerydslBindings bindings, QTradeDeal obj) {
        bindings.bind(obj.stockName).first(StringExpression::contains); // 模糊查询
        bindings.bind(obj.accountNo).first(StringExpression::contains); // 模糊查询
    }

    @ApiOperation(value = "根据账户ID获取所有成交记录信息")
    @ApiImplicitParams({
            @ApiImplicitParam(value = "账户ID", name = "accountId", dataType = "long", required = true)
    })
    List<TradeDeal> findAllByAccountId(@Param("accountId") Long accountId);

}
