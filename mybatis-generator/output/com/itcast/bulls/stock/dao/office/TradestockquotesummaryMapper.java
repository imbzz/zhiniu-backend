package com.itcast.bulls.stock.dao.office;

import com.itcast.bulls.stock.entity.office.Tradestockquotesummary;

public interface TradestockquotesummaryMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table office.t_trade_stock_quote_summary
     *
     * @mbg.generated Fri May 08 15:22:22 CST 2020
     */
    int deleteByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table office.t_trade_stock_quote_summary
     *
     * @mbg.generated Fri May 08 15:22:22 CST 2020
     */
    int insert(Tradestockquotesummary record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table office.t_trade_stock_quote_summary
     *
     * @mbg.generated Fri May 08 15:22:22 CST 2020
     */
    int insertSelective(Tradestockquotesummary record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table office.t_trade_stock_quote_summary
     *
     * @mbg.generated Fri May 08 15:22:22 CST 2020
     */
    Tradestockquotesummary selectByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table office.t_trade_stock_quote_summary
     *
     * @mbg.generated Fri May 08 15:22:22 CST 2020
     */
    int updateByPrimaryKeySelective(Tradestockquotesummary record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table office.t_trade_stock_quote_summary
     *
     * @mbg.generated Fri May 08 15:22:22 CST 2020
     */
    int updateByPrimaryKey(Tradestockquotesummary record);
}