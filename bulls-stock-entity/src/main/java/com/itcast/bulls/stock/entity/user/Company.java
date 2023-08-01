package com.itcast.bulls.stock.entity.user;

import com.itcast.bulls.stock.entity.base.BaseEntity;
import lombok.Data;

import java.util.Date;

/**
 * <p>Description: 公司信息表</p>
 * @date 2019/11/20
 * @author 贺锟 
 * @version 1.0
 * @name  Mirson
 * <p>Copyright:Copyright(c)2019</p>
 */
@Data
public class Company extends BaseEntity {

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
     * 管理员密码
     */
    private String adminPwd;

    /**
     * 状态(0:有效， 2：禁用）
     */
    private Integer status;

    /**
     * 创建人名称
     */
    private String createUser;

    /**
     * 创建时间
     */
    private Date createTime;

    /**
     * 最后更新人名称
     */
    private String lastUpdateUser;

    /**
     * 最后更新时间
     */
    private Date lastUpdateTime;

}
