package com.itcast.bulls.stock.entity.system;

import lombok.Data;

/**
 * <p>Description: </p>
 * @date 2020/1/7
 * @author 贺锟 
 * @version 1.0
 * <p>Copyright:Copyright(c)2019</p>
 */
@Data
public class TradeSeq {

    /**
     * 业务编号
     */
    private String code;

    /**
     * 序列值
     */
    private Long nextId;
}
