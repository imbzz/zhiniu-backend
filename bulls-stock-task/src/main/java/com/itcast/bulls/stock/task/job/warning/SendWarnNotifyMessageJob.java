package com.itcast.bulls.stock.task.job.warning;

import com.itcast.bulls.stock.task.service.IAccountWarnSettingService;
import com.xxl.job.core.biz.model.ReturnT;
import com.xxl.job.core.handler.IJobHandler;
import com.xxl.job.core.handler.annotation.JobHandler;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * <p>Description: </p>
 * @date 
 * @author 
 * @version 1.0
 * <p>Copyright:Copyright(c)2020</p>
 */
@JobHandler(value="sendWarnNotifyMessageJob")
@Service
@Log4j2
public class SendWarnNotifyMessageJob extends IJobHandler {

    @Autowired
    private IAccountWarnSettingService accountWarnSettingService;

    @Override
    public ReturnT<String> execute(String param) throws Exception {
        log.info("Process in SendWarnNotifyMessageJob.execute method, param:" + param);
        try{

            // 发送预警通知数据
            accountWarnSettingService.sendWarnNotifyMessage();

            return SUCCESS;
        }catch(Exception e) {
            log.error(e.getMessage(), e);
        }
        return FAIL;

    }

}
