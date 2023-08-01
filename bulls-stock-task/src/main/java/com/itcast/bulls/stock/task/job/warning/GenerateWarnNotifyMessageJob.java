package com.itcast.bulls.stock.task.job.warning;

import com.itcast.bulls.stock.task.service.IAccountWarnSettingService;
import com.xxl.job.core.biz.model.ReturnT;
import com.xxl.job.core.handler.IJobHandler;
import com.xxl.job.core.handler.annotation.JobHandler;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * <p>Description: 生成账户预警通知记录信息, 每分钟执行一次 (0 0/1 * * * ? ) </p>
 * @date 
 * @author 
 * @version 1.0
 * <p>Copyright:Copyright(c)2020</p>
 */
@JobHandler(value="generateWarnNotifyMessageJob")
@Service
@Log4j2
public class GenerateWarnNotifyMessageJob extends IJobHandler {

    /**
     * 账户预警通知的服务层接口
     */
    @Autowired
    private IAccountWarnSettingService accountWarnSettingService;

    @Override
    public ReturnT<String> execute(String param) throws Exception {
        log.info("Process in GenerateWarnNotifyMessageJob.execute method, param:" + param);

        try{
            // 生成预警通知记录
            accountWarnSettingService.generateWarnNotifyMessage();
            return SUCCESS;
        }catch(Exception e) {
            log.error(e.getMessage(), e);
        }
        return FAIL;

    }

}
