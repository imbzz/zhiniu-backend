package com.itcast.bulls.stock.starter.sender.vo;

import com.itcast.bulls.stock.common.utils.GlobalConstants;
import lombok.Data;

/**
 * <p>Description: </p>
 * @date 
 * @author 
 * @version 1.0
 * <p>Copyright:Copyright(c)2020</p>
 */
@Data
public class SenderResult {

    /**
     * 数据标识ID
     */
    private Long id;

    /**
     * 发送状态
     */
    private String sendStatus = GlobalConstants.STATUS_ERROR;

    /**
     * 发送结果记录
     */
    private String memo;

    /**
     * 发送状态是否成功
     * @return
     */
    public boolean isSuccess() {
        return GlobalConstants.STATUS_OK.equals(sendStatus) ? true : false;
    }

}