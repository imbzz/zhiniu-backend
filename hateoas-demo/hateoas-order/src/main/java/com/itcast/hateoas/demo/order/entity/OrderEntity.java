package com.itcast.hateoas.demo.order.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * <p>Description: </p>
 * @date 2019/12/20
 * @author 贺锟 
 * @version 1.0
 * <p>Copyright:Copyright(c)2019</p>
 */
@Entity
@Data
@Table(name ="T_ORDER")
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class OrderEntity extends BaseEntity {

    /**
     * 用户
     */
    private String user;

    /**
     * 股票名称
     */
    private String stockName;

    /**
     * 成交数量
     */
    private Integer volume;

    /**
     * 成交价格
     */
    private Double price;


}
