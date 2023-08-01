package com.itcast.bulls.stock.admin.user.repository.biz;

import java.util.List;

import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

import com.itcast.bulls.stock.entity.user.AuthorityNoLimitUri;

/**
 * <p>Description: </p>
 * @date 2019/8/2
 * @author 贺锟 
 * @version 1.0
 * @name  Mirson
 * <p>Copyright:Copyright(c)2019</p>
 */
@Repository
public interface AuthorityNoLimitUriRepository extends PagingAndSortingRepository<AuthorityNoLimitUri, Long>, JpaSpecificationExecutor<AuthorityNoLimitUri> {

    /**
     * 获取所有的公开菜单信息
     * @return
     */
    List<AuthorityNoLimitUri> findAll();
}
