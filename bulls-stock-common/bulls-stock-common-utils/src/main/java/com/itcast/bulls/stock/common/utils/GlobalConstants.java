package com.itcast.bulls.stock.common.utils;
/**
 * <p>Description: </p>
 * @date 2020/1/2
 * @author 贺锟 
 * @version 1.0
 * <p>Copyright:Copyright(c)2019</p>
 */
public class GlobalConstants {


    /**
     * 缓存 -- 用户信息前缀
     */
    public static final String OAUTH_KEY_STOCK_USER_DETAILS = "oauth:stock:user_details";
    /**
     * 缓存 --- 客户端信息前缀
     */
    public static final String OAUTH_KEY_CLIENT_DETAILS = "oauth:client:details";

    /**
     * 缓存 -- 用于tokenstore的存取前缀
     */
    public static final String OAUTH_PREFIX_KEY = "oauth";

    /**
     * 缓存 -- 用于tokenstore的存取前缀
     */
    public static final String OAUTH_CLIENT_CREDENTIALS = "client_credentials";
    /**
     * 缓存 -- 用户ID前缀
     */
    public static final String OAUTH_DETAILS_USER_ID = "user_id";
    /**
     * 缓存 -- 用户名称前缀
     */
    public static final String OAUTH_DETAILS_USERNAME = "user_name";

    /**
     * 缓存 -- 用户登录信息
     */
    public static final String OAUTH_DETAILS_LOGIN_INFO = "login_info";

    /**
     * 缓存 -- 用户的菜单权限信息
     */
    public static final String AUTHORITY_MENU_KEY = "authority:menu";
    public static final String AUTHORITY_MENU_NO_LIMIT_KEY = "nolimit";

    /**
     * 账户交易组， 默认组别
     */
    public static final String DEFAULT_GROUP_NAME= "默认组";


    // 用户文件类型（0：身份证， 1：银行卡， 2：信用卡）
    public static final int FILE_BIZ_TYPE_IDCARD = 0;
    public static final int FILE_BIZ_TYPE_BANK_CARD = 1;
    public static final int FILE_BIZ_TYPE_CREDIT_CARD = 2;

    // 数值型标识(YES: 1, NO:0)
    public static final int INT_YES = 1;
    public static final int INT_NO = 0;
    // 字符串常量标识， 0： 否， 1： 是
    public static final String STR_YES = "1";
    public static final String STR_NO = "0";
    // 数值型标识(ENABLE: 0, DISABLE: 1)
    public static final int INT_ENABLE = 0;
    public static final int INT_DISABLE = 1;

    // 机构类型(COMPANY: 交易商, GROUPS: 顶层公司, SERVICE_OPERATE:运营中心)
    public static final String INSTITUTION_TYPE_COMPANY = "COMPANY";
    public static final String INSTITUTION_TYPE_GROUPS = "GROUPS";
    public static final String INSTITUTION_TYPE_SERVICE_OPERATE = "SERVICE_OPERATE";

    /**
     * 分隔符
     */
    public static final String SPLIT = "|";

    // 股票行情缓存key键定义
    public static final String STOCK_QUOTE_GENERATE_KLINE_KEY ="stock:quote:generate:kline";
    public static final String STOCK_QUOTE_KLINE_KEY ="stock:quote:kline";
    public static final String STOCK_QUOTE_LAST_PRICE_KEY ="stock:quote:lastprice:kline";
    public static final String STOCK_QUOTE_CLOSE_PRICE_CUR_KEY ="stock:quote:closeprice:cur";
    public static final String STOCK_QUOTE_CLOSE_PRICE_LAST_KEY ="stock:quote:closeprice:last";
    public static final String STOCK_QUOTE_OPEN_PRICE_CUR_KEY ="stock:quote:openprice:cur";

    // 客户端交互的状态码
    public static final String STATUS_OK = "200";
    public static final String STATUS_ERROR = "300";

    /**
     * 股票代理缓存
     */
    public static final String STOCK_PROXY_USER_KEY ="stock:proxy:user";
    public static final String STOCK_PROXY_USER_KEY_ONLINE ="online";


    // 分布式锁配置
    public static final long DISTRIB_LOCK_KEY_EXPIRE =  30 * 1000;
    public static final int DISTRIB_LOCK_KEY_WAITTIME =  5;
    public static final String DISTRIB_LOCK_FOR_FINANCE = "stock-finance-lock";
    public static final String DISTRIB_LOCK_FOR_PROXY= "stock-proxy-lock";

    /**
     * 股票产品缓存
     */
    public static final String STOCK_PRODUCT_KEY ="stock:product:id";
    public static final String STOCK_PRODUCT_CATEGORY_KEY ="stock:product_cat:id";
    public static final String STOCK_PRODUCT_ALL_KEY ="stock:product:all";

    /**
     *  交易账户组缓存
     */
    public static final String STOCK_TRADE_GROUP_ACCOUNT_KEY ="stock:group:account:id";
    public static final String STOCK_TRADE_ACCOUNT_KEY ="stock:account:id";

    // 买卖方向(0: 买入， 1: 卖出）
    public static final int ORDER_DIRECTION_BUY = 0;
    public static final int ORDER_DIRECTION_SELL = 1;


    // 交易订单状态(0:待成交, 1:部分成交， 2：完全成交, 3:手工撤单， 4:系统撤单)
    public static final int ORDER_STATUS_WAIT = 0;
    public static final int ORDER_STATUS_PART = 1;
    public static final int ORDER_STATUS_ALL = 2;
    public static final int ORDER_STATUS_MANUAL_CANCEL = 3;
    public static final int ORDER_STATUS_SYS_CANCEL = 4;


    // 挂单类型(0:市价单， 1:限价单)
    public static final int ORDER_TYPE_MARKET = 0;
    public static final int ORDER_TYPE_LIMIT = 1;


    // 生成K线的时间周期, 单位是秒
    public static final int KLINE_PERIOD_60 = 60;
    public static final int KLINE_PERIOD_300 = 300;
    public static final int KLINE_PERIOD_1800 = 1800;
    public static final int KLINE_PERIOD_3600 = 3600;


    /**
     * 挂单服务
     */
    public static final String STOCK_PENDING_LIMIT_ORDER = "stock:pending:limit:order";

    /**
     * 账户预警通知缓存
     */
    public static final String ACCOUNT_WARN_SETTING_STOCK_KEY= "account:warn:setting:stockId:";
    public static final String ACCOUNT_WARN_TEMPLATE_TYPE_KEY= "account:warn:template:warntype";

    // 预警类型 (0: 止损, 1:止盈)
    public static final int ACCOUNT_WARN_TYPE_STOP_LOSS = 0;
    public static final int ACCOUNT_WARN_TYPE_STOP_PRIFIT = 1;

    // 通知方式(APP:站内信，EMAIL：邮件，SMS：短信， 多个以逗号分隔)
    public static final String ACCOUNT_WARN_NOTIFY_TYPE_APP = "APP";
    public static final String ACCOUNT_WARN_NOTIFY_TYPE_EMAIL= "EMAIL";
    public static final String ACCOUNT_WARN_NOTIFY_TYPE_SMS = "SMS";

}
