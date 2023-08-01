package com.itcast.trade.bulls.stock.user.vo;

import lombok.Data;

/**
 * <p>Description: </p>
 * @date 
 * @author 
 * @version 1.0
 * <p>Copyright:Copyright(c)2020</p>
 */
@Data
public class CompanyVo {

    /**
     * 公司ID
     */
    private Long id;

    /**
     * 公司名称
     */
    private String companyName;

    /**
     * 机构类型
     */
    private String institutionTypeId;

    /**
     * 联系人
     */
    private String contactUser;

    /**
     * 联系电话
     */
    private String contactPhone;

    /**
     * 管理员账号
     */
    private String adminUser;

    /**
     * 机构ID
     */
    private Long institutionId;

}

