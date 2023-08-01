package com.itcast.bulls.stock.task.dao.trade;


import com.itcast.bulls.stock.entity.trade.AccountWarnNotifyMessage;
import com.itcast.bulls.stock.starter.sender.vo.SenderResult;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public interface IAccountWarnNotifyMessageDao {

    /**
     * 新增数据
     * @param record
     * @return
     */
    int insert(AccountWarnNotifyMessage record);

    /**
     * 获取需要发送预警通知的数据, 每次抓取默认上限1000条
     * @param sendStatus
     * @param retryTimes
     * @return
     */
    List<AccountWarnNotifyMessage> getAllNeedNotifyData();

    /**
     * 更新通知消息发送后状态, 每发送一次会做一次累加
     * @param id
     * @param sendStatus
     * @return
     */
    int updateNotifyDataSendStatus(SenderResult senderResult);


}