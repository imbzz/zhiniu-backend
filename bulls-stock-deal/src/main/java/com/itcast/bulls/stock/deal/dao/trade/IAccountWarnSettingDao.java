package com.itcast.bulls.stock.deal.dao.trade;


import com.itcast.bulls.stock.entity.user.AccountWarnSetting;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public interface IAccountWarnSettingDao {


    /**
     * 新增数据
     * @param record
     * @return
     */
    int insert(AccountWarnSetting record);

    /**
     * 根据账号ID和股票ID查找对象
     * @param accountId
     * @param stockId
     * @return
     */
    AccountWarnSetting getByAccountAndStock(@Param("accountId") Long accountId, @Param("stockId") Long stockId);

    /**
     * 更新对象
     * @param record
     * @return
     */
    int update(AccountWarnSetting record);

    /**
     * 查询所有数据
     * @return
     */
    List<AccountWarnSetting> getAll();

}