package com.itcast.bulls.stock.quote.sources;

import com.google.gson.JsonObject;
import com.itcast.bulls.stock.common.constants.StockMarketEnum;
import com.itcast.bulls.stock.common.http.HttpPoolUtil;
import com.itcast.bulls.stock.common.json.GsonConvertUtil;
import com.itcast.bulls.stock.common.math.MathUtils;
import com.itcast.bulls.stock.entity.product.TradeStock;
import com.itcast.bulls.stock.entity.quote.TradeStockQuoteLast;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import java.time.LocalDateTime;
import java.time.ZoneOffset;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.Map;

/**
 * <p>Description: </p>
 * @date 
 * @author 
 * @version 1.0
 * <p>Copyright:Copyright(c)2020</p>
 */
@Component
@Log4j2
public class JuheThirdApi {

    /**
     * 第三方行情源的秘钥信息
     */
    @Value("${quote.appkey}")
    private String APPKEY;

    /**
     * 第三方行情源的地址
     */
    @Value("${quote.url}")
    private String url;

    /**
     *  沪深股市的行情接口地址
     */
    @Value("#{'${quote.url}'.concat('/hs')}")
    private String url_hs;


    /**
     * 组装完整的股票编号, 附带市场的标识(符合聚合数据平台的规范要求: 市场标识[拼音简写] + 股票编号)
     * @param stock
     * @return
     */
    private String getStockCodeByMarket(TradeStock stock) {
        if(null != stock) {
            StockMarketEnum marketEnum = StockMarketEnum.parseByMarketNo(stock.getMarketNo());
            return marketEnum.getMarketFlag().toLowerCase() + stock.getCode();
        }
        return stock.getCode();
    }


    public TradeStockQuoteLast getStockReal(TradeStock stock) {
        // 请求参数
        Map<String, String> params = new HashMap<>();
        params.put("gid", getStockCodeByMarket(stock));
        params.put("key", APPKEY);
        TradeStockQuoteLast quoteLast = null;
        try {
            HttpPoolUtil.HttpResult result = HttpPoolUtil.getSingleton().postWithAgent(url_hs, params);
            // 请求正常返回200状态码
            if(result.getResponseCode() == 200) {
                log.info(result.getBody());
                JsonObject json = GsonConvertUtil.getSingleton().getJsonObject(result.getBody());
                // 获取Json数据中的DATA信息节点
                JsonObject data = json.getAsJsonArray("result").get(0).getAsJsonObject().get("data").getAsJsonObject();
                // 将JSON数据转换为股票分时行情报价对象
                quoteLast = parseFromJson(data, stock);
            }else {
                log.error("Process in JuheThirdApi.getStockReal error, status code: " + result.getResponseCode());
            }

        }catch(Exception e) {
            log.error(e.getMessage(), e);
        }

        return quoteLast;
    }

    /**
     * 将Json行情数据转换实时行情对象
     * @param data
     * @param stock
     * @return
     */
    private TradeStockQuoteLast parseFromJson(JsonObject data, TradeStock stock) {
        TradeStockQuoteLast quoteLast = new TradeStockQuoteLast();

        // 设置基础信息
        quoteLast.setStockId(stock.getId());
        quoteLast.setStockCode(stock.getCode());
        quoteLast.setStockName(stock.getName());
        quoteLast.setLastPrice(cvt2Long(data, "nowPri"));
        quoteLast.setAmount(cvt2Long(data, "traAmount"));
        quoteLast.setVolume(data.get("traNumber").getAsLong());
        quoteLast.setTime(cvtDatetime(data.get("date").getAsString(), data.get("time").getAsString()));
        quoteLast.setMarketNo(stock.getMarketNo());

        // 设置卖方五档信息
        quoteLast.setPriceAsk1(cvt2Long(data, "sellOnePri"));
        quoteLast.setPriceAsk2(cvt2Long(data, "sellTwoPri"));
        quoteLast.setPriceAsk3(cvt2Long(data, "sellThreePri"));
        quoteLast.setPriceAsk4(cvt2Long(data, "sellFourPri"));
        quoteLast.setPriceAsk5(cvt2Long(data, "sellFivePri"));
        quoteLast.setVolumeAsk1(data.get("sellOne").getAsLong());
        quoteLast.setVolumeAsk2(data.get("sellTwo").getAsLong());
        quoteLast.setVolumeAsk3(data.get("sellThree").getAsLong());
        quoteLast.setVolumeAsk4(data.get("sellFour").getAsLong());
        quoteLast.setVolumeAsk5(data.get("sellFive").getAsLong());

        // 设置买方五档信息
        quoteLast.setPriceBid1(cvt2Long(data, "buyOnePri"));
        quoteLast.setPriceBid2(cvt2Long(data, "buyTwoPri"));
        quoteLast.setPriceBid3(cvt2Long(data, "buyThreePri"));
        quoteLast.setPriceBid4(cvt2Long(data, "buyFourPri"));
        quoteLast.setPriceBid5(cvt2Long(data, "buyFivePri"));
        quoteLast.setVolumeBid1(data.get("buyOne").getAsLong());
        quoteLast.setVolumeBid2(data.get("buyTwo").getAsLong());
        quoteLast.setVolumeBid3(data.get("buyThree").getAsLong());
        quoteLast.setVolumeBid4(data.get("buyFour").getAsLong());
        quoteLast.setVolumeBid5(data.get("buyFive").getAsLong());

        // 开盘价
        quoteLast.setOpenPrice(cvt2Long(data, "todayStartPri"));

        // 作收价
        quoteLast.setLastClosePrice(cvt2Long(data, "yestodEndPri"));


        return quoteLast;

    }

    /**
     * 拼装时间转换为时间戳， 默认置为东八时区
     * @param date
     * @param time
     * @return
     */
    private Long cvtDatetime(String date, String time) {
        DateTimeFormatter df = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        return LocalDateTime.parse(date + " " + time, df).toInstant(ZoneOffset.ofHours(8)).toEpochMilli();
    }

    /**
     * 将字符转换为长整型, 保留两位精度
     * @param data
     * @param flag
     * @return
     */
    private Long cvt2Long(JsonObject data, String flag ) {
        return MathUtils.round2Long(data.get(flag).getAsString());
    }


}
