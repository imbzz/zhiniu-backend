package com.itcast.bulls.stock.entity.vo;

import com.itcast.bulls.stock.entity.base.BaseEntity;
import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * 
 * t_authority_menu_operation
 *
 */
@Entity
@Table(name="t_authority_menu_operation")
@Data
public class AuthorityMenuOperationVo extends BaseEntity {

    /**
     * 自定义菜单id
     */
    private Long menuId;

    /**
     * 操作名称
     */
    private String operationName;

    /**
     * 操作URI地址
     */
    private String operationUri;


    /**
     */
    private static final long serialVersionUID = 1L;
}