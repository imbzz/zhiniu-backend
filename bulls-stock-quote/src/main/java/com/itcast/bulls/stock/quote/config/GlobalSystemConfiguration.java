package com.itcast.bulls.stock.quote.config;

import com.itcast.bulls.stock.common.constants.StockMarketEnum;
import com.itcast.bulls.stock.common.generator.DateUtils;
import com.itcast.bulls.stock.entity.product.TradeStock;
import com.itcast.bulls.stock.entity.product.TradeStockCategory;
import com.itcast.bulls.stock.quote.repository.biz.TradeStockCategoryRepository;
import com.itcast.bulls.stock.quote.service.IStockQuoteService;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.ApplicationArguments;
import org.springframework.boot.ApplicationRunner;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.task.TaskExecutor;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * <p>Description: </p>
 * @date 
 * @author 
 * @version 1.0
 * <p>Copyright:Copyright(c)2020</p>
 */
@Configuration
@Log4j2
public class GlobalSystemConfiguration implements ApplicationRunner {

    @Autowired
    private IStockQuoteService stockQuoteService;

    @Autowired
    private TaskExecutor taskExecutor;

    @Autowired
    private TradeStockCategoryRepository tradeStockCategoryRepository;


    /**
     * 判断是否休市 （延长5分钟）
     * @return
     */
    private int isCloseTime(TradeStockCategory category) {

        if(null != category && null != category.getEndMins()) {
            return DateUtils.compareMinsDiff(category.getEndMins().intValue());
        }
        return 0;
    }

    /**
     * 判断是否开市
     * @return
     */
    private boolean isOpenTime(TradeStockCategory category) {

        if(null != category && null != category.getStartMins()) {
            // 当前时间大于开市时间
            if(DateUtils.compareMins(category.getStartMins())) {
                return true;
            }
        }
        return false;
    }


    /**
     * 服务容器启动完成后, 调用执行
     * @param args
     * @throws Exception
     */
    @Override
    public void run(ApplicationArguments args) throws Exception {
        log.info("Process in GlobalSystemConfiguration.run method. ");
        new Thread(() -> {
            while(true) {
                try {
                    // 获取有效的股票产品行情数据
                    getStockQuotes();
                    // todo 间隔时间, 一般设置为1秒
                    // 由于是教学测试, 这里时间, 可以适当放长一些, 这里设定为30s (因为受到免费账号的限制)
                    long l = System.currentTimeMillis();
                    Thread.sleep(30000L);
                    // todo 请求api的间隔时间
                    System.out.println("======获取有效数据的间隔时间"+ (System.currentTimeMillis()-l)/1000 + "秒 ");
                }catch(Exception e) {
                    log.error(e.getMessage(), e);
                }
            }
        }).start();
    }

    /**
     * 获取股票的产品行情数据
     */
    private void getStockQuotes() {
        // 1. 获取所有的有效产品
        List<TradeStock> stockList = stockQuoteService.findAllValidStocks();
        log.info("get stock total size: " + stockList.size());
        if(null != stockList && stockList.size() > 0) {
            // 2. 根据股票产品的市场编号, 进行分组汇总处理,  每个市场的股票信息处理互不干扰
            Map<Integer, List<TradeStock>> groupBy = stockList.stream().collect(Collectors.groupingBy(TradeStock:: getMarketNo));
            groupBy.forEach((marketNo, value) -> {
                // 3. 校验股票产品的分类是否存在(股票分类和股票市场是对应关系, 分类信息里面包含交易时间的设置信息)
                TradeStockCategory category = tradeStockCategoryRepository.findByCode(StockMarketEnum.parseByMarketNo(marketNo).getMarketFlag());
                if(null == category ) {
                    log.warn("not found TradeStockCategory, marketNo: {}" , marketNo);
                    return;
                }
                // 4. 判断是否处于开盘时间
                boolean isOpenTime = isOpenTime(category);

                // 5. 计算距离收盘的时间分钟差, 收盘价是在收盘后5分钟内进行更新处理
                int closeDiffMins = isCloseTime(category);

                // 6. 交易时间内, 获取股票产品的实时行情数据 (这里是做测试, 不做交易时间的限定)
                if(1 == 1 ){
                    // 采用线程池方式调用
                    taskExecutor.execute(new Runnable() {
                        @Override
                        public void run() {
                            try {
                                // 7. 采用并发流方式, 遍历获取每个股票市场的所有产品行情数据
                                List<TradeStock> marketStockList = (List<TradeStock>) value;
                                marketStockList.parallelStream().forEach(stock -> stockQuoteService.fetchStockQuote(stock, closeDiffMins));
                            }catch(Exception e) {
                                log.error(e.getMessage(), e);
                            }
                        }
                    });
                }


            });
        }

    }
}
