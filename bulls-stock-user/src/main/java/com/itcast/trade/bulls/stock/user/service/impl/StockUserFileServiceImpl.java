package com.itcast.trade.bulls.stock.user.service.impl;

import com.itcast.bulls.stock.common.exception.BusinessException;
import com.itcast.bulls.stock.common.exception.ComponentException;
import com.itcast.bulls.stock.common.exception.constants.ApplicationErrorCodeEnum;
import com.itcast.bulls.stock.common.generator.GlobalIDGenerator;
import com.itcast.bulls.stock.common.utils.GlobalConstants;
import com.itcast.bulls.stock.entity.user.TradeUserFile;
import com.itcast.bulls.stock.starter.ceph.CephSwiftOperator;
import com.itcast.trade.bulls.stock.user.dao.ITradeUserFileDao;
import com.itcast.trade.bulls.stock.user.service.IStockUserFileService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.util.Date;

/**
 * <p>Description: </p>
 * @date 
 * @author 
 * @version 1.0
 * <p>Copyright:Copyright(c)2020</p>
 */
@Service
public class StockUserFileServiceImpl implements IStockUserFileService {

    /**
     * Ceph Swift Api接口
     */
//    @Autowired
//    private CephSwiftOperator cephSwiftOperator;

    /**
     * 全局序列号生成接口
     */
    @Autowired
    private GlobalIDGenerator globalIDGenerator;

    /**
     * 用户文件资料的数据层接口
     */
    @Autowired
    private ITradeUserFileDao tradeUserFileDao;

    /**
     * 上传用户的身份证文件信息
     * @param userId
     * @param file
     * @return
     */
    @Override
    public String uploadUserIdCard(Long userId, MultipartFile file) throws Exception {
//        // 1. 对文件做校验判断
//        if(null == file ) {
//            throw new BusinessException(ApplicationErrorCodeEnum.USER_FILE_NOT_FOUND);
//        }
//        // 2. 生成全局的唯一文件ID标识
//        String remoteFileId = globalIDGenerator.nextStrId();
//
//        // 3. 上传文件至Ceph服务器
//        cephSwiftOperator.createObject(remoteFileId, file.getBytes());
//
//
//        // 4. 从数据库中获取文件信息, 判断文件是否存在
//        TradeUserFile dbTradeUserFile = tradeUserFileDao.getByUserIdAndBizType(userId, GlobalConstants.FILE_BIZ_TYPE_IDCARD);
//        if(null  == dbTradeUserFile) {
//            dbTradeUserFile = new TradeUserFile();
//            dbTradeUserFile.setBizType(GlobalConstants.FILE_BIZ_TYPE_IDCARD);
//            dbTradeUserFile.setFilename(file.getOriginalFilename());
//            dbTradeUserFile.setFileType(file.getContentType());
//            dbTradeUserFile.setFileId(remoteFileId);
//            dbTradeUserFile.setUserId(userId);
//            dbTradeUserFile.setCreateTime(new Date());
//            // 用户文件的保存
//            tradeUserFileDao.insert(dbTradeUserFile);
//        }else {
//            // 如果文件已存在, 先删除文件服务器的原始文件
//            cephSwiftOperator.deleteObject(dbTradeUserFile.getFileId());
//
//            // 更新用户文件信息
//            dbTradeUserFile.setFileId(remoteFileId);
//            dbTradeUserFile.setFilename(file.getOriginalFilename());
//            dbTradeUserFile.setFileType(file.getContentType());
//            tradeUserFileDao.update(dbTradeUserFile);
//        }
//        return remoteFileId;
        return  null;
    }

    /**
     * 根据文件ID查找文件对象
     * @param fileId
     * @return
     */
    @Override
    public TradeUserFile getTradeUserFile(String fileId) throws ComponentException {
//        TradeUserFile tradeUserFile = tradeUserFileDao.getByFileId(Long.valueOf(fileId));
//        if(null == tradeUserFile) {
//            throw new ComponentException(ApplicationErrorCodeEnum.USER_FILE_NOT_FOUND);
//        }
//        return tradeUserFile;
        return null;
    }



}
