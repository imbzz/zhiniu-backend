package com.itcast.bulls.stock.admin.user.repository.biz;

import java.util.List;

import org.springframework.data.jpa.repository.EntityGraph;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.itcast.bulls.stock.entity.user.AuthorityRoleOperation;

/**
 * <p>Description: </p>
 * @date 2019/7/30
 * @author 贺锟 
 * @version 1.0
 * <p>Copyright:Copyright(c)2019</p>
 */
@Repository
public interface AuthorityRoleOperationRepository extends PagingAndSortingRepository<AuthorityRoleOperation, Long>, JpaSpecificationExecutor<AuthorityRoleOperation> {


    /**
     * 根据角色ID删除所有角色操作对象
     * @param roleId
     * @return
     */
    @Transactional
    @Modifying
    @Query(" delete from AuthorityRoleOperation where roleId = :roleId")
    public int deleteAllByRoleId(@Param("roleId") Long roleId);


    /**
     * 根据所有角色ID获取操作数据
     * @param roleId
     * @return
     */
//    @Query(value = "select roleOpt.*, menuOpt.menuId from t_authority_role_operation roleOpt, t_authority_menu_operation menuOpt " +
//            " where roleOpt.roleId = ? " +
//            " and roleOpt.operationId = menuOpt.id ", nativeQuery = true)
    // 减少出现过多的N+1条SQL查询
    @EntityGraph(value = "AuthorityRoleOperation.fullMenuOperation" , type= EntityGraph.EntityGraphType.FETCH)
    List<AuthorityRoleOperation> findAllByRoleId(@Param("roleId") Long roleId);

}
