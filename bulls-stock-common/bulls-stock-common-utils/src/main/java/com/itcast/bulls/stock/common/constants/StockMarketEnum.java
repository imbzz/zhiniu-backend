package com.itcast.bulls.stock.common.constants;

import lombok.Getter;

/**
 * <p>Description: </p>
 * @date 
 * @author 
 * @version 1.0
 * <p>Copyright:Copyright(c)2020</p>
 */
@Getter
public enum StockMarketEnum {
    SHANGHAI(0, "sh", "上交所"),
    SHENZHEN(1, "sz", "深交所"),
    HONGKONG(2, null, "港交所"),
    NASDAQ(3, null, "纳斯达克"),

    ;
    /**
     * 市场编号
     */
    private int marketNo;

    /**
     * 市场标识（主要区分上交所和深交所的股票）
     */
    private String marketFlag;

    /**
     * 市场名称
     */
    private String marketName;

    StockMarketEnum(int marketNo, String marketFlag, String marketName){
        this.marketNo = marketNo;
        this.marketFlag = marketFlag;
        this.marketName = marketName;
    }

    /**
     * 根据市场编号获取枚举
     * @param marketNo
     * @return
     */
    public static StockMarketEnum parseByMarketNo(int marketNo) {
        for(StockMarketEnum marketEnum : values()) {
            if(marketNo == marketEnum.getMarketNo()) {
                return marketEnum;
            }
        }
        return null;
    }

}

