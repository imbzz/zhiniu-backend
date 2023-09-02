package com.itcast.bulls.stock.entity.product;

import com.itcast.bulls.stock.entity.base.BaseEntity;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.Table;
import java.util.Date;

/**
 * 
 * t_trade_stock
 *
 */
@Api(value = "HATEOAS接口-产品管理(TradeStock)")
@Entity
@Table(name="t_trade_stock")
@Data
@ApiModel("TradeStock(产品信息)")
public class TradeStock extends BaseEntity {

    /**
     * 名称
     */
    @ApiModelProperty(value="产品名称")
    private String name;

    /**
     * 股票编号
     */
    @ApiModelProperty(value="股票编号",example = "123")
    private String code;

    /**
     * 股票分类ID
     */
    @ApiModelProperty(value="股票分类ID",example = "1")
    private Long categoryId;

    /**
     * 股票市场(0: 上交所， 1：深交所，2：港股， 3：美股）
     */
    @ApiModelProperty(value="股票市场(0: 上交所， 1：深交所，2：港股， 3：美股）",example = "1")
    private Integer marketNo;

    /**
     * 交易币种（CNY:人民币， HKD：港币，USD：美元）
     */
    @ApiModelProperty(value="交易币种（CNY:人民币， HKD：港币，USD：美元）")
    private String currency;

    /**
     * 股票单位（默认为：100）
     */
    @ApiModelProperty(value="股票单位（默认为：100）",example = "100")
    private Integer unit;

    /**
     * 标签(0:普通， 1：热门)
     */
    @ApiModelProperty(value="标签(0:普通， 1：热门)",example = "1")
    private Integer tag;

    /**
     * 状态(0:启用， 1：禁用）
     */
    @ApiModelProperty(value="状态(0:启用， 1：禁用）",example = "1")
    private Integer status;

    /**
     * 行情来源
     */
    @ApiModelProperty(value="行情来源(JH:聚合数据）")
    private String marketSource;


    @ApiModelProperty(value="涨幅",example = "123")
    private Integer highRate;


    @ApiModelProperty(value="跌幅",example = "123")
    private Integer lowRate;

    /**
     * 显示顺序, 升序排列
     */
    @ApiModelProperty(value="显示顺序, 升序排列",example = "123")
    private Integer display_order;

    /**
     * 修改时间
     */
    @ApiModelProperty(value="修改时间")
    private Date updateTime;

    /**
     * 创建时间
     */
    @ApiModelProperty(value="创建时间")
    private Date craeteTime;

    /**
     */
    private static final long serialVersionUID = 1L;

}