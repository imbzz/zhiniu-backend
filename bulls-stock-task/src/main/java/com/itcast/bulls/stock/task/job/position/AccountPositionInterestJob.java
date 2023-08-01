package com.itcast.bulls.stock.task.job.position;

import com.itcast.bulls.stock.task.service.IAccountPositionInterestService;
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
@JobHandler(value="accountPositionInterestJob")
@Service
@Log4j2
public class AccountPositionInterestJob extends IJobHandler {

    /**
     * 持仓利息的业务实现接口
     */
    @Autowired
    private IAccountPositionInterestService accountPositionInterestService;


    @Override
    public ReturnT<String> execute(String param) throws Exception {
        log.info("Process in AccountPositionInterestJob.execute method, param:" + param);

        try{
            // 生成账户持仓利息
            accountPositionInterestService.generateAccountPositionInterest(param);
            return SUCCESS;
        }catch(Exception e) {
            log.error(e.getMessage(), e);
        }
        return FAIL;

    }

}
