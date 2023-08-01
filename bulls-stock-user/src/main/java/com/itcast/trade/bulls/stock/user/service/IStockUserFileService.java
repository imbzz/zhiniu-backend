package com.itcast.trade.bulls.stock.user.service;

import com.itcast.bulls.stock.common.exception.ComponentException;
import com.itcast.bulls.stock.entity.user.TradeUserFile;
import org.springframework.web.multipart.MultipartFile;

/**
 * <p>Description: </p>
 * @date 
 * @author 
 * @version 1.0
 * <p>Copyright:Copyright(c)2020</p>
 */
public interface IStockUserFileService {
    /**
     * 上传用户的身份证文件信息
     * @param userId
     * @param file
     * @return
     */
    String uploadUserIdCard(Long userId, MultipartFile file) throws Exception;

    /**
     * 根据文件ID查找文件对象
     * @param fileId
     * @return
     */
    TradeUserFile getTradeUserFile(String fileId) throws ComponentException;
}
