package com.itcast.bulls.stock.entity.user;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.itcast.bulls.stock.entity.base.BaseEntity;
import com.itcast.bulls.stock.entity.vo.AuthorityUserRoleVo;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import org.hibernate.annotations.NotFound;
import org.hibernate.annotations.NotFoundAction;

import javax.persistence.*;
import java.util.Date;
import java.util.List;

/**
 * 
 * t_authority_user
 *
 */
@Api(value = "HATEOAS接口-用户管理(AuthorityUser)")
@Entity
@Table(name= "t_authority_user")
@Data
@ApiModel("AuthorityUser(用户信息)")
public class AuthorityUser extends BaseEntity {

    /**
     * 用户帐号（登录用）
     */
    @ApiModelProperty(value="用户账号", required = true)
    private String userAccount;

    @ApiModelProperty(value="机构类型", required = true)
    private String institutionTypeId;

    @ApiModelProperty(value="机构ID", required = true)
    private Long institutionId;

    /**
     * 用户密码
     */
    @ApiModelProperty(value="用户密码", required = true)
    @JsonIgnore
    private String userPassword;

    /**
     * 用户姓名
     */
    @ApiModelProperty(value="用户姓名", required = true)
    private String userName;

    /**
     * 电话号码
     */
    @ApiModelProperty(value="电话号码")
    private String phone;

    /**
     * 邮箱
     */
    @ApiModelProperty(value="邮箱")
    private String email;

    /**
     * 最后登录时间
     */
    @ApiModelProperty(hidden = true)
    private Date lastLoginTime;

    /**
     * 最后登陆IP
     */
    @ApiModelProperty(hidden = true)
    private String lastLoginIp;

    /**
     * 用户创建时间
     */
    @ApiModelProperty(hidden = true)
    private Date createTime;

    /**
     * 创建人的账号
     */
    @ApiModelProperty(hidden = true)
    private String creatorUserAccount;

    /**
     * 状态（0无效1有效）
     */
    @ApiModelProperty(hidden = true)
    private Integer status;

    /**
     * 是否管理员（0否1是）
     */
    @ApiModelProperty(hidden = true)
    private Integer isAdmin;

    /**
     * 备注
     */
    @ApiModelProperty(value = "备注信息 ")
    private String remark;


    @OneToMany(targetEntity= AuthorityUserRoleVo.class, cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    @NotFound(action= NotFoundAction.IGNORE)
    @JoinColumn(name = "userId", referencedColumnName="id", insertable = false, updatable = false)
    private List<AuthorityUserRoleVo> authorityUserRoleVos;

    /**
     * 角色ID
     */
    @Transient
    private Long roleId;



    /**
     */
    private static final long serialVersionUID = 1L;

}