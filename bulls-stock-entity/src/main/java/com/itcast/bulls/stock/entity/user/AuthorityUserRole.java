package com.itcast.bulls.stock.entity.user;

import com.itcast.bulls.stock.entity.base.BaseEntity;
import com.itcast.bulls.stock.entity.vo.AuthorityRoleVo;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import org.hibernate.annotations.NotFound;
import org.hibernate.annotations.NotFoundAction;

import javax.persistence.*;
import java.util.Date;

/**
 * 
 * t_authority_user_role
 *
 */
@Api(value = "HATEOAS接口-用户与角色关联管理(AuthorityUserRole)")
@Entity
@Table(name="t_authority_user_role")
@Data
@ApiModel("AuthorityUserRole(用户与角色关联表)")
public class AuthorityUserRole extends BaseEntity {

    /**
     * 用户id
     */
    @ApiModelProperty(value = "用户ID", example = "1")
    private Long userId;

    /**
     * 角色id
     */
    @ApiModelProperty(value="角色ID", example = "10171")
    private Long roleId;

    /**
     * 角色名称
     */
    @ApiModelProperty("角色名称")
    private String roleName;

    /**
     * 角色机构类型
     */
    @ApiModelProperty(value = "机构类型", example = "COMPANY")
    private String institutionTypeId;

    /**
     * 角色对应机构类型下的机构id
     */
    @ApiModelProperty(value= "机构ID", example = "10065")
    private Long institutionId;

    /**
     * 角色对应的机构名称
     */
    @ApiModelProperty(value = "机构名称", example = "御金汇公司")
    private String institutionName;


    @ManyToOne(fetch = FetchType.EAGER)
    @NotFound(action= NotFoundAction.IGNORE)
    @JoinColumn(name = "roleId", referencedColumnName="id", insertable = false, updatable = false)
    private AuthorityRoleVo authorityRoleVo;


    /**
     * 创建人id
     */
    @ApiModelProperty(hidden = true)
    private Long createBy;

    /**
     * 创建人名称
     */
    @ApiModelProperty(hidden = true)
    private String createUser;

    /**
     * 创建时间
     */
    @ApiModelProperty(hidden = true)
    private Date createTime;

    /**
     * 最后跟新人id
     */
    @ApiModelProperty(hidden = true)
    private Long lastUpdateBy;

    /**
     * 最后更新人名称
     */
    @ApiModelProperty(hidden = true)
    private String lastUpdateUser;

    /**
     * 最后更新时间
     */
    @ApiModelProperty(hidden = true)
    private Date lastUpdateTime;

    /**
     */
    private static final long serialVersionUID = 1L;

}