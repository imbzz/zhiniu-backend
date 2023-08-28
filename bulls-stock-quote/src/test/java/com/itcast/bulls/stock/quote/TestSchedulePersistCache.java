package com.itcast.bulls.stock.quote;

import com.itcast.bulls.stock.entity.quote.TradeStockQuoteLast;
import com.itcast.bulls.stock.quote.repository.trade.TradeStockQuoteLastRepository;
import com.itcast.bulls.stock.quote.service.impl.StockQuoteServiceImpl;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import javax.annotation.Resource;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;


/**
 * @imb.zz
 */
@SpringBootTest
public class TestSchedulePersistCache {

    @Resource
    private TradeStockQuoteLastRepository tradeStockQuoteLastRepository;

    @Test
    public void testSchedulePersistCache(){
        Connection c = null;
        Statement stmt = null;
        try {
            Class.forName("org.postgresql.Driver");
            c = DriverManager
                    .getConnection("jdbc:postgresql://8.134.48.179:5432/trade_stock",
                            "imbzz", "123456psql");
            System.out.println("Opened database successfully");

            stmt = c.createStatement();
            String sql = "select * from trade_stock.office.t_trade_stock_quote_last";
            stmt.executeUpdate(sql);
            stmt.close();
            c.close();
        } catch ( Exception e ) {
            System.err.println( e.getClass().getName()+": "+ e.getMessage() );
            System.exit(0);
        }
        System.out.println("Table created successfully");
    }
}
