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
@Table(name = "T_STOCKS")
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class StocksEntity extends BaseEntity {

    /**
     * 股票名称
     */
    private String name;

    /**
     * 股票价格
     */
    private Double price;
}
