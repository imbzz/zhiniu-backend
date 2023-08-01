package com.itcast.trade.bulls.stock.user.dao;

import com.itcast.bulls.stock.entity.user.TradeUserFile;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * <p>Description: </p>
 * @date 
 * @author 
 * @version 1.0
 * <p>Copyright:Copyright(c)2020</p>
 */
@Repository
public interface ITradeUserFileDao {
    /**
     * 新增用户文件
     * @param record
     * @return
     */
    int insert(TradeUserFile record);

    /**
     * 更新用户文件
     * @param record
     * @return
     */
    int update(TradeUserFile record);

    /**
     * 根据用户ID获取对象
     * @param userId
     * @return
     */
    List<TradeUserFile> getByUserId(Long userId);

    /**
     * 根据文件标识ID获取对象
     * @param fileId
     * @return
     */
    TradeUserFile getByUserIdAndBizType(@Param("userId") Long userId, @Param("bizType")Integer bizType);

    /**
     * 根据文件ID获取对象
     * @param userId
     * @param bizType
     * @return
     */
    TradeUserFile getByFileId(@Param("fileId") Long fileId);

}
