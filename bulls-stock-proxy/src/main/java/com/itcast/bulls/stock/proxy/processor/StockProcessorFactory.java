package com.itcast.bulls.stock.proxy.processor;

import com.itcast.bulls.stock.common.exception.ComponentException;
import com.itcast.bulls.stock.common.exception.constants.ApplicationErrorCodeEnum;
import com.itcast.bulls.stock.struct.netty.trade.StockHeadProto;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/**
 * <p>Description: </p>
 * @date 
 * @author 
 * @version 1.0
 * <p>Copyright:Copyright(c)2020</p>
 */
@Component
@Log4j2
public class StockProcessorFactory {
    /**
     * 交易服务的处理器
     */
    @Autowired
    private IBaseStockProcessor stockDealProcessor;

    /**
     * 用户服务的处理器
     */
    @Autowired
    private IBaseStockProcessor stockUserProcessor;

    /**
     * 行情服务的处理器
     */
    @Autowired
    private IBaseStockProcessor stockQuoteProcessor;

    /**
     * 挂单服务的处理器
     */
    @Autowired
    private IBaseStockProcessor stockRecallOrderProcessor;

    /**
     * 持仓服务的处理器
     */
    @Autowired
    private IBaseStockProcessor stockPositionProcessor;

    /**
     * 资金服务的处理器
     */
    @Autowired
    private IBaseStockProcessor stockFinanceProcessor;


    /**
     * 根据请求参数获取指定的业务处理器
     * @param requestType
     * @return
     * @throws ComponentException
     */
    public IBaseStockProcessor generateStockProcessor(StockHeadProto.RequestType requestType) throws ComponentException {
        IBaseStockProcessor processor = null;
        switch (requestType) {
            case PLACE_ORDER:
            case GET_ORDER:
                processor = stockDealProcessor;
                break;
            case USER_LOGIN:
            case ACCOUNT_WARN_SETTING:
                processor = stockUserProcessor;
                break;
            case QUOTE_KLINE:
                processor = stockQuoteProcessor;
                break;
            case RECALL_ORDER:
                processor = stockRecallOrderProcessor;
                break;
            case GET_ALL_POSITIONS:
                processor = stockPositionProcessor;
                break;
            case GET_FINANCE_OVERVIEW:
            case GET_ACCOUNT_SETTLEMENTS:
                processor = stockFinanceProcessor;
                break;
            default:
                log.error("Process in StockProcessorFactory.generateStockProcessor method, not found Processor! ");
                throw new ComponentException(ApplicationErrorCodeEnum.NOT_FOUND_PROCESSOR);
        }
        return processor;
    }
}
