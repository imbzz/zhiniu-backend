package com.itcast.bulls.stock.entity.user;

import com.itcast.bulls.stock.entity.base.BaseEntity;
import com.itcast.bulls.stock.entity.vo.ParentAuthorityMenuVo;
import io.swagger.annotations.Api;
import lombok.Data;
import org.hibernate.annotations.NotFound;
import org.hibernate.annotations.NotFoundAction;

import javax.persistence.*;

/**
 * 
 * t_authority_menu
 *
 */
@Api(value = "HATEOAS接口-菜单管理(AuthorityMenu)")
@Entity
@Table(name="t_authority_menu")
@Data
public class AuthorityMenu extends BaseEntity {

    /**
     */
    private static final long serialVersionUID = -1L;


    /**
     * 上级menu_id
     */
    private Long parentId;

    /**
     * 机构类型id
     */
    private String institutionTypeId;

    /**
     * 菜单编码
     */
    private String menuCode;

    /**
     * 菜单名称
     */
    private String menuName;

    /**
     * 菜单URI
     */
    private String menuUri;

    /**
     * 菜单等级
     */
    private Integer menuLevel;

    /**
     * 是否需要操作授权（0不需要（默认） ，1需要）
     */
    private Integer operationSecurity;

    /**
     * 位置排序
     */
    private Integer menuSeq;

    /**
     */
    private String menuIco;

    /**
     * 菜单状态(0无效,1有效)
     */
    private Integer status;

    /**
     * 只对2级菜单生效。0闭合，1打开
     */
    private Integer isOpen;

    /**
     * 是否显示 (0--否  1--是)
     */
    private Integer isShow;

    /**
     * 组件标识（前后分离使用）
     */
    private String componentSrc;

    @ManyToOne(fetch = FetchType.EAGER)
    @NotFound(action= NotFoundAction.IGNORE)
    @JoinColumn(name = "parentId", referencedColumnName="id", insertable = false, updatable = false)
    private ParentAuthorityMenuVo parentAuthorityMenu;


}