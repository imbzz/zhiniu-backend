package com.itcast.bulls.stock.entity.vo;

import com.itcast.bulls.stock.entity.base.BaseEntity;
import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * 
 * t_institution
 *
 */
@Entity
@Table(name="t_institution")
@Data
public class InstitutionVo extends BaseEntity {

    /**i
     * 机构类型id
     */
    private String institutionTypeId;

    /**
     * 机构关联id
     */
    private Long detailInstitutionId;

    /**
     * 机构关联名称
     */
    private String detailInstitutionName;

    /**
     */
    private static final long serialVersionUID = 1L;

}