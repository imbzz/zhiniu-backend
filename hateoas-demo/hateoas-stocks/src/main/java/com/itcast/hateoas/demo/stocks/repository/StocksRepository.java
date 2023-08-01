package com.itcast.hateoas.demo.stocks.repository;

import com.itcast.hateoas.demo.stocks.entity.StocksEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

import java.util.List;

/**
 * <p>Description: </p>
 * @date 2019/12/20
 * @author 贺锟 
 * @version 1.0
 * <p>Copyright:Copyright(c)2019</p>
 */
@RepositoryRestResource(path = "/stocks")
public interface StocksRepository extends JpaRepository<StocksEntity, Long> {

    /**
     * 根据股票名称查找股票信息
     * @param list
     * @return
     */
    List<StocksEntity> findByNameInOrderById(@Param("list")List<String> list);

    /**
     * 根据名称查询股票
     * @param name
     * @return
     */
    public StocksEntity findByName(@Param("name")String name);
}
