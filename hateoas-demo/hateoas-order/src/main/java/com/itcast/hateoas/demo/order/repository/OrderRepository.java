package com.itcast.hateoas.demo.order.repository;

import com.itcast.hateoas.demo.order.entity.OrderEntity;
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
@RepositoryRestResource(path = "/order")
public interface OrderRepository extends JpaRepository<OrderEntity, Long> {

    /**
     * 根据用户查找获取所有订单信息
     * @param user
     * @return
     */
    public List<OrderEntity> findByUser(@Param("user")String user);
}
