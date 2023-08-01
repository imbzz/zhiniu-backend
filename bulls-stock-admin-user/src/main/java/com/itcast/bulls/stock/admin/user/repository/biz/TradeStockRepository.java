package com.itcast.bulls.stock.admin.user.repository.biz;

import java.util.List;

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

import com.itcast.bulls.stock.entity.product.QTradeStock;
import com.itcast.bulls.stock.entity.product.TradeStock;
import com.querydsl.core.types.dsl.StringExpression;

import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;

/**
 * <p>Description: 产品管理数据层接口 </p>
 * @date 2019/8/1
 * @author 贺锟 
 * @version 1.0
 * @name mirson
 * <p>Copyright:Copyright(c)2019</p>
 */
@RepositoryRestResource(path = "/authorityTradeStock")
public interface TradeStockRepository extends QuerydslPredicateExecutor<TradeStock>, QuerydslBinderCustomizer<QTradeStock>, PagingAndSortingRepository<TradeStock, Long>, JpaSpecificationExecutor<TradeStock> {

    @Override
    default public void customize(QuerydslBindings bindings, QTradeStock obj) {

        bindings.bind(obj.name).first(StringExpression::contains); // 股票名称
        bindings.bind(obj.code).first(StringExpression::contains); // 股票代码
    }

    @ApiOperation(value = "根据股票编号获取对象")
    @ApiImplicitParams({
            @ApiImplicitParam(value = "股票编号", name = "code", dataType = "string", required = true)
    })
    TradeStock findByCode(@Param("code") String code);

    @ApiOperation(value = "根据分类编号编号获取股票数据")
    @ApiImplicitParams({
            @ApiImplicitParam(value = "分类编号", name = "categoryId", dataType = "string", required = true)
    })
    List<TradeStock> findByCategoryId(@Param("categoryId") Long categoryId);

    @ApiOperation(value = "根据产品ID设置是否为热门产品")
    @ApiImplicitParams({
            @ApiImplicitParam(value = "id", name = "产品ID", dataType = "long", required = true),
            @ApiImplicitParam(value = "tag", name = "是否热门(0:普通， 1：热门)", dataType = "string", required = true)
    })
    @Transactional
    @Modifying
    @Query("update TradeStock stock set stock.tag = :tag where stock.id = :id")
    int updateStockTag(@Param("id") Long id, @Param("tag") Integer tag);

}
