package com.itcast.hateoas.demo.stocks.entity;

import lombok.Data;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

/**
 * <p>Description: </p>
 * @date 2019/12/20
 * @author 贺锟 
 * @version 1.0
 * <p>Copyright:Copyright(c)2019</p>
 */
@MappedSuperclass
@Data
public class BaseEntity implements Serializable {

    /**
     * 数据唯一标识
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    /**
     * 创建时间
     */
    @Column(updatable = false)
    @CreationTimestamp
    private Date createTime;

    /**
     * 修改时间
     */
    @UpdateTimestamp
    private Date updateTime;

}
