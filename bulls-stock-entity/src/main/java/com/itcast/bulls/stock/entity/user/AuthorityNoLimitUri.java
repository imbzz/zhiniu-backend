package com.itcast.bulls.stock.entity.user;

import com.itcast.bulls.stock.entity.base.BaseEntity;
import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * 
 * t_authority_no_limit_urit
 *
 */
@Entity
@Table(name="t_authority_no_limit_uri")
@Data
public class AuthorityNoLimitUri extends BaseEntity {

    /**
     * 不限制的uri
     */
    private String noLimitUri;

    /**
     */
    private static final long serialVersionUID = 1L;

}