package com.itcast.bulls.stock.dao.office;

import com.itcast.bulls.stock.entity.office.Tradestockkline;

public interface TradestockklineMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table office.t_trade_stock_kline
     *
     * @mbg.generated Fri May 08 15:22:22 CST 2020
     */
    int deleteByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table office.t_trade_stock_kline
     *
     * @mbg.generated Fri May 08 15:22:22 CST 2020
     */
    int insert(Tradestockkline record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table office.t_trade_stock_kline
     *
     * @mbg.generated Fri May 08 15:22:22 CST 2020
     */
    int insertSelective(Tradestockkline record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table office.t_trade_stock_kline
     *
     * @mbg.generated Fri May 08 15:22:22 CST 2020
     */
    Tradestockkline selectByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table office.t_trade_stock_kline
     *
     * @mbg.generated Fri May 08 15:22:22 CST 2020
     */
    int updateByPrimaryKeySelective(Tradestockkline record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table office.t_trade_stock_kline
     *
     * @mbg.generated Fri May 08 15:22:22 CST 2020
     */
    int updateByPrimaryKey(Tradestockkline record);
}