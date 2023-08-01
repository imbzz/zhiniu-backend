package com.itcast.bulls.stock.task.job.finance;

import com.itcast.bulls.stock.task.dao.biz.ITradeAccountSettlementDao;
import com.itcast.bulls.stock.task.service.IAccountSettlementService;
import com.xxl.job.core.biz.model.ReturnT;
import com.xxl.job.core.handler.IJobHandler;
import com.xxl.job.core.handler.annotation.JobHandler;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * <p>Description: 生成账户交割单数据信息, 执行时间放在休市之后(0 0 22 * * ? )</p>
 * @date 
 * @author 
 * @version 1.0
 * <p>Copyright:Copyright(c)2020</p>
 */
@JobHandler(value = "accountSettlementJob")
@Service
@Log4j2
public class AccountSettlementJob extends IJobHandler {

    /**
     * 账户交割单任务的实现接口
     */
    @Autowired
    private IAccountSettlementService accountSettlementService;

    @Override
    public ReturnT<String> execute(String params) throws Exception {
        log.info("Process in AccountSettlementJob.execute method, params: " + params);
        try {
            // 生成账户的交割单信息
            accountSettlementService.generateAccountSettlement(params);
            return SUCCESS;
        }catch(Exception e) {
            log.error(e.getMessage(), e);
        }
        return FAIL;
    }
}
