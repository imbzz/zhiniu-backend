package com.itcast.bulls.stock.entity.user;

import com.itcast.bulls.stock.entity.base.BaseEntity;
import com.itcast.bulls.stock.entity.vo.AuthorityMenuOperationVo;
import lombok.Data;
import org.hibernate.annotations.NotFound;
import org.hibernate.annotations.NotFoundAction;

import javax.persistence.*;

/**
 * 
 * t_authority_role_operation
 *
 */
@Entity
@Table(name= "t_authority_role_operation")
@Data
@NamedEntityGraph(name = "AuthorityRoleOperation.fullMenuOperation", attributeNodes = {@NamedAttributeNode("authorityMenuOperationVo")})
public class AuthorityRoleOperation extends BaseEntity {

    /**
     * 自定义角色id
     */
    private Long roleId;

    /**
     * 自定义操作id
     */
    private Long operationId;



    @ManyToOne(fetch = FetchType.EAGER)
    @NotFound(action= NotFoundAction.IGNORE)
    @JoinColumn(name = "operationId", referencedColumnName="id", insertable = false, updatable = false)
    private AuthorityMenuOperationVo authorityMenuOperationVo;

    /**
     */
    private static final long serialVersionUID = 1L;

}