/*100009
 Navicat Premium Data Transfer

 Source Server         : 192.168.19.150_pgSql
 Source Server Type    : PostgreSQL
 Source Server Version : 100009
 Source Host           : 192.168.19.150:5432
 Source Catalog        : trade_stock
 Source Schema         : office

 Target Server Type    : PostgreSQL
 Target Server Version : 100009
 File Encoding         : 65001

 Date: 27/02/2020 21:32:28
*/


-- ----------------------------
-- Sequence structure for t_account_warn_notify_message_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "office"."t_account_warn_notify_message_id_seq";
CREATE SEQUENCE "office"."t_account_warn_notify_message_id_seq"
    INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for t_account_warn_setting_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "office"."t_account_warn_setting_id_seq";
CREATE SEQUENCE "office"."t_account_warn_setting_id_seq"
    INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for t_trade_deal_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "office"."t_trade_deal_id_seq";
CREATE SEQUENCE "office"."t_trade_deal_id_seq"
    INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for t_trade_order_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "office"."t_trade_order_id_seq";
CREATE SEQUENCE "office"."t_trade_order_id_seq"
    INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for t_trade_position_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "office"."t_trade_position_id_seq";
CREATE SEQUENCE "office"."t_trade_position_id_seq"
    INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for t_trade_stock_kline_1_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "office"."t_trade_stock_kline_1_id_seq";
CREATE SEQUENCE "office"."t_trade_stock_kline_1_id_seq"
    INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for t_trade_stock_kline_5_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "office"."t_trade_stock_kline_5_id_seq";
CREATE SEQUENCE "office"."t_trade_stock_kline_5_id_seq"
    INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for t_trade_stock_kline_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "office"."t_trade_stock_kline_id_seq";
CREATE SEQUENCE "office"."t_trade_stock_kline_id_seq"
    INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for t_trade_stock_quote_last_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "office"."t_trade_stock_quote_last_id_seq";
CREATE SEQUENCE "office"."t_trade_stock_quote_last_id_seq"
    INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for t_trade_stock_quote_summary_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "office"."t_trade_stock_quote_summary_id_seq";
CREATE SEQUENCE "office"."t_trade_stock_quote_summary_id_seq"
    INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Table structure for t_account_warn_notify_message
-- ----------------------------
DROP TABLE IF EXISTS "office"."t_account_warn_notify_message";
CREATE TABLE "office"."t_account_warn_notify_message" (
    -- "id" int4 NOT NULL DEFAULT nextval('t_account_warn_notify_message_id_seq'::regclass),
                                                          "id" serial4 primary key,
                                                          "userid" int8,
                                                          "accountid" int8,
                                                          "receiver" varchar(120) COLLATE "pg_catalog"."default",
                                                          "notifytype" varchar(255) COLLATE "pg_catalog"."default",
                                                          "warntype" int4 NOT NULL,
                                                          "notifycontent" varchar(2000) COLLATE "pg_catalog"."default",
                                                          "sendstatus" varchar(128) COLLATE "pg_catalog"."default",
                                                          "retrytimes" int4,
                                                          "memo" varchar(500) COLLATE "pg_catalog"."default",
                                                          "updatetime" timestamp(6),
                                                          "userno" varchar(32) COLLATE "pg_catalog"."default",
                                                          "notifytitle" varchar(64) COLLATE "pg_catalog"."default",
                                                          "username" varchar(32) COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "office"."t_account_warn_notify_message"."id" IS '主键标识';
COMMENT ON COLUMN "office"."t_account_warn_notify_message"."userid" IS '用户ID';
COMMENT ON COLUMN "office"."t_account_warn_notify_message"."accountid" IS '账户ID';
COMMENT ON COLUMN "office"."t_account_warn_notify_message"."receiver" IS '接收者地址';
COMMENT ON COLUMN "office"."t_account_warn_notify_message"."notifytype" IS '通知方式(APP:站内信，EMAIL：邮件，SMS：短信， 多个以逗号分隔)';
COMMENT ON COLUMN "office"."t_account_warn_notify_message"."warntype" IS '预警类型 (0: 止损, 1:止盈)';
COMMENT ON COLUMN "office"."t_account_warn_notify_message"."notifycontent" IS '通知内容';
COMMENT ON COLUMN "office"."t_account_warn_notify_message"."sendstatus" IS '发送状态（成功为OK， 失败为错误码）';
COMMENT ON COLUMN "office"."t_account_warn_notify_message"."retrytimes" IS '重试次数，默认重发3次';
COMMENT ON COLUMN "office"."t_account_warn_notify_message"."memo" IS '备注，如果失败， 记录异常信息';
COMMENT ON COLUMN "office"."t_account_warn_notify_message"."updatetime" IS '更新时间';
COMMENT ON TABLE "office"."t_account_warn_notify_message" IS '账户预警通知记录表';

-- ----------------------------
-- Records of t_account_warn_notify_message
-- ----------------------------
INSERT INTO "office"."t_account_warn_notify_message" VALUES (8, 1, 1, '1', 'APP', 1, '尊敬的客户， 您所持有的产品601398$， 当前价格5.5$元， 已达到止损比例1.0%$，请您及时处理。', '200', 1, NULL, '2019-09-20 23:16:40.057984', NULL, NULL, NULL);
INSERT INTO "office"."t_account_warn_notify_message" VALUES (6, 1, 1, '1', 'APP', 1, '尊敬的客户， 您所持有的产品601318$， 当前价格88.95$元， 已达到止损比例1.66%$，请您及时处理。', '200', 1, NULL, '2019-09-20 23:16:40.059413', NULL, NULL, NULL);
INSERT INTO "office"."t_account_warn_notify_message" VALUES (10, 1, 1, '1', 'APP', 1, '尊敬的客户， 您所持有的产品601318$， 当前价格88.95$元， 已达到止损比例1.66%$，请您及时处理。', '200', 1, NULL, '2019-09-20 23:21:45.381542', NULL, NULL, NULL);
INSERT INTO "office"."t_account_warn_notify_message" VALUES (12, 1, 1, '1', 'APP', 1, '尊敬的客户， 您所持有的产品601398$， 当前价格5.5$元， 已达到止损比例1.0%$，请您及时处理。', '200', 1, NULL, '2019-09-20 23:21:45.383235', NULL, NULL, NULL);
INSERT INTO "office"."t_account_warn_notify_message" VALUES (7, 1, 1, 'test2', 'EMAIL', 1, '尊敬的客户， 您所持有的产品601318$， 当前价格88.95$元， 已达到止损比例1.66%$，请您及时处理。', 'InvalidToAddress', 4, 'InvalidToAddress : The specified toAddress is wrongly formed.
RequestId : 66C75991-BF0B-46FD-AE81-40EB4BAC923F', '2019-12-31 17:47:12.461043', NULL, NULL, NULL);
INSERT INTO "office"."t_account_warn_notify_message" VALUES (9, 1, 1, 'hekun@itcast.cn', 'EMAIL', 1, '尊敬的客户， 您所持有的产品601398$， 当前价格5.5$元， 已达到止损比例1.0%$，请您及时处理。', '200', 3, NULL, '2019-12-31 17:47:12.955704', NULL, NULL, NULL);
INSERT INTO "office"."t_account_warn_notify_message" VALUES (15, 1, 1, 'hekun@itcast.cn', 'EMAIL', 1, '尊敬的客户， 您所持有的产品601318$， 当前价格82.39$元， 已达到止损比例1.65999997%$，请您及时处理。', NULL, 0, NULL, '2020-02-27 18:29:47.179', 'admin', '账户预警通知', 'admin');
INSERT INTO "office"."t_account_warn_notify_message" VALUES (11, 1, 1, 'test2', 'EMAIL', 1, '尊敬的客户， 您所持有的产品601318$， 当前价格88.95$元， 已达到止损比例1.66%$，请您及时处理。', 'InvalidToAddress', 4, 'InvalidToAddress : The specified toAddress is wrongly formed.
RequestId : 2748DB7A-9329-451D-ADCF-6938CDEBF763', '2019-12-31 17:47:12.458157', NULL, NULL, NULL);
INSERT INTO "office"."t_account_warn_notify_message" VALUES (13, 1, 1, 'test2', 'EMAIL', 1, '尊敬的客户， 您所持有的产品601398$， 当前价格5.5$元， 已达到止损比例1.0%$，请您及时处理。', 'InvalidToAddress', 4, 'InvalidToAddress : The specified toAddress is wrongly formed.
RequestId : 2616EF5E-7144-4AAA-B8D2-17170FE48E17', '2019-12-31 17:47:12.460123', NULL, NULL, NULL);
INSERT INTO "office"."t_account_warn_notify_message" VALUES (14, 1, 1, '1', 'APP', 1, '尊敬的客户， 您所持有的产品601318$， 当前价格82.39$元， 已达到止损比例1.65999997%$，请您及时处理。', '200', 1, NULL, '2020-02-20 11:01:31.523268', 'admin', '账户预警通知', 'admin');

-- ----------------------------
-- Table structure for t_account_warn_setting
-- ----------------------------
DROP TABLE IF EXISTS "office"."t_account_warn_setting";
CREATE TABLE "office"."t_account_warn_setting" (
    -- "id" int4 NOT NULL DEFAULT nextval('t_account_warn_setting_id_seq'::regclass),
                                                   "id" serial4 primary key,
                                                   "accountid" int8,
                                                   "stockid" int8,
                                                   "warntype" int4 NOT NULL,
                                                   "stoprate" float4,
                                                   "notifytype" varchar(255) COLLATE "pg_catalog"."default",
                                                   "createtime" timestamp(6),
                                                   "updatetime" timestamp(6)
)
;
COMMENT ON COLUMN "office"."t_account_warn_setting"."id" IS '主键标识';
COMMENT ON COLUMN "office"."t_account_warn_setting"."accountid" IS '账户ID';
COMMENT ON COLUMN "office"."t_account_warn_setting"."stockid" IS '股票产品ID';
COMMENT ON COLUMN "office"."t_account_warn_setting"."warntype" IS '预警类型 (0: 止损, 1:止盈)';
COMMENT ON COLUMN "office"."t_account_warn_setting"."stoprate" IS '止盈止损设置比例';
COMMENT ON COLUMN "office"."t_account_warn_setting"."notifytype" IS '通知方式(APP:站内信，EMAIL：邮件，SMS：短信， 多个以逗号分隔)';
COMMENT ON COLUMN "office"."t_account_warn_setting"."createtime" IS '创建时间';
COMMENT ON COLUMN "office"."t_account_warn_setting"."updatetime" IS '更新时间';
COMMENT ON TABLE "office"."t_account_warn_setting" IS '账户预警设置表';

-- ----------------------------
-- Records of t_account_warn_setting
-- ----------------------------
INSERT INTO "office"."t_account_warn_setting" VALUES (2, 2, 2, 1, 6, 'APP,EMAIL', '2019-08-29 17:13:45.954', '2019-08-29 17:15:55.494');
INSERT INTO "office"."t_account_warn_setting" VALUES (3, 1, 1, 1, 1.66, 'APP,EMAIL', '2019-09-24 15:15:50.793', '2019-09-25 11:03:02.633');
INSERT INTO "office"."t_account_warn_setting" VALUES (1, 1, 2, 1, 1.66, 'EMAIL', '2019-08-29 17:13:45.954', '2020-02-27 17:33:04.355');

-- ----------------------------
-- Table structure for t_trade_deal
-- ----------------------------
DROP TABLE IF EXISTS "office"."t_trade_deal";
CREATE TABLE "office"."t_trade_deal" (
    -- "id" int4 NOT NULL DEFAULT nextval('t_trade_deal_id_seq'::regclass),
                                         "id" serial4 primary key,
                                         "tradeorderid" int8 NOT NULL,
                                         "accountid" int8 NOT NULL,
                                         "stockid" int8 NOT NULL,
                                         "stockmarket" int2,
                                         "execvolume" int4,
                                         "execprice" int8,
                                         "exectime" timestamp(0),
                                         "direction" int2 NOT NULL,
                                         "profit" int8,
                                         "commission" int8,
                                         "taxes" int8,
                                         "status" int2 NOT NULL,
                                         "positionid" int8 NOT NULL,
                                         "accountno" varchar(32) COLLATE "pg_catalog"."default",
                                         "stockcode" varchar(32) COLLATE "pg_catalog"."default",
                                         "stockname" varchar(32) COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "office"."t_trade_deal"."id" IS '主键， 唯一标识';
COMMENT ON COLUMN "office"."t_trade_deal"."tradeorderid" IS '交易订单号';
COMMENT ON COLUMN "office"."t_trade_deal"."accountid" IS '交易账号ID';
COMMENT ON COLUMN "office"."t_trade_deal"."stockid" IS '股票ID';
COMMENT ON COLUMN "office"."t_trade_deal"."stockmarket" IS '股票市场(0: 上交所， 1：深交所，2：港股， 3：美股）';
COMMENT ON COLUMN "office"."t_trade_deal"."execvolume" IS '成交数量';
COMMENT ON COLUMN "office"."t_trade_deal"."execprice" IS '成交价格';
COMMENT ON COLUMN "office"."t_trade_deal"."exectime" IS '成交时间';
COMMENT ON COLUMN "office"."t_trade_deal"."direction" IS '买卖方向';
COMMENT ON COLUMN "office"."t_trade_deal"."profit" IS '盈亏';
COMMENT ON COLUMN "office"."t_trade_deal"."commission" IS '佣金';
COMMENT ON COLUMN "office"."t_trade_deal"."taxes" IS '税费';
COMMENT ON COLUMN "office"."t_trade_deal"."status" IS '状态(0:有效，1：无效）';
COMMENT ON COLUMN "office"."t_trade_deal"."positionid" IS '仓位ID';
COMMENT ON TABLE "office"."t_trade_deal" IS '成交记录表';

-- ----------------------------
-- Records of t_trade_deal
-- ----------------------------
INSERT INTO "office"."t_trade_deal" VALUES (632, 660, 1, 2, 0, 1, 539, '2019-08-28 17:27:16', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (644, 672, 1, 2, 0, 1, 539, '2019-08-28 17:27:16', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (661, 689, 1, 2, 0, 1, 539, '2019-08-28 17:27:17', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (665, 693, 1, 2, 0, 1, 539, '2019-08-28 17:27:18', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (686, 714, 1, 2, 0, 1, 539, '2019-08-28 17:27:18', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (694, 722, 1, 2, 0, 1, 539, '2019-08-28 17:27:19', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (701, 729, 1, 2, 0, 1, 539, '2019-08-28 17:27:19', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (705, 733, 1, 2, 0, 1, 539, '2019-08-28 17:27:20', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (708, 736, 1, 2, 0, 1, 539, '2019-08-28 17:27:20', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (711, 739, 1, 2, 0, 1, 539, '2019-08-28 17:27:20', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (721, 749, 1, 2, 0, 1, 539, '2019-08-28 17:27:20', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (727, 755, 1, 2, 0, 1, 539, '2019-08-28 17:27:21', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (839, 867, 1, 2, 0, 1, 539, '2019-08-28 17:36:38', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (842, 870, 1, 2, 0, 1, 539, '2019-08-28 17:36:38', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (845, 873, 1, 2, 0, 1, 539, '2019-08-28 17:36:38', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (848, 876, 1, 2, 0, 1, 539, '2019-08-28 17:36:38', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (871, 899, 1, 2, 0, 1, 539, '2019-08-28 17:36:38', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (874, 902, 1, 2, 0, 1, 539, '2019-08-28 17:36:40', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (880, 908, 1, 2, 0, 1, 539, '2019-08-28 17:36:40', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (883, 911, 1, 2, 0, 1, 539, '2019-08-28 17:36:40', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (890, 918, 1, 2, 0, 1, 539, '2019-08-28 17:36:40', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (900, 928, 1, 2, 0, 1, 539, '2019-08-28 17:36:41', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (909, 937, 1, 2, 0, 1, 539, '2019-08-28 17:36:41', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (920, 948, 1, 2, 0, 1, 539, '2019-08-28 17:36:42', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (928, 956, 1, 2, 0, 1, 539, '2019-08-28 17:36:42', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1340, 1368, 1, 2, 0, 1, 539, '2019-08-28 18:23:25', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1346, 1374, 1, 2, 0, 1, 539, '2019-08-28 18:23:25', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1355, 1383, 1, 2, 0, 1, 539, '2019-08-28 18:23:25', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1361, 1389, 1, 2, 0, 1, 539, '2019-08-28 18:23:26', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1371, 1399, 1, 2, 0, 1, 539, '2019-08-28 18:23:26', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1375, 1403, 1, 2, 0, 1, 539, '2019-08-28 18:23:27', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1378, 1406, 1, 2, 0, 1, 539, '2019-08-28 18:23:27', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1383, 1411, 1, 2, 0, 1, 539, '2019-08-28 18:23:27', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1386, 1414, 1, 2, 0, 1, 539, '2019-08-28 18:23:27', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1395, 1423, 1, 2, 0, 1, 539, '2019-08-28 18:23:28', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1398, 1426, 1, 2, 0, 1, 539, '2019-08-28 18:23:28', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1425, 1453, 1, 2, 0, 1, 539, '2019-08-28 18:23:28', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1436, 1464, 1, 2, 0, 1, 539, '2019-08-28 18:23:30', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1438, 1466, 1, 2, 0, 1, 539, '2019-08-28 18:24:52', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1451, 1479, 1, 2, 0, 1, 539, '2019-08-28 18:24:52', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1454, 1482, 1, 2, 0, 1, 539, '2019-08-28 18:24:53', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1493, 1521, 1, 2, 0, 1, 539, '2019-08-28 18:24:53', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1496, 1524, 1, 2, 0, 1, 539, '2019-08-28 18:24:55', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1498, 1526, 1, 2, 0, 1, 539, '2019-08-28 18:24:55', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1501, 1529, 1, 2, 0, 1, 539, '2019-08-28 18:24:55', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1514, 1542, 1, 2, 0, 1, 539, '2019-08-28 18:24:55', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1517, 1545, 1, 2, 0, 1, 539, '2019-08-28 18:24:56', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1522, 1550, 1, 2, 0, 1, 539, '2019-08-28 18:24:56', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1525, 1553, 1, 2, 0, 1, 539, '2019-08-28 18:24:56', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1529, 1557, 1, 2, 0, 1, 539, '2019-08-28 18:24:57', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1837, 1865, 1, 2, 0, 1, 539, '2019-08-28 18:30:55', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1845, 1873, 1, 2, 0, 1, 539, '2019-08-28 18:30:55', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1853, 1881, 1, 2, 0, 1, 539, '2019-08-28 18:30:55', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1861, 1889, 1, 2, 0, 1, 539, '2019-08-28 18:30:55', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1869, 1897, 1, 2, 0, 1, 539, '2019-08-28 18:30:56', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1877, 1905, 1, 2, 0, 1, 539, '2019-08-28 18:30:56', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1885, 1913, 1, 2, 0, 1, 539, '2019-08-28 18:30:57', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1893, 1921, 1, 2, 0, 1, 539, '2019-08-28 18:30:57', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1901, 1929, 1, 2, 0, 1, 539, '2019-08-28 18:30:57', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1909, 1937, 1, 2, 0, 1, 539, '2019-08-28 18:30:58', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1917, 1945, 1, 2, 0, 1, 539, '2019-08-28 18:30:58', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1925, 1953, 1, 2, 0, 1, 539, '2019-08-28 18:30:59', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1933, 1961, 1, 2, 0, 1, 539, '2019-08-28 18:30:59', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1943, 1972, 1, 1, 0, 100, 8865, '2019-10-30 17:04:32', 0, NULL, 10638, NULL, 0, 7, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1944, 1973, 1, 1, 0, 100, 8865, '2019-10-30 17:14:33', 0, NULL, 10638, NULL, 0, 7, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (633, 661, 1, 2, 0, 1, 539, '2019-08-28 17:27:16', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (642, 670, 1, 2, 0, 1, 539, '2019-08-28 17:27:16', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (651, 679, 1, 2, 0, 1, 539, '2019-08-28 17:27:17', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (668, 696, 1, 2, 0, 1, 539, '2019-08-28 17:27:17', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (671, 699, 1, 2, 0, 1, 539, '2019-08-28 17:27:18', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (687, 715, 1, 2, 0, 1, 539, '2019-08-28 17:27:18', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (696, 724, 1, 2, 0, 1, 539, '2019-08-28 17:27:19', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (703, 731, 1, 2, 0, 1, 539, '2019-08-28 17:27:20', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (709, 737, 1, 2, 0, 1, 539, '2019-08-28 17:27:20', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (715, 743, 1, 2, 0, 1, 539, '2019-08-28 17:27:20', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (718, 746, 1, 2, 0, 1, 539, '2019-08-28 17:27:21', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (725, 753, 1, 2, 0, 1, 539, '2019-08-28 17:27:21', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (840, 868, 1, 2, 0, 1, 539, '2019-08-28 17:36:38', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (852, 880, 1, 2, 0, 1, 539, '2019-08-28 17:36:38', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (855, 883, 1, 2, 0, 1, 539, '2019-08-28 17:36:39', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (859, 887, 1, 2, 0, 1, 539, '2019-08-28 17:36:39', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (865, 893, 1, 2, 0, 1, 539, '2019-08-28 17:36:39', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (872, 900, 1, 2, 0, 1, 539, '2019-08-28 17:36:39', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (875, 903, 1, 2, 0, 1, 539, '2019-08-28 17:36:40', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (886, 914, 1, 2, 0, 1, 539, '2019-08-28 17:36:40', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (893, 921, 1, 2, 0, 1, 539, '2019-08-28 17:36:41', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (906, 934, 1, 2, 0, 1, 539, '2019-08-28 17:36:41', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (913, 941, 1, 2, 0, 1, 539, '2019-08-28 17:36:42', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (916, 944, 1, 2, 0, 1, 539, '2019-08-28 17:36:42', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (921, 949, 1, 2, 0, 1, 539, '2019-08-28 17:36:42', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (927, 955, 1, 2, 0, 1, 539, '2019-08-28 17:36:42', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1341, 1369, 1, 2, 0, 1, 539, '2019-08-28 18:23:25', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1353, 1381, 1, 2, 0, 1, 539, '2019-08-28 18:23:25', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1356, 1384, 1, 2, 0, 1, 539, '2019-08-28 18:23:26', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1365, 1393, 1, 2, 0, 1, 539, '2019-08-28 18:23:26', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1368, 1396, 1, 2, 0, 1, 539, '2019-08-28 18:23:26', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1380, 1408, 1, 2, 0, 1, 539, '2019-08-28 18:23:27', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1389, 1417, 1, 2, 0, 1, 539, '2019-08-28 18:23:27', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1393, 1421, 1, 2, 0, 1, 539, '2019-08-28 18:23:28', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1401, 1429, 1, 2, 0, 1, 539, '2019-08-28 18:23:28', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1413, 1441, 1, 2, 0, 1, 539, '2019-08-28 18:23:28', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1423, 1451, 1, 2, 0, 1, 539, '2019-08-28 18:23:29', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1430, 1458, 1, 2, 0, 1, 539, '2019-08-28 18:23:29', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1439, 1467, 1, 2, 0, 1, 539, '2019-08-28 18:24:52', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1445, 1473, 1, 2, 0, 1, 539, '2019-08-28 18:24:52', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1455, 1483, 1, 2, 0, 1, 539, '2019-08-28 18:24:52', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1474, 1502, 1, 2, 0, 1, 539, '2019-08-28 18:24:53', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1477, 1505, 1, 2, 0, 1, 539, '2019-08-28 18:24:54', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1484, 1512, 1, 2, 0, 1, 539, '2019-08-28 18:24:54', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1491, 1519, 1, 2, 0, 1, 539, '2019-08-28 18:24:54', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1494, 1522, 1, 2, 0, 1, 539, '2019-08-28 18:24:55', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1513, 1541, 1, 2, 0, 1, 539, '2019-08-28 18:24:55', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1516, 1544, 1, 2, 0, 1, 539, '2019-08-28 18:24:56', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1519, 1547, 1, 2, 0, 1, 539, '2019-08-28 18:24:56', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1535, 1563, 1, 2, 0, 1, 539, '2019-08-28 18:24:56', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1838, 1866, 1, 2, 0, 1, 539, '2019-08-28 18:30:55', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1846, 1874, 1, 2, 0, 1, 539, '2019-08-28 18:30:55', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1854, 1882, 1, 2, 0, 1, 539, '2019-08-28 18:30:55', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1862, 1890, 1, 2, 0, 1, 539, '2019-08-28 18:30:55', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1870, 1898, 1, 2, 0, 1, 539, '2019-08-28 18:30:56', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1878, 1906, 1, 2, 0, 1, 539, '2019-08-28 18:30:56', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1886, 1914, 1, 2, 0, 1, 539, '2019-08-28 18:30:57', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1894, 1922, 1, 2, 0, 1, 539, '2019-08-28 18:30:57', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1902, 1930, 1, 2, 0, 1, 539, '2019-08-28 18:30:58', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1910, 1938, 1, 2, 0, 1, 539, '2019-08-28 18:30:58', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1918, 1946, 1, 2, 0, 1, 539, '2019-08-28 18:30:58', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1926, 1954, 1, 2, 0, 1, 539, '2019-08-28 18:30:59', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1934, 1962, 1, 2, 0, 1, 539, '2019-08-28 18:30:59', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1945, 1974, 1, 1, 0, 100, 8796, '2019-10-30 17:32:41', 0, NULL, 10555, NULL, 0, 7, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1969, 1999, 1, 1, 0, 100000, 8240, '2020-02-21 11:29:33', 0, NULL, 9888000, NULL, 0, 15, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_deal" VALUES (634, 662, 1, 2, 0, 1, 539, '2019-08-28 17:27:16', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (637, 665, 1, 2, 0, 1, 539, '2019-08-28 17:27:16', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (643, 671, 1, 2, 0, 1, 539, '2019-08-28 17:27:16', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (646, 674, 1, 2, 0, 1, 539, '2019-08-28 17:27:17', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (652, 680, 1, 2, 0, 1, 539, '2019-08-28 17:27:17', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (664, 692, 1, 2, 0, 1, 539, '2019-08-28 17:27:17', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (678, 706, 1, 2, 0, 1, 539, '2019-08-28 17:27:18', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (685, 713, 1, 2, 0, 1, 539, '2019-08-28 17:27:19', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (693, 721, 1, 2, 0, 1, 539, '2019-08-28 17:27:19', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (697, 725, 1, 2, 0, 1, 539, '2019-08-28 17:27:19', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (722, 750, 1, 2, 0, 1, 539, '2019-08-28 17:27:20', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (730, 758, 1, 2, 0, 1, 539, '2019-08-28 17:27:21', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (932, 960, 1, 2, 0, 1, 539, '2019-08-28 18:07:48', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (933, 961, 1, 2, 0, 1, 539, '2019-08-28 18:09:30', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (934, 962, 1, 2, 0, 1, 539, '2019-08-28 18:10:19', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1342, 1370, 1, 2, 0, 1, 539, '2019-08-28 18:23:25', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1345, 1373, 1, 2, 0, 1, 539, '2019-08-28 18:23:25', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1348, 1376, 1, 2, 0, 1, 539, '2019-08-28 18:23:25', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1358, 1386, 1, 2, 0, 1, 539, '2019-08-28 18:23:25', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1370, 1398, 1, 2, 0, 1, 539, '2019-08-28 18:23:26', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1377, 1405, 1, 2, 0, 1, 539, '2019-08-28 18:23:27', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1391, 1419, 1, 2, 0, 1, 539, '2019-08-28 18:23:27', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1397, 1425, 1, 2, 0, 1, 539, '2019-08-28 18:23:28', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1408, 1436, 1, 2, 0, 1, 539, '2019-08-28 18:23:28', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1412, 1440, 1, 2, 0, 1, 539, '2019-08-28 18:23:29', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1416, 1444, 1, 2, 0, 1, 539, '2019-08-28 18:23:29', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1419, 1447, 1, 2, 0, 1, 539, '2019-08-28 18:23:29', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1429, 1457, 1, 2, 0, 1, 539, '2019-08-28 18:23:29', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1447, 1475, 1, 2, 0, 1, 539, '2019-08-28 18:24:52', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1453, 1481, 1, 2, 0, 1, 539, '2019-08-28 18:24:52', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1457, 1485, 1, 2, 0, 1, 539, '2019-08-28 18:24:53', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1472, 1500, 1, 2, 0, 1, 539, '2019-08-28 18:24:53', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1481, 1509, 1, 2, 0, 1, 539, '2019-08-28 18:24:54', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1485, 1513, 1, 2, 0, 1, 539, '2019-08-28 18:24:54', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1497, 1525, 1, 2, 0, 1, 539, '2019-08-28 18:24:55', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1505, 1533, 1, 2, 0, 1, 539, '2019-08-28 18:24:55', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1511, 1539, 1, 2, 0, 1, 539, '2019-08-28 18:24:56', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1524, 1552, 1, 2, 0, 1, 539, '2019-08-28 18:24:56', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1528, 1556, 1, 2, 0, 1, 539, '2019-08-28 18:24:57', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1532, 1560, 1, 2, 0, 1, 539, '2019-08-28 18:24:57', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1839, 1867, 1, 2, 0, 1, 539, '2019-08-28 18:30:55', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1847, 1875, 1, 2, 0, 1, 539, '2019-08-28 18:30:55', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1855, 1883, 1, 2, 0, 1, 539, '2019-08-28 18:30:55', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1863, 1891, 1, 2, 0, 1, 539, '2019-08-28 18:30:55', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1871, 1899, 1, 2, 0, 1, 539, '2019-08-28 18:30:56', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1879, 1907, 1, 2, 0, 1, 539, '2019-08-28 18:30:56', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1887, 1915, 1, 2, 0, 1, 539, '2019-08-28 18:30:57', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1895, 1923, 1, 2, 0, 1, 539, '2019-08-28 18:30:57', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1903, 1931, 1, 2, 0, 1, 539, '2019-08-28 18:30:58', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1911, 1939, 1, 2, 0, 1, 539, '2019-08-28 18:30:58', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1919, 1947, 1, 2, 0, 1, 539, '2019-08-28 18:30:58', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1927, 1955, 1, 2, 0, 1, 539, '2019-08-28 18:30:59', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1935, 1963, 1, 2, 0, 1, 539, '2019-08-28 18:30:59', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1946, 1975, 1, 1, 0, 100, 8365, '2019-12-13 16:57:50', 0, NULL, 10038, NULL, 0, 7, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1947, 1976, 1, 1, 0, 100, 8365, '2019-12-13 17:17:28', 0, NULL, 10038, NULL, 0, 7, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1970, 2000, 1, 1, 0, 100000, 8239, '2020-02-21 11:45:23', 1, NULL, 9886800, NULL, 0, 15, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_deal" VALUES (635, 663, 1, 2, 0, 1, 539, '2019-08-28 17:27:16', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (638, 666, 1, 2, 0, 1, 539, '2019-08-28 17:27:16', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (641, 669, 1, 2, 0, 1, 539, '2019-08-28 17:27:16', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (648, 676, 1, 2, 0, 1, 539, '2019-08-28 17:27:17', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (654, 682, 1, 2, 0, 1, 539, '2019-08-28 17:27:17', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (660, 688, 1, 2, 0, 1, 539, '2019-08-28 17:27:17', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (667, 695, 1, 2, 0, 1, 539, '2019-08-28 17:27:18', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (670, 698, 1, 2, 0, 1, 539, '2019-08-28 17:27:18', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (679, 707, 1, 2, 0, 1, 539, '2019-08-28 17:27:18', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (691, 719, 1, 2, 0, 1, 539, '2019-08-28 17:27:19', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (700, 728, 1, 2, 0, 1, 539, '2019-08-28 17:27:19', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (704, 732, 1, 2, 0, 1, 539, '2019-08-28 17:27:20', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (707, 735, 1, 2, 0, 1, 539, '2019-08-28 17:27:20', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (731, 759, 1, 2, 0, 1, 539, '2019-08-28 17:27:20', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (935, 963, 1, 2, 0, 1, 539, '2019-08-28 18:14:57', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (936, 964, 1, 2, 0, 1, 539, '2019-08-28 18:16:20', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (937, 965, 1, 2, 0, 1, 539, '2019-08-28 18:17:35', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (943, 971, 1, 2, 0, 1, 539, '2019-08-28 18:17:35', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (951, 979, 1, 2, 0, 1, 539, '2019-08-28 18:17:36', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (968, 996, 1, 2, 0, 1, 539, '2019-08-28 18:17:36', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (975, 1003, 1, 2, 0, 1, 539, '2019-08-28 18:17:37', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (981, 1009, 1, 2, 0, 1, 539, '2019-08-28 18:17:38', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (984, 1012, 1, 2, 0, 1, 539, '2019-08-28 18:17:38', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (987, 1015, 1, 2, 0, 1, 539, '2019-08-28 18:17:38', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (990, 1018, 1, 2, 0, 1, 539, '2019-08-28 18:17:38', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (996, 1024, 1, 2, 0, 1, 539, '2019-08-28 18:17:39', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1009, 1037, 1, 2, 0, 1, 539, '2019-08-28 18:17:39', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1016, 1044, 1, 2, 0, 1, 539, '2019-08-28 18:17:40', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1022, 1050, 1, 2, 0, 1, 539, '2019-08-28 18:17:40', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1026, 1054, 1, 2, 0, 1, 539, '2019-08-28 18:17:41', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1034, 1062, 1, 2, 0, 1, 539, '2019-08-28 18:17:41', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1038, 1066, 1, 2, 0, 1, 539, '2019-08-28 18:18:23', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1050, 1078, 1, 2, 0, 1, 539, '2019-08-28 18:18:23', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1063, 1091, 1, 2, 0, 1, 539, '2019-08-28 18:18:24', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1066, 1094, 1, 2, 0, 1, 539, '2019-08-28 18:18:24', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1073, 1101, 1, 2, 0, 1, 539, '2019-08-28 18:18:25', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1095, 1123, 1, 2, 0, 1, 539, '2019-08-28 18:18:25', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1098, 1126, 1, 2, 0, 1, 539, '2019-08-28 18:18:26', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1107, 1135, 1, 2, 0, 1, 539, '2019-08-28 18:18:26', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1114, 1142, 1, 2, 0, 1, 539, '2019-08-28 18:18:27', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1119, 1147, 1, 2, 0, 1, 539, '2019-08-28 18:18:27', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1122, 1150, 1, 2, 0, 1, 539, '2019-08-28 18:18:28', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1132, 1160, 1, 2, 0, 1, 539, '2019-08-28 18:18:28', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1352, 1380, 1, 2, 0, 1, 539, '2019-08-28 18:23:25', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1381, 1409, 1, 2, 0, 1, 539, '2019-08-28 18:23:26', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1384, 1412, 1, 2, 0, 1, 539, '2019-08-28 18:23:27', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1387, 1415, 1, 2, 0, 1, 539, '2019-08-28 18:23:27', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1394, 1422, 1, 2, 0, 1, 539, '2019-08-28 18:23:28', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1399, 1427, 1, 2, 0, 1, 539, '2019-08-28 18:23:28', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1414, 1442, 1, 2, 0, 1, 539, '2019-08-28 18:23:28', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1420, 1448, 1, 2, 0, 1, 539, '2019-08-28 18:23:29', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1426, 1454, 1, 2, 0, 1, 539, '2019-08-28 18:23:29', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1433, 1461, 1, 2, 0, 1, 539, '2019-08-28 18:23:30', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1437, 1465, 1, 2, 0, 1, 539, '2019-08-28 18:24:52', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1441, 1469, 1, 2, 0, 1, 539, '2019-08-28 18:24:52', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1444, 1472, 1, 2, 0, 1, 539, '2019-08-28 18:24:52', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1448, 1476, 1, 2, 0, 1, 539, '2019-08-28 18:24:52', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1458, 1486, 1, 2, 0, 1, 539, '2019-08-28 18:24:53', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1461, 1489, 1, 2, 0, 1, 539, '2019-08-28 18:24:53', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1464, 1492, 1, 2, 0, 1, 539, '2019-08-28 18:24:53', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1467, 1495, 1, 2, 0, 1, 539, '2019-08-28 18:24:53', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1470, 1498, 1, 2, 0, 1, 539, '2019-08-28 18:24:54', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1480, 1508, 1, 2, 0, 1, 539, '2019-08-28 18:24:54', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1483, 1511, 1, 2, 0, 1, 539, '2019-08-28 18:24:54', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1503, 1531, 1, 2, 0, 1, 539, '2019-08-28 18:24:54', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (636, 664, 1, 2, 0, 1, 539, '2019-08-28 17:27:16', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (639, 667, 1, 2, 0, 1, 539, '2019-08-28 17:27:16', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (645, 673, 1, 2, 0, 1, 539, '2019-08-28 17:27:16', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (666, 694, 1, 2, 0, 1, 539, '2019-08-28 17:27:17', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (674, 702, 1, 2, 0, 1, 539, '2019-08-28 17:27:18', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (684, 712, 1, 2, 0, 1, 539, '2019-08-28 17:27:18', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (690, 718, 1, 2, 0, 1, 539, '2019-08-28 17:27:19', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (695, 723, 1, 2, 0, 1, 539, '2019-08-28 17:27:19', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (702, 730, 1, 2, 0, 1, 539, '2019-08-28 17:27:20', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (717, 745, 1, 2, 0, 1, 539, '2019-08-28 17:27:20', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (729, 757, 1, 2, 0, 1, 539, '2019-08-28 17:27:21', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (938, 966, 1, 2, 0, 1, 539, '2019-08-28 18:17:35', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (941, 969, 1, 2, 0, 1, 539, '2019-08-28 18:17:35', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (949, 977, 1, 2, 0, 1, 539, '2019-08-28 18:17:35', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (957, 985, 1, 2, 0, 1, 539, '2019-08-28 18:17:36', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (960, 988, 1, 2, 0, 1, 539, '2019-08-28 18:17:37', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (969, 997, 1, 2, 0, 1, 539, '2019-08-28 18:17:37', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (979, 1007, 1, 2, 0, 1, 539, '2019-08-28 18:17:37', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (985, 1013, 1, 2, 0, 1, 539, '2019-08-28 18:17:38', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (994, 1022, 1, 2, 0, 1, 539, '2019-08-28 18:17:38', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1010, 1038, 1, 2, 0, 1, 539, '2019-08-28 18:17:39', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1023, 1051, 1, 2, 0, 1, 539, '2019-08-28 18:17:40', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1033, 1061, 1, 2, 0, 1, 539, '2019-08-28 18:17:41', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1039, 1067, 1, 2, 0, 1, 539, '2019-08-28 18:18:23', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1045, 1073, 1, 2, 0, 1, 539, '2019-08-28 18:18:23', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1052, 1080, 1, 2, 0, 1, 539, '2019-08-28 18:18:23', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1056, 1084, 1, 2, 0, 1, 539, '2019-08-28 18:18:24', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1062, 1090, 1, 2, 0, 1, 539, '2019-08-28 18:18:24', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1068, 1096, 1, 2, 0, 1, 539, '2019-08-28 18:18:24', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1104, 1132, 1, 2, 0, 1, 539, '2019-08-28 18:18:25', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1108, 1136, 1, 2, 0, 1, 539, '2019-08-28 18:18:27', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1112, 1140, 1, 2, 0, 1, 539, '2019-08-28 18:18:27', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1118, 1146, 1, 2, 0, 1, 539, '2019-08-28 18:18:27', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1121, 1149, 1, 2, 0, 1, 539, '2019-08-28 18:18:28', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1128, 1156, 1, 2, 0, 1, 539, '2019-08-28 18:18:28', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1133, 1161, 1, 2, 0, 1, 539, '2019-08-28 18:18:28', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1354, 1382, 1, 2, 0, 1, 539, '2019-08-28 18:23:25', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1357, 1385, 1, 2, 0, 1, 539, '2019-08-28 18:23:26', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1403, 1431, 1, 2, 0, 1, 539, '2019-08-28 18:23:26', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1406, 1434, 1, 2, 0, 1, 539, '2019-08-28 18:23:28', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1410, 1438, 1, 2, 0, 1, 539, '2019-08-28 18:23:29', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1417, 1445, 1, 2, 0, 1, 539, '2019-08-28 18:23:29', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1435, 1463, 1, 2, 0, 1, 539, '2019-08-28 18:23:29', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1469, 1497, 1, 2, 0, 1, 539, '2019-08-28 18:24:52', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1473, 1501, 1, 2, 0, 1, 539, '2019-08-28 18:24:54', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1476, 1504, 1, 2, 0, 1, 539, '2019-08-28 18:24:54', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1479, 1507, 1, 2, 0, 1, 539, '2019-08-28 18:24:54', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1482, 1510, 1, 2, 0, 1, 539, '2019-08-28 18:24:54', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1486, 1514, 1, 2, 0, 1, 539, '2019-08-28 18:24:54', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1492, 1520, 1, 2, 0, 1, 539, '2019-08-28 18:24:55', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1495, 1523, 1, 2, 0, 1, 539, '2019-08-28 18:24:55', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1534, 1562, 1, 2, 0, 1, 539, '2019-08-28 18:24:55', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1840, 1868, 1, 2, 0, 1, 539, '2019-08-28 18:30:55', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1848, 1876, 1, 2, 0, 1, 539, '2019-08-28 18:30:55', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1856, 1884, 1, 2, 0, 1, 539, '2019-08-28 18:30:55', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1864, 1892, 1, 2, 0, 1, 539, '2019-08-28 18:30:56', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1872, 1900, 1, 2, 0, 1, 539, '2019-08-28 18:30:56', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1880, 1908, 1, 2, 0, 1, 539, '2019-08-28 18:30:56', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1888, 1916, 1, 2, 0, 1, 539, '2019-08-28 18:30:57', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1896, 1924, 1, 2, 0, 1, 539, '2019-08-28 18:30:57', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1904, 1932, 1, 2, 0, 1, 539, '2019-08-28 18:30:58', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1912, 1940, 1, 2, 0, 1, 539, '2019-08-28 18:30:58', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1920, 1948, 1, 2, 0, 1, 539, '2019-08-28 18:30:58', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1928, 1956, 1, 2, 0, 1, 539, '2019-08-28 18:30:59', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1936, 1964, 1, 2, 0, 1, 539, '2019-08-28 18:30:59', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (640, 668, 1, 2, 0, 1, 539, '2019-08-28 17:27:16', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (655, 683, 1, 2, 0, 1, 539, '2019-08-28 17:27:16', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (658, 686, 1, 2, 0, 1, 539, '2019-08-28 17:27:17', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (673, 701, 1, 2, 0, 1, 539, '2019-08-28 17:27:17', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (676, 704, 1, 2, 0, 1, 539, '2019-08-28 17:27:18', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (680, 708, 1, 2, 0, 1, 539, '2019-08-28 17:27:18', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (683, 711, 1, 2, 0, 1, 539, '2019-08-28 17:27:19', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (692, 720, 1, 2, 0, 1, 539, '2019-08-28 17:27:19', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (699, 727, 1, 2, 0, 1, 539, '2019-08-28 17:27:19', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (706, 734, 1, 2, 0, 1, 539, '2019-08-28 17:27:20', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (712, 740, 1, 2, 0, 1, 539, '2019-08-28 17:27:20', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (716, 744, 1, 2, 0, 1, 539, '2019-08-28 17:27:20', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (723, 751, 1, 2, 0, 1, 539, '2019-08-28 17:27:21', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (726, 754, 1, 2, 0, 1, 539, '2019-08-28 17:27:21', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (939, 967, 1, 2, 0, 1, 539, '2019-08-28 18:17:35', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (942, 970, 1, 2, 0, 1, 539, '2019-08-28 18:17:35', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (945, 973, 1, 2, 0, 1, 539, '2019-08-28 18:17:35', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (953, 981, 1, 2, 0, 1, 539, '2019-08-28 18:17:36', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (956, 984, 1, 2, 0, 1, 539, '2019-08-28 18:17:36', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (965, 993, 1, 2, 0, 1, 539, '2019-08-28 18:17:36', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (974, 1002, 1, 2, 0, 1, 539, '2019-08-28 18:17:37', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (992, 1020, 1, 2, 0, 1, 539, '2019-08-28 18:17:38', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (995, 1023, 1, 2, 0, 1, 539, '2019-08-28 18:17:39', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (998, 1026, 1, 2, 0, 1, 539, '2019-08-28 18:17:39', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1001, 1029, 1, 2, 0, 1, 539, '2019-08-28 18:17:39', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1018, 1046, 1, 2, 0, 1, 539, '2019-08-28 18:17:39', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1021, 1049, 1, 2, 0, 1, 539, '2019-08-28 18:17:40', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1025, 1053, 1, 2, 0, 1, 539, '2019-08-28 18:17:40', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1036, 1064, 1, 2, 0, 1, 539, '2019-08-28 18:17:41', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1037, 1065, 1, 2, 0, 1, 539, '2019-08-28 18:18:23', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1053, 1081, 1, 2, 0, 1, 539, '2019-08-28 18:18:23', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1057, 1085, 1, 2, 0, 1, 539, '2019-08-28 18:18:24', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1065, 1093, 1, 2, 0, 1, 539, '2019-08-28 18:18:24', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1072, 1100, 1, 2, 0, 1, 539, '2019-08-28 18:18:25', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1078, 1106, 1, 2, 0, 1, 539, '2019-08-28 18:18:25', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1097, 1125, 1, 2, 0, 1, 539, '2019-08-28 18:18:25', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1109, 1137, 1, 2, 0, 1, 539, '2019-08-28 18:18:26', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1127, 1155, 1, 2, 0, 1, 539, '2019-08-28 18:18:27', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1131, 1159, 1, 2, 0, 1, 539, '2019-08-28 18:18:28', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1506, 1534, 1, 2, 0, 1, 539, '2019-08-28 18:24:55', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1523, 1551, 1, 2, 0, 1, 539, '2019-08-28 18:24:56', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1530, 1558, 1, 2, 0, 1, 539, '2019-08-28 18:24:57', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1841, 1869, 1, 2, 0, 1, 539, '2019-08-28 18:30:55', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1849, 1877, 1, 2, 0, 1, 539, '2019-08-28 18:30:55', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1857, 1885, 1, 2, 0, 1, 539, '2019-08-28 18:30:55', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1865, 1893, 1, 2, 0, 1, 539, '2019-08-28 18:30:56', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1873, 1901, 1, 2, 0, 1, 539, '2019-08-28 18:30:56', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1881, 1909, 1, 2, 0, 1, 539, '2019-08-28 18:30:56', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1889, 1917, 1, 2, 0, 1, 539, '2019-08-28 18:30:57', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1897, 1925, 1, 2, 0, 1, 539, '2019-08-28 18:30:57', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1905, 1933, 1, 2, 0, 1, 539, '2019-08-28 18:30:58', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1913, 1941, 1, 2, 0, 1, 539, '2019-08-28 18:30:58', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1921, 1949, 1, 2, 0, 1, 539, '2019-08-28 18:30:59', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1929, 1957, 1, 2, 0, 1, 539, '2019-08-28 18:30:59', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1948, 1977, 1, 1, 0, 100, 8365, '2019-12-13 17:23:06', 0, NULL, 10038, NULL, 0, 7, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_deal" VALUES (1971, 2001, 1, 1, 0, 100000, 8240, '2020-02-21 22:22:01', 0, NULL, 9888000, NULL, 0, 15, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_deal" VALUES (647, 675, 1, 2, 0, 1, 539, '2019-08-28 17:27:16', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (650, 678, 1, 2, 0, 1, 539, '2019-08-28 17:27:17', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (653, 681, 1, 2, 0, 1, 539, '2019-08-28 17:27:17', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (656, 684, 1, 2, 0, 1, 539, '2019-08-28 17:27:17', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (659, 687, 1, 2, 0, 1, 539, '2019-08-28 17:27:17', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (662, 690, 1, 2, 0, 1, 539, '2019-08-28 17:27:18', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (669, 697, 1, 2, 0, 1, 539, '2019-08-28 17:27:18', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (677, 705, 1, 2, 0, 1, 539, '2019-08-28 17:27:18', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (681, 709, 1, 2, 0, 1, 539, '2019-08-28 17:27:19', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (688, 716, 1, 2, 0, 1, 539, '2019-08-28 17:27:19', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (710, 738, 1, 2, 0, 1, 539, '2019-08-28 17:27:19', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (713, 741, 1, 2, 0, 1, 539, '2019-08-28 17:27:20', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (719, 747, 1, 2, 0, 1, 539, '2019-08-28 17:27:20', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (728, 756, 1, 2, 0, 1, 539, '2019-08-28 17:27:21', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (940, 968, 1, 2, 0, 1, 539, '2019-08-28 18:17:35', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (948, 976, 1, 2, 0, 1, 539, '2019-08-28 18:17:35', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (959, 987, 1, 2, 0, 1, 539, '2019-08-28 18:17:36', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (962, 990, 1, 2, 0, 1, 539, '2019-08-28 18:17:37', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (977, 1005, 1, 2, 0, 1, 539, '2019-08-28 18:17:37', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (980, 1008, 1, 2, 0, 1, 539, '2019-08-28 18:17:38', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (989, 1017, 1, 2, 0, 1, 539, '2019-08-28 18:17:38', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1006, 1034, 1, 2, 0, 1, 539, '2019-08-28 18:17:39', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1012, 1040, 1, 2, 0, 1, 539, '2019-08-28 18:17:40', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1029, 1057, 1, 2, 0, 1, 539, '2019-08-28 18:17:40', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1059, 1087, 1, 2, 0, 1, 539, '2019-08-28 18:18:23', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1071, 1099, 1, 2, 0, 1, 539, '2019-08-28 18:18:24', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1074, 1102, 1, 2, 0, 1, 539, '2019-08-28 18:18:25', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1080, 1108, 1, 2, 0, 1, 539, '2019-08-28 18:18:25', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1083, 1111, 1, 2, 0, 1, 539, '2019-08-28 18:18:25', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1086, 1114, 1, 2, 0, 1, 539, '2019-08-28 18:18:25', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1089, 1117, 1, 2, 0, 1, 539, '2019-08-28 18:18:26', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1103, 1131, 1, 2, 0, 1, 539, '2019-08-28 18:18:26', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1111, 1139, 1, 2, 0, 1, 539, '2019-08-28 18:18:27', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1117, 1145, 1, 2, 0, 1, 539, '2019-08-28 18:18:27', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1120, 1148, 1, 2, 0, 1, 539, '2019-08-28 18:18:27', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1123, 1151, 1, 2, 0, 1, 539, '2019-08-28 18:18:28', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1135, 1163, 1, 2, 0, 1, 539, '2019-08-28 18:18:28', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1537, 1565, 1, 2, 0, 1, 539, '2019-08-28 18:28:41', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1545, 1573, 1, 2, 0, 1, 539, '2019-08-28 18:28:42', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1553, 1581, 1, 2, 0, 1, 539, '2019-08-28 18:28:42', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1561, 1589, 1, 2, 0, 1, 539, '2019-08-28 18:28:43', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1569, 1597, 1, 2, 0, 1, 539, '2019-08-28 18:28:43', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1577, 1605, 1, 2, 0, 1, 539, '2019-08-28 18:28:43', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1585, 1613, 1, 2, 0, 1, 539, '2019-08-28 18:28:44', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1593, 1621, 1, 2, 0, 1, 539, '2019-08-28 18:28:44', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1601, 1629, 1, 2, 0, 1, 539, '2019-08-28 18:28:45', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1609, 1637, 1, 2, 0, 1, 539, '2019-08-28 18:28:45', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1617, 1645, 1, 2, 0, 1, 539, '2019-08-28 18:28:46', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1625, 1653, 1, 2, 0, 1, 539, '2019-08-28 18:28:46', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1633, 1661, 1, 2, 0, 1, 539, '2019-08-28 18:28:46', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1640, 1668, 1, 2, 0, 1, 539, '2019-08-28 18:29:50', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1648, 1676, 1, 2, 0, 1, 539, '2019-08-28 18:29:50', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1656, 1684, 1, 2, 0, 1, 539, '2019-08-28 18:29:51', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1664, 1692, 1, 2, 0, 1, 539, '2019-08-28 18:29:51', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1672, 1700, 1, 2, 0, 1, 539, '2019-08-28 18:29:52', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1680, 1708, 1, 2, 0, 1, 539, '2019-08-28 18:29:52', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1688, 1716, 1, 2, 0, 1, 539, '2019-08-28 18:29:53', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1696, 1724, 1, 2, 0, 1, 539, '2019-08-28 18:29:53', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1704, 1732, 1, 2, 0, 1, 539, '2019-08-28 18:29:53', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1712, 1740, 1, 2, 0, 1, 539, '2019-08-28 18:29:54', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1720, 1748, 1, 2, 0, 1, 539, '2019-08-28 18:29:54', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1728, 1756, 1, 2, 0, 1, 539, '2019-08-28 18:29:55', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1736, 1764, 1, 2, 0, 1, 539, '2019-08-28 18:29:55', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1737, 1765, 1, 2, 0, 1, 539, '2019-08-28 18:30:12', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1745, 1773, 1, 2, 0, 1, 539, '2019-08-28 18:30:12', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (649, 677, 1, 2, 0, 1, 539, '2019-08-28 17:27:16', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (657, 685, 1, 2, 0, 1, 539, '2019-08-28 17:27:17', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (663, 691, 1, 2, 0, 1, 539, '2019-08-28 17:27:17', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (672, 700, 1, 2, 0, 1, 539, '2019-08-28 17:27:18', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (675, 703, 1, 2, 0, 1, 539, '2019-08-28 17:27:18', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (682, 710, 1, 2, 0, 1, 539, '2019-08-28 17:27:18', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (689, 717, 1, 2, 0, 1, 539, '2019-08-28 17:27:19', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (698, 726, 1, 2, 0, 1, 539, '2019-08-28 17:27:19', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (714, 742, 1, 2, 0, 1, 539, '2019-08-28 17:27:20', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (720, 748, 1, 2, 0, 1, 539, '2019-08-28 17:27:21', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (724, 752, 1, 2, 0, 1, 539, '2019-08-28 17:27:21', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (944, 972, 1, 2, 0, 1, 539, '2019-08-28 18:17:35', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (952, 980, 1, 2, 0, 1, 539, '2019-08-28 18:17:36', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (955, 983, 1, 2, 0, 1, 539, '2019-08-28 18:17:36', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (972, 1000, 1, 2, 0, 1, 539, '2019-08-28 18:17:36', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (976, 1004, 1, 2, 0, 1, 539, '2019-08-28 18:17:38', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (988, 1016, 1, 2, 0, 1, 539, '2019-08-28 18:17:38', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (991, 1019, 1, 2, 0, 1, 539, '2019-08-28 18:17:39', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (997, 1025, 1, 2, 0, 1, 539, '2019-08-28 18:17:39', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1000, 1028, 1, 2, 0, 1, 539, '2019-08-28 18:17:39', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1003, 1031, 1, 2, 0, 1, 539, '2019-08-28 18:17:39', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1008, 1036, 1, 2, 0, 1, 539, '2019-08-28 18:17:39', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1015, 1043, 1, 2, 0, 1, 539, '2019-08-28 18:17:40', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1028, 1056, 1, 2, 0, 1, 539, '2019-08-28 18:17:40', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1032, 1060, 1, 2, 0, 1, 539, '2019-08-28 18:17:41', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1041, 1069, 1, 2, 0, 1, 539, '2019-08-28 18:18:23', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1044, 1072, 1, 2, 0, 1, 539, '2019-08-28 18:18:23', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1047, 1075, 1, 2, 0, 1, 539, '2019-08-28 18:18:23', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1054, 1082, 1, 2, 0, 1, 539, '2019-08-28 18:18:24', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1058, 1086, 1, 2, 0, 1, 539, '2019-08-28 18:18:24', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1075, 1103, 1, 2, 0, 1, 539, '2019-08-28 18:18:24', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1081, 1109, 1, 2, 0, 1, 539, '2019-08-28 18:18:25', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1084, 1112, 1, 2, 0, 1, 539, '2019-08-28 18:18:25', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1087, 1115, 1, 2, 0, 1, 539, '2019-08-28 18:18:25', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1090, 1118, 1, 2, 0, 1, 539, '2019-08-28 18:18:26', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1093, 1121, 1, 2, 0, 1, 539, '2019-08-28 18:18:26', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1099, 1127, 1, 2, 0, 1, 539, '2019-08-28 18:18:26', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1115, 1143, 1, 2, 0, 1, 539, '2019-08-28 18:18:26', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1126, 1154, 1, 2, 0, 1, 539, '2019-08-28 18:18:27', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1130, 1158, 1, 2, 0, 1, 539, '2019-08-28 18:18:28', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1538, 1566, 1, 2, 0, 1, 539, '2019-08-28 18:28:41', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1546, 1574, 1, 2, 0, 1, 539, '2019-08-28 18:28:42', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1554, 1582, 1, 2, 0, 1, 539, '2019-08-28 18:28:42', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1562, 1590, 1, 2, 0, 1, 539, '2019-08-28 18:28:43', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1570, 1598, 1, 2, 0, 1, 539, '2019-08-28 18:28:43', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1578, 1606, 1, 2, 0, 1, 539, '2019-08-28 18:28:44', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1586, 1614, 1, 2, 0, 1, 539, '2019-08-28 18:28:44', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1594, 1622, 1, 2, 0, 1, 539, '2019-08-28 18:28:44', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1602, 1630, 1, 2, 0, 1, 539, '2019-08-28 18:28:45', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1610, 1638, 1, 2, 0, 1, 539, '2019-08-28 18:28:45', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1618, 1646, 1, 2, 0, 1, 539, '2019-08-28 18:28:46', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1626, 1654, 1, 2, 0, 1, 539, '2019-08-28 18:28:46', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1634, 1662, 1, 2, 0, 1, 539, '2019-08-28 18:28:46', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1639, 1667, 1, 2, 0, 1, 539, '2019-08-28 18:29:50', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1647, 1675, 1, 2, 0, 1, 539, '2019-08-28 18:29:50', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1655, 1683, 1, 2, 0, 1, 539, '2019-08-28 18:29:51', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1663, 1691, 1, 2, 0, 1, 539, '2019-08-28 18:29:51', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1671, 1699, 1, 2, 0, 1, 539, '2019-08-28 18:29:52', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1679, 1707, 1, 2, 0, 1, 539, '2019-08-28 18:29:52', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1687, 1715, 1, 2, 0, 1, 539, '2019-08-28 18:29:53', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1695, 1723, 1, 2, 0, 1, 539, '2019-08-28 18:29:53', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1703, 1731, 1, 2, 0, 1, 539, '2019-08-28 18:29:53', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1711, 1739, 1, 2, 0, 1, 539, '2019-08-28 18:29:54', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1719, 1747, 1, 2, 0, 1, 539, '2019-08-28 18:29:54', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1727, 1755, 1, 2, 0, 1, 539, '2019-08-28 18:29:55', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (732, 760, 1, 2, 0, 1, 539, '2019-08-28 17:27:52', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (757, 785, 1, 2, 0, 1, 539, '2019-08-28 17:27:52', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (770, 798, 1, 2, 0, 1, 539, '2019-08-28 17:27:53', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (773, 801, 1, 2, 0, 1, 539, '2019-08-28 17:27:54', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (779, 807, 1, 2, 0, 1, 539, '2019-08-28 17:27:54', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (782, 810, 1, 2, 0, 1, 539, '2019-08-28 17:27:55', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (792, 820, 1, 2, 0, 1, 539, '2019-08-28 17:27:55', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (800, 828, 1, 2, 0, 1, 539, '2019-08-28 17:27:55', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (825, 853, 1, 2, 0, 1, 539, '2019-08-28 17:27:56', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (946, 974, 1, 2, 0, 1, 539, '2019-08-28 18:17:35', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (954, 982, 1, 2, 0, 1, 539, '2019-08-28 18:17:36', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (963, 991, 1, 2, 0, 1, 539, '2019-08-28 18:17:36', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (966, 994, 1, 2, 0, 1, 539, '2019-08-28 18:17:37', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (982, 1010, 1, 2, 0, 1, 539, '2019-08-28 18:17:37', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1007, 1035, 1, 2, 0, 1, 539, '2019-08-28 18:17:38', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1014, 1042, 1, 2, 0, 1, 539, '2019-08-28 18:17:40', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1017, 1045, 1, 2, 0, 1, 539, '2019-08-28 18:17:40', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1020, 1048, 1, 2, 0, 1, 539, '2019-08-28 18:17:40', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1024, 1052, 1, 2, 0, 1, 539, '2019-08-28 18:17:40', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1035, 1063, 1, 2, 0, 1, 539, '2019-08-28 18:17:41', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1042, 1070, 1, 2, 0, 1, 539, '2019-08-28 18:18:23', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1051, 1079, 1, 2, 0, 1, 539, '2019-08-28 18:18:23', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1061, 1089, 1, 2, 0, 1, 539, '2019-08-28 18:18:24', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1070, 1098, 1, 2, 0, 1, 539, '2019-08-28 18:18:24', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1076, 1104, 1, 2, 0, 1, 539, '2019-08-28 18:18:25', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1079, 1107, 1, 2, 0, 1, 539, '2019-08-28 18:18:25', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1085, 1113, 1, 2, 0, 1, 539, '2019-08-28 18:18:25', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1091, 1119, 1, 2, 0, 1, 539, '2019-08-28 18:18:26', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1100, 1128, 1, 2, 0, 1, 539, '2019-08-28 18:18:26', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1106, 1134, 1, 2, 0, 1, 539, '2019-08-28 18:18:26', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1113, 1141, 1, 2, 0, 1, 539, '2019-08-28 18:18:27', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1116, 1144, 1, 2, 0, 1, 539, '2019-08-28 18:18:27', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1125, 1153, 1, 2, 0, 1, 539, '2019-08-28 18:18:27', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1129, 1157, 1, 2, 0, 1, 539, '2019-08-28 18:18:28', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1539, 1567, 1, 2, 0, 1, 539, '2019-08-28 18:28:41', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1547, 1575, 1, 2, 0, 1, 539, '2019-08-28 18:28:42', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1555, 1583, 1, 2, 0, 1, 539, '2019-08-28 18:28:42', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1563, 1591, 1, 2, 0, 1, 539, '2019-08-28 18:28:43', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1571, 1599, 1, 2, 0, 1, 539, '2019-08-28 18:28:43', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1579, 1607, 1, 2, 0, 1, 539, '2019-08-28 18:28:44', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1587, 1615, 1, 2, 0, 1, 539, '2019-08-28 18:28:44', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1595, 1623, 1, 2, 0, 1, 539, '2019-08-28 18:28:44', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1603, 1631, 1, 2, 0, 1, 539, '2019-08-28 18:28:45', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1611, 1639, 1, 2, 0, 1, 539, '2019-08-28 18:28:45', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1619, 1647, 1, 2, 0, 1, 539, '2019-08-28 18:28:46', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1627, 1655, 1, 2, 0, 1, 539, '2019-08-28 18:28:46', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1635, 1663, 1, 2, 0, 1, 539, '2019-08-28 18:28:46', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1638, 1666, 1, 2, 0, 1, 539, '2019-08-28 18:29:50', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1646, 1674, 1, 2, 0, 1, 539, '2019-08-28 18:29:50', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1654, 1682, 1, 2, 0, 1, 539, '2019-08-28 18:29:51', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1662, 1690, 1, 2, 0, 1, 539, '2019-08-28 18:29:51', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1670, 1698, 1, 2, 0, 1, 539, '2019-08-28 18:29:52', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1678, 1706, 1, 2, 0, 1, 539, '2019-08-28 18:29:52', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1686, 1714, 1, 2, 0, 1, 539, '2019-08-28 18:29:52', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1694, 1722, 1, 2, 0, 1, 539, '2019-08-28 18:29:53', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1702, 1730, 1, 2, 0, 1, 539, '2019-08-28 18:29:53', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1710, 1738, 1, 2, 0, 1, 539, '2019-08-28 18:29:54', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1718, 1746, 1, 2, 0, 1, 539, '2019-08-28 18:29:54', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1726, 1754, 1, 2, 0, 1, 539, '2019-08-28 18:29:55', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1734, 1762, 1, 2, 0, 1, 539, '2019-08-28 18:29:55', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1738, 1766, 1, 2, 0, 1, 539, '2019-08-28 18:30:12', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1746, 1774, 1, 2, 0, 1, 539, '2019-08-28 18:30:12', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1754, 1782, 1, 2, 0, 1, 539, '2019-08-28 18:30:13', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1762, 1790, 1, 2, 0, 1, 539, '2019-08-28 18:30:13', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1770, 1798, 1, 2, 0, 1, 539, '2019-08-28 18:30:14', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (733, 761, 1, 2, 0, 1, 539, '2019-08-28 17:27:52', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (759, 787, 1, 2, 0, 1, 539, '2019-08-28 17:27:52', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (769, 797, 1, 2, 0, 1, 539, '2019-08-28 17:27:53', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (772, 800, 1, 2, 0, 1, 539, '2019-08-28 17:27:54', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (775, 803, 1, 2, 0, 1, 539, '2019-08-28 17:27:54', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (778, 806, 1, 2, 0, 1, 539, '2019-08-28 17:27:54', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (781, 809, 1, 2, 0, 1, 539, '2019-08-28 17:27:54', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (785, 813, 1, 2, 0, 1, 539, '2019-08-28 17:27:55', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (802, 830, 1, 2, 0, 1, 539, '2019-08-28 17:27:55', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (805, 833, 1, 2, 0, 1, 539, '2019-08-28 17:27:56', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (808, 836, 1, 2, 0, 1, 539, '2019-08-28 17:27:56', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (815, 843, 1, 2, 0, 1, 539, '2019-08-28 17:27:56', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (818, 846, 1, 2, 0, 1, 539, '2019-08-28 17:27:57', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (822, 850, 1, 2, 0, 1, 539, '2019-08-28 17:27:57', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (830, 858, 1, 2, 0, 1, 539, '2019-08-28 17:27:57', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (947, 975, 1, 2, 0, 1, 539, '2019-08-28 18:17:35', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (958, 986, 1, 2, 0, 1, 539, '2019-08-28 18:17:36', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (961, 989, 1, 2, 0, 1, 539, '2019-08-28 18:17:37', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (970, 998, 1, 2, 0, 1, 539, '2019-08-28 18:17:37', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (973, 1001, 1, 2, 0, 1, 539, '2019-08-28 18:17:37', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (983, 1011, 1, 2, 0, 1, 539, '2019-08-28 18:17:38', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (986, 1014, 1, 2, 0, 1, 539, '2019-08-28 18:17:38', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1004, 1032, 1, 2, 0, 1, 539, '2019-08-28 18:17:38', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1013, 1041, 1, 2, 0, 1, 539, '2019-08-28 18:17:39', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1019, 1047, 1, 2, 0, 1, 539, '2019-08-28 18:17:40', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1030, 1058, 1, 2, 0, 1, 539, '2019-08-28 18:17:40', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1043, 1071, 1, 2, 0, 1, 539, '2019-08-28 18:18:23', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1048, 1076, 1, 2, 0, 1, 539, '2019-08-28 18:18:23', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1055, 1083, 1, 2, 0, 1, 539, '2019-08-28 18:18:24', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1064, 1092, 1, 2, 0, 1, 539, '2019-08-28 18:18:24', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1067, 1095, 1, 2, 0, 1, 539, '2019-08-28 18:18:24', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1077, 1105, 1, 2, 0, 1, 539, '2019-08-28 18:18:25', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1092, 1120, 1, 2, 0, 1, 539, '2019-08-28 18:18:25', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1096, 1124, 1, 2, 0, 1, 539, '2019-08-28 18:18:26', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1101, 1129, 1, 2, 0, 1, 539, '2019-08-28 18:18:26', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1105, 1133, 1, 2, 0, 1, 539, '2019-08-28 18:18:26', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1136, 1164, 1, 2, 0, 1, 539, '2019-08-28 18:18:27', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1540, 1568, 1, 2, 0, 1, 539, '2019-08-28 18:28:41', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1548, 1576, 1, 2, 0, 1, 539, '2019-08-28 18:28:42', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1556, 1584, 1, 2, 0, 1, 539, '2019-08-28 18:28:42', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1564, 1592, 1, 2, 0, 1, 539, '2019-08-28 18:28:43', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1572, 1600, 1, 2, 0, 1, 539, '2019-08-28 18:28:43', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1580, 1608, 1, 2, 0, 1, 539, '2019-08-28 18:28:44', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1588, 1616, 1, 2, 0, 1, 539, '2019-08-28 18:28:44', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1596, 1624, 1, 2, 0, 1, 539, '2019-08-28 18:28:44', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1604, 1632, 1, 2, 0, 1, 539, '2019-08-28 18:28:45', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1612, 1640, 1, 2, 0, 1, 539, '2019-08-28 18:28:45', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1620, 1648, 1, 2, 0, 1, 539, '2019-08-28 18:28:46', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1628, 1656, 1, 2, 0, 1, 539, '2019-08-28 18:28:46', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1636, 1664, 1, 2, 0, 1, 539, '2019-08-28 18:28:47', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1637, 1665, 1, 2, 0, 1, 539, '2019-08-28 18:29:50', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1645, 1673, 1, 2, 0, 1, 539, '2019-08-28 18:29:50', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1653, 1681, 1, 2, 0, 1, 539, '2019-08-28 18:29:51', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1661, 1689, 1, 2, 0, 1, 539, '2019-08-28 18:29:51', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1669, 1697, 1, 2, 0, 1, 539, '2019-08-28 18:29:51', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1677, 1705, 1, 2, 0, 1, 539, '2019-08-28 18:29:52', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1685, 1713, 1, 2, 0, 1, 539, '2019-08-28 18:29:52', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1693, 1721, 1, 2, 0, 1, 539, '2019-08-28 18:29:53', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1701, 1729, 1, 2, 0, 1, 539, '2019-08-28 18:29:53', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1709, 1737, 1, 2, 0, 1, 539, '2019-08-28 18:29:54', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1717, 1745, 1, 2, 0, 1, 539, '2019-08-28 18:29:54', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1725, 1753, 1, 2, 0, 1, 539, '2019-08-28 18:29:55', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1733, 1761, 1, 2, 0, 1, 539, '2019-08-28 18:29:55', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1740, 1768, 1, 2, 0, 1, 539, '2019-08-28 18:30:12', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1748, 1776, 1, 2, 0, 1, 539, '2019-08-28 18:30:13', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (734, 762, 1, 2, 0, 1, 539, '2019-08-28 17:27:52', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (745, 773, 1, 2, 0, 1, 539, '2019-08-28 17:27:52', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (748, 776, 1, 2, 0, 1, 539, '2019-08-28 17:27:53', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (751, 779, 1, 2, 0, 1, 539, '2019-08-28 17:27:53', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (754, 782, 1, 2, 0, 1, 539, '2019-08-28 17:27:53', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (761, 789, 1, 2, 0, 1, 539, '2019-08-28 17:27:53', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (767, 795, 1, 2, 0, 1, 539, '2019-08-28 17:27:53', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (776, 804, 1, 2, 0, 1, 539, '2019-08-28 17:27:54', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (789, 817, 1, 2, 0, 1, 539, '2019-08-28 17:27:54', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (795, 823, 1, 2, 0, 1, 539, '2019-08-28 17:27:55', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (812, 840, 1, 2, 0, 1, 539, '2019-08-28 17:27:55', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (816, 844, 1, 2, 0, 1, 539, '2019-08-28 17:27:56', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (819, 847, 1, 2, 0, 1, 539, '2019-08-28 17:27:57', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (823, 851, 1, 2, 0, 1, 539, '2019-08-28 17:27:57', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (826, 854, 1, 2, 0, 1, 539, '2019-08-28 17:27:57', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (950, 978, 1, 2, 0, 1, 539, '2019-08-28 18:17:35', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (964, 992, 1, 2, 0, 1, 539, '2019-08-28 18:17:36', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (967, 995, 1, 2, 0, 1, 539, '2019-08-28 18:17:37', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (971, 999, 1, 2, 0, 1, 539, '2019-08-28 18:17:37', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (978, 1006, 1, 2, 0, 1, 539, '2019-08-28 18:17:38', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (993, 1021, 1, 2, 0, 1, 539, '2019-08-28 18:17:38', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (999, 1027, 1, 2, 0, 1, 539, '2019-08-28 18:17:39', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1002, 1030, 1, 2, 0, 1, 539, '2019-08-28 18:17:39', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1005, 1033, 1, 2, 0, 1, 539, '2019-08-28 18:17:39', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1011, 1039, 1, 2, 0, 1, 539, '2019-08-28 18:17:40', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1027, 1055, 1, 2, 0, 1, 539, '2019-08-28 18:17:40', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1031, 1059, 1, 2, 0, 1, 539, '2019-08-28 18:17:41', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1040, 1068, 1, 2, 0, 1, 539, '2019-08-28 18:18:23', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1046, 1074, 1, 2, 0, 1, 539, '2019-08-28 18:18:23', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1049, 1077, 1, 2, 0, 1, 539, '2019-08-28 18:18:24', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1060, 1088, 1, 2, 0, 1, 539, '2019-08-28 18:18:24', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1069, 1097, 1, 2, 0, 1, 539, '2019-08-28 18:18:24', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1082, 1110, 1, 2, 0, 1, 539, '2019-08-28 18:18:25', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1088, 1116, 1, 2, 0, 1, 539, '2019-08-28 18:18:25', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1094, 1122, 1, 2, 0, 1, 539, '2019-08-28 18:18:26', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1102, 1130, 1, 2, 0, 1, 539, '2019-08-28 18:18:26', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1110, 1138, 1, 2, 0, 1, 539, '2019-08-28 18:18:26', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1124, 1152, 1, 2, 0, 1, 539, '2019-08-28 18:18:27', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1134, 1162, 1, 2, 0, 1, 539, '2019-08-28 18:18:28', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1541, 1569, 1, 2, 0, 1, 539, '2019-08-28 18:28:41', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1549, 1577, 1, 2, 0, 1, 539, '2019-08-28 18:28:42', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1557, 1585, 1, 2, 0, 1, 539, '2019-08-28 18:28:42', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1565, 1593, 1, 2, 0, 1, 539, '2019-08-28 18:28:43', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1573, 1601, 1, 2, 0, 1, 539, '2019-08-28 18:28:43', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1581, 1609, 1, 2, 0, 1, 539, '2019-08-28 18:28:44', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1589, 1617, 1, 2, 0, 1, 539, '2019-08-28 18:28:44', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1597, 1625, 1, 2, 0, 1, 539, '2019-08-28 18:28:45', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1605, 1633, 1, 2, 0, 1, 539, '2019-08-28 18:28:45', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1613, 1641, 1, 2, 0, 1, 539, '2019-08-28 18:28:45', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1621, 1649, 1, 2, 0, 1, 539, '2019-08-28 18:28:46', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1629, 1657, 1, 2, 0, 1, 539, '2019-08-28 18:28:46', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1643, 1671, 1, 2, 0, 1, 539, '2019-08-28 18:29:50', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1651, 1679, 1, 2, 0, 1, 539, '2019-08-28 18:29:51', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1659, 1687, 1, 2, 0, 1, 539, '2019-08-28 18:29:51', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1667, 1695, 1, 2, 0, 1, 539, '2019-08-28 18:29:51', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1675, 1703, 1, 2, 0, 1, 539, '2019-08-28 18:29:52', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1683, 1711, 1, 2, 0, 1, 539, '2019-08-28 18:29:52', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1691, 1719, 1, 2, 0, 1, 539, '2019-08-28 18:29:53', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1699, 1727, 1, 2, 0, 1, 539, '2019-08-28 18:29:53', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1707, 1735, 1, 2, 0, 1, 539, '2019-08-28 18:29:54', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1715, 1743, 1, 2, 0, 1, 539, '2019-08-28 18:29:54', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1723, 1751, 1, 2, 0, 1, 539, '2019-08-28 18:29:54', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1731, 1759, 1, 2, 0, 1, 539, '2019-08-28 18:29:55', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1742, 1770, 1, 2, 0, 1, 539, '2019-08-28 18:30:12', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1750, 1778, 1, 2, 0, 1, 539, '2019-08-28 18:30:13', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (735, 763, 1, 2, 0, 1, 539, '2019-08-28 17:27:52', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (738, 766, 1, 2, 0, 1, 539, '2019-08-28 17:27:52', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (746, 774, 1, 2, 0, 1, 539, '2019-08-28 17:27:52', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (749, 777, 1, 2, 0, 1, 539, '2019-08-28 17:27:53', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (752, 780, 1, 2, 0, 1, 539, '2019-08-28 17:27:53', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (755, 783, 1, 2, 0, 1, 539, '2019-08-28 17:27:53', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (765, 793, 1, 2, 0, 1, 539, '2019-08-28 17:27:53', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (768, 796, 1, 2, 0, 1, 539, '2019-08-28 17:27:54', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (786, 814, 1, 2, 0, 1, 539, '2019-08-28 17:27:54', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (798, 826, 1, 2, 0, 1, 539, '2019-08-28 17:27:55', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (801, 829, 1, 2, 0, 1, 539, '2019-08-28 17:27:56', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (804, 832, 1, 2, 0, 1, 539, '2019-08-28 17:27:56', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (829, 857, 1, 2, 0, 1, 539, '2019-08-28 17:27:56', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1137, 1165, 1, 2, 0, 1, 539, '2019-08-28 18:18:52', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1147, 1175, 1, 2, 0, 1, 539, '2019-08-28 18:18:52', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1156, 1184, 1, 2, 0, 1, 539, '2019-08-28 18:18:53', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1162, 1190, 1, 2, 0, 1, 539, '2019-08-28 18:18:53', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1165, 1193, 1, 2, 0, 1, 539, '2019-08-28 18:18:53', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1172, 1200, 1, 2, 0, 1, 539, '2019-08-28 18:18:53', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1175, 1203, 1, 2, 0, 1, 539, '2019-08-28 18:18:54', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1181, 1209, 1, 2, 0, 1, 539, '2019-08-28 18:18:54', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1191, 1219, 1, 2, 0, 1, 539, '2019-08-28 18:18:54', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1207, 1235, 1, 2, 0, 1, 539, '2019-08-28 18:18:55', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1210, 1238, 1, 2, 0, 1, 539, '2019-08-28 18:18:56', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1219, 1247, 1, 2, 0, 1, 539, '2019-08-28 18:18:56', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1229, 1257, 1, 2, 0, 1, 539, '2019-08-28 18:18:56', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1240, 1268, 1, 2, 0, 1, 539, '2019-08-28 18:22:15', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1256, 1284, 1, 2, 0, 1, 539, '2019-08-28 18:22:15', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1260, 1288, 1, 2, 0, 1, 539, '2019-08-28 18:22:16', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1275, 1303, 1, 2, 0, 1, 539, '2019-08-28 18:22:16', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1278, 1306, 1, 2, 0, 1, 539, '2019-08-28 18:22:17', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1282, 1310, 1, 2, 0, 1, 539, '2019-08-28 18:22:17', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1292, 1320, 1, 2, 0, 1, 539, '2019-08-28 18:22:17', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1300, 1328, 1, 2, 0, 1, 539, '2019-08-28 18:22:18', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1320, 1348, 1, 2, 0, 1, 539, '2019-08-28 18:22:18', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1333, 1361, 1, 2, 0, 1, 539, '2019-08-28 18:22:19', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1542, 1570, 1, 2, 0, 1, 539, '2019-08-28 18:28:41', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1550, 1578, 1, 2, 0, 1, 539, '2019-08-28 18:28:42', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1558, 1586, 1, 2, 0, 1, 539, '2019-08-28 18:28:42', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1566, 1594, 1, 2, 0, 1, 539, '2019-08-28 18:28:43', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1574, 1602, 1, 2, 0, 1, 539, '2019-08-28 18:28:43', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1582, 1610, 1, 2, 0, 1, 539, '2019-08-28 18:28:44', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1590, 1618, 1, 2, 0, 1, 539, '2019-08-28 18:28:44', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1598, 1626, 1, 2, 0, 1, 539, '2019-08-28 18:28:45', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1606, 1634, 1, 2, 0, 1, 539, '2019-08-28 18:28:45', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1614, 1642, 1, 2, 0, 1, 539, '2019-08-28 18:28:45', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1622, 1650, 1, 2, 0, 1, 539, '2019-08-28 18:28:46', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1630, 1658, 1, 2, 0, 1, 539, '2019-08-28 18:28:46', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1644, 1672, 1, 2, 0, 1, 539, '2019-08-28 18:29:50', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1652, 1680, 1, 2, 0, 1, 539, '2019-08-28 18:29:51', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1660, 1688, 1, 2, 0, 1, 539, '2019-08-28 18:29:51', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1668, 1696, 1, 2, 0, 1, 539, '2019-08-28 18:29:51', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1676, 1704, 1, 2, 0, 1, 539, '2019-08-28 18:29:52', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1684, 1712, 1, 2, 0, 1, 539, '2019-08-28 18:29:52', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1692, 1720, 1, 2, 0, 1, 539, '2019-08-28 18:29:53', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1700, 1728, 1, 2, 0, 1, 539, '2019-08-28 18:29:53', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1708, 1736, 1, 2, 0, 1, 539, '2019-08-28 18:29:54', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1716, 1744, 1, 2, 0, 1, 539, '2019-08-28 18:29:54', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1724, 1752, 1, 2, 0, 1, 539, '2019-08-28 18:29:55', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1732, 1760, 1, 2, 0, 1, 539, '2019-08-28 18:29:55', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1743, 1771, 1, 2, 0, 1, 539, '2019-08-28 18:30:12', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1751, 1779, 1, 2, 0, 1, 539, '2019-08-28 18:30:13', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1759, 1787, 1, 2, 0, 1, 539, '2019-08-28 18:30:13', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1767, 1795, 1, 2, 0, 1, 539, '2019-08-28 18:30:14', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1775, 1803, 1, 2, 0, 1, 539, '2019-08-28 18:30:14', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (736, 764, 1, 2, 0, 1, 539, '2019-08-28 17:27:52', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (739, 767, 1, 2, 0, 1, 539, '2019-08-28 17:27:52', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (750, 778, 1, 2, 0, 1, 539, '2019-08-28 17:27:52', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (756, 784, 1, 2, 0, 1, 539, '2019-08-28 17:27:53', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (762, 790, 1, 2, 0, 1, 539, '2019-08-28 17:27:53', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (777, 805, 1, 2, 0, 1, 539, '2019-08-28 17:27:54', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (783, 811, 1, 2, 0, 1, 539, '2019-08-28 17:27:54', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (790, 818, 1, 2, 0, 1, 539, '2019-08-28 17:27:55', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (807, 835, 1, 2, 0, 1, 539, '2019-08-28 17:27:55', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (810, 838, 1, 2, 0, 1, 539, '2019-08-28 17:27:56', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (828, 856, 1, 2, 0, 1, 539, '2019-08-28 17:27:56', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1138, 1166, 1, 2, 0, 1, 539, '2019-08-28 18:18:52', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1141, 1169, 1, 2, 0, 1, 539, '2019-08-28 18:18:52', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1144, 1172, 1, 2, 0, 1, 539, '2019-08-28 18:18:52', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1157, 1185, 1, 2, 0, 1, 539, '2019-08-28 18:18:52', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1160, 1188, 1, 2, 0, 1, 539, '2019-08-28 18:18:53', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1185, 1213, 1, 2, 0, 1, 539, '2019-08-28 18:18:53', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1195, 1223, 1, 2, 0, 1, 539, '2019-08-28 18:18:55', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1198, 1226, 1, 2, 0, 1, 539, '2019-08-28 18:18:55', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1204, 1232, 1, 2, 0, 1, 539, '2019-08-28 18:18:55', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1213, 1241, 1, 2, 0, 1, 539, '2019-08-28 18:18:56', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1216, 1244, 1, 2, 0, 1, 539, '2019-08-28 18:18:56', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1220, 1248, 1, 2, 0, 1, 539, '2019-08-28 18:18:56', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1223, 1251, 1, 2, 0, 1, 539, '2019-08-28 18:18:57', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1227, 1255, 1, 2, 0, 1, 539, '2019-08-28 18:18:57', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1235, 1263, 1, 2, 0, 1, 539, '2019-08-28 18:18:57', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1238, 1266, 1, 2, 0, 1, 539, '2019-08-28 18:22:15', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1247, 1275, 1, 2, 0, 1, 539, '2019-08-28 18:22:15', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1254, 1282, 1, 2, 0, 1, 539, '2019-08-28 18:22:15', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1258, 1286, 1, 2, 0, 1, 539, '2019-08-28 18:22:16', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1268, 1296, 1, 2, 0, 1, 539, '2019-08-28 18:22:16', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1283, 1311, 1, 2, 0, 1, 539, '2019-08-28 18:22:16', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1295, 1323, 1, 2, 0, 1, 539, '2019-08-28 18:22:17', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1298, 1326, 1, 2, 0, 1, 539, '2019-08-28 18:22:18', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1304, 1332, 1, 2, 0, 1, 539, '2019-08-28 18:22:18', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1324, 1352, 1, 2, 0, 1, 539, '2019-08-28 18:22:18', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1330, 1358, 1, 2, 0, 1, 539, '2019-08-28 18:22:19', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1543, 1571, 1, 2, 0, 1, 539, '2019-08-28 18:28:41', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1551, 1579, 1, 2, 0, 1, 539, '2019-08-28 18:28:42', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1559, 1587, 1, 2, 0, 1, 539, '2019-08-28 18:28:43', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1567, 1595, 1, 2, 0, 1, 539, '2019-08-28 18:28:43', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1575, 1603, 1, 2, 0, 1, 539, '2019-08-28 18:28:43', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1583, 1611, 1, 2, 0, 1, 539, '2019-08-28 18:28:44', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1591, 1619, 1, 2, 0, 1, 539, '2019-08-28 18:28:44', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1599, 1627, 1, 2, 0, 1, 539, '2019-08-28 18:28:45', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1607, 1635, 1, 2, 0, 1, 539, '2019-08-28 18:28:45', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1615, 1643, 1, 2, 0, 1, 539, '2019-08-28 18:28:45', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1623, 1651, 1, 2, 0, 1, 539, '2019-08-28 18:28:46', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1631, 1659, 1, 2, 0, 1, 539, '2019-08-28 18:28:46', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1642, 1670, 1, 2, 0, 1, 539, '2019-08-28 18:29:50', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1650, 1678, 1, 2, 0, 1, 539, '2019-08-28 18:29:51', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1658, 1686, 1, 2, 0, 1, 539, '2019-08-28 18:29:51', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1666, 1694, 1, 2, 0, 1, 539, '2019-08-28 18:29:51', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1674, 1702, 1, 2, 0, 1, 539, '2019-08-28 18:29:52', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1682, 1710, 1, 2, 0, 1, 539, '2019-08-28 18:29:52', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1690, 1718, 1, 2, 0, 1, 539, '2019-08-28 18:29:53', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1698, 1726, 1, 2, 0, 1, 539, '2019-08-28 18:29:53', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1706, 1734, 1, 2, 0, 1, 539, '2019-08-28 18:29:54', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1714, 1742, 1, 2, 0, 1, 539, '2019-08-28 18:29:54', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1722, 1750, 1, 2, 0, 1, 539, '2019-08-28 18:29:54', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1730, 1758, 1, 2, 0, 1, 539, '2019-08-28 18:29:55', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1741, 1769, 1, 2, 0, 1, 539, '2019-08-28 18:30:12', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1749, 1777, 1, 2, 0, 1, 539, '2019-08-28 18:30:13', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1757, 1785, 1, 2, 0, 1, 539, '2019-08-28 18:30:13', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1765, 1793, 1, 2, 0, 1, 539, '2019-08-28 18:30:13', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (737, 765, 1, 2, 0, 1, 539, '2019-08-28 17:27:52', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (740, 768, 1, 2, 0, 1, 539, '2019-08-28 17:27:52', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (743, 771, 1, 2, 0, 1, 539, '2019-08-28 17:27:52', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (758, 786, 1, 2, 0, 1, 539, '2019-08-28 17:27:53', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (764, 792, 1, 2, 0, 1, 539, '2019-08-28 17:27:53', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (771, 799, 1, 2, 0, 1, 539, '2019-08-28 17:27:54', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (774, 802, 1, 2, 0, 1, 539, '2019-08-28 17:27:54', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (780, 808, 1, 2, 0, 1, 539, '2019-08-28 17:27:54', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (787, 815, 1, 2, 0, 1, 539, '2019-08-28 17:27:55', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (793, 821, 1, 2, 0, 1, 539, '2019-08-28 17:27:55', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (796, 824, 1, 2, 0, 1, 539, '2019-08-28 17:27:55', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (831, 859, 1, 2, 0, 1, 539, '2019-08-28 17:27:55', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1139, 1167, 1, 2, 0, 1, 539, '2019-08-28 18:18:52', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1142, 1170, 1, 2, 0, 1, 539, '2019-08-28 18:18:52', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1176, 1204, 1, 2, 0, 1, 539, '2019-08-28 18:18:52', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1182, 1210, 1, 2, 0, 1, 539, '2019-08-28 18:18:54', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1188, 1216, 1, 2, 0, 1, 539, '2019-08-28 18:18:54', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1212, 1240, 1, 2, 0, 1, 539, '2019-08-28 18:18:55', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1218, 1246, 1, 2, 0, 1, 539, '2019-08-28 18:18:56', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1221, 1249, 1, 2, 0, 1, 539, '2019-08-28 18:18:56', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1228, 1256, 1, 2, 0, 1, 539, '2019-08-28 18:18:57', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1232, 1260, 1, 2, 0, 1, 539, '2019-08-28 18:18:57', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1243, 1271, 1, 2, 0, 1, 539, '2019-08-28 18:22:15', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1246, 1274, 1, 2, 0, 1, 539, '2019-08-28 18:22:15', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1257, 1285, 1, 2, 0, 1, 539, '2019-08-28 18:22:15', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1267, 1295, 1, 2, 0, 1, 539, '2019-08-28 18:22:16', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1270, 1298, 1, 2, 0, 1, 539, '2019-08-28 18:22:16', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1273, 1301, 1, 2, 0, 1, 539, '2019-08-28 18:22:16', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1276, 1304, 1, 2, 0, 1, 539, '2019-08-28 18:22:17', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1280, 1308, 1, 2, 0, 1, 539, '2019-08-28 18:22:17', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1287, 1315, 1, 2, 0, 1, 539, '2019-08-28 18:22:17', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1293, 1321, 1, 2, 0, 1, 539, '2019-08-28 18:22:17', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1301, 1329, 1, 2, 0, 1, 539, '2019-08-28 18:22:18', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1315, 1343, 1, 2, 0, 1, 539, '2019-08-28 18:22:18', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1331, 1359, 1, 2, 0, 1, 539, '2019-08-28 18:22:19', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1544, 1572, 1, 2, 0, 1, 539, '2019-08-28 18:28:41', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1552, 1580, 1, 2, 0, 1, 539, '2019-08-28 18:28:42', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1560, 1588, 1, 2, 0, 1, 539, '2019-08-28 18:28:43', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1568, 1596, 1, 2, 0, 1, 539, '2019-08-28 18:28:43', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1576, 1604, 1, 2, 0, 1, 539, '2019-08-28 18:28:43', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1584, 1612, 1, 2, 0, 1, 539, '2019-08-28 18:28:44', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1592, 1620, 1, 2, 0, 1, 539, '2019-08-28 18:28:44', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1600, 1628, 1, 2, 0, 1, 539, '2019-08-28 18:28:45', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1608, 1636, 1, 2, 0, 1, 539, '2019-08-28 18:28:45', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1616, 1644, 1, 2, 0, 1, 539, '2019-08-28 18:28:45', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1624, 1652, 1, 2, 0, 1, 539, '2019-08-28 18:28:46', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1632, 1660, 1, 2, 0, 1, 539, '2019-08-28 18:28:46', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1641, 1669, 1, 2, 0, 1, 539, '2019-08-28 18:29:50', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1649, 1677, 1, 2, 0, 1, 539, '2019-08-28 18:29:50', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1657, 1685, 1, 2, 0, 1, 539, '2019-08-28 18:29:51', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1665, 1693, 1, 2, 0, 1, 539, '2019-08-28 18:29:51', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1673, 1701, 1, 2, 0, 1, 539, '2019-08-28 18:29:52', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1681, 1709, 1, 2, 0, 1, 539, '2019-08-28 18:29:52', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1689, 1717, 1, 2, 0, 1, 539, '2019-08-28 18:29:53', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1697, 1725, 1, 2, 0, 1, 539, '2019-08-28 18:29:53', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1705, 1733, 1, 2, 0, 1, 539, '2019-08-28 18:29:54', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1713, 1741, 1, 2, 0, 1, 539, '2019-08-28 18:29:54', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1721, 1749, 1, 2, 0, 1, 539, '2019-08-28 18:29:54', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1729, 1757, 1, 2, 0, 1, 539, '2019-08-28 18:29:55', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1744, 1772, 1, 2, 0, 1, 539, '2019-08-28 18:30:12', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1752, 1780, 1, 2, 0, 1, 539, '2019-08-28 18:30:13', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1760, 1788, 1, 2, 0, 1, 539, '2019-08-28 18:30:13', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1768, 1796, 1, 2, 0, 1, 539, '2019-08-28 18:30:14', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1776, 1804, 1, 2, 0, 1, 539, '2019-08-28 18:30:14', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1784, 1812, 1, 2, 0, 1, 539, '2019-08-28 18:30:14', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (741, 769, 1, 2, 0, 1, 539, '2019-08-28 17:27:52', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (744, 772, 1, 2, 0, 1, 539, '2019-08-28 17:27:52', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (747, 775, 1, 2, 0, 1, 539, '2019-08-28 17:27:53', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (531, 559, 1, 2, 0, 1, 539, '2019-08-28 17:23:30', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (532, 560, 1, 2, 0, 1, 539, '2019-08-28 17:25:32', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (533, 561, 1, 2, 0, 1, 539, '2019-08-28 17:25:32', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (534, 562, 1, 2, 0, 1, 539, '2019-08-28 17:25:32', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (535, 563, 1, 2, 0, 1, 539, '2019-08-28 17:25:32', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (536, 564, 1, 2, 0, 1, 539, '2019-08-28 17:25:32', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (537, 565, 1, 2, 0, 1, 539, '2019-08-28 17:25:32', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (538, 566, 1, 2, 0, 1, 539, '2019-08-28 17:25:32', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (539, 567, 1, 2, 0, 1, 539, '2019-08-28 17:25:32', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (540, 568, 1, 2, 0, 1, 539, '2019-08-28 17:25:32', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (541, 569, 1, 2, 0, 1, 539, '2019-08-28 17:25:32', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (542, 570, 1, 2, 0, 1, 539, '2019-08-28 17:25:32', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (543, 571, 1, 2, 0, 1, 539, '2019-08-28 17:25:33', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (544, 572, 1, 2, 0, 1, 539, '2019-08-28 17:25:33', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (545, 573, 1, 2, 0, 1, 539, '2019-08-28 17:25:33', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (546, 574, 1, 2, 0, 1, 539, '2019-08-28 17:25:33', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (547, 575, 1, 2, 0, 1, 539, '2019-08-28 17:25:33', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (548, 576, 1, 2, 0, 1, 539, '2019-08-28 17:25:32', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (549, 577, 1, 2, 0, 1, 539, '2019-08-28 17:25:33', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (550, 578, 1, 2, 0, 1, 539, '2019-08-28 17:25:32', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (551, 579, 1, 2, 0, 1, 539, '2019-08-28 17:25:33', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (552, 580, 1, 2, 0, 1, 539, '2019-08-28 17:25:33', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (553, 581, 1, 2, 0, 1, 539, '2019-08-28 17:25:33', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (554, 582, 1, 2, 0, 1, 539, '2019-08-28 17:25:33', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (555, 583, 1, 2, 0, 1, 539, '2019-08-28 17:25:32', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (556, 584, 1, 2, 0, 1, 539, '2019-08-28 17:25:32', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (557, 585, 1, 2, 0, 1, 539, '2019-08-28 17:25:33', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (558, 586, 1, 2, 0, 1, 539, '2019-08-28 17:25:34', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (559, 587, 1, 2, 0, 1, 539, '2019-08-28 17:25:33', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (560, 588, 1, 2, 0, 1, 539, '2019-08-28 17:25:34', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (561, 589, 1, 2, 0, 1, 539, '2019-08-28 17:25:34', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (562, 590, 1, 2, 0, 1, 539, '2019-08-28 17:25:34', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (563, 591, 1, 2, 0, 1, 539, '2019-08-28 17:25:34', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (564, 592, 1, 2, 0, 1, 539, '2019-08-28 17:25:34', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (565, 593, 1, 2, 0, 1, 539, '2019-08-28 17:25:34', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (566, 594, 1, 2, 0, 1, 539, '2019-08-28 17:25:33', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (567, 595, 1, 2, 0, 1, 539, '2019-08-28 17:25:34', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (568, 596, 1, 2, 0, 1, 539, '2019-08-28 17:25:34', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (569, 597, 1, 2, 0, 1, 539, '2019-08-28 17:25:32', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (570, 598, 1, 2, 0, 1, 539, '2019-08-28 17:25:34', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (571, 599, 1, 2, 0, 1, 539, '2019-08-28 17:25:34', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (572, 600, 1, 2, 0, 1, 539, '2019-08-28 17:25:35', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (573, 601, 1, 2, 0, 1, 539, '2019-08-28 17:25:35', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (574, 602, 1, 2, 0, 1, 539, '2019-08-28 17:25:35', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (575, 603, 1, 2, 0, 1, 539, '2019-08-28 17:25:34', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (576, 604, 1, 2, 0, 1, 539, '2019-08-28 17:25:35', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (577, 605, 1, 2, 0, 1, 539, '2019-08-28 17:25:35', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (578, 606, 1, 2, 0, 1, 539, '2019-08-28 17:25:35', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (579, 607, 1, 2, 0, 1, 539, '2019-08-28 17:25:35', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (580, 608, 1, 2, 0, 1, 539, '2019-08-28 17:25:35', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (581, 609, 1, 2, 0, 1, 539, '2019-08-28 17:25:34', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (582, 610, 1, 2, 0, 1, 539, '2019-08-28 17:25:35', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (583, 611, 1, 2, 0, 1, 539, '2019-08-28 17:25:35', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (584, 612, 1, 2, 0, 1, 539, '2019-08-28 17:25:35', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (585, 613, 1, 2, 0, 1, 539, '2019-08-28 17:25:35', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (586, 614, 1, 2, 0, 1, 539, '2019-08-28 17:25:35', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (587, 615, 1, 2, 0, 1, 539, '2019-08-28 17:25:36', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (588, 616, 1, 2, 0, 1, 539, '2019-08-28 17:25:36', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (589, 617, 1, 2, 0, 1, 539, '2019-08-28 17:25:36', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (590, 618, 1, 2, 0, 1, 539, '2019-08-28 17:25:35', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (591, 619, 1, 2, 0, 1, 539, '2019-08-28 17:25:36', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (592, 620, 1, 2, 0, 1, 539, '2019-08-28 17:25:36', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (593, 621, 1, 2, 0, 1, 539, '2019-08-28 17:25:36', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (600, 628, 1, 2, 0, 1, 539, '2019-08-28 17:25:36', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (610, 638, 1, 2, 0, 1, 539, '2019-08-28 17:25:37', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (620, 648, 1, 2, 0, 1, 539, '2019-08-28 17:25:37', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (623, 651, 1, 2, 0, 1, 539, '2019-08-28 17:25:38', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (629, 657, 1, 2, 0, 1, 539, '2019-08-28 17:25:38', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (742, 770, 1, 2, 0, 1, 539, '2019-08-28 17:27:52', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (760, 788, 1, 2, 0, 1, 539, '2019-08-28 17:27:52', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (766, 794, 1, 2, 0, 1, 539, '2019-08-28 17:27:53', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (788, 816, 1, 2, 0, 1, 539, '2019-08-28 17:27:54', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (791, 819, 1, 2, 0, 1, 539, '2019-08-28 17:27:55', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (794, 822, 1, 2, 0, 1, 539, '2019-08-28 17:27:55', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (797, 825, 1, 2, 0, 1, 539, '2019-08-28 17:27:55', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (803, 831, 1, 2, 0, 1, 539, '2019-08-28 17:27:56', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (806, 834, 1, 2, 0, 1, 539, '2019-08-28 17:27:56', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (809, 837, 1, 2, 0, 1, 539, '2019-08-28 17:27:56', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (813, 841, 1, 2, 0, 1, 539, '2019-08-28 17:27:56', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (817, 845, 1, 2, 0, 1, 539, '2019-08-28 17:27:56', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (820, 848, 1, 2, 0, 1, 539, '2019-08-28 17:27:57', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (824, 852, 1, 2, 0, 1, 539, '2019-08-28 17:27:57', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1140, 1168, 1, 2, 0, 1, 539, '2019-08-28 18:18:52', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1143, 1171, 1, 2, 0, 1, 539, '2019-08-28 18:18:52', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1155, 1183, 1, 2, 0, 1, 539, '2019-08-28 18:18:52', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1167, 1195, 1, 2, 0, 1, 539, '2019-08-28 18:18:53', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1174, 1202, 1, 2, 0, 1, 539, '2019-08-28 18:18:54', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1177, 1205, 1, 2, 0, 1, 539, '2019-08-28 18:18:54', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1184, 1212, 1, 2, 0, 1, 539, '2019-08-28 18:18:54', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1187, 1215, 1, 2, 0, 1, 539, '2019-08-28 18:18:55', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1194, 1222, 1, 2, 0, 1, 539, '2019-08-28 18:18:55', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1197, 1225, 1, 2, 0, 1, 539, '2019-08-28 18:18:55', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1200, 1228, 1, 2, 0, 1, 539, '2019-08-28 18:18:55', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1203, 1231, 1, 2, 0, 1, 539, '2019-08-28 18:18:55', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1215, 1243, 1, 2, 0, 1, 539, '2019-08-28 18:18:56', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1225, 1253, 1, 2, 0, 1, 539, '2019-08-28 18:18:56', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1236, 1264, 1, 2, 0, 1, 539, '2019-08-28 18:18:57', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1241, 1269, 1, 2, 0, 1, 539, '2019-08-28 18:22:15', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1244, 1272, 1, 2, 0, 1, 539, '2019-08-28 18:22:15', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1251, 1279, 1, 2, 0, 1, 539, '2019-08-28 18:22:15', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1262, 1290, 1, 2, 0, 1, 539, '2019-08-28 18:22:15', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1265, 1293, 1, 2, 0, 1, 539, '2019-08-28 18:22:16', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1279, 1307, 1, 2, 0, 1, 539, '2019-08-28 18:22:16', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1286, 1314, 1, 2, 0, 1, 539, '2019-08-28 18:22:17', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1289, 1317, 1, 2, 0, 1, 539, '2019-08-28 18:22:17', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1297, 1325, 1, 2, 0, 1, 539, '2019-08-28 18:22:17', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1303, 1331, 1, 2, 0, 1, 539, '2019-08-28 18:22:18', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1307, 1335, 1, 2, 0, 1, 539, '2019-08-28 18:22:18', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1311, 1339, 1, 2, 0, 1, 539, '2019-08-28 18:22:18', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1318, 1346, 1, 2, 0, 1, 539, '2019-08-28 18:22:19', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1321, 1349, 1, 2, 0, 1, 539, '2019-08-28 18:22:19', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1327, 1355, 1, 2, 0, 1, 539, '2019-08-28 18:22:19', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1335, 1363, 1, 2, 0, 1, 539, '2019-08-28 18:22:19', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1735, 1763, 1, 2, 0, 1, 539, '2019-08-28 18:29:55', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1739, 1767, 1, 2, 0, 1, 539, '2019-08-28 18:30:12', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1747, 1775, 1, 2, 0, 1, 539, '2019-08-28 18:30:13', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1755, 1783, 1, 2, 0, 1, 539, '2019-08-28 18:30:13', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1763, 1791, 1, 2, 0, 1, 539, '2019-08-28 18:30:13', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1771, 1799, 1, 2, 0, 1, 539, '2019-08-28 18:30:14', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1779, 1807, 1, 2, 0, 1, 539, '2019-08-28 18:30:14', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1787, 1815, 1, 2, 0, 1, 539, '2019-08-28 18:30:15', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1795, 1823, 1, 2, 0, 1, 539, '2019-08-28 18:30:15', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1803, 1831, 1, 2, 0, 1, 539, '2019-08-28 18:30:16', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1811, 1839, 1, 2, 0, 1, 539, '2019-08-28 18:30:16', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1819, 1847, 1, 2, 0, 1, 539, '2019-08-28 18:30:16', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1827, 1855, 1, 2, 0, 1, 539, '2019-08-28 18:30:17', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1835, 1863, 1, 2, 0, 1, 539, '2019-08-28 18:30:17', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (594, 622, 1, 2, 0, 1, 539, '2019-08-28 17:25:35', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (604, 632, 1, 2, 0, 1, 539, '2019-08-28 17:25:36', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (614, 642, 1, 2, 0, 1, 539, '2019-08-28 17:25:37', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (617, 645, 1, 2, 0, 1, 539, '2019-08-28 17:25:38', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (631, 659, 1, 2, 0, 1, 539, '2019-08-28 17:25:38', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (753, 781, 1, 2, 0, 1, 539, '2019-08-28 17:27:53', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (763, 791, 1, 2, 0, 1, 539, '2019-08-28 17:27:53', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (784, 812, 1, 2, 0, 1, 539, '2019-08-28 17:27:54', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (799, 827, 1, 2, 0, 1, 539, '2019-08-28 17:27:55', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (811, 839, 1, 2, 0, 1, 539, '2019-08-28 17:27:56', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (814, 842, 1, 2, 0, 1, 539, '2019-08-28 17:27:56', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (821, 849, 1, 2, 0, 1, 539, '2019-08-28 17:27:57', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (827, 855, 1, 2, 0, 1, 539, '2019-08-28 17:27:57', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1145, 1173, 1, 2, 0, 1, 539, '2019-08-28 18:18:52', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1151, 1179, 1, 2, 0, 1, 539, '2019-08-28 18:18:52', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1158, 1186, 1, 2, 0, 1, 539, '2019-08-28 18:18:53', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1161, 1189, 1, 2, 0, 1, 539, '2019-08-28 18:18:53', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1164, 1192, 1, 2, 0, 1, 539, '2019-08-28 18:18:53', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1170, 1198, 1, 2, 0, 1, 539, '2019-08-28 18:18:53', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1183, 1211, 1, 2, 0, 1, 539, '2019-08-28 18:18:54', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1201, 1229, 1, 2, 0, 1, 539, '2019-08-28 18:18:54', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1222, 1250, 1, 2, 0, 1, 539, '2019-08-28 18:18:56', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1226, 1254, 1, 2, 0, 1, 539, '2019-08-28 18:18:57', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1233, 1261, 1, 2, 0, 1, 539, '2019-08-28 18:18:57', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1242, 1270, 1, 2, 0, 1, 539, '2019-08-28 18:22:15', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1248, 1276, 1, 2, 0, 1, 539, '2019-08-28 18:22:15', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1255, 1283, 1, 2, 0, 1, 539, '2019-08-28 18:22:15', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1259, 1287, 1, 2, 0, 1, 539, '2019-08-28 18:22:16', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1271, 1299, 1, 2, 0, 1, 539, '2019-08-28 18:22:16', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1274, 1302, 1, 2, 0, 1, 539, '2019-08-28 18:22:16', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1284, 1312, 1, 2, 0, 1, 539, '2019-08-28 18:22:17', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1290, 1318, 1, 2, 0, 1, 539, '2019-08-28 18:22:17', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1305, 1333, 1, 2, 0, 1, 539, '2019-08-28 18:22:17', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1308, 1336, 1, 2, 0, 1, 539, '2019-08-28 18:22:18', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1312, 1340, 1, 2, 0, 1, 539, '2019-08-28 18:22:18', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1319, 1347, 1, 2, 0, 1, 539, '2019-08-28 18:22:19', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1322, 1350, 1, 2, 0, 1, 539, '2019-08-28 18:22:19', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1332, 1360, 1, 2, 0, 1, 539, '2019-08-28 18:22:19', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1753, 1781, 1, 2, 0, 1, 539, '2019-08-28 18:30:13', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1761, 1789, 1, 2, 0, 1, 539, '2019-08-28 18:30:13', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1769, 1797, 1, 2, 0, 1, 539, '2019-08-28 18:30:14', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1777, 1805, 1, 2, 0, 1, 539, '2019-08-28 18:30:14', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1785, 1813, 1, 2, 0, 1, 539, '2019-08-28 18:30:15', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1793, 1821, 1, 2, 0, 1, 539, '2019-08-28 18:30:15', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1801, 1829, 1, 2, 0, 1, 539, '2019-08-28 18:30:15', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1809, 1837, 1, 2, 0, 1, 539, '2019-08-28 18:30:16', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1817, 1845, 1, 2, 0, 1, 539, '2019-08-28 18:30:16', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1825, 1853, 1, 2, 0, 1, 539, '2019-08-28 18:30:17', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1833, 1861, 1, 2, 0, 1, 539, '2019-08-28 18:30:17', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1842, 1870, 1, 2, 0, 1, 539, '2019-08-28 18:30:55', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1850, 1878, 1, 2, 0, 1, 539, '2019-08-28 18:30:55', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1858, 1886, 1, 2, 0, 1, 539, '2019-08-28 18:30:55', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1866, 1894, 1, 2, 0, 1, 539, '2019-08-28 18:30:56', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1874, 1902, 1, 2, 0, 1, 539, '2019-08-28 18:30:56', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1882, 1910, 1, 2, 0, 1, 539, '2019-08-28 18:30:56', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1890, 1918, 1, 2, 0, 1, 539, '2019-08-28 18:30:57', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1898, 1926, 1, 2, 0, 1, 539, '2019-08-28 18:30:57', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1906, 1934, 1, 2, 0, 1, 539, '2019-08-28 18:30:58', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1914, 1942, 1, 2, 0, 1, 539, '2019-08-28 18:30:58', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1922, 1950, 1, 2, 0, 1, 539, '2019-08-28 18:30:59', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1930, 1958, 1, 2, 0, 1, 539, '2019-08-28 18:30:59', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1949, 1982, 1, 1, 0, 20000, 8349, '2020-02-02 18:52:58', 0, NULL, 2003806, NULL, 0, 7, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_deal" VALUES (1950, 1983, 1, 1, 0, 20000, 8349, '2020-02-02 18:58:08', 0, NULL, 2003806, NULL, 0, 9, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_deal" VALUES (1951, 1984, 1, 1, 0, 10000, 8349, '2020-02-02 18:59:07', 0, NULL, 1001880, NULL, 0, 9, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_deal" VALUES (595, 623, 1, 2, 0, 1, 539, '2019-08-28 17:25:36', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (602, 630, 1, 2, 0, 1, 539, '2019-08-28 17:25:36', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (606, 634, 1, 2, 0, 1, 539, '2019-08-28 17:25:37', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (618, 646, 1, 2, 0, 1, 539, '2019-08-28 17:25:37', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (621, 649, 1, 2, 0, 1, 539, '2019-08-28 17:25:38', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (628, 656, 1, 2, 0, 1, 539, '2019-08-28 17:25:38', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (832, 860, 1, 2, 0, 1, 539, '2019-08-28 17:36:38', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (841, 869, 1, 2, 0, 1, 539, '2019-08-28 17:36:38', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (844, 872, 1, 2, 0, 1, 539, '2019-08-28 17:36:38', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (857, 885, 1, 2, 0, 1, 539, '2019-08-28 17:36:38', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (863, 891, 1, 2, 0, 1, 539, '2019-08-28 17:36:39', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (873, 901, 1, 2, 0, 1, 539, '2019-08-28 17:36:39', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (879, 907, 1, 2, 0, 1, 539, '2019-08-28 17:36:40', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (884, 912, 1, 2, 0, 1, 539, '2019-08-28 17:36:40', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (888, 916, 1, 2, 0, 1, 539, '2019-08-28 17:36:40', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (901, 929, 1, 2, 0, 1, 539, '2019-08-28 17:36:41', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (904, 932, 1, 2, 0, 1, 539, '2019-08-28 17:36:41', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (911, 939, 1, 2, 0, 1, 539, '2019-08-28 17:36:42', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (914, 942, 1, 2, 0, 1, 539, '2019-08-28 17:36:42', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (917, 945, 1, 2, 0, 1, 539, '2019-08-28 17:36:42', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (930, 958, 1, 2, 0, 1, 539, '2019-08-28 17:36:42', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1146, 1174, 1, 2, 0, 1, 539, '2019-08-28 18:18:52', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1149, 1177, 1, 2, 0, 1, 539, '2019-08-28 18:18:53', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1152, 1180, 1, 2, 0, 1, 539, '2019-08-28 18:18:53', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1159, 1187, 1, 2, 0, 1, 539, '2019-08-28 18:18:53', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1171, 1199, 1, 2, 0, 1, 539, '2019-08-28 18:18:53', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1180, 1208, 1, 2, 0, 1, 539, '2019-08-28 18:18:54', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1186, 1214, 1, 2, 0, 1, 539, '2019-08-28 18:18:54', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1190, 1218, 1, 2, 0, 1, 539, '2019-08-28 18:18:55', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1202, 1230, 1, 2, 0, 1, 539, '2019-08-28 18:18:55', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1206, 1234, 1, 2, 0, 1, 539, '2019-08-28 18:18:56', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1209, 1237, 1, 2, 0, 1, 539, '2019-08-28 18:18:56', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1224, 1252, 1, 2, 0, 1, 539, '2019-08-28 18:18:56', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1234, 1262, 1, 2, 0, 1, 539, '2019-08-28 18:18:57', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1237, 1265, 1, 2, 0, 1, 539, '2019-08-28 18:22:15', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1250, 1278, 1, 2, 0, 1, 539, '2019-08-28 18:22:15', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1261, 1289, 1, 2, 0, 1, 539, '2019-08-28 18:22:15', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1264, 1292, 1, 2, 0, 1, 539, '2019-08-28 18:22:16', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1294, 1322, 1, 2, 0, 1, 539, '2019-08-28 18:22:16', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1313, 1341, 1, 2, 0, 1, 539, '2019-08-28 18:22:18', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1323, 1351, 1, 2, 0, 1, 539, '2019-08-28 18:22:19', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1326, 1354, 1, 2, 0, 1, 539, '2019-08-28 18:22:19', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1329, 1357, 1, 2, 0, 1, 539, '2019-08-28 18:22:19', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1756, 1784, 1, 2, 0, 1, 539, '2019-08-28 18:30:13', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1764, 1792, 1, 2, 0, 1, 539, '2019-08-28 18:30:13', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1772, 1800, 1, 2, 0, 1, 539, '2019-08-28 18:30:14', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1780, 1808, 1, 2, 0, 1, 539, '2019-08-28 18:30:14', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1788, 1816, 1, 2, 0, 1, 539, '2019-08-28 18:30:15', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1796, 1824, 1, 2, 0, 1, 539, '2019-08-28 18:30:15', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1804, 1832, 1, 2, 0, 1, 539, '2019-08-28 18:30:16', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1812, 1840, 1, 2, 0, 1, 539, '2019-08-28 18:30:16', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1820, 1848, 1, 2, 0, 1, 539, '2019-08-28 18:30:16', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1828, 1856, 1, 2, 0, 1, 539, '2019-08-28 18:30:17', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1836, 1864, 1, 2, 0, 1, 539, '2019-08-28 18:30:17', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1843, 1871, 1, 2, 0, 1, 539, '2019-08-28 18:30:55', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1851, 1879, 1, 2, 0, 1, 539, '2019-08-28 18:30:55', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1859, 1887, 1, 2, 0, 1, 539, '2019-08-28 18:30:55', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1867, 1895, 1, 2, 0, 1, 539, '2019-08-28 18:30:56', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1875, 1903, 1, 2, 0, 1, 539, '2019-08-28 18:30:56', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1883, 1911, 1, 2, 0, 1, 539, '2019-08-28 18:30:57', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1891, 1919, 1, 2, 0, 1, 539, '2019-08-28 18:30:57', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1899, 1927, 1, 2, 0, 1, 539, '2019-08-28 18:30:57', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1907, 1935, 1, 2, 0, 1, 539, '2019-08-28 18:30:58', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1915, 1943, 1, 2, 0, 1, 539, '2019-08-28 18:30:58', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1923, 1951, 1, 2, 0, 1, 539, '2019-08-28 18:30:59', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (596, 624, 1, 2, 0, 1, 539, '2019-08-28 17:25:36', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (609, 637, 1, 2, 0, 1, 539, '2019-08-28 17:25:36', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (616, 644, 1, 2, 0, 1, 539, '2019-08-28 17:25:37', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (625, 653, 1, 2, 0, 1, 539, '2019-08-28 17:25:38', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (833, 861, 1, 2, 0, 1, 539, '2019-08-28 17:36:38', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (836, 864, 1, 2, 0, 1, 539, '2019-08-28 17:36:38', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (851, 879, 1, 2, 0, 1, 539, '2019-08-28 17:36:38', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (858, 886, 1, 2, 0, 1, 539, '2019-08-28 17:36:39', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (864, 892, 1, 2, 0, 1, 539, '2019-08-28 17:36:39', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (882, 910, 1, 2, 0, 1, 539, '2019-08-28 17:36:39', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (889, 917, 1, 2, 0, 1, 539, '2019-08-28 17:36:40', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (902, 930, 1, 2, 0, 1, 539, '2019-08-28 17:36:41', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (912, 940, 1, 2, 0, 1, 539, '2019-08-28 17:36:41', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (915, 943, 1, 2, 0, 1, 539, '2019-08-28 17:36:42', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (918, 946, 1, 2, 0, 1, 539, '2019-08-28 17:36:42', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (931, 959, 1, 2, 0, 1, 539, '2019-08-28 17:36:42', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1148, 1176, 1, 2, 0, 1, 539, '2019-08-28 18:18:52', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1154, 1182, 1, 2, 0, 1, 539, '2019-08-28 18:18:53', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1163, 1191, 1, 2, 0, 1, 539, '2019-08-28 18:18:53', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1166, 1194, 1, 2, 0, 1, 539, '2019-08-28 18:18:53', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1169, 1197, 1, 2, 0, 1, 539, '2019-08-28 18:18:54', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1173, 1201, 1, 2, 0, 1, 539, '2019-08-28 18:18:54', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1179, 1207, 1, 2, 0, 1, 539, '2019-08-28 18:18:54', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1189, 1217, 1, 2, 0, 1, 539, '2019-08-28 18:18:54', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1192, 1220, 1, 2, 0, 1, 539, '2019-08-28 18:18:55', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1196, 1224, 1, 2, 0, 1, 539, '2019-08-28 18:18:55', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1199, 1227, 1, 2, 0, 1, 539, '2019-08-28 18:18:55', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1214, 1242, 1, 2, 0, 1, 539, '2019-08-28 18:18:55', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1217, 1245, 1, 2, 0, 1, 539, '2019-08-28 18:18:56', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1231, 1259, 1, 2, 0, 1, 539, '2019-08-28 18:18:56', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1245, 1273, 1, 2, 0, 1, 539, '2019-08-28 18:22:15', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1252, 1280, 1, 2, 0, 1, 539, '2019-08-28 18:22:15', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1266, 1294, 1, 2, 0, 1, 539, '2019-08-28 18:22:16', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1269, 1297, 1, 2, 0, 1, 539, '2019-08-28 18:22:16', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1272, 1300, 1, 2, 0, 1, 539, '2019-08-28 18:22:16', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1285, 1313, 1, 2, 0, 1, 539, '2019-08-28 18:22:17', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1288, 1316, 1, 2, 0, 1, 539, '2019-08-28 18:22:17', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1291, 1319, 1, 2, 0, 1, 539, '2019-08-28 18:22:17', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1299, 1327, 1, 2, 0, 1, 539, '2019-08-28 18:22:18', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1309, 1337, 1, 2, 0, 1, 539, '2019-08-28 18:22:18', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1316, 1344, 1, 2, 0, 1, 539, '2019-08-28 18:22:18', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1325, 1353, 1, 2, 0, 1, 539, '2019-08-28 18:22:19', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1328, 1356, 1, 2, 0, 1, 539, '2019-08-28 18:22:19', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1334, 1362, 1, 2, 0, 1, 539, '2019-08-28 18:22:19', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1758, 1786, 1, 2, 0, 1, 539, '2019-08-28 18:30:13', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1766, 1794, 1, 2, 0, 1, 539, '2019-08-28 18:30:14', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1774, 1802, 1, 2, 0, 1, 539, '2019-08-28 18:30:14', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1782, 1810, 1, 2, 0, 1, 539, '2019-08-28 18:30:14', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1790, 1818, 1, 2, 0, 1, 539, '2019-08-28 18:30:15', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1798, 1826, 1, 2, 0, 1, 539, '2019-08-28 18:30:15', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1806, 1834, 1, 2, 0, 1, 539, '2019-08-28 18:30:16', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1814, 1842, 1, 2, 0, 1, 539, '2019-08-28 18:30:16', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1822, 1850, 1, 2, 0, 1, 539, '2019-08-28 18:30:17', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1830, 1858, 1, 2, 0, 1, 539, '2019-08-28 18:30:17', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1844, 1872, 1, 2, 0, 1, 539, '2019-08-28 18:30:55', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1852, 1880, 1, 2, 0, 1, 539, '2019-08-28 18:30:55', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1860, 1888, 1, 2, 0, 1, 539, '2019-08-28 18:30:55', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1868, 1896, 1, 2, 0, 1, 539, '2019-08-28 18:30:56', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1876, 1904, 1, 2, 0, 1, 539, '2019-08-28 18:30:56', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1884, 1912, 1, 2, 0, 1, 539, '2019-08-28 18:30:57', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1892, 1920, 1, 2, 0, 1, 539, '2019-08-28 18:30:57', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1900, 1928, 1, 2, 0, 1, 539, '2019-08-28 18:30:57', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1908, 1936, 1, 2, 0, 1, 539, '2019-08-28 18:30:58', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1916, 1944, 1, 2, 0, 1, 539, '2019-08-28 18:30:58', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1924, 1952, 1, 2, 0, 1, 539, '2019-08-28 18:30:59', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (597, 625, 1, 2, 0, 1, 539, '2019-08-28 17:25:36', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (601, 629, 1, 2, 0, 1, 539, '2019-08-28 17:25:37', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (608, 636, 1, 2, 0, 1, 539, '2019-08-28 17:25:37', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (615, 643, 1, 2, 0, 1, 539, '2019-08-28 17:25:37', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (624, 652, 1, 2, 0, 1, 539, '2019-08-28 17:25:38', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (834, 862, 1, 2, 0, 1, 539, '2019-08-28 17:36:38', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (846, 874, 1, 2, 0, 1, 539, '2019-08-28 17:36:38', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (853, 881, 1, 2, 0, 1, 539, '2019-08-28 17:36:38', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (856, 884, 1, 2, 0, 1, 539, '2019-08-28 17:36:39', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (860, 888, 1, 2, 0, 1, 539, '2019-08-28 17:36:39', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (868, 896, 1, 2, 0, 1, 539, '2019-08-28 17:36:39', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (878, 906, 1, 2, 0, 1, 539, '2019-08-28 17:36:40', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (887, 915, 1, 2, 0, 1, 539, '2019-08-28 17:36:40', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (894, 922, 1, 2, 0, 1, 539, '2019-08-28 17:36:41', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (897, 925, 1, 2, 0, 1, 539, '2019-08-28 17:36:41', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (903, 931, 1, 2, 0, 1, 539, '2019-08-28 17:36:41', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (910, 938, 1, 2, 0, 1, 539, '2019-08-28 17:36:41', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (923, 951, 1, 2, 0, 1, 539, '2019-08-28 17:36:42', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (926, 954, 1, 2, 0, 1, 539, '2019-08-28 17:36:43', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1150, 1178, 1, 2, 0, 1, 539, '2019-08-28 18:18:52', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1153, 1181, 1, 2, 0, 1, 539, '2019-08-28 18:18:53', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1168, 1196, 1, 2, 0, 1, 539, '2019-08-28 18:18:53', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1178, 1206, 1, 2, 0, 1, 539, '2019-08-28 18:18:54', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1193, 1221, 1, 2, 0, 1, 539, '2019-08-28 18:18:54', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1205, 1233, 1, 2, 0, 1, 539, '2019-08-28 18:18:55', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1208, 1236, 1, 2, 0, 1, 539, '2019-08-28 18:18:56', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1211, 1239, 1, 2, 0, 1, 539, '2019-08-28 18:18:56', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1230, 1258, 1, 2, 0, 1, 539, '2019-08-28 18:18:56', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1239, 1267, 1, 2, 0, 1, 539, '2019-08-28 18:22:15', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1249, 1277, 1, 2, 0, 1, 539, '2019-08-28 18:22:15', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1253, 1281, 1, 2, 0, 1, 539, '2019-08-28 18:22:15', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1263, 1291, 1, 2, 0, 1, 539, '2019-08-28 18:22:16', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1277, 1305, 1, 2, 0, 1, 539, '2019-08-28 18:22:16', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1281, 1309, 1, 2, 0, 1, 539, '2019-08-28 18:22:17', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1296, 1324, 1, 2, 0, 1, 539, '2019-08-28 18:22:17', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1302, 1330, 1, 2, 0, 1, 539, '2019-08-28 18:22:18', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1306, 1334, 1, 2, 0, 1, 539, '2019-08-28 18:22:18', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1310, 1338, 1, 2, 0, 1, 539, '2019-08-28 18:22:18', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1314, 1342, 1, 2, 0, 1, 539, '2019-08-28 18:22:19', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1317, 1345, 1, 2, 0, 1, 539, '2019-08-28 18:22:19', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1336, 1364, 1, 2, 0, 1, 539, '2019-08-28 18:22:19', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1773, 1801, 1, 2, 0, 1, 539, '2019-08-28 18:30:14', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1781, 1809, 1, 2, 0, 1, 539, '2019-08-28 18:30:14', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1789, 1817, 1, 2, 0, 1, 539, '2019-08-28 18:30:15', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1797, 1825, 1, 2, 0, 1, 539, '2019-08-28 18:30:15', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1805, 1833, 1, 2, 0, 1, 539, '2019-08-28 18:30:16', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1813, 1841, 1, 2, 0, 1, 539, '2019-08-28 18:30:16', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1821, 1849, 1, 2, 0, 1, 539, '2019-08-28 18:30:17', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1829, 1857, 1, 2, 0, 1, 539, '2019-08-28 18:30:17', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1931, 1959, 1, 2, 0, 1, 539, '2019-08-28 18:30:59', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1952, 1985, 1, 1, 0, 60000, 8349, '2020-02-02 19:02:00', 0, NULL, 6011806, NULL, 0, 10, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_deal" VALUES (1953, 1986, 1, 1, 0, 80000, 8349, '2020-02-02 19:03:34', 0, NULL, 8015806, NULL, 0, 11, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_deal" VALUES (1954, 1987, 1, 1, 0, 100000, 8349, '2020-02-02 19:05:23', 0, NULL, 10019808, NULL, 0, 12, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_deal" VALUES (1972, 2002, 1, 1, 0, 100, 8240, '2020-02-21 23:02:28', 0, NULL, 9888, NULL, 0, 15, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_deal" VALUES (598, 626, 1, 2, 0, 1, 539, '2019-08-28 17:25:36', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (605, 633, 1, 2, 0, 1, 539, '2019-08-28 17:25:37', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (611, 639, 1, 2, 0, 1, 539, '2019-08-28 17:25:37', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (626, 654, 1, 2, 0, 1, 539, '2019-08-28 17:25:37', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (835, 863, 1, 2, 0, 1, 539, '2019-08-28 17:36:38', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (847, 875, 1, 2, 0, 1, 539, '2019-08-28 17:36:38', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (854, 882, 1, 2, 0, 1, 539, '2019-08-28 17:36:38', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (861, 889, 1, 2, 0, 1, 539, '2019-08-28 17:36:39', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (867, 895, 1, 2, 0, 1, 539, '2019-08-28 17:36:39', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (870, 898, 1, 2, 0, 1, 539, '2019-08-28 17:36:39', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (877, 905, 1, 2, 0, 1, 539, '2019-08-28 17:36:40', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (885, 913, 1, 2, 0, 1, 539, '2019-08-28 17:36:40', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (892, 920, 1, 2, 0, 1, 539, '2019-08-28 17:36:41', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (896, 924, 1, 2, 0, 1, 539, '2019-08-28 17:36:41', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (899, 927, 1, 2, 0, 1, 539, '2019-08-28 17:36:41', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (905, 933, 1, 2, 0, 1, 539, '2019-08-28 17:36:41', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (919, 947, 1, 2, 0, 1, 539, '2019-08-28 17:36:42', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (922, 950, 1, 2, 0, 1, 539, '2019-08-28 17:36:42', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (925, 953, 1, 2, 0, 1, 539, '2019-08-28 17:36:43', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1337, 1365, 1, 2, 0, 1, 539, '2019-08-28 18:23:25', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1343, 1371, 1, 2, 0, 1, 539, '2019-08-28 18:23:25', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1349, 1377, 1, 2, 0, 1, 539, '2019-08-28 18:23:25', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1359, 1387, 1, 2, 0, 1, 539, '2019-08-28 18:23:26', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1364, 1392, 1, 2, 0, 1, 539, '2019-08-28 18:23:26', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1373, 1401, 1, 2, 0, 1, 539, '2019-08-28 18:23:26', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1379, 1407, 1, 2, 0, 1, 539, '2019-08-28 18:23:27', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1382, 1410, 1, 2, 0, 1, 539, '2019-08-28 18:23:27', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1385, 1413, 1, 2, 0, 1, 539, '2019-08-28 18:23:27', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1392, 1420, 1, 2, 0, 1, 539, '2019-08-28 18:23:28', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1400, 1428, 1, 2, 0, 1, 539, '2019-08-28 18:23:28', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1405, 1433, 1, 2, 0, 1, 539, '2019-08-28 18:23:28', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1409, 1437, 1, 2, 0, 1, 539, '2019-08-28 18:23:29', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1422, 1450, 1, 2, 0, 1, 539, '2019-08-28 18:23:29', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1428, 1456, 1, 2, 0, 1, 539, '2019-08-28 18:23:29', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1432, 1460, 1, 2, 0, 1, 539, '2019-08-28 18:23:30', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1446, 1474, 1, 2, 0, 1, 539, '2019-08-28 18:24:52', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1456, 1484, 1, 2, 0, 1, 539, '2019-08-28 18:24:52', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1475, 1503, 1, 2, 0, 1, 539, '2019-08-28 18:24:53', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1478, 1506, 1, 2, 0, 1, 539, '2019-08-28 18:24:54', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1488, 1516, 1, 2, 0, 1, 539, '2019-08-28 18:24:54', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1504, 1532, 1, 2, 0, 1, 539, '2019-08-28 18:24:55', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1507, 1535, 1, 2, 0, 1, 539, '2019-08-28 18:24:55', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1510, 1538, 1, 2, 0, 1, 539, '2019-08-28 18:24:56', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1531, 1559, 1, 2, 0, 1, 539, '2019-08-28 18:24:56', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1778, 1806, 1, 2, 0, 1, 539, '2019-08-28 18:30:14', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1786, 1814, 1, 2, 0, 1, 539, '2019-08-28 18:30:15', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1794, 1822, 1, 2, 0, 1, 539, '2019-08-28 18:30:15', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1802, 1830, 1, 2, 0, 1, 539, '2019-08-28 18:30:15', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1810, 1838, 1, 2, 0, 1, 539, '2019-08-28 18:30:16', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1818, 1846, 1, 2, 0, 1, 539, '2019-08-28 18:30:16', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1826, 1854, 1, 2, 0, 1, 539, '2019-08-28 18:30:17', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1834, 1862, 1, 2, 0, 1, 539, '2019-08-28 18:30:17', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1932, 1960, 1, 2, 0, 1, 539, '2019-08-28 18:30:59', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1955, 1988, 1, 1, 0, 100000, 8349, '2020-02-02 19:09:41', 0, NULL, 10019808, NULL, 0, 13, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_deal" VALUES (1956, 1989, 1, 1, 0, 147746, 8350, '2020-02-02 19:10:16', 0, NULL, 14805239, NULL, 0, 13, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_deal" VALUES (1957, 1990, 1, 1, 0, 147746, 8350, '2020-02-02 19:13:21', 0, NULL, 14805239, NULL, 0, 14, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_deal" VALUES (599, 627, 1, 2, 0, 1, 539, '2019-08-28 17:25:36', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (612, 640, 1, 2, 0, 1, 539, '2019-08-28 17:25:37', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (619, 647, 1, 2, 0, 1, 539, '2019-08-28 17:25:37', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (627, 655, 1, 2, 0, 1, 539, '2019-08-28 17:25:38', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (837, 865, 1, 2, 0, 1, 539, '2019-08-28 17:36:38', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (843, 871, 1, 2, 0, 1, 539, '2019-08-28 17:36:38', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (849, 877, 1, 2, 0, 1, 539, '2019-08-28 17:36:38', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (862, 890, 1, 2, 0, 1, 539, '2019-08-28 17:36:38', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (869, 897, 1, 2, 0, 1, 539, '2019-08-28 17:36:39', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (876, 904, 1, 2, 0, 1, 539, '2019-08-28 17:36:40', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (891, 919, 1, 2, 0, 1, 539, '2019-08-28 17:36:40', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (895, 923, 1, 2, 0, 1, 539, '2019-08-28 17:36:41', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (898, 926, 1, 2, 0, 1, 539, '2019-08-28 17:36:41', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (908, 936, 1, 2, 0, 1, 539, '2019-08-28 17:36:41', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (929, 957, 1, 2, 0, 1, 539, '2019-08-28 17:36:42', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1338, 1366, 1, 2, 0, 1, 539, '2019-08-28 18:23:25', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1344, 1372, 1, 2, 0, 1, 539, '2019-08-28 18:23:25', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1347, 1375, 1, 2, 0, 1, 539, '2019-08-28 18:23:25', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1350, 1378, 1, 2, 0, 1, 539, '2019-08-28 18:23:25', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1362, 1390, 1, 2, 0, 1, 539, '2019-08-28 18:23:26', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1366, 1394, 1, 2, 0, 1, 539, '2019-08-28 18:23:26', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1369, 1397, 1, 2, 0, 1, 539, '2019-08-28 18:23:26', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1372, 1400, 1, 2, 0, 1, 539, '2019-08-28 18:23:27', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1376, 1404, 1, 2, 0, 1, 539, '2019-08-28 18:23:27', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1390, 1418, 1, 2, 0, 1, 539, '2019-08-28 18:23:27', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1396, 1424, 1, 2, 0, 1, 539, '2019-08-28 18:23:28', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1404, 1432, 1, 2, 0, 1, 539, '2019-08-28 18:23:28', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1407, 1435, 1, 2, 0, 1, 539, '2019-08-28 18:23:29', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1411, 1439, 1, 2, 0, 1, 539, '2019-08-28 18:23:29', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1421, 1449, 1, 2, 0, 1, 539, '2019-08-28 18:23:29', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1434, 1462, 1, 2, 0, 1, 539, '2019-08-28 18:23:29', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1442, 1470, 1, 2, 0, 1, 539, '2019-08-28 18:24:52', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1449, 1477, 1, 2, 0, 1, 539, '2019-08-28 18:24:52', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1452, 1480, 1, 2, 0, 1, 539, '2019-08-28 18:24:53', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1459, 1487, 1, 2, 0, 1, 539, '2019-08-28 18:24:53', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1462, 1490, 1, 2, 0, 1, 539, '2019-08-28 18:24:53', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1465, 1493, 1, 2, 0, 1, 539, '2019-08-28 18:24:53', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1468, 1496, 1, 2, 0, 1, 539, '2019-08-28 18:24:53', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1471, 1499, 1, 2, 0, 1, 539, '2019-08-28 18:24:54', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1487, 1515, 1, 2, 0, 1, 539, '2019-08-28 18:24:54', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1490, 1518, 1, 2, 0, 1, 539, '2019-08-28 18:24:55', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1500, 1528, 1, 2, 0, 1, 539, '2019-08-28 18:24:55', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1509, 1537, 1, 2, 0, 1, 539, '2019-08-28 18:24:55', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1518, 1546, 1, 2, 0, 1, 539, '2019-08-28 18:24:56', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1521, 1549, 1, 2, 0, 1, 539, '2019-08-28 18:24:56', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1527, 1555, 1, 2, 0, 1, 539, '2019-08-28 18:24:56', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1536, 1564, 1, 2, 0, 1, 539, '2019-08-28 18:24:57', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1783, 1811, 1, 2, 0, 1, 539, '2019-08-28 18:30:14', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1791, 1819, 1, 2, 0, 1, 539, '2019-08-28 18:30:15', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1799, 1827, 1, 2, 0, 1, 539, '2019-08-28 18:30:15', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1807, 1835, 1, 2, 0, 1, 539, '2019-08-28 18:30:16', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1815, 1843, 1, 2, 0, 1, 539, '2019-08-28 18:30:16', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1823, 1851, 1, 2, 0, 1, 539, '2019-08-28 18:30:17', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1831, 1859, 1, 2, 0, 1, 539, '2019-08-28 18:30:17', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1937, 1965, 1, 2, 0, 1, 572, '2019-10-28 14:51:06', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1938, 1966, 1, 2, 0, 1, 572, '2019-10-28 15:16:22', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1939, 1967, 1, 2, 0, 1, 572, '2019-10-28 15:16:47', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1958, 1991, 1, 1, 0, 147746, 8350, '2020-02-07 14:18:05', 0, NULL, 14805239, NULL, 0, 14, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_deal" VALUES (1964, 1995, 1, 1, 0, 210000, 8240, '2020-02-17 17:23:36', 0, NULL, 20764800, NULL, 0, 15, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_deal" VALUES (1965, 1996, 1, 1, 0, 397300, 8240, '2020-02-17 17:26:07', 0, NULL, 39285024, NULL, 0, 15, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_deal" VALUES (1966, 1996, 1, 1, 0, 397300, 8240, '2020-02-17 17:26:37', 0, NULL, 39285024, NULL, 0, 15, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_deal" VALUES (1967, 1996, 1, 1, 0, 5400, 8240, '2020-02-17 17:27:07', 0, NULL, 533952, NULL, 0, 15, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_deal" VALUES (603, 631, 1, 2, 0, 1, 539, '2019-08-28 17:25:36', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (607, 635, 1, 2, 0, 1, 539, '2019-08-28 17:25:37', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (613, 641, 1, 2, 0, 1, 539, '2019-08-28 17:25:37', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (622, 650, 1, 2, 0, 1, 539, '2019-08-28 17:25:37', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (630, 658, 1, 2, 0, 1, 539, '2019-08-28 17:25:38', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (838, 866, 1, 2, 0, 1, 539, '2019-08-28 17:36:38', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (850, 878, 1, 2, 0, 1, 539, '2019-08-28 17:36:38', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (866, 894, 1, 2, 0, 1, 539, '2019-08-28 17:36:39', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (881, 909, 1, 2, 0, 1, 539, '2019-08-28 17:36:39', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (907, 935, 1, 2, 0, 1, 539, '2019-08-28 17:36:40', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (924, 952, 1, 2, 0, 1, 539, '2019-08-28 17:36:42', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1339, 1367, 1, 2, 0, 1, 539, '2019-08-28 18:23:25', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1351, 1379, 1, 2, 0, 1, 539, '2019-08-28 18:23:25', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1360, 1388, 1, 2, 0, 1, 539, '2019-08-28 18:23:26', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1363, 1391, 1, 2, 0, 1, 539, '2019-08-28 18:23:26', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1367, 1395, 1, 2, 0, 1, 539, '2019-08-28 18:23:26', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1374, 1402, 1, 2, 0, 1, 539, '2019-08-28 18:23:27', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1388, 1416, 1, 2, 0, 1, 539, '2019-08-28 18:23:27', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1402, 1430, 1, 2, 0, 1, 539, '2019-08-28 18:23:28', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1415, 1443, 1, 2, 0, 1, 539, '2019-08-28 18:23:28', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1418, 1446, 1, 2, 0, 1, 539, '2019-08-28 18:23:29', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1424, 1452, 1, 2, 0, 1, 539, '2019-08-28 18:23:29', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1427, 1455, 1, 2, 0, 1, 539, '2019-08-28 18:23:30', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1431, 1459, 1, 2, 0, 1, 539, '2019-08-28 18:23:30', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1440, 1468, 1, 2, 0, 1, 539, '2019-08-28 18:24:52', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1443, 1471, 1, 2, 0, 1, 539, '2019-08-28 18:24:52', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1450, 1478, 1, 2, 0, 1, 539, '2019-08-28 18:24:52', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1460, 1488, 1, 2, 0, 1, 539, '2019-08-28 18:24:53', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1463, 1491, 1, 2, 0, 1, 539, '2019-08-28 18:24:53', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1466, 1494, 1, 2, 0, 1, 539, '2019-08-28 18:24:53', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1489, 1517, 1, 2, 0, 1, 539, '2019-08-28 18:24:53', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1499, 1527, 1, 2, 0, 1, 539, '2019-08-28 18:24:55', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1502, 1530, 1, 2, 0, 1, 539, '2019-08-28 18:24:55', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1508, 1536, 1, 2, 0, 1, 539, '2019-08-28 18:24:55', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1512, 1540, 1, 2, 0, 1, 539, '2019-08-28 18:24:56', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1515, 1543, 1, 2, 0, 1, 539, '2019-08-28 18:24:56', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1520, 1548, 1, 2, 0, 1, 539, '2019-08-28 18:24:56', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1526, 1554, 1, 2, 0, 1, 539, '2019-08-28 18:24:56', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1533, 1561, 1, 2, 0, 1, 539, '2019-08-28 18:24:57', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1792, 1820, 1, 2, 0, 1, 539, '2019-08-28 18:30:15', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1800, 1828, 1, 2, 0, 1, 539, '2019-08-28 18:30:15', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1808, 1836, 1, 2, 0, 1, 539, '2019-08-28 18:30:16', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1816, 1844, 1, 2, 0, 1, 539, '2019-08-28 18:30:16', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1824, 1852, 1, 2, 0, 1, 539, '2019-08-28 18:30:17', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1832, 1860, 1, 2, 0, 1, 539, '2019-08-28 18:30:17', 0, NULL, 6, NULL, 0, 8, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1940, 1969, 1, 1, 0, 100, 8865, '2019-10-28 16:27:41', 0, NULL, 10638, NULL, 0, 7, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1941, 1970, 1, 1, 0, 100, 8865, '2019-10-28 16:33:39', 0, NULL, 10638, NULL, 0, 7, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1942, 1971, 1, 1, 0, 100, 8865, '2019-10-28 16:36:19', 0, NULL, 10638, NULL, 0, 7, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_deal" VALUES (1968, 1998, 1, 1, 0, 397300, 8240, '2020-02-18 16:23:10', 0, NULL, 39285024, NULL, 0, 15, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_deal" VALUES (2558, 2418, 1, 1, 0, 1000, 8240, '2020-02-26 13:59:39', 0, NULL, 98880, NULL, 0, 15, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_deal" VALUES (2559, 2419, 1, 1, 0, 1000, 8240, '2020-02-26 13:59:39', 0, NULL, 98880, NULL, 0, 15, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_deal" VALUES (2560, 2420, 1, 1, 0, 1000, 8240, '2020-02-26 13:59:39', 0, NULL, 98880, NULL, 0, 15, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_deal" VALUES (2561, 2421, 1, 1, 0, 1000, 8240, '2020-02-26 13:59:39', 0, NULL, 98880, NULL, 0, 15, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_deal" VALUES (2562, 2422, 1, 1, 0, 1000, 8240, '2020-02-26 13:59:39', 0, NULL, 98880, NULL, 0, 15, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_deal" VALUES (2563, 2423, 1, 1, 0, 1000, 8240, '2020-02-26 13:59:39', 0, NULL, 98880, NULL, 0, 15, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_deal" VALUES (2564, 2424, 1, 1, 0, 1000, 8240, '2020-02-26 13:59:39', 0, NULL, 98880, NULL, 0, 15, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_deal" VALUES (2565, 2425, 1, 1, 0, 1000, 8240, '2020-02-26 13:59:39', 0, NULL, 98880, NULL, 0, 15, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_deal" VALUES (2566, 2426, 1, 1, 0, 1000, 8240, '2020-02-26 13:59:39', 0, NULL, 98880, NULL, 0, 15, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_deal" VALUES (2567, 2427, 1, 1, 0, 1000, 8240, '2020-02-26 13:59:39', 0, NULL, 98880, NULL, 0, 15, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_deal" VALUES (2568, 2428, 1, 1, 0, 1000, 8240, '2020-02-26 13:59:39', 0, NULL, 98880, NULL, 0, 15, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_deal" VALUES (2569, 2429, 1, 1, 0, 1000, 8240, '2020-02-26 13:59:39', 0, NULL, 98880, NULL, 0, 15, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_deal" VALUES (2570, 2430, 1, 1, 0, 1000, 8240, '2020-02-26 13:59:39', 0, NULL, 98880, NULL, 0, 15, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_deal" VALUES (2571, 2431, 1, 1, 0, 1000, 8240, '2020-02-26 13:59:39', 0, NULL, 98880, NULL, 0, 15, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_deal" VALUES (2572, 2432, 1, 1, 0, 1000, 8240, '2020-02-26 13:59:39', 0, NULL, 98880, NULL, 0, 15, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_deal" VALUES (2573, 2433, 1, 1, 0, 1000, 8240, '2020-02-26 13:59:39', 0, NULL, 98880, NULL, 0, 15, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_deal" VALUES (2574, 2434, 1, 1, 0, 1000, 8240, '2020-02-26 13:59:39', 0, NULL, 98880, NULL, 0, 15, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_deal" VALUES (2575, 2435, 1, 1, 0, 1000, 8240, '2020-02-26 13:59:39', 0, NULL, 98880, NULL, 0, 15, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_deal" VALUES (2576, 2436, 1, 1, 0, 1000, 8240, '2020-02-26 13:59:39', 0, NULL, 98880, NULL, 0, 15, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_deal" VALUES (2577, 2437, 1, 1, 0, 1000, 8240, '2020-02-26 13:59:39', 0, NULL, 98880, NULL, 0, 15, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_deal" VALUES (2578, 2438, 1, 1, 0, 1000, 8240, '2020-02-26 13:59:40', 0, NULL, 98880, NULL, 0, 15, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_deal" VALUES (2579, 2439, 1, 1, 0, 1000, 8240, '2020-02-26 13:59:40', 0, NULL, 98880, NULL, 0, 15, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_deal" VALUES (2580, 2440, 1, 1, 0, 1000, 8240, '2020-02-26 13:59:40', 0, NULL, 98880, NULL, 0, 15, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_deal" VALUES (2581, 2441, 1, 1, 0, 1000, 8240, '2020-02-26 13:59:40', 0, NULL, 98880, NULL, 0, 15, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_deal" VALUES (2582, 2442, 1, 1, 0, 1000, 8240, '2020-02-26 13:59:40', 0, NULL, 98880, NULL, 0, 15, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_deal" VALUES (2583, 2443, 1, 1, 0, 1000, 8240, '2020-02-26 13:59:40', 0, NULL, 98880, NULL, 0, 15, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_deal" VALUES (2584, 2444, 1, 1, 0, 1000, 8240, '2020-02-26 13:59:40', 0, NULL, 98880, NULL, 0, 15, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_deal" VALUES (2585, 2445, 1, 1, 0, 1000, 8240, '2020-02-26 13:59:40', 0, NULL, 98880, NULL, 0, 15, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_deal" VALUES (2586, 2446, 1, 1, 0, 1000, 8240, '2020-02-26 13:59:40', 0, NULL, 98880, NULL, 0, 15, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_deal" VALUES (2587, 2447, 1, 1, 0, 1000, 8240, '2020-02-26 13:59:40', 0, NULL, 98880, NULL, 0, 15, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_deal" VALUES (2588, 2448, 1, 1, 0, 1000, 8240, '2020-02-26 13:59:40', 0, NULL, 98880, NULL, 0, 15, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_deal" VALUES (2589, 2449, 1, 1, 0, 1000, 8240, '2020-02-26 13:59:40', 0, NULL, 98880, NULL, 0, 15, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_deal" VALUES (2590, 2450, 1, 1, 0, 1000, 8240, '2020-02-26 13:59:40', 0, NULL, 98880, NULL, 0, 15, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_deal" VALUES (2591, 2451, 1, 1, 0, 1000, 8240, '2020-02-26 13:59:40', 0, NULL, 98880, NULL, 0, 15, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_deal" VALUES (2592, 2452, 1, 1, 0, 1000, 8240, '2020-02-26 13:59:40', 0, NULL, 98880, NULL, 0, 15, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_deal" VALUES (2593, 2453, 1, 1, 0, 1000, 8240, '2020-02-26 13:59:40', 0, NULL, 98880, NULL, 0, 15, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_deal" VALUES (2594, 2454, 1, 1, 0, 1000, 8240, '2020-02-26 13:59:40', 0, NULL, 98880, NULL, 0, 15, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_deal" VALUES (2595, 2455, 1, 1, 0, 1000, 8240, '2020-02-26 13:59:40', 0, NULL, 98880, NULL, 0, 15, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_deal" VALUES (2596, 2456, 1, 1, 0, 1000, 8240, '2020-02-26 13:59:41', 0, NULL, 98880, NULL, 0, 15, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_deal" VALUES (2597, 2457, 1, 1, 0, 1000, 8240, '2020-02-26 13:59:41', 0, NULL, 98880, NULL, 0, 15, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_deal" VALUES (2598, 2458, 1, 1, 0, 1000, 8240, '2020-02-26 13:59:41', 0, NULL, 98880, NULL, 0, 15, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_deal" VALUES (2599, 2459, 1, 1, 0, 1000, 8240, '2020-02-26 13:59:41', 0, NULL, 98880, NULL, 0, 15, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_deal" VALUES (2600, 2460, 1, 1, 0, 1000, 8240, '2020-02-26 13:59:41', 0, NULL, 98880, NULL, 0, 15, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_deal" VALUES (2601, 2461, 1, 1, 0, 1000, 8240, '2020-02-26 13:59:41', 0, NULL, 98880, NULL, 0, 15, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_deal" VALUES (2602, 2462, 1, 1, 0, 1000, 8240, '2020-02-26 13:59:41', 0, NULL, 98880, NULL, 0, 15, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_deal" VALUES (2603, 2463, 1, 1, 0, 1000, 8240, '2020-02-26 13:59:41', 0, NULL, 98880, NULL, 0, 15, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_deal" VALUES (2611, 2471, 1, 1, 0, 1000, 8240, '2020-02-26 13:59:41', 0, NULL, 98880, NULL, 0, 15, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_deal" VALUES (2619, 2479, 1, 1, 0, 1000, 8240, '2020-02-26 13:59:42', 0, NULL, 98880, NULL, 0, 15, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_deal" VALUES (2627, 2487, 1, 1, 0, 1000, 8240, '2020-02-26 13:59:42', 0, NULL, 98880, NULL, 0, 15, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_deal" VALUES (2635, 2495, 1, 1, 0, 1000, 8240, '2020-02-26 13:59:43', 0, NULL, 98880, NULL, 0, 15, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_deal" VALUES (2643, 2503, 1, 1, 0, 1000, 8240, '2020-02-26 13:59:43', 0, NULL, 98880, NULL, 0, 15, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_deal" VALUES (2651, 2511, 1, 1, 0, 1000, 8240, '2020-02-26 13:59:44', 0, NULL, 98880, NULL, 0, 15, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_deal" VALUES (2604, 2464, 1, 1, 0, 1000, 8240, '2020-02-26 13:59:41', 0, NULL, 98880, NULL, 0, 15, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_deal" VALUES (2612, 2472, 1, 1, 0, 1000, 8240, '2020-02-26 13:59:42', 0, NULL, 98880, NULL, 0, 15, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_deal" VALUES (2620, 2480, 1, 1, 0, 1000, 8240, '2020-02-26 13:59:42', 0, NULL, 98880, NULL, 0, 15, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_deal" VALUES (2628, 2488, 1, 1, 0, 1000, 8240, '2020-02-26 13:59:42', 0, NULL, 98880, NULL, 0, 15, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_deal" VALUES (2636, 2496, 1, 1, 0, 1000, 8240, '2020-02-26 13:59:43', 0, NULL, 98880, NULL, 0, 15, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_deal" VALUES (2644, 2504, 1, 1, 0, 1000, 8240, '2020-02-26 13:59:43', 0, NULL, 98880, NULL, 0, 15, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_deal" VALUES (2652, 2512, 1, 1, 0, 1000, 8240, '2020-02-26 13:59:44', 0, NULL, 98880, NULL, 0, 15, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_deal" VALUES (2605, 2465, 1, 1, 0, 1000, 8240, '2020-02-26 13:59:41', 0, NULL, 98880, NULL, 0, 15, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_deal" VALUES (2613, 2473, 1, 1, 0, 1000, 8240, '2020-02-26 13:59:42', 0, NULL, 98880, NULL, 0, 15, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_deal" VALUES (2621, 2481, 1, 1, 0, 1000, 8240, '2020-02-26 13:59:42', 0, NULL, 98880, NULL, 0, 15, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_deal" VALUES (2629, 2489, 1, 1, 0, 1000, 8240, '2020-02-26 13:59:43', 0, NULL, 98880, NULL, 0, 15, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_deal" VALUES (2637, 2497, 1, 1, 0, 1000, 8240, '2020-02-26 13:59:43', 0, NULL, 98880, NULL, 0, 15, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_deal" VALUES (2645, 2505, 1, 1, 0, 1000, 8240, '2020-02-26 13:59:43', 0, NULL, 98880, NULL, 0, 15, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_deal" VALUES (2653, 2513, 1, 1, 0, 1000, 8240, '2020-02-26 13:59:44', 0, NULL, 98880, NULL, 0, 15, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_deal" VALUES (2606, 2466, 1, 1, 0, 1000, 8240, '2020-02-26 13:59:41', 0, NULL, 98880, NULL, 0, 15, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_deal" VALUES (2614, 2474, 1, 1, 0, 1000, 8240, '2020-02-26 13:59:42', 0, NULL, 98880, NULL, 0, 15, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_deal" VALUES (2622, 2482, 1, 1, 0, 1000, 8240, '2020-02-26 13:59:42', 0, NULL, 98880, NULL, 0, 15, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_deal" VALUES (2631, 2491, 1, 1, 0, 1000, 8240, '2020-02-26 13:59:43', 0, NULL, 98880, NULL, 0, 15, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_deal" VALUES (2639, 2499, 1, 1, 0, 1000, 8240, '2020-02-26 13:59:43', 0, NULL, 98880, NULL, 0, 15, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_deal" VALUES (2647, 2507, 1, 1, 0, 1000, 8240, '2020-02-26 13:59:43', 0, NULL, 98880, NULL, 0, 15, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_deal" VALUES (2655, 2515, 1, 1, 0, 1000, 8240, '2020-02-26 13:59:44', 0, NULL, 98880, NULL, 0, 15, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_deal" VALUES (2607, 2467, 1, 1, 0, 1000, 8240, '2020-02-26 13:59:41', 0, NULL, 98880, NULL, 0, 15, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_deal" VALUES (2615, 2475, 1, 1, 0, 1000, 8240, '2020-02-26 13:59:42', 0, NULL, 98880, NULL, 0, 15, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_deal" VALUES (2623, 2483, 1, 1, 0, 1000, 8240, '2020-02-26 13:59:42', 0, NULL, 98880, NULL, 0, 15, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_deal" VALUES (2630, 2490, 1, 1, 0, 1000, 8240, '2020-02-26 13:59:43', 0, NULL, 98880, NULL, 0, 15, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_deal" VALUES (2638, 2498, 1, 1, 0, 1000, 8240, '2020-02-26 13:59:43', 0, NULL, 98880, NULL, 0, 15, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_deal" VALUES (2646, 2506, 1, 1, 0, 1000, 8240, '2020-02-26 13:59:43', 0, NULL, 98880, NULL, 0, 15, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_deal" VALUES (2654, 2514, 1, 1, 0, 1000, 8240, '2020-02-26 13:59:44', 0, NULL, 98880, NULL, 0, 15, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_deal" VALUES (2608, 2468, 1, 1, 0, 1000, 8240, '2020-02-26 13:59:41', 0, NULL, 98880, NULL, 0, 15, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_deal" VALUES (2616, 2476, 1, 1, 0, 1000, 8240, '2020-02-26 13:59:42', 0, NULL, 98880, NULL, 0, 15, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_deal" VALUES (2624, 2484, 1, 1, 0, 1000, 8240, '2020-02-26 13:59:42', 0, NULL, 98880, NULL, 0, 15, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_deal" VALUES (2632, 2492, 1, 1, 0, 1000, 8240, '2020-02-26 13:59:43', 0, NULL, 98880, NULL, 0, 15, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_deal" VALUES (2640, 2500, 1, 1, 0, 1000, 8240, '2020-02-26 13:59:43', 0, NULL, 98880, NULL, 0, 15, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_deal" VALUES (2648, 2508, 1, 1, 0, 1000, 8240, '2020-02-26 13:59:44', 0, NULL, 98880, NULL, 0, 15, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_deal" VALUES (2656, 2516, 1, 1, 0, 1000, 8240, '2020-02-26 13:59:44', 0, NULL, 98880, NULL, 0, 15, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_deal" VALUES (2609, 2469, 1, 1, 0, 1000, 8240, '2020-02-26 13:59:41', 0, NULL, 98880, NULL, 0, 15, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_deal" VALUES (2617, 2477, 1, 1, 0, 1000, 8240, '2020-02-26 13:59:42', 0, NULL, 98880, NULL, 0, 15, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_deal" VALUES (2625, 2485, 1, 1, 0, 1000, 8240, '2020-02-26 13:59:42', 0, NULL, 98880, NULL, 0, 15, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_deal" VALUES (2633, 2493, 1, 1, 0, 1000, 8240, '2020-02-26 13:59:43', 0, NULL, 98880, NULL, 0, 15, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_deal" VALUES (2641, 2501, 1, 1, 0, 1000, 8240, '2020-02-26 13:59:43', 0, NULL, 98880, NULL, 0, 15, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_deal" VALUES (2649, 2509, 1, 1, 0, 1000, 8240, '2020-02-26 13:59:44', 0, NULL, 98880, NULL, 0, 15, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_deal" VALUES (2657, 2517, 1, 1, 0, 1000, 8240, '2020-02-26 13:59:44', 0, NULL, 98880, NULL, 0, 15, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_deal" VALUES (2610, 2470, 1, 1, 0, 1000, 8240, '2020-02-26 13:59:41', 0, NULL, 98880, NULL, 0, 15, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_deal" VALUES (2618, 2478, 1, 1, 0, 1000, 8240, '2020-02-26 13:59:42', 0, NULL, 98880, NULL, 0, 15, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_deal" VALUES (2626, 2486, 1, 1, 0, 1000, 8240, '2020-02-26 13:59:42', 0, NULL, 98880, NULL, 0, 15, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_deal" VALUES (2634, 2494, 1, 1, 0, 1000, 8240, '2020-02-26 13:59:43', 0, NULL, 98880, NULL, 0, 15, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_deal" VALUES (2642, 2502, 1, 1, 0, 1000, 8240, '2020-02-26 13:59:43', 0, NULL, 98880, NULL, 0, 15, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_deal" VALUES (2650, 2510, 1, 1, 0, 1000, 8240, '2020-02-26 13:59:44', 0, NULL, 98880, NULL, 0, 15, '8600001', '601318', '中国平安');

-- ----------------------------
-- Table structure for t_trade_order
-- ----------------------------
DROP TABLE IF EXISTS "office"."t_trade_order";
CREATE TABLE "office"."t_trade_order" (
    -- "id" int4 NOT NULL DEFAULT nextval('t_trade_order_id_seq'::regclass),
                                          "id" serial4 primary key,
                                          "accountid" int8 NOT NULL,
                                          "stockid" int8 NOT NULL,
                                          "status" int2 NOT NULL,
                                          "type" int2 NOT NULL,
                                          "direction" int2 NOT NULL,
                                          "initvolume" int4 NOT NULL,
                                          "execvolume" int4,
                                          "execprice" int8,
                                          "exectime" timestamp(0),
                                          "requestprice" int8,
                                          "accountno" varchar(32) COLLATE "pg_catalog"."default",
                                          "stockcode" varchar(32) COLLATE "pg_catalog"."default",
                                          "stockname" varchar(32) COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "office"."t_trade_order"."id" IS '主键标识';
COMMENT ON COLUMN "office"."t_trade_order"."accountid" IS '交易账号ID';
COMMENT ON COLUMN "office"."t_trade_order"."stockid" IS '股票ID
';
COMMENT ON COLUMN "office"."t_trade_order"."status" IS '状态(0:待成交, 1:部分成交， 2：完全成交, 3:手工撤单， 4:系统撤单)';
COMMENT ON COLUMN "office"."t_trade_order"."type" IS '挂单类型(0:市价单， 1:限价单)';
COMMENT ON COLUMN "office"."t_trade_order"."direction" IS '买卖方向';
COMMENT ON COLUMN "office"."t_trade_order"."initvolume" IS '挂单的数量';
COMMENT ON COLUMN "office"."t_trade_order"."execvolume" IS '成交数量';
COMMENT ON COLUMN "office"."t_trade_order"."execprice" IS '成交价格';
COMMENT ON COLUMN "office"."t_trade_order"."exectime" IS '成交时间';
COMMENT ON COLUMN "office"."t_trade_order"."requestprice" IS '请求价格';
COMMENT ON TABLE "office"."t_trade_order" IS '订单表';

-- ----------------------------
-- Records of t_trade_order
-- ----------------------------
INSERT INTO "office"."t_trade_order" VALUES (660, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:16', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (672, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:17', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (689, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:18', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (693, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:18', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (714, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:19', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (722, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:19', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (729, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:20', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (733, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:20', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (736, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:20', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (739, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:20', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (749, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:21', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (755, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:21', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1178, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:53', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1181, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:53', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1196, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:54', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1206, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:54', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1221, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:55', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1233, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:56', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1236, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:56', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1239, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:56', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1258, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:57', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1267, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:22:15', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1277, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:22:15', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1281, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:22:16', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1291, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:22:16', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1305, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:22:17', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1309, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:22:17', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1324, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:22:18', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1330, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:22:18', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1334, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:22:18', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1338, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:22:19', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1342, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:22:19', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1345, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:22:19', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1364, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:22:20', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (661, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:16', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (670, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:17', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (679, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:17', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (696, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:18', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (699, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:18', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (715, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:19', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (724, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:20', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (731, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:20', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (737, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:20', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (743, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:21', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (746, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:21', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (753, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:21', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1365, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:23:25', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1371, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:23:25', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1377, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:23:26', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1387, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:23:26', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1392, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:23:26', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1401, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:23:27', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1407, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:23:27', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1410, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:23:27', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1413, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:23:28', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1420, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:23:28', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1428, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:23:28', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1433, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:23:29', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1437, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:23:29', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1450, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:23:29', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1456, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:23:30', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1460, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:23:30', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1474, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:24:52', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1484, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:24:53', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1503, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:24:54', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1506, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:24:54', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1516, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:24:55', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1532, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:24:55', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1535, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:24:56', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1538, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:24:56', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1559, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:24:57', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1967, 1, 2, 2, 0, 0, 1, 1, 572, '2019-10-28 15:16:47', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1966, 1, 2, 3, 0, 0, 1, 1, 572, '2019-10-28 15:16:22', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1965, 1, 2, 4, 0, 0, 1, 1, 572, '2019-10-28 14:51:06', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1978, 0, 1, 0, 1, 0, 100, 100, 655, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (662, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:16', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (665, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:16', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (671, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:17', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (674, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:17', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (680, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:17', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (692, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:18', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (706, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:19', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (713, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:19', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (721, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:19', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (725, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:20', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (750, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:21', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (758, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:21', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1366, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:23:25', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1372, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:23:25', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1375, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:23:25', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1378, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:23:26', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1390, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:23:26', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1394, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:23:26', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1397, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:23:27', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1400, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:23:27', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1404, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:23:27', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1418, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:23:28', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1424, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:23:28', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1432, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:23:29', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1435, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:23:29', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1439, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:23:29', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1449, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:23:29', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1462, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:23:30', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1470, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:24:52', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1477, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:24:53', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1480, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:24:53', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1487, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:24:53', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1490, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:24:53', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1493, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:24:53', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1496, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:24:54', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1499, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:24:54', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1515, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:24:55', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1518, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:24:55', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1528, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:24:55', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1537, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:24:56', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1546, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:24:56', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1549, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:24:56', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1555, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:24:57', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1564, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:24:57', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1968, 1, 1, 0, 1, 0, 100, 0, 0, '2019-10-28 16:18:19', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1979, 0, 1, 0, 1, 0, 100, 100, 655, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1995, 1, 1, 2, 1, 0, 210000, 210000, 8240, '2020-02-17 17:23:36', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (1996, 1, 1, 2, 1, 0, 800000, 800000, 8240, '2020-02-17 17:27:07', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (663, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:16', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (666, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:16', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (669, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:17', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (676, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:17', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (682, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:17', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (688, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:18', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (695, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:18', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (698, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:18', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (707, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:19', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (719, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:19', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (728, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:20', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (732, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:20', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (735, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:20', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (759, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:21', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1367, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:23:25', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1379, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:23:26', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1388, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:23:26', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1391, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:23:26', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1395, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:23:27', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1402, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:23:27', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1416, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:23:28', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1430, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:23:28', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1443, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:23:29', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1446, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:23:29', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1452, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:23:30', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1455, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:23:30', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1459, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:23:30', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1468, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:24:52', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1471, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:24:52', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1478, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:24:53', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1488, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:24:53', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1491, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:24:53', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1494, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:24:53', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1517, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:24:55', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1527, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:24:55', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1530, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:24:55', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1536, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:24:56', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1540, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:24:56', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1543, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:24:56', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1548, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:24:56', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1554, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:24:57', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1561, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:24:57', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1969, 1, 1, 2, 0, 0, 100, 100, 8865, '2019-10-28 16:27:41', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1970, 1, 1, 2, 0, 0, 100, 100, 8865, '2019-10-28 16:33:39', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1971, 1, 1, 2, 0, 0, 100, 100, 8865, '2019-10-28 16:36:19', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1980, 0, 1, 0, 1, 0, 100, 100, 655, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1997, 1, 1, 3, 1, 0, 800000, 0, 0, '2020-02-18 16:12:44', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (1998, 1, 1, 3, 1, 0, 800000, 397300, 8240, '2020-02-18 16:23:10', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (664, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:16', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (667, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:16', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (673, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:17', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (694, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:18', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (702, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:18', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (712, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:19', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (718, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:19', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (723, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:20', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (730, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:20', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (745, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:21', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (757, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:21', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1368, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:23:25', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1374, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:23:25', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1383, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:23:26', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1389, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:23:26', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1399, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:23:27', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1403, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:23:27', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1406, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:23:27', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1411, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:23:27', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1414, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:23:28', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1423, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:23:28', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1426, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:23:28', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1453, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:23:30', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1464, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:23:30', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1466, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:24:52', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1479, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:24:53', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1482, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:24:53', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1521, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:24:55', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1524, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:24:55', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1526, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:24:55', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1529, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:24:55', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1542, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:24:56', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1545, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:24:56', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1550, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:24:56', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1553, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:24:57', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1557, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:24:57', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1972, 1, 1, 2, 0, 0, 100, 100, 8865, '2019-10-30 17:04:32', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1973, 1, 1, 2, 0, 0, 100, 100, 8865, '2019-10-30 17:14:33', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1974, 1, 1, 2, 0, 0, 100, 100, 8796, '2019-10-30 17:32:41', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1982, 1, 1, 2, 0, 0, 20000, 20000, 8349, '2020-02-02 18:52:58', 655, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (1983, 1, 1, 2, 0, 0, 20000, 20000, 8349, '2020-02-02 18:58:08', 655, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (1984, 1, 1, 2, 0, 0, 10000, 10000, 8349, '2020-02-02 18:59:07', 655, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (1985, 1, 1, 2, 0, 0, 60000, 60000, 8349, '2020-02-02 19:02:00', 655, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (1986, 1, 1, 2, 0, 0, 80000, 80000, 8349, '2020-02-02 19:03:34', 655, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (1987, 1, 1, 2, 0, 0, 100000, 100000, 8349, '2020-02-02 19:05:23', 655, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (1999, 1, 1, 2, 0, 0, 100000, 100000, 8240, '2020-02-21 11:29:33', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2000, 1, 1, 2, 0, 1, 100000, 100000, 8239, '2020-02-21 11:45:23', 8239, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (668, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:16', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (683, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:17', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (686, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:17', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (701, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:18', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (704, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:18', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (708, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:19', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (711, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:19', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (720, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:19', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (727, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:20', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (734, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:20', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (740, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:20', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (744, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:21', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (751, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:21', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (754, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:21', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1369, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:23:25', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1381, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:23:26', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1384, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:23:26', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1393, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:23:26', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1396, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:23:27', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1408, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:23:27', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1417, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:23:28', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1421, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:23:28', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1429, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:23:28', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1441, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:23:29', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1451, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:23:29', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1458, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:23:30', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1467, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:24:52', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1473, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:24:52', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1483, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:24:53', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1502, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:24:54', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1505, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:24:54', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1512, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:24:54', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1519, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:24:55', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1522, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:24:55', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1541, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:24:56', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1544, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:24:56', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1547, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:24:56', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1563, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:24:57', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1975, 1, 1, 2, 0, 0, 100, 100, 8365, '2019-12-13 16:57:50', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1976, 1, 1, 2, 0, 0, 100, 100, 8365, '2019-12-13 17:17:28', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1988, 1, 1, 2, 0, 0, 100000, 100000, 8349, '2020-02-02 19:09:41', 655, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (1989, 1, 1, 1, 0, 0, 150000, 147746, 8350, '2020-02-02 19:10:16', 655, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (1990, 1, 1, 1, 0, 0, 150000, 147746, 8350, '2020-02-02 19:13:21', 655, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2001, 1, 1, 2, 0, 0, 100000, 100000, 8240, '2020-02-21 22:22:02', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (675, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:17', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (678, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:17', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (681, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:17', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (684, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:17', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (687, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:18', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (690, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:18', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (697, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:18', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (705, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:19', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (709, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:19', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (716, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:19', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (738, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:20', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (741, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:20', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (747, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:21', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (756, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:21', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1370, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:23:25', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1373, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:23:25', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1376, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:23:25', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1386, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:23:26', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1398, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:23:27', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1405, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:23:27', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1419, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:23:28', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1425, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:23:28', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1436, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:23:29', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1440, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:23:29', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1444, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:23:29', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1447, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:23:29', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1457, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:23:30', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1475, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:24:52', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1481, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:24:53', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1485, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:24:53', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1500, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:24:54', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1509, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:24:54', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1513, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:24:55', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1525, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:24:55', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1533, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:24:56', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1539, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:24:56', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1552, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:24:57', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1556, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:24:57', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1560, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:24:57', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1977, 1, 1, 2, 0, 0, 100, 100, 8365, '2019-12-13 17:23:13', 555, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (1991, 1, 1, 1, 0, 0, 150000, 147746, 8350, '2020-02-07 14:18:05', 655, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2002, 1, 1, 2, 1, 0, 100, 100, 8240, '2020-02-21 23:02:28', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (677, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:17', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (685, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:17', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (691, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:18', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (700, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:18', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (703, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:18', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (710, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:19', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (717, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:19', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (726, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:20', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (742, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:21', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (748, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:21', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (752, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:21', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1380, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:23:26', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1409, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:23:27', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1412, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:23:27', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1415, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:23:28', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1422, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:23:28', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1427, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:23:28', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1442, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:23:29', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1448, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:23:29', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1454, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:23:30', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1461, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:23:30', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1465, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:24:52', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1469, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:24:52', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1472, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:24:52', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1476, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:24:53', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1486, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:24:53', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1489, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:24:53', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1492, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:24:53', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1495, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:24:54', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1498, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:24:54', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1508, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:24:54', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1511, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:24:54', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1531, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:24:55', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1534, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:24:56', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1551, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:24:57', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1558, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:24:57', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (760, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:52', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (785, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:53', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (798, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:54', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (801, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:54', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (807, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:55', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (810, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:55', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (820, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:55', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (828, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:56', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (853, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:57', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1382, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:23:26', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1385, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:23:26', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1431, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:23:28', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1434, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:23:29', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1438, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:23:29', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1445, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:23:29', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1463, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:23:30', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1497, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:24:54', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1501, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:24:54', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1504, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:24:54', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1507, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:24:54', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1510, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:24:54', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1514, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:24:55', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1520, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:24:55', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1523, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:24:55', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1562, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:24:57', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (2006, 1, 1, 0, 1, 0, 10000, 0, 0, '2020-02-23 16:33:38', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (761, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:52', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (787, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:53', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (797, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:54', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (800, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:54', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (803, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:54', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (806, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:54', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (809, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:55', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (813, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:55', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (830, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:56', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (833, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:56', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (836, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:56', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (843, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:57', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (846, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:57', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (850, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:57', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (858, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:57', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1565, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:28:42', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1573, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:28:42', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1581, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:28:43', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1589, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:28:43', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1597, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:28:43', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1605, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:28:44', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1613, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:28:44', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1621, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:28:45', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1629, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:28:45', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1637, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:28:46', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1645, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:28:46', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1653, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:28:46', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1661, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:28:47', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1668, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:29:50', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1676, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:29:51', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1684, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:29:51', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1692, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:29:52', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1700, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:29:52', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1708, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:29:53', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1716, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:29:53', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1724, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:29:53', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1732, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:29:54', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1740, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:29:54', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1748, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:29:55', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1756, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:29:55', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1764, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:29:56', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1765, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:12', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1773, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:13', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1781, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:13', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1789, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:14', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1797, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:14', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1805, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:15', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1813, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:15', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1821, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:15', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1829, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:16', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1837, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:16', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1845, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:17', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1853, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:17', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1861, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:18', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (2007, 1, 1, 0, 1, 0, 10000, 0, 0, '2020-02-23 16:43:41', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (762, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:52', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (773, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:53', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (776, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:53', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (779, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:53', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (782, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:53', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (789, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:53', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (795, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:54', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (804, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:54', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (817, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:55', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (823, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:55', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (840, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:56', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (844, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:57', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (847, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:57', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (851, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:57', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (854, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:57', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1566, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:28:42', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1574, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:28:42', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1582, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:28:43', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1590, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:28:43', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1598, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:28:44', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1606, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:28:44', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1614, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:28:44', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1622, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:28:45', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1630, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:28:45', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1638, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:28:46', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1646, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:28:46', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1654, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:28:46', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1662, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:28:47', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1667, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:29:50', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1675, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:29:51', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1683, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:29:51', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1691, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:29:52', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1699, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:29:52', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1707, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:29:53', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1715, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:29:53', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1723, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:29:53', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1731, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:29:54', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1739, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:29:54', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1747, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:29:55', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1755, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:29:55', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1763, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:29:56', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1767, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:13', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1775, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:13', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1783, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:13', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1791, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:14', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1799, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:14', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1807, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:15', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1815, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:15', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1823, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:16', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1831, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:16', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1839, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:16', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1847, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:17', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1855, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:17', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1863, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:18', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (2008, 1, 1, 0, 1, 0, 10000, 0, 0, '2020-02-23 16:51:12', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2009, 1, 1, 0, 1, 0, 10000, 0, 0, '2020-02-23 16:51:15', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (763, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:52', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (766, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:52', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (774, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:53', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (777, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:53', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (780, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:53', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (783, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:53', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (793, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:54', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (796, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:54', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (814, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:55', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (826, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:56', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (829, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:56', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (832, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:56', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (857, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:57', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1567, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:28:42', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1575, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:28:42', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1583, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:28:43', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1591, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:28:43', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1599, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:28:44', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1607, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:28:44', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1615, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:28:44', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1623, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:28:45', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1631, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:28:45', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1639, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:28:46', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1647, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:28:46', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1655, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:28:46', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1663, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:28:47', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1666, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:29:50', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1674, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:29:51', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1682, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:29:51', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1690, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:29:52', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1698, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:29:52', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1706, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:29:52', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1714, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:29:53', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1722, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:29:53', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1730, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:29:54', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1738, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:29:54', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1746, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:29:55', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1754, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:29:55', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1762, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:29:56', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1766, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:12', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1774, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:13', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1782, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:13', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1790, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:14', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1798, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:14', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1806, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:15', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1814, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:15', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1822, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:15', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1830, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:16', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1838, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:16', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1846, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:17', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1854, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:17', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1862, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:18', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (2010, 1, 1, 0, 1, 0, 10000, 0, 0, '2020-02-23 16:53:13', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2011, 1, 1, 0, 1, 0, 10000, 0, 0, '2020-02-23 16:53:23', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2012, 1, 1, 0, 1, 0, 10000, 0, 0, '2020-02-23 16:54:37', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (764, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:52', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (767, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:52', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (778, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:53', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (784, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:53', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (790, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:54', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (805, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:54', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (811, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:55', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (818, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:55', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (835, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:56', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (838, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:56', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (856, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:57', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1568, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:28:42', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1576, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:28:42', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1584, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:28:43', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1592, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:28:43', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1600, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:28:44', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1608, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:28:44', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1616, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:28:44', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1624, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:28:45', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1632, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:28:45', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1640, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:28:46', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1648, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:28:46', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1656, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:28:47', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1664, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:28:47', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1665, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:29:50', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1673, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:29:51', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1681, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:29:51', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1689, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:29:51', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1697, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:29:52', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1705, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:29:52', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1713, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:29:53', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1721, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:29:53', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1729, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:29:54', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1737, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:29:54', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1745, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:29:55', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1753, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:29:55', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1761, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:29:55', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1768, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:13', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1776, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:13', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1784, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:13', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1792, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:14', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1800, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:14', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1808, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:15', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1816, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:15', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1824, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:16', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1832, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:16', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1840, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:16', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1848, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:17', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1856, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:17', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1864, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:18', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (2013, 1, 1, 0, 1, 0, 10000, 0, 0, '2020-02-23 18:50:26', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2014, 1, 1, 0, 1, 0, 10000, 0, 0, '2020-02-23 18:51:55', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2015, 1, 1, 0, 1, 0, 10000, 0, 0, '2020-02-23 18:56:02', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (765, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:52', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (768, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:52', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (771, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:52', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (786, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:53', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (792, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:54', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (799, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:54', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (802, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:54', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (808, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:55', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (815, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:55', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (821, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:55', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (824, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:55', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (859, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:57', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1569, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:28:42', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1577, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:28:42', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1585, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:28:43', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1593, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:28:43', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1601, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:28:44', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1609, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:28:44', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1617, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:28:45', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1625, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:28:45', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1633, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:28:45', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1641, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:28:46', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1649, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:28:46', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1657, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:28:47', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1671, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:29:51', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1679, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:29:51', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1687, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:29:51', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1695, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:29:52', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1703, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:29:52', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1711, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:29:53', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1719, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:29:53', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1727, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:29:54', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1735, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:29:54', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1743, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:29:54', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1751, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:29:55', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1759, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:29:55', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1770, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:13', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1778, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:13', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1786, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:14', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1794, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:14', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1802, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:14', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1810, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:15', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1818, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:15', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1826, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:16', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1834, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:16', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1842, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:17', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1850, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:17', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1858, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:17', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (769, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:52', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (772, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:53', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (775, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:53', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (781, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:53', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (791, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:54', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (812, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:55', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (827, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:56', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (839, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:56', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (842, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:57', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (849, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:57', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (855, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:57', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1570, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:28:42', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1578, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:28:42', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1586, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:28:43', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1594, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:28:43', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1602, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:28:44', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1610, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:28:44', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1618, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:28:45', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1626, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:28:45', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1634, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:28:45', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1642, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:28:46', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1650, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:28:46', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1658, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:28:47', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1672, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:29:51', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1680, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:29:51', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1688, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:29:51', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1696, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:29:52', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1704, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:29:52', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1712, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:29:53', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1720, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:29:53', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1728, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:29:54', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1736, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:29:54', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1744, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:29:55', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1752, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:29:55', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1760, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:29:55', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1771, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:13', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1779, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:13', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1787, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:14', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1795, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:14', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1803, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:14', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1811, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:15', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1819, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:15', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1827, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:16', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1835, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:16', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1843, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:17', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1851, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:17', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1859, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:17', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (2017, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:52:01', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2018, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:52:56', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2023, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:52:57', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2044, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:52:58', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2050, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:52:58', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2057, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:52:59', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2069, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:53:00', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2072, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:53:00', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2078, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:53:00', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2084, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:53:01', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2088, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:53:01', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2091, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:53:01', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2096, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:53:01', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2111, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:53:02', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2120, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:55:54', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2124, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:55:55', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2161, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:55:57', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2163, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:55:57', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2175, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:55:57', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2192, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:55:58', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2198, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:55:59', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2208, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:55:59', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2214, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:56:00', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (770, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:52', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (788, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:53', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (794, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:54', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (816, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:55', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (819, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:55', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (822, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:55', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (825, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:56', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (831, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:56', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (834, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:56', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (837, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:56', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (841, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:56', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (845, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:57', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (848, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:57', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (852, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:27:57', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1571, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:28:42', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1579, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:28:43', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1587, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:28:43', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1595, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:28:43', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1603, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:28:44', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1611, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:28:44', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1619, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:28:45', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1627, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:28:45', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1635, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:28:45', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1643, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:28:46', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1651, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:28:46', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1659, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:28:47', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1670, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:29:51', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1678, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:29:51', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1686, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:29:51', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1694, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:29:52', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1702, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:29:52', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1710, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:29:53', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1718, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:29:53', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1726, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:29:54', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1734, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:29:54', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1742, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:29:54', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1750, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:29:55', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1758, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:29:55', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1769, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:13', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1777, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:13', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1785, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:13', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1793, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:14', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1801, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:14', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1809, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:15', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1817, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:15', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1825, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:16', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1833, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:16', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1841, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:16', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1849, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:17', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1857, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:17', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (2019, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:52:56', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2029, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:52:57', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2033, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:52:57', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2041, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:52:58', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2075, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:53:00', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2083, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:53:00', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2087, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:53:01', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2092, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:53:01', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2108, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:53:02', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2115, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:53:02', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2118, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:55:54', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2122, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:55:54', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2144, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:55:56', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2155, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:55:56', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2166, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:55:57', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2176, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:55:57', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2179, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:55:58', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2183, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:55:58', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2187, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:55:58', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2197, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:55:59', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2201, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:55:59', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2205, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:55:59', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2216, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:56:00', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (860, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:36:38', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (869, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:36:38', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (872, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:36:38', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (885, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:36:39', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (891, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:36:39', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (901, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:36:40', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (907, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:36:40', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (912, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:36:40', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (916, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:36:41', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (929, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:36:41', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (932, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:36:42', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (939, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:36:42', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (942, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:36:42', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (945, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:36:42', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (958, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:36:43', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1572, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:28:42', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1580, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:28:43', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1588, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:28:43', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1596, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:28:43', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1604, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:28:44', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1612, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:28:44', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1620, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:28:45', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1628, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:28:45', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1636, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:28:45', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1644, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:28:46', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1652, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:28:46', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1660, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:28:47', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1669, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:29:50', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1677, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:29:51', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1685, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:29:51', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1693, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:29:52', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1701, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:29:52', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1709, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:29:53', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1717, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:29:53', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1725, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:29:54', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1733, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:29:54', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1741, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:29:54', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1749, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:29:55', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1757, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:29:55', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1772, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:13', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1780, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:13', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1788, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:14', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1796, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:14', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1804, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:14', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1812, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:15', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1820, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:15', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1828, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:16', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1836, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:16', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1844, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:17', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1852, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:17', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1860, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:18', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (2020, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:52:56', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2030, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:52:57', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2036, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:52:58', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2039, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:52:58', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2047, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:52:58', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2053, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:52:59', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2068, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:53:00', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2073, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:53:00', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2077, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:53:00', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2081, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:53:00', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2113, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:53:02', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2128, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:55:55', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2132, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:55:55', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2136, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:55:55', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2141, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:55:55', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2146, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:55:56', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2150, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:55:56', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2154, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:55:56', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2158, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:55:56', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2164, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:55:57', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2172, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:55:57', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2184, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:55:58', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2191, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:55:58', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2200, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:55:59', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2204, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:55:59', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (861, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:36:38', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (864, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:36:38', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (879, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:36:39', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (886, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:36:39', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (892, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:36:39', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (910, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:36:40', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (917, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:36:41', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (930, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:36:41', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (940, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:36:42', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (943, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:36:42', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (946, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:36:42', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (959, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:36:43', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1865, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:55', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1873, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:55', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1881, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:55', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1889, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:56', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1897, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:56', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1905, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:57', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1913, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:57', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1921, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:57', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1929, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:58', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1937, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:58', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1945, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:59', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1953, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:59', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1961, 1, 2, 0, 0, 0, 1, 1, 539, '2019-08-28 18:31:00', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (2021, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:52:56', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2024, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:52:57', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2027, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:52:57', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2048, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:52:58', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2061, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:52:59', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2095, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:53:01', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2099, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:53:01', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2104, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:53:02', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2107, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:53:02', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2116, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:53:02', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2121, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:55:54', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2125, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:55:55', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2130, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:55:55', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2134, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:55:55', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2138, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:55:55', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2151, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:55:56', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2160, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:55:57', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2165, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:55:57', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2174, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:55:57', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2193, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:55:58', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2199, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:55:59', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2206, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:55:59', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2213, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:56:00', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (862, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:36:38', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (874, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:36:38', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (881, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:36:39', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (884, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:36:39', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (888, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:36:39', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (896, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:36:40', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (906, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:36:40', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (915, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:36:41', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (922, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:36:41', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (925, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:36:41', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (931, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:36:41', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (938, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:36:42', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (951, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:36:43', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (954, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:36:43', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1866, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:55', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1874, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:55', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1882, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:55', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1890, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:56', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1898, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:56', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1906, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:57', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1914, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:57', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1922, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:58', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1930, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:58', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1938, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:58', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1946, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:59', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1954, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:59', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1962, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:31:00', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (2022, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:52:57', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2035, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:52:57', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2038, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:52:58', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2042, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:52:58', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2046, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:52:58', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2052, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:52:59', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2065, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:52:59', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2071, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:53:00', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2080, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:53:00', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2086, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:53:01', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2090, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:53:01', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2094, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:53:01', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2098, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:53:01', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2110, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:53:02', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2123, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:55:54', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2126, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:55:55', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2142, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:55:55', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2145, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:55:56', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2149, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:55:56', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2153, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:55:56', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2162, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:55:57', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2173, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:55:57', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2185, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:55:58', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2189, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:55:58', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2207, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:55:59', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2212, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:56:00', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (863, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:36:38', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (875, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:36:38', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (882, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:36:39', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (889, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:36:39', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (895, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:36:39', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (898, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:36:40', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (905, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:36:40', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (913, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:36:41', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (920, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:36:41', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (924, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:36:41', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (927, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:36:41', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (933, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:36:42', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (947, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:36:42', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (950, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:36:43', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (953, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:36:43', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1867, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:55', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1875, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:55', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1883, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:55', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1891, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:56', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1899, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:56', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1907, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:57', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1915, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:57', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1923, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:58', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1931, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:58', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1939, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:58', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1947, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:59', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1955, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:59', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1963, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:31:00', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (2025, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:52:57', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2031, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:52:57', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2034, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:52:57', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2037, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:52:58', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2040, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:52:58', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2054, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:52:59', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2058, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:52:59', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2062, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:52:59', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2067, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:52:59', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2076, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:53:00', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2102, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:53:02', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2112, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:53:02', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2129, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:55:55', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2133, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:55:55', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2137, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:55:55', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2143, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:55:56', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2159, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:55:56', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2167, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:55:57', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2170, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:55:57', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2178, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:55:58', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2182, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:55:58', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2186, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:55:58', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2190, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:55:58', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2194, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:55:58', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2211, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:56:00', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (865, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:36:38', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (871, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:36:38', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (877, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:36:38', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (890, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:36:39', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (897, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:36:40', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (904, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:36:40', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (919, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:36:41', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (923, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:36:41', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (926, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:36:41', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (936, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:36:42', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (957, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:36:43', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1868, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:55', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1876, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:55', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1884, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:55', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1892, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:56', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1900, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:56', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1908, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:57', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1916, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:57', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1924, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:58', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1932, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:58', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1940, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:58', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1948, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:59', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1956, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:59', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1964, 1, 2, 3, 0, 0, 1, 1, 539, '2019-08-28 18:31:00', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (2026, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:52:57', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2045, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:52:58', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2051, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:52:59', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2055, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:52:59', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2059, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:52:59', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2063, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:52:59', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2066, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:52:59', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2070, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:53:00', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2082, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:53:00', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2100, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:53:01', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2103, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:53:02', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2106, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:53:02', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2114, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:53:02', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2127, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:55:55', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2140, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:55:55', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2147, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:55:56', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2157, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:55:56', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2168, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:55:57', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2171, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:55:57', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2177, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:55:58', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2181, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:55:58', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2188, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:55:58', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2195, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:55:59', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2202, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:55:59', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2210, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:55:59', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (866, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:36:38', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (878, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:36:39', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (894, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:36:39', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (909, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:36:40', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (935, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:36:42', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (952, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:36:43', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1869, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:55', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1877, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:55', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1885, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:56', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1893, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:56', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1901, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:56', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1909, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:57', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1917, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:57', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1925, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:58', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1933, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:58', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1941, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:59', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1949, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:59', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1957, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:59', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (2028, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:52:57', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2032, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:52:57', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2043, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:52:58', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2049, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:52:58', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2056, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:52:59', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2060, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:52:59', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2064, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:52:59', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2074, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:53:00', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2079, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:53:00', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2085, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:53:01', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2089, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:53:01', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2093, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:53:01', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2097, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:53:01', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2101, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:53:01', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2105, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:53:02', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2109, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:53:02', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2117, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:53:02', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2119, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:55:54', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2131, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:55:55', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2135, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:55:55', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2139, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:55:55', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2148, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:55:56', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2152, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:55:56', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2156, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:55:56', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2169, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:55:57', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2180, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:55:58', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2196, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:55:59', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2203, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:55:59', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2209, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:55:59', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2215, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:56:00', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (867, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:36:38', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (870, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:36:38', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (873, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:36:38', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (876, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:36:38', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (899, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:36:40', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (902, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:36:40', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (908, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:36:40', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (911, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:36:40', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (918, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:36:41', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (928, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:36:41', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (937, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:36:42', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (948, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:36:42', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (956, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:36:43', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1870, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:55', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1878, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:55', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1886, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:56', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1894, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:56', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1902, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:56', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1910, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:57', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1918, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:57', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1926, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:58', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1934, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:58', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1942, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:59', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1950, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:59', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1958, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:59', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (2217, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:56:00', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (868, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:36:38', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (880, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:36:39', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (883, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:36:39', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (887, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:36:39', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (893, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:36:39', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (900, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:36:40', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (903, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:36:40', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (914, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:36:41', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (921, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:36:41', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (934, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:36:42', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (941, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:36:42', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (944, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:36:42', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (949, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:36:42', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (955, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:36:43', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1871, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:55', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1879, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:55', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1887, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:56', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1895, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:56', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1903, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:56', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1911, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:57', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1919, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:57', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1927, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:58', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1935, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:58', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1943, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:59', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1951, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:59', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1959, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:59', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (2218, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:56:45', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2225, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:56:45', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2229, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:56:46', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2233, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:56:46', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2240, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:56:46', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2244, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:56:46', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2250, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:56:47', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2253, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:56:47', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2257, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:56:47', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2270, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:56:48', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2278, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:56:48', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2284, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:56:49', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2290, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:56:49', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2294, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:56:49', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2304, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:56:50', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2307, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:56:50', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2315, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:56:50', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2318, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:58:41', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2326, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:58:41', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2334, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:58:41', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2342, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:58:42', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2350, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:58:42', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2358, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:58:43', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2366, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:58:43', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2374, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:58:43', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2382, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:58:44', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2390, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:58:44', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2398, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:58:45', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2406, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:58:45', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2415, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:58:46', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2421, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:59:39', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2429, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:59:39', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2437, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:59:40', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2445, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:59:40', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2453, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:59:41', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2461, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:59:41', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2469, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:59:42', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2477, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:59:42', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2485, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:59:43', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2493, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:59:43', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2501, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:59:44', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2509, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:59:44', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2517, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:59:44', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (960, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:07:48', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (961, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:09:30', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (962, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:10:19', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1872, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:55', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1880, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:55', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1888, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:56', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1896, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:56', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1904, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:57', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1912, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:57', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1920, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:57', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1928, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:58', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1936, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:58', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1944, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:59', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1952, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:30:59', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1960, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:31:00', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (2219, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:56:45', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2222, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:56:45', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2239, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:56:46', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2246, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:56:46', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2261, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:56:47', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2264, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:56:47', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2295, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:56:49', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2313, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:56:50', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2320, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:58:41', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2328, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:58:41', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2336, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:58:42', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2344, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:58:42', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2352, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:58:42', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2361, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:58:43', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2369, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:58:43', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2377, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:58:44', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2385, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:58:44', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2393, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:58:45', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2401, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:58:45', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2409, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:58:46', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2417, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:58:46', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2419, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:59:39', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2427, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:59:39', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2435, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:59:40', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2443, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:59:40', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2451, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:59:41', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2459, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:59:41', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2467, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:59:42', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2475, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:59:42', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2483, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:59:43', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2490, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:59:43', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2498, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:59:43', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2506, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:59:44', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2514, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:59:44', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (963, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:14:58', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (964, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:16:20', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (965, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:17:35', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (971, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:17:36', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (979, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:17:36', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (996, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:17:37', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1003, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:17:38', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1009, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:17:38', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1012, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:17:38', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1015, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:17:38', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1018, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:17:39', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1024, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:17:39', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1037, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:17:40', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1044, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:17:40', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1050, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:17:41', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1054, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:17:41', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1062, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:17:41', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1066, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:23', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1078, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:24', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1091, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:24', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1094, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:25', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1101, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:25', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1123, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:26', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1126, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:26', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1135, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:27', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1142, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:27', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1147, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:28', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1150, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:28', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1160, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:28', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (2220, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:56:45', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2226, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:56:45', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2243, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:56:46', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2251, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:56:47', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2260, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:56:47', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2263, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:56:47', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2271, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:56:48', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2275, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:56:48', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2281, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:56:48', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2287, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:56:49', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2292, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:56:49', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2296, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:56:49', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2303, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:56:50', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2308, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:56:50', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2314, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:56:50', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2322, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:58:41', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2330, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:58:41', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2337, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:58:42', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2345, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:58:42', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2353, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:58:42', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2360, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:58:43', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2368, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:58:43', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2376, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:58:44', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2383, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:58:44', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2391, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:58:44', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2400, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:58:45', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2408, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:58:45', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2416, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:58:46', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2418, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:59:39', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2426, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:59:39', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2434, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:59:40', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2442, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:59:40', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2450, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:59:41', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2458, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:59:41', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2466, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:59:42', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2474, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:59:42', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2482, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:59:43', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2491, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:59:43', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2499, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:59:43', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2507, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:59:44', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2515, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:59:44', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (966, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:17:35', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (969, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:17:35', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (977, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:17:36', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (985, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:17:37', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (988, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:17:37', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (997, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:17:37', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1007, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:17:38', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1013, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:17:38', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1022, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:17:39', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1038, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:17:40', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1051, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:17:41', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1061, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:17:41', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1067, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:23', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1073, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:23', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1080, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:24', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1084, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:24', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1090, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:24', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1096, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:25', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1132, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:27', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1136, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:27', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1140, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:27', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1146, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:28', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1149, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:28', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1156, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:28', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1161, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:28', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (2221, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:56:45', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2224, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:56:45', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2228, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:56:45', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2232, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:56:46', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2238, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:56:46', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2248, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:56:47', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2269, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:56:48', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2272, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:56:48', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2283, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:56:49', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2286, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:56:49', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2293, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:56:49', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2297, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:56:49', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2302, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:56:50', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2305, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:56:50', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2317, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:56:50', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2323, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:58:41', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2331, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:58:41', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2339, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:58:42', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2346, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:58:42', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2354, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:58:43', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2362, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:58:43', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2370, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:58:43', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2378, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:58:44', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2386, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:58:44', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2394, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:58:45', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2402, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:58:45', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2410, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:58:46', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2422, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:59:39', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2430, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:59:40', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2438, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:59:40', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2446, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:59:40', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2454, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:59:41', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2462, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:59:41', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2470, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:59:42', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2478, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:59:42', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2486, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:59:43', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2494, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:59:43', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2502, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:59:44', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2510, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:59:44', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (967, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:17:35', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (970, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:17:35', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (973, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:17:36', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (981, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:17:36', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (984, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:17:36', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (993, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:17:37', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1002, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:17:38', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1020, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:17:39', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1023, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:17:39', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1026, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:17:39', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1029, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:17:39', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1046, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:17:40', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1049, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:17:40', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1053, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:17:41', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1064, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:17:41', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1065, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:23', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1081, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:24', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1085, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:24', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1093, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:25', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1100, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:25', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1106, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:25', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1125, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:26', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1137, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:27', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1155, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:28', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1159, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:28', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (2223, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:56:45', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2227, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:56:45', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2231, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:56:46', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2237, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:56:46', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2247, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:56:46', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2255, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:56:47', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2268, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:56:48', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2276, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:56:48', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2282, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:56:49', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2300, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:56:49', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2306, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:56:50', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2310, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:56:50', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2319, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:58:41', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2327, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:58:41', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2335, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:58:42', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2343, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:58:42', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2351, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:58:42', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2359, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:58:43', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2367, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:58:43', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2375, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:58:44', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2384, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:58:44', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2392, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:58:44', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2399, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:58:45', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2407, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:58:45', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2414, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:58:46', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2425, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:59:39', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2433, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:59:40', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2441, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:59:40', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2449, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:59:41', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2457, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:59:41', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2465, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:59:42', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2473, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:59:42', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2481, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:59:42', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2489, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:59:43', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2497, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:59:43', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2505, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:59:44', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2513, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:59:44', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (968, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:17:35', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (976, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:17:36', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (987, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:17:37', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (990, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:17:37', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1005, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:17:38', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1008, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:17:38', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1017, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:17:39', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1034, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:17:40', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1040, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:17:40', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1057, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:17:41', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1087, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:24', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1099, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:25', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1102, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:25', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1108, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:25', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1111, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:25', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1114, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:26', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1117, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:26', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1131, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:27', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1139, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:27', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1145, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:27', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1148, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:28', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1151, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:28', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1163, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:28', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (2230, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:56:46', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2234, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:56:46', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2242, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:56:46', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2252, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:56:47', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2256, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:56:47', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2262, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:56:47', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2267, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:56:48', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2273, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:56:48', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2279, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:56:48', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2285, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:56:49', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2301, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:56:50', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2309, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:56:50', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2316, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:56:50', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2325, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:58:41', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2333, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:58:41', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2341, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:58:42', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2349, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:58:42', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2357, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:58:43', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2365, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:58:43', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2373, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:58:43', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2380, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:58:44', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2388, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:58:44', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2396, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:58:45', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2404, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:58:45', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2412, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:58:46', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2424, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:59:39', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2432, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:59:40', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2440, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:59:40', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2448, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:59:40', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2456, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:59:41', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2464, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:59:41', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2472, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:59:42', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2480, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:59:42', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2488, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:59:43', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2496, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:59:43', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2504, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:59:44', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2512, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:59:44', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (972, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:17:36', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (980, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:17:36', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (983, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:17:36', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1000, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:17:38', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1004, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:17:38', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1016, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:17:39', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1019, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:17:39', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1025, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:17:39', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1028, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:17:39', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1031, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:17:39', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1036, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:17:40', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1043, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:17:40', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1056, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:17:41', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1060, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:17:41', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1069, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:23', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1072, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:23', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1075, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:24', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1082, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:24', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1086, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:24', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1103, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:25', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1109, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:25', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1112, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:25', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1115, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:26', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1118, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:26', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1121, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:26', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1127, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:26', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1143, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:27', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1154, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:28', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1158, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:28', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (2235, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:56:46', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2241, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:56:46', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2249, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:56:47', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2254, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:56:47', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2258, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:56:47', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2266, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:56:48', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2277, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:56:48', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2288, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:56:49', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2291, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:56:49', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2298, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:56:49', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2312, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:56:50', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2321, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:58:41', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2329, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:58:41', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2338, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:58:42', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2347, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:58:42', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2355, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:58:43', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2363, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:58:43', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2371, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:58:43', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2379, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:58:44', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2387, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:58:44', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2395, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:58:45', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2403, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:58:45', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2411, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:58:46', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2420, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:59:39', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2428, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:59:39', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2436, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:59:40', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2444, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:59:40', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2452, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:59:41', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2460, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:59:41', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2468, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:59:42', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2476, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:59:42', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2484, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:59:43', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2492, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:59:43', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2500, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:59:43', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2508, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:59:44', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2516, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:59:44', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (974, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:17:36', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (982, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:17:36', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (991, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:17:37', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (994, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:17:37', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1010, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:17:38', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1035, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:17:40', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1042, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:17:40', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1045, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:17:40', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1048, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:17:40', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1052, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:17:41', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1063, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:17:41', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1070, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:23', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1079, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:24', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1089, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:24', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1098, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:25', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1104, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:25', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1107, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:25', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1113, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:26', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1119, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:26', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1128, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:26', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1134, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:27', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1141, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:27', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1144, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:27', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1153, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:28', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1157, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:28', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (2236, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:56:46', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2245, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:56:46', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2259, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:56:47', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2265, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:56:48', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2274, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:56:48', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2280, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:56:48', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2289, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:56:49', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2299, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:56:49', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2311, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:56:50', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2324, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:58:41', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2332, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:58:41', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2340, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:58:42', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2348, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:58:42', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2356, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:58:43', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2364, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:58:43', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2372, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:58:43', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2381, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:58:44', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2389, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:58:44', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2397, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:58:45', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2405, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:58:45', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2413, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:58:46', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2423, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:59:39', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2431, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:59:40', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2439, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:59:40', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2447, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:59:40', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2455, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:59:41', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2463, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:59:41', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2471, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:59:42', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2479, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:59:42', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2487, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:59:43', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2495, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:59:43', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2503, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:59:44', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (2511, 1, 1, 2, 0, 0, 1000, 1000, 8240, '2020-02-26 13:59:44', 8240, '8600001', '601318', '中国平安');
INSERT INTO "office"."t_trade_order" VALUES (975, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:17:36', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (986, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:17:37', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (989, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:17:37', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (998, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:17:37', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1001, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:17:38', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1011, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:17:38', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1014, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:17:38', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1032, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:17:39', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1041, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:17:40', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1047, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:17:40', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1058, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:17:41', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1071, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:23', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1076, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:24', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1083, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:24', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1092, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:24', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1095, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:25', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1105, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:25', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1120, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:26', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1124, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:26', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1129, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:26', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1133, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:27', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1164, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:29', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (978, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:17:36', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (992, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:17:37', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (559, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:23:30', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (560, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:25:32', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (561, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:25:32', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (562, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:25:32', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (563, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:25:32', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (564, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:25:32', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (565, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:25:32', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (566, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:25:32', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (567, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:25:32', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (568, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:25:33', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (569, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:25:33', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (570, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:25:33', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (571, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:25:33', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (572, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:25:33', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (573, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:25:33', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (574, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:25:33', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (575, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:25:33', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (576, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:25:33', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (577, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:25:33', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (578, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:25:33', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (579, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:25:33', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (580, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:25:33', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (581, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:25:34', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (582, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:25:34', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (583, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:25:34', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (584, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:25:34', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (585, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:25:34', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (586, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:25:34', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (587, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:25:34', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (588, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:25:34', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (589, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:25:34', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (590, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:25:34', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (591, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:25:34', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (592, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:25:34', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (593, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:25:34', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (594, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:25:35', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (595, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:25:35', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (596, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:25:35', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (597, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:25:35', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (598, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:25:35', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (599, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:25:35', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (600, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:25:35', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (601, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:25:35', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (602, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:25:35', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (603, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:25:35', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (604, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:25:35', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (605, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:25:35', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (606, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:25:35', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (607, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:25:35', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (608, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:25:35', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (609, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:25:36', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (610, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:25:36', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (611, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:25:36', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (612, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:25:36', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (613, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:25:36', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (614, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:25:36', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (615, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:25:36', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (616, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:25:36', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (617, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:25:36', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (618, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:25:36', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (619, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:25:36', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (620, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:25:36', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (621, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:25:36', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (622, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:25:36', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (623, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:25:36', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (624, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:25:36', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (625, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:25:37', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (626, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:25:37', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (627, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:25:37', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (628, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:25:37', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (629, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:25:37', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (630, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:25:37', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (631, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:25:37', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (632, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:25:37', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (633, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:25:37', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (634, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:25:37', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (635, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:25:37', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (636, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:25:37', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (637, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:25:37', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (638, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:25:37', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (639, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:25:37', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (640, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:25:37', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (641, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:25:37', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (642, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:25:38', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (643, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:25:38', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (644, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:25:38', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (645, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:25:38', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (659, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:25:39', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (995, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:17:37', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (999, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:17:38', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1006, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:17:38', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1021, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:17:39', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1027, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:17:39', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1030, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:17:39', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1033, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:17:40', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1039, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:17:40', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1055, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:17:41', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1059, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:17:41', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1068, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:23', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1074, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:24', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1077, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:24', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1088, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:24', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1097, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:25', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1110, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:25', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1116, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:26', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1122, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:26', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1130, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:26', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1138, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:27', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1152, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:28', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1162, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:28', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (646, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:25:38', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (649, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:25:38', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (656, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:25:38', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1165, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:52', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1175, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:53', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1184, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:53', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1190, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:53', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1193, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:53', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1200, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:54', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1203, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:54', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1209, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:54', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1219, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:55', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1235, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:56', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1238, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:56', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1247, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:56', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1257, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:57', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1268, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:22:15', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1284, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:22:16', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1288, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:22:16', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1303, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:22:17', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1306, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:22:17', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1310, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:22:17', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1320, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:22:18', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1328, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:22:18', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1348, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:22:19', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1361, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:22:20', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (647, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:25:38', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (655, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:25:38', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1166, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:52', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1169, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:52', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1172, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:52', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1185, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:53', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1188, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:53', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1213, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:55', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1223, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:55', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1226, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:55', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1232, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:56', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1241, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:56', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1244, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:56', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1248, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:57', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1251, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:57', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1255, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:57', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1263, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:57', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1266, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:22:15', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1275, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:22:15', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1282, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:22:16', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1286, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:22:16', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1296, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:22:16', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1311, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:22:17', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1323, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:22:18', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1326, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:22:18', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1332, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:22:18', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1352, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:22:19', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1358, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:22:20', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (648, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:25:38', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (651, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:25:38', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (657, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:25:38', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1167, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:52', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1170, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:52', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1204, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:54', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1210, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:54', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1216, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:55', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1240, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:56', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1246, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:56', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1249, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:57', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1256, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:57', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1260, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:57', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1271, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:22:15', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1274, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:22:15', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1285, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:22:16', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1295, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:22:16', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1298, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:22:16', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1301, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:22:17', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1304, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:22:17', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1308, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:22:17', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1315, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:22:17', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1321, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:22:18', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1329, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:22:18', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1343, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:22:19', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1359, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:22:20', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (650, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:25:38', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (658, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:25:39', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1168, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:52', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1171, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:52', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1183, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:53', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1195, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:54', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1202, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:54', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1205, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:54', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1212, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:55', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1215, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:55', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1222, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:55', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1225, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:55', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1228, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:55', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1231, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:56', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1243, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:56', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1253, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:57', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1264, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:57', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1269, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:22:15', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1272, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:22:15', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1279, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:22:15', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1290, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:22:16', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1293, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:22:16', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1307, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:22:17', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1314, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:22:17', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1317, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:22:17', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1325, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:22:18', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1331, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:22:18', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1335, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:22:18', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1339, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:22:19', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1346, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:22:19', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1349, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:22:19', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1355, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:22:19', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1363, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:22:20', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (652, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:25:38', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1173, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:52', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1179, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:53', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1186, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:53', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1189, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:53', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1192, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:53', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1198, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:54', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1211, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:54', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1229, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:56', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1250, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:57', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1254, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:57', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1261, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:57', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1270, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:22:15', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1276, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:22:15', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1283, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:22:16', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1287, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:22:16', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1299, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:22:16', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1302, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:22:17', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1312, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:22:17', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1318, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:22:17', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1333, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:22:18', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1336, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:22:18', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1340, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:22:19', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1347, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:22:19', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1350, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:22:19', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1360, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:22:20', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (653, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:25:38', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1174, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:53', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1177, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:53', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1180, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:53', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1187, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:53', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1199, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:54', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1208, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:54', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1214, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:55', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1218, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:55', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1230, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:56', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1234, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:56', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1237, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:56', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1252, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:57', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1262, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:57', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1265, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:22:15', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1278, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:22:15', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1289, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:22:16', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1292, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:22:16', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1322, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:22:18', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1341, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:22:19', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1351, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:22:19', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1354, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:22:19', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1357, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:22:19', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (654, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 17:25:38', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1176, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:53', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1182, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:53', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1191, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:53', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1194, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:54', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1197, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:54', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1201, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:54', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1207, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:54', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1217, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:55', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1220, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:55', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1224, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:55', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1227, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:55', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1242, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:56', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1245, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:56', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1259, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:18:57', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1273, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:22:15', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1280, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:22:16', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1294, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:22:16', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1297, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:22:16', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1300, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:22:16', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1313, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:22:17', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1316, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:22:17', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1319, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:22:17', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1327, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:22:18', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1337, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:22:18', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1344, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:22:19', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1353, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:22:19', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1356, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:22:19', 555, NULL, NULL, NULL);
INSERT INTO "office"."t_trade_order" VALUES (1362, 1, 2, 2, 0, 0, 1, 1, 539, '2019-08-28 18:22:20', 555, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for t_trade_position
-- ----------------------------
DROP TABLE IF EXISTS "office"."t_trade_position";
CREATE TABLE "office"."t_trade_position" (
    -- "id" int4 NOT NULL DEFAULT nextval('t_trade_position_id_seq'::regclass),
                                             "id" serial4 primary key,
                                             "accountid" int8 NOT NULL,
                                             "stockid" int8 NOT NULL,
                                             "costprice" int8,
                                             "volume" int4 NOT NULL,
                                             "stockmarket" int2,
                                             "avgprice" int8 NOT NULL,
                                             "validsellvolume" int4,
                                             "profit" int8,
                                             "exectime" timestamp(0),
                                             "status" int2 NOT NULL,
                                             "interest" int8,
                                             "accountno" varchar(32) COLLATE "pg_catalog"."default",
                                             "stockcode" varchar(32) COLLATE "pg_catalog"."default",
                                             "stockname" varchar(32) COLLATE "pg_catalog"."default",
                                             "interesttime" varchar(10) COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "office"."t_trade_position"."id" IS '主键， 唯一标识';
COMMENT ON COLUMN "office"."t_trade_position"."accountid" IS '交易账号ID';
COMMENT ON COLUMN "office"."t_trade_position"."stockid" IS '股票ID';
COMMENT ON COLUMN "office"."t_trade_position"."costprice" IS '成本价';
COMMENT ON COLUMN "office"."t_trade_position"."volume" IS '持仓数量';
COMMENT ON COLUMN "office"."t_trade_position"."stockmarket" IS '股票市场(0: 上交所， 1：深交所，2：港股， 3：美股）';
COMMENT ON COLUMN "office"."t_trade_position"."avgprice" IS '成交均价';
COMMENT ON COLUMN "office"."t_trade_position"."validsellvolume" IS '可卖数量(T+1制度使用)';
COMMENT ON COLUMN "office"."t_trade_position"."profit" IS '盈亏(默认两位小数）';
COMMENT ON COLUMN "office"."t_trade_position"."exectime" IS '成交时间';
COMMENT ON COLUMN "office"."t_trade_position"."status" IS '状态(0:有效，1：无效）';
COMMENT ON COLUMN "office"."t_trade_position"."interest" IS '持仓累计利息（默认两位小数）';
COMMENT ON TABLE "office"."t_trade_position" IS '仓位表';

-- ----------------------------
-- Records of t_trade_position
-- ----------------------------
INSERT INTO "office"."t_trade_position" VALUES (15, 1, 1, 8239, 2008400, 0, 8239, 2008400, NULL, '2020-02-17 17:23:36', 0, 248389372, '8600001', '601318', '中国平安', '20200225');
INSERT INTO "office"."t_trade_position" VALUES (8, 1, 2, 563, 304511, 0, 567, 304511, NULL, '2019-08-21 17:55:16', 0, 3343530, '', '601398', '工商银行', '20200225');

-- ----------------------------
-- Table structure for t_trade_stock_kline
-- ----------------------------
DROP TABLE IF EXISTS "office"."t_trade_stock_kline";
CREATE TABLE "office"."t_trade_stock_kline"
(
    -- "id" int4 NOT NULL DEFAULT nextval('t_trade_stock_kline_id_seq'::regclass),
    "id"             serial4 primary key,
    "stockid"        int8                                       NOT NULL,
    "stockcode"      varchar(12) COLLATE "pg_catalog"."default" NOT NULL,
    "stockname"      varchar(32) COLLATE "pg_catalog"."default" NOT NULL,
    "priceopen"      int8,
    "pricehigh"      int8,
    "pricelow"       int8,
    "priceclose"     int8,
    "volume"         int8 DEFAULT 100,
    "amount"         int8,
    "time"           int8,
    "lastcloseprice" int8,
    "datatype"       int8
)
;
COMMENT ON COLUMN "office"."t_trade_stock_kline"."id" IS '主键标识';
COMMENT ON COLUMN "office"."t_trade_stock_kline"."stockid" IS '产品ID';
COMMENT ON COLUMN "office"."t_trade_stock_kline"."stockcode" IS '产品编号';
COMMENT ON COLUMN "office"."t_trade_stock_kline"."stockname" IS '产品名称';
COMMENT ON COLUMN "office"."t_trade_stock_kline"."priceopen" IS '开盘价';
COMMENT ON COLUMN "office"."t_trade_stock_kline"."pricehigh" IS '最高价';
COMMENT ON COLUMN "office"."t_trade_stock_kline"."pricelow" IS '最低价';
COMMENT ON COLUMN "office"."t_trade_stock_kline"."priceclose" IS '收盘价';
COMMENT ON COLUMN "office"."t_trade_stock_kline"."volume" IS '成交量';
COMMENT ON COLUMN "office"."t_trade_stock_kline"."amount" IS '成交金额';
COMMENT ON COLUMN "office"."t_trade_stock_kline"."time" IS '报价时间';
COMMENT ON TABLE "office"."t_trade_stock_kline" IS '股票K线表';

-- ----------------------------
-- Records of t_trade_stock_kline
-- ----------------------------
INSERT INTO "office"."t_trade_stock_kline" VALUES (1, 1, '601318', '中国平安', 8559, 8559, 8559, 8559, 204153, 173491574500, 1565577180, NULL, NULL);
INSERT INTO "office"."t_trade_stock_kline" VALUES (48, 4, '000333', '美的集团', 5151, 5151, 5151, 5151, 4841, 2497281759, 1566356040, NULL, NULL);
INSERT INTO "office"."t_trade_stock_kline" VALUES (49, 1, '601318', '中国平安', 8787, 8787, 8787, 8787, 4137, 3636780600, 1566356100, NULL, NULL);
INSERT INTO "office"."t_trade_stock_kline" VALUES (50, 2, '601398', '工商银行', 543, 543, 543, 543, 44354, 2406378100, 1566356040, NULL, NULL);
INSERT INTO "office"."t_trade_stock_kline" VALUES (51, 1, '601318', '中国平安', 8791, 8791, 8791, 8791, 4977, 4373400500, 1566356280, NULL, NULL);
INSERT INTO "office"."t_trade_stock_kline" VALUES (52, 4, '000333', '美的集团', 5162, 5162, 5162, 5162, 1620, 835986826, 1566356340, NULL, NULL);
INSERT INTO "office"."t_trade_stock_kline" VALUES (53, 1, '601318', '中国平安', 8789, 8789, 8789, 8789, 2311, 2031539900, 1566356460, NULL, NULL);
INSERT INTO "office"."t_trade_stock_kline" VALUES (54, 2, '601398', '工商银行', 542, 542, 542, 542, 8970, 486994300, 1566356460, NULL, NULL);
INSERT INTO "office"."t_trade_stock_kline" VALUES (55, 1, '601318', '中国平安', 8777, 8777, 8777, 8777, 7779, 6818175900, 1566438840, NULL, NULL);
INSERT INTO "office"."t_trade_stock_kline" VALUES (56, 4, '000333', '美的集团', 5154, 5154, 5154, 5154, 9460, 4869337166, 1566438900, NULL, NULL);
INSERT INTO "office"."t_trade_stock_kline" VALUES (57, 1, '601318', '中国平安', 8763, 8763, 8763, 8763, 19106, 16734544600, 1566439020, NULL, NULL);
INSERT INTO "office"."t_trade_stock_kline" VALUES (58, 2, '601398', '工商银行', 540, 540, 540, 540, 29322, 1584361200, 1566439080, NULL, NULL);
INSERT INTO "office"."t_trade_stock_kline" VALUES (59, 4, '000333', '美的集团', 5161, 5161, 5161, 5161, 164121, 85984496156, 1566439440, NULL, NULL);
INSERT INTO "office"."t_trade_stock_kline" VALUES (60, 1, '601318', '中国平安', 8753, 8753, 8753, 8753, 786859, 706263661700, 1566439380, NULL, NULL);
INSERT INTO "office"."t_trade_stock_kline" VALUES (61, 2, '601398', '工商银行', 541, 541, 541, 541, 859689, 46517430400, 1566439440, NULL, NULL);
INSERT INTO "office"."t_trade_stock_kline" VALUES (62, 4, '000333', '美的集团', 5104, 5104, 5104, 5104, 2301, 5765881570, 1566802800, NULL, NULL);
INSERT INTO "office"."t_trade_stock_kline" VALUES (63, 1, '601318', '中国平安', 8750, 8750, 8750, 8750, -425613, -376893137300, 1566802800, NULL, NULL);
INSERT INTO "office"."t_trade_stock_kline" VALUES (64, 2, '601398', '工商银行', 538, 538, 538, 538, 138169, 7920684900, 1566802800, NULL, NULL);
INSERT INTO "office"."t_trade_stock_kline" VALUES (65, 2, '601398', '工商银行', 539, 539, 539, 539, -515078, -26956774500, 1567148400, NULL, NULL);
INSERT INTO "office"."t_trade_stock_kline" VALUES (66, 4, '000333', '美的集团', 5207, 5207, 5207, 5207, -22678, -9567586462, 1569308400, NULL, NULL);
INSERT INTO "office"."t_trade_stock_kline" VALUES (67, 1, '601318', '中国平安', 8895, 8895, 8895, 8895, 214075, 206926521600, 1569308400, NULL, NULL);
INSERT INTO "office"."t_trade_stock_kline" VALUES (68, 2, '601398', '工商银行', 550, 550, 550, 550, -307276, -15373299500, 1569308400, NULL, NULL);
INSERT INTO "office"."t_trade_stock_kline" VALUES (69, 4, '000333', '美的集团', 5322, 5322, 5322, 5322, 8809, 5632901989, 1571295600, NULL, NULL);
INSERT INTO "office"."t_trade_stock_kline" VALUES (70, 1, '601318', '中国平安', 9172, 9172, 9172, 9172, 31606, 7562627800, 1571295600, NULL, NULL);
INSERT INTO "office"."t_trade_stock_kline" VALUES (71, 2, '601398', '工商银行', 571, 571, 571, 571, 1000443, 61075039400, 1571295600, NULL, NULL);
INSERT INTO "office"."t_trade_stock_kline" VALUES (2, 2, '601398', '工商银行', 548, 548, 548, 548, 418180, 22884316000, 1565577360, 547, NULL);

-- ----------------------------
-- Table structure for t_trade_stock_kline_1
-- ----------------------------
DROP TABLE IF EXISTS "office"."t_trade_stock_kline_1";
CREATE TABLE "office"."t_trade_stock_kline_1"
(
    -- "id" int8 NOT NULL DEFAULT nextval('t_trade_stock_kline_1_id_seq'::regclass),
    "id"             serial8 primary key,
    "stockid"        int8                                       NOT NULL,
    "stockcode"      varchar(12) COLLATE "pg_catalog"."default" NOT NULL,
    "stockname"      varchar(32) COLLATE "pg_catalog"."default" NOT NULL,
    "priceopen"      int8,
    "pricehigh"      int8,
    "pricelow"       int8,
    "priceclose"     int8,
    "volume"         int8 DEFAULT 100,
    "amount"         int8,
    "time"           int8,
    "lastcloseprice" int8,
    "datatype"       int8
)
;
COMMENT ON COLUMN "office"."t_trade_stock_kline_1"."id" IS '主键标识';
COMMENT ON COLUMN "office"."t_trade_stock_kline_1"."stockid" IS '产品ID';
COMMENT ON COLUMN "office"."t_trade_stock_kline_1"."stockcode" IS '产品编号';
COMMENT ON COLUMN "office"."t_trade_stock_kline_1"."stockname" IS '产品名称';
COMMENT ON COLUMN "office"."t_trade_stock_kline_1"."priceopen" IS '开盘价';
COMMENT ON COLUMN "office"."t_trade_stock_kline_1"."pricehigh" IS '最高价';
COMMENT ON COLUMN "office"."t_trade_stock_kline_1"."pricelow" IS '最低价';
COMMENT ON COLUMN "office"."t_trade_stock_kline_1"."priceclose" IS '收盘价';
COMMENT ON COLUMN "office"."t_trade_stock_kline_1"."volume" IS '成交量';
COMMENT ON COLUMN "office"."t_trade_stock_kline_1"."amount" IS '成交金额';
COMMENT ON COLUMN "office"."t_trade_stock_kline_1"."time" IS '报价时间';
COMMENT ON COLUMN "office"."t_trade_stock_kline_1"."datatype" IS '类型, 生成K线的时间周期(1: 1分钟, 5: 5分钟, 30: 30分钟)';
COMMENT ON TABLE "office"."t_trade_stock_kline_1" IS '股票K线表';

-- ----------------------------
-- Records of t_trade_stock_kline_1
-- ----------------------------
INSERT INTO "office"."t_trade_stock_kline_1" VALUES (1226177853855506432, 2, '601398', '工商银行', 576, 572, NULL, 572, NULL, 11462385, 1579762808, 579, 60);
INSERT INTO "office"."t_trade_stock_kline_1" VALUES (1226179269986754560, 3, '601398', '工商银行', 576, 572, NULL, 572, NULL, 11462385, 1579762808, 579, 60);

-- ----------------------------
-- Table structure for t_trade_stock_kline_5
-- ----------------------------
DROP TABLE IF EXISTS "office"."t_trade_stock_kline_5";
CREATE TABLE "office"."t_trade_stock_kline_5"
(
    -- "id" int8 NOT NULL DEFAULT nextval('t_trade_stock_kline_5_id_seq'::regclass),
    "id"             serial8 primary key,
    "stockid"        int8                                       NOT NULL,
    "stockcode"      varchar(12) COLLATE "pg_catalog"."default" NOT NULL,
    "stockname"      varchar(32) COLLATE "pg_catalog"."default" NOT NULL,
    "priceopen"      int8,
    "pricehigh"      int8,
    "pricelow"       int8,
    "priceclose"     int8,
    "volume"         int8 DEFAULT 100,
    "amount"         int8,
    "time"           int8,
    "lastcloseprice" int8,
    "datatype"       int8
)
;
COMMENT ON COLUMN "office"."t_trade_stock_kline_5"."id" IS '主键标识';
COMMENT ON COLUMN "office"."t_trade_stock_kline_5"."stockid" IS '产品ID';
COMMENT ON COLUMN "office"."t_trade_stock_kline_5"."stockcode" IS '产品编号';
COMMENT ON COLUMN "office"."t_trade_stock_kline_5"."stockname" IS '产品名称';
COMMENT ON COLUMN "office"."t_trade_stock_kline_5"."priceopen" IS '开盘价';
COMMENT ON COLUMN "office"."t_trade_stock_kline_5"."pricehigh" IS '最高价';
COMMENT ON COLUMN "office"."t_trade_stock_kline_5"."pricelow" IS '最低价';
COMMENT ON COLUMN "office"."t_trade_stock_kline_5"."priceclose" IS '收盘价';
COMMENT ON COLUMN "office"."t_trade_stock_kline_5"."volume" IS '成交量';
COMMENT ON COLUMN "office"."t_trade_stock_kline_5"."amount" IS '成交金额';
COMMENT ON COLUMN "office"."t_trade_stock_kline_5"."time" IS '报价时间';
COMMENT ON COLUMN "office"."t_trade_stock_kline_5"."datatype" IS '类型, 生成K线的时间周期(1: 1分钟, 5: 5分钟, 30: 30分钟)';
COMMENT ON TABLE "office"."t_trade_stock_kline_5" IS '股票K线表';

-- ----------------------------
-- Records of t_trade_stock_kline_5
-- ----------------------------
INSERT INTO "office"."t_trade_stock_kline_5" VALUES (1226179523440156672, 2, '601398', '工商银行', 576, 572, NULL, 572, NULL, 11462385, 1579762808, 579, 300);
INSERT INTO "office"."t_trade_stock_kline_5" VALUES (1226179537788870656, 2, '601398', '工商银行', 576, 572, NULL, 572, NULL, 11462385, 1579762808, 579, 300);
INSERT INTO "office"."t_trade_stock_kline_5" VALUES (1226330808424472576, 2, '601398', '工商银行', 576, 572, NULL, 572, NULL, 11462385, 1579762808, 579, 300);
INSERT INTO "office"."t_trade_stock_kline_5" VALUES (1226343074574245888, 2, '601398', '工商银行', 576, 572, NULL, 572, NULL, 11462385, 1579762808, 579, 300);
INSERT INTO "office"."t_trade_stock_kline_5" VALUES (1226418021195718656, 2, '601398', '工商银行', 576, 572, NULL, 572, NULL, 11462385, 1579762808, 579, 300);
INSERT INTO "office"."t_trade_stock_kline_5" VALUES (1226418927597395968, 2, '601398', '工商银行', 576, 572, NULL, 572, NULL, 11462385, 1579762808, 579, 300);

-- ----------------------------
-- Table structure for t_trade_stock_quote_last
-- ----------------------------
DROP TABLE IF EXISTS "office"."t_trade_stock_quote_last";
CREATE TABLE "office"."t_trade_stock_quote_last" (
    -- "id" int4 NOT NULL DEFAULT nextval('t_trade_stock_quote_last_id_seq'::regclass),
                                                     "id" serial4 primary key,
                                                     "stockid" int8 NOT NULL,
                                                     "stockcode" varchar(12) COLLATE "pg_catalog"."default" NOT NULL,
                                                     "stockname" varchar(32) COLLATE "pg_catalog"."default" NOT NULL,
                                                     "pricebid1" int8,
                                                     "pricebid2" int8,
                                                     "pricebid3" int8,
                                                     "pricebid4" int8,
                                                     "pricebid5" int8,
                                                     "volumebid1" int8,
                                                     "volumebid2" int8,
                                                     "volumebid3" int8,
                                                     "volumebid4" int8,
                                                     "volumebid5" int8,
                                                     "priceask1" int8,
                                                     "priceask2" int8,
                                                     "priceask3" int8,
                                                     "priceask4" int8,
                                                     "priceask5" int8,
                                                     "volumeask1" int8,
                                                     "volumeask2" int8,
                                                     "volumeask3" int8,
                                                     "volumeask4" int8,
                                                     "volumeask5" int8,
                                                     "lastprice" int8,
                                                     "volume" int8,
                                                     "amount" int8,
                                                     "time" int8,
                                                     "openprice" int8,
                                                     "lastcloseprice" int8
)
;
COMMENT ON COLUMN "office"."t_trade_stock_quote_last"."id" IS '主键标识';
COMMENT ON COLUMN "office"."t_trade_stock_quote_last"."stockid" IS '产品ID';
COMMENT ON COLUMN "office"."t_trade_stock_quote_last"."stockcode" IS '产品编号';
COMMENT ON COLUMN "office"."t_trade_stock_quote_last"."stockname" IS '产品名称';
COMMENT ON COLUMN "office"."t_trade_stock_quote_last"."pricebid1" IS '买方报价（一档）';
COMMENT ON COLUMN "office"."t_trade_stock_quote_last"."pricebid2" IS '买方报价（二档）';
COMMENT ON COLUMN "office"."t_trade_stock_quote_last"."pricebid3" IS '买方报价（三档）';
COMMENT ON COLUMN "office"."t_trade_stock_quote_last"."pricebid4" IS '买方报价（四档）';
COMMENT ON COLUMN "office"."t_trade_stock_quote_last"."pricebid5" IS '买方报价（五档）';
COMMENT ON COLUMN "office"."t_trade_stock_quote_last"."volumebid1" IS '买方数量（一档）';
COMMENT ON COLUMN "office"."t_trade_stock_quote_last"."volumebid2" IS '买方数量（二档）';
COMMENT ON COLUMN "office"."t_trade_stock_quote_last"."volumebid3" IS '买方数量（三档）';
COMMENT ON COLUMN "office"."t_trade_stock_quote_last"."volumebid4" IS '买方数量（四档）';
COMMENT ON COLUMN "office"."t_trade_stock_quote_last"."volumebid5" IS '买方数量（五档）';
COMMENT ON COLUMN "office"."t_trade_stock_quote_last"."priceask1" IS '卖方报价（一档）';
COMMENT ON COLUMN "office"."t_trade_stock_quote_last"."priceask2" IS '卖方报价（二档）';
COMMENT ON COLUMN "office"."t_trade_stock_quote_last"."priceask3" IS '卖方报价（三档）';
COMMENT ON COLUMN "office"."t_trade_stock_quote_last"."priceask4" IS '卖方报价（四档）';
COMMENT ON COLUMN "office"."t_trade_stock_quote_last"."priceask5" IS '卖方报价（五档）';
COMMENT ON COLUMN "office"."t_trade_stock_quote_last"."volumeask1" IS '卖方数量（一档）';
COMMENT ON COLUMN "office"."t_trade_stock_quote_last"."volumeask2" IS '卖方数量（二档）';
COMMENT ON COLUMN "office"."t_trade_stock_quote_last"."volumeask3" IS '卖方数量（三档）';
COMMENT ON COLUMN "office"."t_trade_stock_quote_last"."volumeask4" IS '卖方数量（四档）';
COMMENT ON COLUMN "office"."t_trade_stock_quote_last"."volumeask5" IS '卖方数量（五档）';
COMMENT ON COLUMN "office"."t_trade_stock_quote_last"."lastprice" IS '当前价格';
COMMENT ON COLUMN "office"."t_trade_stock_quote_last"."volume" IS '当前成交量';
COMMENT ON COLUMN "office"."t_trade_stock_quote_last"."amount" IS '当前成交金额';
COMMENT ON COLUMN "office"."t_trade_stock_quote_last"."time" IS '报价时间';
COMMENT ON TABLE "office"."t_trade_stock_quote_last" IS '股票分时行情报价表';

-- ----------------------------
-- Records of t_trade_stock_quote_last
-- ----------------------------
INSERT INTO "office"."t_trade_stock_quote_last" VALUES (1, 2, '601398', '工商银行', 540, 539, 538, 537, 536, 2134700, 689400, 686300, 912600, 392700, 541, 542, 543, 544, 545, 144500, 690100, 2713000, 2709883, 2147600, 541, 116974, 6341231300, 1565141741000, NULL, NULL);
INSERT INTO "office"."t_trade_stock_quote_last" VALUES (2, 1, '601318', '中国平安', 8442, 8441, 8440, 8439, 8438, 9700, 1600, 4567, 3300, 11700, 8443, 8445, 8448, 8449, 8450, 4700, 1200, 300, 1300, 13500, 8443, 61016, 51692476800, 1565141719000, NULL, NULL);
INSERT INTO "office"."t_trade_stock_quote_last" VALUES (3, 2, '601398', '工商银行', 540, 539, 538, 537, 536, 1159972, 1205400, 1382500, 1042100, 656100, 541, 542, 543, 544, 545, 827239, 1590600, 2105600, 2673683, 2343600, 541, 187648, 10161250200, 1565142128000, NULL, NULL);
INSERT INTO "office"."t_trade_stock_quote_last" VALUES (4, 1, '601318', '中国平安', 8452, 8451, 8450, 8449, 8448, 11600, 1800, 5500, 15000, 19000, 8453, 8454, 8455, 8456, 8457, 1600, 8100, 5456, 2500, 17600, 8452, 90214, 76369384000, 1565142124000, NULL, NULL);
INSERT INTO "office"."t_trade_stock_quote_last" VALUES (5, 2, '601398', '工商银行', 539, 538, 537, 536, 535, 50789, 1521200, 1075500, 1177100, 1154700, 540, 541, 542, 543, 544, 1509600, 1029439, 1522000, 2009100, 2703783, 540, 236429, 12793355500, 1565142335000, NULL, NULL);
INSERT INTO "office"."t_trade_stock_quote_last" VALUES (6, 2, '601398', '工商银行', 538, 537, 536, 535, 534, 4572300, 1406400, 1648200, 1355500, 241900, 539, 540, 541, 542, 543, 241032, 1091385, 1193239, 2712300, 2195200, 539, 272704, 14748927500, 1565142530000, NULL, NULL);
INSERT INTO "office"."t_trade_stock_quote_last" VALUES (7, 1, '601318', '中国平安', 8443, 8441, 8440, 8439, 8438, 11300, 9100, 7582, 2800, 2200, 8444, 8445, 8448, 8449, 8450, 1500, 3898, 7500, 15856, 9100, 8443, 102681, 86893163500, 1565142337000, NULL, NULL);
INSERT INTO "office"."t_trade_stock_quote_last" VALUES (8, 1, '601318', '中国平安', 8419, 8418, 8417, 8416, 8415, 1600, 700, 800, 3400, 5300, 8420, 8422, 8423, 8424, 8425, 7456, 4600, 400, 300, 3000, 8419, 112787, 95414382400, 1565142529000, NULL, NULL);
INSERT INTO "office"."t_trade_stock_quote_last" VALUES (9, 1, '601318', '中国平安', 8384, 8383, 8382, 8381, 8380, 60600, 3900, 7200, 11100, 5900, 8385, 8386, 8387, 8388, 8389, 900, 900, 5200, 5100, 11800, 8384, 250404, 210890586000, 1565145988000, NULL, NULL);
INSERT INTO "office"."t_trade_stock_quote_last" VALUES (10, 2, '601398', '工商银行', 539, 538, 537, 536, 535, 1487300, 7488556, 1905300, 2309000, 2445600, 540, 541, 542, 543, 544, 3320460, 2016826, 3461483, 2522800, 3409750, 540, 539487, 29146344200, 1565145791000, NULL, NULL);
INSERT INTO "office"."t_trade_stock_quote_last" VALUES (11, 1, '601318', '中国平安', 8368, 8367, 8366, 8365, 8364, 11300, 9500, 44700, 6100, 400, 8369, 8370, 8373, 8374, 8375, 1600, 5102, 3300, 20200, 500, 8368, 266316, 224213820600, 1565146621000, NULL, NULL);
INSERT INTO "office"."t_trade_stock_quote_last" VALUES (12, 2, '601398', '工商银行', 539, 538, 537, 536, 535, 1123017, 7806656, 1942900, 2394300, 2680200, 540, 541, 542, 543, 544, 4478160, 1963526, 3182183, 2381700, 3690750, 540, 571454, 30870759100, 1565147021000, NULL, NULL);
INSERT INTO "office"."t_trade_stock_quote_last" VALUES (13, 1, '601318', '中国平安', 8363, 8362, 8361, 8360, 8359, 1000, 1842, 6200, 4000, 6000, 8364, 8365, 8366, 8367, 8369, 1300, 300, 300, 200, 1500, 8363, 247926, 208815222800, 1565145799000, NULL, NULL);
INSERT INTO "office"."t_trade_stock_quote_last" VALUES (14, 2, '601398', '工商银行', 539, 538, 537, 536, 535, 2062951, 7501156, 1909700, 2314400, 2513900, 540, 541, 542, 543, 544, 2911660, 2017526, 3460183, 2512800, 3397750, 539, 542820, 29326268900, 1565145977000, NULL, NULL);
INSERT INTO "office"."t_trade_stock_quote_last" VALUES (15, 2, '601398', '工商银行', 539, 538, 537, 536, 535, 1721432, 7709456, 1940000, 2380700, 2658300, 540, 541, 542, 543, 544, 3403860, 2042326, 3187583, 2380800, 3679450, 539, 559281, 30214048800, 1565146523000, NULL, NULL);
INSERT INTO "office"."t_trade_stock_quote_last" VALUES (16, 1, '601318', '中国平安', 8370, 8368, 8366, 8365, 8364, 8898, 3000, 5700, 5700, 600, 8371, 8372, 8373, 8374, 8375, 22400, 16941, 1800, 31100, 900, 8370, 274225, 230837415500, 1565147023000, NULL, NULL);
INSERT INTO "office"."t_trade_stock_quote_last" VALUES (17, 2, '601398', '工商银行', 539, 538, 537, 536, 535, 531820, 7832756, 1944000, 2411800, 2685200, 540, 541, 542, 543, 544, 4305160, 1968126, 3163283, 2367600, 3676950, 539, 580161, 31340227400, 1565147204000, NULL, NULL);
INSERT INTO "office"."t_trade_stock_quote_last" VALUES (18, 1, '601318', '中国平安', 8361, 8359, 8358, 8357, 8356, 9600, 871, 25500, 2800, 5100, 8362, 8363, 8364, 8365, 8366, 25200, 1000, 1900, 32800, 3300, 8362, 277978, 233976409700, 1565147206000, NULL, NULL);
INSERT INTO "office"."t_trade_stock_quote_last" VALUES (19, 1, '601318', '中国平安', 8363, 8362, 8361, 8360, 8359, 25351, 2600, 3800, 25274, 23400, 8364, 8365, 8366, 8367, 8368, 400, 20200, 3300, 3672, 2300, 8363, 280989, 236493630400, 1565147386000, NULL, NULL);
INSERT INTO "office"."t_trade_stock_quote_last" VALUES (20, 2, '601398', '工商银行', 539, 538, 537, 536, 535, 8300, 8639476, 1975200, 2423200, 2677700, 540, 541, 542, 543, 544, 5032860, 2980526, 3169683, 2358100, 3670950, 539, 595520, 32168066100, 1565147387000, NULL, NULL);
INSERT INTO "office"."t_trade_stock_quote_last" VALUES (21, 1, '601318', '中国平安', 8369, 8367, 8366, 8365, 8364, 200, 4128, 9300, 2100, 9600, 8370, 8371, 8372, 8373, 8374, 55300, 13000, 16941, 1300, 30100, 8370, 285201, 240015640400, 1565147572000, NULL, NULL);
INSERT INTO "office"."t_trade_stock_quote_last" VALUES (22, 2, '601398', '工商银行', 538, 537, 536, 535, 534, 8667576, 1995700, 2481800, 2689800, 612200, 539, 540, 541, 542, 543, 4700, 4541060, 3001226, 3159583, 2360100, 538, 605526, 32707385500, 1565147570000, NULL, NULL);
INSERT INTO "office"."t_trade_stock_quote_last" VALUES (23, 1, '601318', '中国平安', 8373, 8372, 8371, 8370, 8369, 6700, 8659, 4400, 3600, 8000, 8374, 8375, 8376, 8377, 8378, 50300, 400, 7814, 700, 400, 8374, 288218, 242540875100, 1565147755000, NULL, NULL);
INSERT INTO "office"."t_trade_stock_quote_last" VALUES (24, 2, '601398', '工商银行', 539, 538, 537, 536, 535, 211500, 8653376, 2000400, 2535800, 2702100, 540, 541, 542, 543, 544, 5420760, 3014826, 3130583, 2353200, 3690950, 539, 609443, 32918594900, 1565147753000, NULL, NULL);
INSERT INTO "office"."t_trade_stock_quote_last" VALUES (25, 2, '601398', '工商银行', 539, 538, 537, 536, 535, 456388, 8227676, 2018400, 2546600, 2700900, 540, 541, 542, 543, 544, 4714560, 3018226, 3103583, 2328900, 3695750, 539, 621881, 33589823200, 1565147936000, NULL, NULL);
INSERT INTO "office"."t_trade_stock_quote_last" VALUES (26, 1, '601318', '中国平安', 8380, 8379, 8378, 8377, 8376, 5300, 1400, 3100, 100, 486, 8382, 8383, 8384, 8385, 8386, 3500, 10600, 200, 1900, 3400, 8382, 291904, 245628642100, 1565147938000, NULL, NULL);
INSERT INTO "office"."t_trade_stock_quote_last" VALUES (27, 1, '601318', '中国平安', 8385, 8384, 8383, 8382, 8381, 3592, 500, 25200, 300, 1300, 8388, 8389, 8390, 8391, 8392, 2600, 6500, 1100, 6200, 37800, 8388, 295750, 248854487700, 1565148118000, NULL, NULL);
INSERT INTO "office"."t_trade_stock_quote_last" VALUES (28, 2, '601398', '工商银行', 539, 538, 537, 536, 535, 614646, 8227276, 2018600, 2551000, 2704300, 540, 541, 542, 543, 544, 4906960, 3014126, 3188183, 2370400, 3752250, 539, 625612, 33791039700, 1565148122000, NULL, NULL);
INSERT INTO "office"."t_trade_stock_quote_last" VALUES (29, 2, '601398', '工商银行', 539, 538, 537, 536, 535, 315625, 8264676, 2042600, 2564700, 2701600, 540, 541, 542, 543, 544, 4822260, 3013426, 3191283, 2372300, 3749250, 540, 629450, 33998015600, 1565148305000, NULL, NULL);
INSERT INTO "office"."t_trade_stock_quote_last" VALUES (30, 1, '601318', '中国平安', 8378, 8377, 8376, 8375, 8374, 2500, 5600, 6530, 12500, 1600, 8380, 8383, 8384, 8385, 8386, 13, 4132, 52400, 25800, 1200, 8380, 299615, 252094982400, 1565148304000, NULL, NULL);
INSERT INTO "office"."t_trade_stock_quote_last" VALUES (31, 2, '601398', '工商银行', 539, 538, 537, 536, 535, 459185, 8302676, 2031700, 2549600, 2711800, 540, 541, 542, 543, 544, 4022160, 3015926, 3187783, 2377300, 3749250, 540, 639986, 34566723400, 1565148488000, NULL, NULL);
INSERT INTO "office"."t_trade_stock_quote_last" VALUES (32, 1, '601318', '中国平安', 8377, 8374, 8373, 8372, 8371, 17200, 4200, 1700, 33472, 5800, 8379, 8380, 8381, 8383, 8384, 20400, 32800, 20300, 400, 30400, 8377, 303370, 255239293600, 1565148487000, NULL, NULL);
INSERT INTO "office"."t_trade_stock_quote_last" VALUES (33, 1, '601318', '中国平安', 8380, 8379, 8378, 8377, 8376, 6500, 3400, 9500, 1000, 200, 8381, 8382, 8383, 8384, 8385, 4600, 100, 400, 30400, 20200, 8380, 305287, 256844954000, 1565148600000, NULL, NULL);
INSERT INTO "office"."t_trade_stock_quote_last" VALUES (34, 2, '601398', '工商银行', 539, 538, 537, 536, 535, 674951, 8294076, 2108800, 2569600, 2712000, 540, 541, 542, 543, 544, 3898860, 3015726, 3196983, 2363200, 3752250, 540, 641833, 34666386600, 1565148600000, NULL, NULL);
INSERT INTO "office"."t_trade_stock_quote_last" VALUES (35, 2, '601398', '工商银行', 539, 538, 537, 536, 535, 475255, 6351500, 2050800, 2121500, 2683600, 540, 541, 542, 543, 544, 399583, 2075664, 2304694, 1889000, 2907050, 539, 1121974, 60581540300, 1565161200000, NULL, NULL);
INSERT INTO "office"."t_trade_stock_quote_last" VALUES (36, 1, '601318', '中国平安', 8346, 8345, 8344, 8343, 8342, 4400, 3200, 200, 2000, 22436, 8347, 8348, 8349, 8350, 8351, 52844, 51225, 132300, 57200, 4000, 8347, 532355, 447010731600, 1565161200000, NULL, NULL);
INSERT INTO "office"."t_trade_stock_quote_last" VALUES (37, 1, '601318', '中国平安', 8434, 8433, 8432, 8431, 8430, 78116, 24100, 4600, 10700, 22100, 8435, 8436, 8437, 8438, 8439, 110444, 24100, 13600, 26100, 24600, 8435, 449361, 380036268500, 1565334000000, NULL, NULL);
INSERT INTO "office"."t_trade_stock_quote_last" VALUES (38, 2, '601398', '工商银行', 545, 544, 543, 542, 541, 1215400, 835400, 3000700, 1084700, 856100, 546, 547, 548, 549, 550, 922312, 1606900, 3521300, 1748700, 2449669, 546, 1509768, 82456230800, 1565334007000, NULL, NULL);
INSERT INTO "office"."t_trade_stock_quote_last" VALUES (39, 1, '601318', '中国平安', 8565, 8564, 8560, 8559, 8558, 1500, 48925, 10800, 1600, 1000, 8566, 8567, 8568, 8569, 8570, 21700, 19800, 96700, 10000, 20635, 8566, 192805, 163781155100, 1565577058, NULL, NULL);
INSERT INTO "office"."t_trade_stock_quote_last" VALUES (40, 2, '601398', '工商银行', 548, 547, 546, 545, 544, 2225260, 1976900, 3403700, 3053233, 1696500, 549, 550, 551, 552, 553, 2043173, 4212890, 3164245, 2436000, 2120100, 549, 406923, 22267268800, 1565577093, NULL, NULL);
INSERT INTO "office"."t_trade_stock_quote_last" VALUES (41, 1, '601318', '中国平安', 8559, 8557, 8556, 8555, 8553, 1200, 37700, 4000, 8700, 500, 8560, 8561, 8562, 8563, 8564, 5600, 200, 100, 4800, 12000, 8559, 204153, 173491574500, 1565577238, NULL, NULL);
INSERT INTO "office"."t_trade_stock_quote_last" VALUES (42, 2, '601398', '工商银行', 548, 547, 546, 545, 544, 1387026, 1996300, 3467700, 3047233, 1730000, 549, 550, 551, 552, 553, 2615873, 4283390, 3179745, 2502000, 2131100, 548, 418180, 22884316000, 1565577369, NULL, NULL);
INSERT INTO "office"."t_trade_stock_quote_last" VALUES (43, 1, '601318', '中国平安', 8552, 8551, 8550, 8549, 8548, 100, 9997, 10000, 300, 1000, 8553, 8554, 8555, 8556, 8557, 400, 800, 3800, 5600, 11000, 8553, 212661, 180766730800, 1565577421, NULL, NULL);
INSERT INTO "office"."t_trade_stock_quote_last" VALUES (44, 2, '601398', '工商银行', 548, 547, 546, 545, 544, 657026, 2113800, 3472800, 3052133, 1728200, 549, 550, 551, 552, 553, 3511380, 4365290, 3203445, 2509800, 2168400, 548, 427760, 23409429400, 1565577555, NULL, NULL);
INSERT INTO "office"."t_trade_stock_quote_last" VALUES (45, 1, '601318', '中国平安', 8553, 8552, 8551, 8550, 8549, 1900, 20874, 100, 15200, 5700, 8554, 8555, 8556, 8557, 8558, 6600, 58400, 19300, 18100, 14745, 8553, 220902, 187818958400, 1565577607, NULL, NULL);
INSERT INTO "office"."t_trade_stock_quote_last" VALUES (46, 2, '601398', '工商银行', 548, 547, 546, 545, 544, 2724192, 2136600, 4398300, 3048233, 1720100, 549, 550, 551, 552, 553, 3519392, 4398890, 3217745, 2498700, 2173400, 549, 432606, 23675050500, 1565577741, NULL, NULL);
INSERT INTO "office"."t_trade_stock_quote_last" VALUES (47, 1, '601318', '中国平安', 8528, 8527, 8526, 8525, 8524, 900, 800, 800, 1300, 400, 8530, 8531, 8532, 8533, 8535, 37200, 4600, 5400, 44600, 3100, 8528, 225822, 192019882600, 1565577790, NULL, NULL);
INSERT INTO "office"."t_trade_stock_quote_last" VALUES (48, 2, '601398', '工商银行', 548, 547, 546, 545, 544, 2521348, 2138000, 4408900, 3042233, 1704000, 549, 550, 551, 552, 553, 3555292, 4387490, 3219145, 2524300, 2201300, 549, 436600, 23894018200, 1565577924, NULL, NULL);
INSERT INTO "office"."t_trade_stock_quote_last" VALUES (49, 1, '601318', '中国平安', 8516, 8515, 8514, 8513, 8512, 32800, 27300, 3400, 9217, 11100, 8517, 8518, 8519, 8520, 8521, 7600, 700, 700, 52000, 3100, 8517, 231336, 196716485700, 1565577976, NULL, NULL);
INSERT INTO "office"."t_trade_stock_quote_last" VALUES (50, 2, '601398', '工商银行', 548, 547, 546, 545, 544, 3904348, 2186900, 4414400, 3105633, 1714800, 549, 550, 551, 552, 553, 3357692, 4392090, 3221045, 2528500, 2199900, 549, 442068, 24193920400, 1565578107, NULL, NULL);
INSERT INTO "office"."t_trade_stock_quote_last" VALUES (51, 1, '601318', '中国平安', 8522, 8520, 8519, 8518, 8517, 300, 5800, 600, 3000, 32600, 8523, 8525, 8527, 8528, 8529, 3100, 800, 200, 8500, 2200, 8522, 235318, 200108220600, 1565578162, NULL, NULL);
INSERT INTO "office"."t_trade_stock_quote_last" VALUES (52, 2, '601398', '工商银行', 548, 547, 546, 545, 544, 3370803, 2190300, 4421600, 3099233, 1709800, 549, 550, 551, 552, 553, 3423592, 4391290, 3257645, 2581000, 2169900, 549, 448756, 24560560000, 1565578290, NULL, NULL);
INSERT INTO "office"."t_trade_stock_quote_last" VALUES (53, 1, '601318', '中国平安', 8513, 8512, 8511, 8510, 8509, 8417, 43800, 7700, 14200, 13900, 8514, 8515, 8516, 8517, 8518, 800, 40500, 1700, 600, 4600, 8513, 238970, 203218059600, 1565578345, NULL, NULL);
INSERT INTO "office"."t_trade_stock_quote_last" VALUES (54, 2, '601398', '工商银行', 548, 547, 546, 545, 544, 3222659, 2207600, 4433900, 3107133, 1711900, 549, 550, 551, 552, 553, 3645392, 4429490, 3264145, 2585100, 2171900, 548, 451625, 24717819300, 1565578479, NULL, NULL);
INSERT INTO "office"."t_trade_stock_quote_last" VALUES (55, 1, '601318', '中国平安', 8519, 8518, 8517, 8516, 8515, 1000, 11300, 5500, 10500, 3500, 8520, 8522, 8523, 8525, 8526, 38531, 2100, 2800, 65200, 300, 8520, 244256, 207720450500, 1565578531, NULL, NULL);
INSERT INTO "office"."t_trade_stock_quote_last" VALUES (56, 2, '601398', '工商银行', 548, 547, 546, 545, 544, 2884559, 2221600, 4427000, 3151233, 1714200, 549, 550, 551, 552, 553, 3715492, 4402790, 3358545, 2623200, 2172200, 548, 456712, 24996710800, 1565578665, NULL, NULL);
INSERT INTO "office"."t_trade_stock_quote_last" VALUES (57, 1, '601318', '中国平安', 8513, 8512, 8511, 8510, 8509, 3017, 35200, 57200, 19100, 13300, 8514, 8515, 8516, 8517, 8519, 4300, 16107, 22800, 1000, 2700, 8513, 247572, 210546228800, 1565578717, NULL, NULL);
INSERT INTO "office"."t_trade_stock_quote_last" VALUES (58, 2, '601398', '工商银行', 547, 546, 545, 544, 543, 2369138, 4542200, 3152733, 1706000, 1033400, 548, 549, 550, 551, 552, 54885, 3456792, 4272190, 3441845, 2626200, 547, 482865, 26430566000, 1565578851, NULL, NULL);
INSERT INTO "office"."t_trade_stock_quote_last" VALUES (59, 1, '601318', '中国平安', 8514, 8513, 8512, 8511, 8510, 20958, 11442, 32500, 58500, 23100, 8515, 8516, 8518, 8519, 8520, 900, 51200, 200, 600, 6700, 8515, 249673, 212335340100, 1565578903, NULL, NULL);
INSERT INTO "office"."t_trade_stock_quote_last" VALUES (60, 1, '601318', '中国平安', 8521, 8520, 8519, 8518, 8517, 200, 2800, 2100, 100, 2700, 8522, 8523, 8524, 8525, 8526, 6200, 14500, 1100, 6100, 1300, 8522, 252805, 215003485700, 1565579086, NULL, NULL);
INSERT INTO "office"."t_trade_stock_quote_last" VALUES (61, 2, '601398', '工商银行', 548, 547, 546, 545, 544, 1130615, 2786738, 4560000, 3169333, 1708100, 549, 550, 551, 552, 553, 3423792, 4212490, 3442645, 2634200, 2194600, 548, 487615, 26690890900, 1565579031, NULL, NULL);
INSERT INTO "office"."t_trade_stock_quote_last" VALUES (62, 1, '601318', '中国平安', 8523, 8522, 8521, 8520, 8519, 1124, 500, 1300, 2912, 2600, 8524, 8525, 8526, 8527, 8528, 8800, 33600, 1400, 500, 6000, 8524, 255985, 217713696400, 1565579272, NULL, NULL);
INSERT INTO "office"."t_trade_stock_quote_last" VALUES (63, 2, '601398', '工商银行', 548, 547, 546, 545, 544, 1020015, 2869038, 4581800, 3193533, 1733500, 549, 550, 551, 552, 553, 3454392, 4220090, 3521145, 2631000, 2199600, 548, 490404, 26843841500, 1565579221, NULL, NULL);
INSERT INTO "office"."t_trade_stock_quote_last" VALUES (64, 2, '601398', '工商银行', 548, 547, 546, 545, 544, 73873, 2886538, 4602400, 3231133, 1733500, 549, 550, 551, 552, 553, 3537692, 4234990, 3513645, 2617500, 2196800, 548, 495899, 27145084800, 1565579406, NULL, NULL);
INSERT INTO "office"."t_trade_stock_quote_last" VALUES (65, 1, '601318', '中国平安', 8520, 8519, 8518, 8517, 8516, 1900, 32900, 25600, 4800, 29400, 8521, 8522, 8523, 8524, 8525, 12800, 2900, 2400, 54800, 33400, 8521, 257719, 219190694500, 1565579458, NULL, NULL);
INSERT INTO "office"."t_trade_stock_quote_last" VALUES (66, 2, '601398', '工商银行', 548, 547, 546, 545, 544, 40300, 3343838, 4616000, 3227633, 1734300, 549, 550, 551, 552, 553, 3301219, 4216590, 3497545, 2617500, 2196800, 548, 501446, 27449135400, 1565579589, NULL, NULL);
INSERT INTO "office"."t_trade_stock_quote_last" VALUES (67, 1, '601318', '中国平安', 8527, 8526, 8525, 8523, 8522, 300, 12700, 1600, 500, 2600, 8528, 8529, 8530, 8531, 8532, 49900, 9200, 46900, 400, 800, 8528, 262326, 223117093400, 1565579638, NULL, NULL);
INSERT INTO "office"."t_trade_stock_quote_last" VALUES (68, 2, '601398', '工商银行', 547, 546, 545, 544, 543, 3348438, 4630200, 3238333, 1735100, 971200, 548, 549, 550, 551, 552, 149967, 3443219, 4214990, 3499145, 2625000, 547, 511445, 27996998600, 1565579775, NULL, NULL);
INSERT INTO "office"."t_trade_stock_quote_last" VALUES (69, 1, '601318', '中国平安', 8528, 8527, 8526, 8525, 8522, 8600, 8700, 5800, 200, 2700, 8529, 8530, 8531, 8532, 8533, 4300, 400, 500, 5488, 44100, 8529, 265185, 225555497400, 1565579824, NULL, NULL);
INSERT INTO "office"."t_trade_stock_quote_last" VALUES (70, 2, '601398', '工商银行', 548, 547, 546, 545, 544, 21500, 3281838, 4668200, 3241833, 1735300, 549, 550, 551, 552, 553, 3179519, 4212890, 3503545, 2622200, 2200000, 549, 519298, 28427532600, 1565579958, NULL, NULL);
INSERT INTO "office"."t_trade_stock_quote_last" VALUES (71, 1, '601318', '中国平安', 8538, 8537, 8536, 8535, 8534, 3800, 2500, 10300, 36000, 5500, 8539, 8540, 8541, 8542, 8543, 900, 54500, 500, 19700, 2700, 8539, 269810, 229502842200, 1565580010, NULL, NULL);
INSERT INTO "office"."t_trade_stock_quote_last" VALUES (72, 2, '601398', '工商银行', 547, 546, 545, 544, 543, 3266538, 4662900, 3242633, 1735000, 974400, 548, 549, 550, 551, 552, 65600, 3125019, 4236690, 3501845, 2644000, 547, 522709, 28614440400, 1565580141, NULL, NULL);
INSERT INTO "office"."t_trade_stock_quote_last" VALUES (73, 1, '601318', '中国平安', 8537, 8536, 8535, 8534, 8533, 10500, 26000, 29000, 5500, 300, 8538, 8539, 8540, 8542, 8543, 11900, 13700, 4700, 1700, 5400, 8537, 274241, 233286939700, 1565580196, NULL, NULL);
INSERT INTO "office"."t_trade_stock_quote_last" VALUES (74, 2, '601398', '工商银行', 547, 546, 545, 544, 543, 3243401, 4647400, 3236333, 1737300, 975600, 548, 549, 550, 551, 552, 82400, 3169419, 4253790, 3503845, 2644000, 547, 524894, 28734102500, 1565580330, NULL, NULL);
INSERT INTO "office"."t_trade_stock_quote_last" VALUES (75, 1, '601318', '中国平安', 8537, 8536, 8535, 8534, 8533, 4250, 9500, 2500, 1000, 20600, 8538, 8539, 8540, 8541, 8542, 24126, 11200, 8600, 1200, 1600, 8538, 277062, 235695594900, 1565580379, NULL, NULL);
INSERT INTO "office"."t_trade_stock_quote_last" VALUES (76, 2, '601398', '工商银行', 548, 547, 546, 545, 544, 179900, 3221801, 4678500, 3200033, 1747300, 549, 550, 551, 552, 553, 3088607, 4249090, 3501245, 2650800, 2191300, 548, 527491, 28876441400, 1565580513, NULL, NULL);
INSERT INTO "office"."t_trade_stock_quote_last" VALUES (77, 1, '601318', '中国平安', 8548, 8547, 8546, 8545, 8544, 74700, 3800, 13455, 6400, 91600, 8549, 8550, 8551, 8552, 8553, 29500, 125500, 4100, 12100, 3200, 8549, 281854, 239790117300, 1565580565, NULL, NULL);
INSERT INTO "office"."t_trade_stock_quote_last" VALUES (78, 2, '601398', '工商银行', 548, 547, 546, 545, 544, 194800, 3267201, 4686200, 3203733, 1749100, 549, 550, 551, 552, 553, 3065207, 4248990, 3489045, 2650800, 2191300, 549, 528548, 28934459900, 1565580600, NULL, NULL);
INSERT INTO "office"."t_trade_stock_quote_last" VALUES (79, 1, '601318', '中国平安', 8552, 8551, 8550, 8549, 8548, 43100, 1200, 66800, 6400, 59800, 8553, 8554, 8555, 8556, 8557, 8000, 8800, 83800, 15400, 4300, 8552, 283859, 241504363000, 1565580600, NULL, NULL);
INSERT INTO "office"."t_trade_stock_quote_last" VALUES (80, 1, '601318', '中国平安', 8845, 8844, 8843, 8842, 8841, 92927, 22100, 27500, 38421, 4830, 8846, 8847, 8848, 8849, 8850, 95774, 52600, 109900, 89200, 539731, 8845, 837354, 736028461100, 1566198000, NULL, NULL);
INSERT INTO "office"."t_trade_stock_quote_last" VALUES (81, 1, '601318', '中国平安', 8790, 8788, 8787, 8786, 8785, 16581, 8300, 1900, 3100, 6700, 8791, 8792, 8793, 8794, 8795, 6000, 22480, 4600, 3300, 17000, 8791, 296929, 261150179600, 1566271080, NULL, NULL);
INSERT INTO "office"."t_trade_stock_quote_last" VALUES (82, 2, '601398', '工商银行', 547, 546, 545, 544, 543, 4502993, 3715566, 3215000, 2493800, 3478878, 548, 549, 550, 551, 552, 2689692, 3279370, 4105408, 792100, 842900, 547, 3309679, 179781297500, 1566198000, NULL, NULL);
INSERT INTO "office"."t_trade_stock_quote_last" VALUES (83, 2, '601398', '工商银行', 541, 540, 539, 538, 537, 8908354, 13705700, 7543300, 7426300, 3356800, 542, 543, 544, 545, 546, 539400, 7568979, 2512990, 4605980, 2952658, 542, 1376011, 74621220500, 1566271078, NULL, NULL);
INSERT INTO "office"."t_trade_stock_quote_last" VALUES (84, 1, '601318', '中国平安', 8779, 8778, 8777, 8775, 8774, 200, 10400, 500, 1300, 2400, 8780, 8783, 8784, 8785, 8786, 500, 2200, 1000, 3810, 200, 8779, 299111, 263067028900, 1566271260, NULL, NULL);
INSERT INTO "office"."t_trade_stock_quote_last" VALUES (85, 2, '601398', '工商银行', 541, 540, 539, 538, 537, 9504554, 13337200, 7769400, 7487500, 3418100, 542, 543, 544, 545, 546, 85700, 7570879, 2515690, 4614480, 2983558, 541, 1389579, 75356046200, 1566271261, NULL, NULL);
INSERT INTO "office"."t_trade_stock_quote_last" VALUES (86, 1, '601318', '中国平安', 8780, 8779, 8778, 8777, 8776, 47900, 700, 1200, 5500, 11100, 8781, 8782, 8783, 8785, 8786, 200, 500, 1300, 4110, 200, 8780, 301239, 264935005500, 1566271443, NULL, NULL);
INSERT INTO "office"."t_trade_stock_quote_last" VALUES (87, 2, '601398', '工商银行', 541, 540, 539, 538, 537, 9633754, 13461400, 7797400, 7530500, 3415500, 543, 544, 545, 546, 547, 7600579, 2548390, 4614280, 2984758, 3347300, 543, 1398023, 75813615600, 1566271444, NULL, NULL);
INSERT INTO "office"."t_trade_stock_quote_last" VALUES (88, 1, '601318', '中国平安', 8778, 8777, 8776, 8775, 8774, 44800, 7300, 9500, 21800, 30900, 8779, 8780, 8782, 8783, 8784, 39000, 2400, 1000, 700, 10791, 8778, 303627, 267031277800, 1566271626, NULL, NULL);
INSERT INTO "office"."t_trade_stock_quote_last" VALUES (89, 2, '601398', '工商银行', 541, 540, 539, 538, 537, 10664454, 13785400, 7783300, 7513200, 3470000, 542, 543, 544, 545, 546, 27000, 7539779, 2537090, 4648480, 2991958, 541, 1408884, 76401893300, 1566271627, NULL, NULL);
INSERT INTO "office"."t_trade_stock_quote_last" VALUES (90, 1, '601318', '中国平安', 8778, 8777, 8776, 8775, 8774, 2600, 2500, 11500, 45400, 31500, 8779, 8780, 8781, 8782, 8783, 1000, 10300, 14300, 3200, 11000, 8779, 306859, 269868861200, 1566271800, NULL, NULL);
INSERT INTO "office"."t_trade_stock_quote_last" VALUES (91, 2, '601398', '工商银行', 542, 541, 540, 539, 538, 3100, 9610654, 13953000, 7788000, 7652000, 543, 544, 545, 546, 547, 7294579, 2506590, 4644880, 2993858, 3317300, 542, 1419387, 76971022200, 1566271799, NULL, NULL);
INSERT INTO "office"."t_trade_stock_quote_last" VALUES (92, 1, '601318', '中国平安', 8776, 8775, 8774, 8773, 8771, 600, 3100, 4600, 700, 1000, 8777, 8781, 8782, 8783, 8784, 20100, 1400, 4100, 14700, 4400, 8777, 138430, 121395466900, 1566355918, NULL, NULL);
INSERT INTO "office"."t_trade_stock_quote_last" VALUES (93, 2, '601398', '工商银行', 542, 541, 540, 539, 538, 7939876, 9021501, 14235042, 8470500, 11491700, 543, 544, 545, 546, 547, 6479671, 5284300, 5344023, 4103344, 2781000, 542, 389129, 21074452700, 1566355857, NULL, NULL);
INSERT INTO "office"."t_trade_stock_quote_last" VALUES (94, 4, '000333', '美的集团', 5151, 5150, 5149, 5148, 5147, 48285, 7461, 2200, 400, 2800, 5152, 5153, 5154, 5155, 5156, 11357, 12500, 13600, 22700, 7100, 5151, 80153, 41166789633, 1566356088, NULL, NULL);
INSERT INTO "office"."t_trade_stock_quote_last" VALUES (95, 2, '601398', '工商银行', 542, 541, 540, 539, 538, 10602186, 8349801, 14286942, 8462200, 11447600, 543, 544, 545, 546, 547, 6241371, 5289400, 5352823, 4135544, 2841400, 543, 404127, 21887763500, 1566356058, NULL, NULL);
INSERT INTO "office"."t_trade_stock_quote_last" VALUES (96, 4, '000333', '美的集团', 5157, 5156, 5155, 5154, 5151, 5400, 8200, 2700, 500, 2900, 5158, 5162, 5163, 5164, 5165, 100, 200, 11000, 3000, 6300, 5162, 84994, 43664071392, 1566356394, NULL, NULL);
INSERT INTO "office"."t_trade_stock_quote_last" VALUES (97, 1, '601318', '中国平安', 8787, 8786, 8785, 8781, 8780, 800, 4200, 22884, 1500, 1600, 8788, 8789, 8790, 8791, 8792, 11099, 9900, 51400, 16100, 5300, 8787, 142728, 125167935600, 1566356122, NULL, NULL);
INSERT INTO "office"."t_trade_stock_quote_last" VALUES (98, 1, '601318', '中国平安', 8791, 8790, 8789, 8788, 8787, 5900, 8201, 8400, 4200, 9100, 8792, 8793, 8794, 8795, 8796, 1000, 6100, 17500, 33100, 12200, 8791, 146865, 128804716200, 1566356338, NULL, NULL);
INSERT INTO "office"."t_trade_stock_quote_last" VALUES (99, 2, '601398', '工商银行', 542, 541, 540, 539, 538, 11799286, 8393701, 14166742, 7383900, 11423500, 543, 544, 545, 546, 547, 5340471, 5412600, 5419423, 4173944, 2879100, 542, 448481, 24294141600, 1566356494, NULL, NULL);
INSERT INTO "office"."t_trade_stock_quote_last" VALUES (100, 1, '601318', '中国平安', 8788, 8786, 8785, 8781, 8780, 300, 35701, 22884, 1700, 2000, 8789, 8790, 8791, 8792, 8793, 300, 500, 700, 18200, 27300, 8789, 151842, 133178116700, 1566356518, NULL, NULL);
INSERT INTO "office"."t_trade_stock_quote_last" VALUES (101, 4, '000333', '美的集团', 5160, 5158, 5157, 5155, 5154, 29000, 11000, 42776, 100, 400, 5161, 5162, 5163, 5164, 5165, 5400, 300, 3700, 6200, 7800, 5161, 86614, 44500058218, 1566356586, NULL, NULL);
INSERT INTO "office"."t_trade_stock_quote_last" VALUES (102, 1, '601318', '中国平安', 8793, 8792, 8790, 8789, 8788, 2600, 1700, 3300, 7100, 4500, 8794, 8795, 8796, 8797, 8798, 1700, 34200, 12500, 27700, 36100, 8794, 154153, 135209656600, 1566356704, NULL, NULL);
INSERT INTO "office"."t_trade_stock_quote_last" VALUES (103, 2, '601398', '工商银行', 542, 541, 540, 539, 538, 11807586, 8552701, 14191642, 7357300, 11407500, 543, 544, 545, 546, 547, 5345471, 5632300, 5324723, 4213444, 2949300, 542, 457451, 24781135900, 1566356704, NULL, NULL);
INSERT INTO "office"."t_trade_stock_quote_last" VALUES (104, 4, '000333', '美的集团', 5169, 5168, 5167, 5166, 5165, 40102, 108000, 5100, 18500, 6900, 5170, 5171, 5172, 5173, 5174, 7800, 2500, 5700, 10200, 24047, 5169, 210180, 108545921774, 1566370803, NULL, NULL);
INSERT INTO "office"."t_trade_stock_quote_last" VALUES (105, 1, '601318', '中国平安', 8772, 8771, 8770, 8769, 8768, 43400, 41600, 52300, 7705, 10500, 8773, 8774, 8775, 8776, 8777, 65875, 3099, 11100, 8100, 15800, 8773, 335320, 294381492800, 1566370800, NULL, NULL);
INSERT INTO "office"."t_trade_stock_quote_last" VALUES (106, 2, '601398', '工商银行', 543, 542, 541, 540, 539, 935400, 4975200, 7430600, 10466400, 3716000, 544, 545, 546, 547, 548, 5676123, 5581300, 3952044, 2569500, 2941400, 543, 1058217, 57383180500, 1566370804, NULL, NULL);
INSERT INTO "office"."t_trade_stock_quote_last" VALUES (107, 4, '000333', '美的集团', 5153, 5152, 5151, 5150, 5149, 5114, 11672, 16000, 34155, 3900, 5154, 5155, 5157, 5158, 5160, 18453, 700, 4100, 10000, 4005, 5154, 44096, 22908080467, 1566438936, NULL, NULL);
INSERT INTO "office"."t_trade_stock_quote_last" VALUES (108, 1, '601318', '中国平安', 8777, 8770, 8769, 8768, 8767, 64300, 3900, 20400, 10900, 6200, 8778, 8779, 8780, 8781, 8782, 900, 10100, 19800, 700, 100, 8777, 71945, 63187258500, 1566438868, NULL, NULL);
INSERT INTO "office"."t_trade_stock_quote_last" VALUES (109, 2, '601398', '工商银行', 540, 539, 538, 537, 536, 7606086, 5949000, 6773500, 1307600, 1688100, 541, 542, 543, 544, 545, 1077700, 4883092, 4453609, 4764700, 3533601, 540, 353612, 19134457800, 1566438885, NULL, NULL);
INSERT INTO "office"."t_trade_stock_quote_last" VALUES (110, 1, '601318', '中国平安', 8765, 8763, 8762, 8761, 8760, 15000, 3400, 1500, 192300, 23965, 8768, 8769, 8770, 8774, 8775, 6000, 30600, 22700, 1000, 12700, 8763, 79724, 70005434400, 1566439051, NULL, NULL);
INSERT INTO "office"."t_trade_stock_quote_last" VALUES (111, 4, '000333', '美的集团', 5159, 5158, 5156, 5155, 5154, 1800, 500, 200, 700, 4300, 5161, 5167, 5169, 5170, 5171, 300, 140905, 3800, 8030, 800, 5161, 53556, 27777417633, 1566439470, NULL, NULL);
INSERT INTO "office"."t_trade_stock_quote_last" VALUES (112, 1, '601318', '中国平安', 8753, 8752, 8751, 8750, 8749, 6100, 11200, 37533, 112397, 9500, 8760, 8761, 8762, 8763, 8764, 4100, 1500, 900, 4400, 17500, 8753, 98830, 86739979000, 1566439432, NULL, NULL);
INSERT INTO "office"."t_trade_stock_quote_last" VALUES (113, 2, '601398', '工商银行', 540, 539, 538, 537, 536, 6649896, 6372600, 6922000, 1435400, 1774500, 541, 542, 543, 544, 545, 1017300, 5049092, 4490909, 4667800, 3639601, 540, 374571, 20266661600, 1566439083, NULL, NULL);
INSERT INTO "office"."t_trade_stock_quote_last" VALUES (114, 2, '601398', '工商银行', 540, 539, 538, 537, 536, 7670787, 6750200, 7386800, 1598500, 1893900, 541, 542, 543, 544, 545, 4552300, 5264092, 4642100, 4727600, 3505401, 541, 403893, 21851022800, 1566439461, NULL, NULL);
INSERT INTO "office"."t_trade_stock_quote_last" VALUES (115, 4, '000333', '美的集团', 5225, 5224, 5223, 5222, 5221, 23410, 8200, 55900, 5700, 11700, 5226, 5227, 5228, 5229, 5230, 100, 8300, 10461, 6600, 18632, 5225, 217677, 113761913789, 1566543603, NULL, NULL);
INSERT INTO "office"."t_trade_stock_quote_last" VALUES (116, 1, '601318', '中国平安', 8988, 8987, 8986, 8985, 8984, 18900, 7700, 5300, 11100, 72800, 8989, 8990, 8991, 8992, 8993, 259189, 37100, 50400, 12500, 146200, 8989, 885689, 793003640700, 1566543600, NULL, NULL);
INSERT INTO "office"."t_trade_stock_quote_last" VALUES (117, 2, '601398', '工商银行', 541, 540, 539, 538, 537, 3554915, 5235600, 4239900, 4757400, 1815500, 542, 543, 544, 545, 546, 158008, 8002222, 5857600, 5759501, 3391325, 542, 1263582, 68368453200, 1566543609, NULL, NULL);
INSERT INTO "office"."t_trade_stock_quote_last" VALUES (118, 4, '000333', '美的集团', 5104, 5103, 5102, 5101, 5100, 844, 2300, 12100, 400, 19100, 5105, 5106, 5107, 5108, 5109, 1500, 10400, 3300, 1100, 9800, 5104, 275970, 140834805136, 1566802803, NULL, NULL);
INSERT INTO "office"."t_trade_stock_quote_last" VALUES (119, 1, '601318', '中国平安', 8749, 8748, 8747, 8746, 8745, 11300, 700, 10700, 4400, 85300, 8750, 8751, 8752, 8754, 8755, 4464, 8800, 3600, 100, 50600, 8750, 990268, 870177332900, 1566802800, NULL, NULL);
INSERT INTO "office"."t_trade_stock_quote_last" VALUES (120, 2, '601398', '工商银行', 538, 537, 536, 535, 534, 460200, 3121032, 13979051, 7700400, 1887400, 539, 540, 541, 542, 543, 5391000, 4747120, 2626818, 4087190, 2622100, 538, 1390794, 74756838400, 1566802816, NULL, NULL);
INSERT INTO "office"."t_trade_stock_quote_last" VALUES (121, 4, '000333', '美的集团', 5277, 5276, 5275, 5274, 5273, 2700, 7700, 52967, 79700, 56700, 5278, 5279, 5280, 5281, 5282, 64466, 26100, 85100, 25000, 14200, 5278, 278271, 146600686706, 1567148403, NULL, NULL);
INSERT INTO "office"."t_trade_stock_quote_last" VALUES (122, 1, '601318', '中国平安', 8731, 8730, 8729, 8728, 8726, 7700, 23800, 200, 100, 600, 8732, 8733, 8734, 8735, 8736, 55240, 52500, 1800, 4100, 10500, 8732, 564655, 493284195600, 1567148400, NULL, NULL);
INSERT INTO "office"."t_trade_stock_quote_last" VALUES (123, 2, '601398', '工商银行', 539, 538, 537, 536, 535, 444083, 9733100, 2851000, 2287200, 1287900, 540, 541, 542, 543, 544, 2982822, 4390924, 2861050, 6201031, 10840670, 539, 1528963, 82677523300, 1567148400, NULL, NULL);
INSERT INTO "office"."t_trade_stock_quote_last" VALUES (124, 4, '000333', '美的集团', 5207, 5206, 5205, 5204, 5203, 1900, 12300, 5500, 2400, 8955, 5208, 5209, 5210, 5211, 5212, 64800, 47300, 39600, 11100, 11500, 5207, 207246, 107985883409, 1569308403, NULL, NULL);
INSERT INTO "office"."t_trade_stock_quote_last" VALUES (125, 1, '601318', '中国平安', 8895, 8894, 8893, 8892, 8891, 57758, 11200, 9935, 79600, 5600, 8896, 8897, 8898, 8899, 8900, 31700, 16600, 27200, 16773, 11000, 8895, 405350, 360758886300, 1569308400, NULL, NULL);
INSERT INTO "office"."t_trade_stock_quote_last" VALUES (126, 2, '601398', '工商银行', 549, 548, 547, 546, 545, 1880054, 4385800, 3871307, 3108600, 4956700, 550, 551, 552, 553, 554, 798105, 5883960, 7864206, 5060390, 2945222, 550, 1013885, 55720748800, 1569308405, NULL, NULL);
INSERT INTO "office"."t_trade_stock_quote_last" VALUES (127, 4, '000333', '美的集团', 5321, 5320, 5319, 5318, 5317, 17200, 13200, 5800, 5800, 218500, 5322, 5323, 5324, 5325, 5326, 1900, 5000, 20000, 82900, 20200, 5322, 184568, 98418296947, 1571295603, NULL, NULL);
INSERT INTO "office"."t_trade_stock_quote_last" VALUES (128, 1, '601318', '中国平安', 9172, 9171, 9170, 9169, 9168, 38560, 281100, 84600, 15200, 9700, 9173, 9174, 9175, 9176, 9177, 13600, 57100, 22900, 3200, 20100, 9172, 619425, 567685407900, 1571295600, NULL, NULL);
INSERT INTO "office"."t_trade_stock_quote_last" VALUES (129, 2, '601398', '工商银行', 571, 570, 569, 568, 567, 1466200, 2284600, 2788800, 2486100, 595700, 572, 573, 574, 575, 576, 1921948, 5033805, 3355200, 3845428, 3832126, 571, 706609, 40347449300, 1571295614, NULL, NULL);
INSERT INTO "office"."t_trade_stock_quote_last" VALUES (130, 4, '000333', '美的集团', 5358, 5357, 5356, 5355, 5354, 16100, 12717, 4600, 4500, 13300, 5359, 5360, 5361, 5365, 5366, 138650, 1200, 500, 400, 202800, 5359, 193377, 104051198936, 1572246003, NULL, NULL);
INSERT INTO "office"."t_trade_stock_quote_last" VALUES (131, 1, '601318', '中国平安', 8864, 8863, 8862, 8861, 8860, 40754, 12700, 23500, 86500, 195600, 8865, 8866, 8867, 8868, 8869, 68700, 38700, 34500, 41800, 60600, 8864, 651031, 575248035700, 1572246000, NULL, NULL);
INSERT INTO "office"."t_trade_stock_quote_last" VALUES (132, 2, '601398', '工商银行', 593, 592, 591, 590, 589, 92400, 1292170, 6122672, 5513700, 1703800, 594, 595, 596, 597, 598, 1228500, 2183480, 2050693, 1651121, 1770178, 593, 1707052, 101422488700, 1572246000, NULL, NULL);
INSERT INTO "office"."t_trade_stock_quote_last" VALUES (133, 4, '000333', '美的集团', 5347, 5346, 5345, 5344, 5343, 14790, 16900, 19700, 200, 500, 5349, 5350, 5351, 5352, 5354, 8400, 11400, 1100, 500, 700, 5347, 160286, 85663659444, 1572418803, NULL, NULL);
INSERT INTO "office"."t_trade_stock_quote_last" VALUES (134, 1, '601318', '中国平安', 8795, 8794, 8793, 8792, 8791, 39281, 1900, 29700, 4000, 9400, 8796, 8797, 8798, 8799, 8800, 3000, 17800, 18900, 8900, 25588, 8795, 436516, 384107790000, 1572418800, NULL, NULL);
INSERT INTO "office"."t_trade_stock_quote_last" VALUES (135, 2, '601398', '工商银行', 595, 594, 593, 592, 591, 1844600, 1107100, 1976200, 2175900, 2110410, 596, 597, 598, 599, 600, 596900, 1855145, 7107009, 6651863, 12045386, 595, 1233569, 73377525200, 1572418800, NULL, NULL);
INSERT INTO "office"."t_trade_stock_quote_last" VALUES (136, 4, '000333', '美的集团', 5681, 5680, 5679, 5678, 5677, 21212, 31300, 21600, 16861, 4600, 5682, 5683, 5684, 5685, 5686, 3200, 26700, 44500, 102618, 4600, 5681, 208514, 118526238753, 1575874803, 5660, 5620);
INSERT INTO "office"."t_trade_stock_quote_last" VALUES (137, 1, '601318', '中国平安', 8364, 8361, 8360, 8359, 8358, 6400, 1500, 7000, 3800, 2200, 8365, 8366, 8367, 8368, 8369, 63874, 62000, 83700, 183801, 9200, 8365, 460460, 386286258700, 1575874800, 8476, 8474);
INSERT INTO "office"."t_trade_stock_quote_last" VALUES (138, 2, '601398', '工商银行', 573, 572, 571, 570, 569, 2197588, 3370700, 3737900, 12850700, 3315400, 574, 575, 576, 577, 578, 1273447, 3628942, 4286050, 2897708, 2092000, 574, 1104982, 63208793300, 1575874809, 574, 575);
INSERT INTO "office"."t_trade_stock_quote_last" VALUES (139, 4, '000333', '美的集团', 5964, 5961, 5960, 5959, 5955, 3500, 7400, 4600, 18642, 6900, 5966, 5967, 5968, 5969, 5970, 19416, 67500, 28000, 6800, 80600, 5966, 199813, 119233086822, 1579158003, 6000, 5950);
INSERT INTO "office"."t_trade_stock_quote_last" VALUES (140, 1, '601318', '中国平安', 8555, 8554, 8553, 8552, 8551, 229361, 173600, 20900, 23700, 123200, 8556, 8557, 8558, 8559, 8560, 6101, 1100, 1007600, 200, 5500, 8555, 498579, 428307214700, 1579158000, 8631, 8581);
INSERT INTO "office"."t_trade_stock_quote_last" VALUES (141, 2, '601398', '工商银行', 580, 579, 578, 577, 576, 1103800, 3581400, 3961600, 1471500, 1391100, 581, 582, 583, 584, 585, 3201255, 2784500, 2478396, 2881122, 1483700, 580, 2690313, 157200790300, 1579158020, 587, 588);
INSERT INTO "office"."t_trade_stock_quote_last" VALUES (142, 4, '000333', '美的集团', 5510, 5509, 5508, 5507, 5506, 16279, 800, 1600, 10100, 2500, 5511, 5512, 5513, 5514, 5515, 7700, 900, 200, 300, 2100, 5510, 596536, 331382097894, 1579762803, 5610, 5748);
INSERT INTO "office"."t_trade_stock_quote_last" VALUES (143, 1, '601318', '中国平安', 8348, 8347, 8346, 8345, 8344, 1100, 3300, 2200, 2300, 1900, 8349, 8350, 8351, 8352, 8353, 16146, 83700, 16600, 3500, 27800, 8349, 1080020, 901935401600, 1579762800, 8401, 8522);
INSERT INTO "office"."t_trade_stock_quote_last" VALUES (144, 2, '601398', '工商银行', 572, 571, 570, 569, 568, 2007050, 1624300, 5735947, 2893400, 2629300, 573, 574, 575, 576, 577, 195890, 867200, 1689718, 3094954, 1806489, 572, 2000376, 114623855000, 1579762808, 576, 579);
INSERT INTO "office"."t_trade_stock_quote_last" VALUES (147, 2, '601398', '工商银行', 542, 541, 540, 539, 538, 2913400, 6156095, 13250337, 6875500, 6346400, 543, 544, 545, 546, 547, 2394055, 9347920, 8834465, 7978900, 4974100, 556, 1415764, 76712666300, 1581663607, 540, 541);
INSERT INTO "office"."t_trade_stock_quote_last" VALUES (148, 4, '000333', '美的集团', 5283, 5282, 5281, 5280, 5279, 83967, 19575, 16039, 40310, 5800, 5284, 5285, 5286, 5287, 5288, 1000, 1300, 3300, 7900, 75200, 5283, 344090, 181188295743, 1581058803, 5350, 5379);
INSERT INTO "office"."t_trade_stock_quote_last" VALUES (152, 2, '601398', '工商银行', 544, 543, 542, 541, 540, 844700, 1920850, 2394300, 3778600, 7663210, 545, 546, 547, 548, 549, 3094147, 4605000, 2576500, 2633200, 3096400, 544, 2373189, 128842815800, 1581058800, 547, 550);
INSERT INTO "office"."t_trade_stock_quote_last" VALUES (145, 4, '000333', '美的集团', 5373, 5372, 5371, 5370, 5369, 108400, 241400, 51900, 23700, 16500, 5374, 5375, 5376, 5377, 5378, 10729, 31654, 5300, 7500, 13500, 5386, 210043, 112528155647, 1581663603, 5350, 5380);
INSERT INTO "office"."t_trade_stock_quote_last" VALUES (146, 1, '601318', '中国平安', 8099, 8098, 8097, 8096, 8095, 70800, 55300, 51500, 34300, 235800, 8100, 8101, 8102, 8103, 8104, 281688, 71500, 6900, 4200, 23600, 8097, 428765, 346045925000, 1581663600, 8037, 8045);
INSERT INTO "office"."t_trade_stock_quote_last" VALUES (150, 1, '601318', '中国平安', 8102, 8101, 8100, 8099, 8098, 34100, 84000, 36500, 7000, 12600, 8103, 8104, 8105, 8106, 8107, 73131, 2300, 13100, 500, 2559, 8103, 491630, 396808228900, 1581058800, 8060, 8152);
INSERT INTO "office"."t_trade_stock_quote_last" VALUES (149, 4, '000333', '美的集团', 5440, 5439, 5438, 5437, 5436, 240562, 5200, 10200, 9200, 3600, 5441, 5442, 5443, 5444, 5445, 8900, 51600, 17500, 7800, 14400, 5454, 325052, 175192771534, 1581922803, 5334, 5374);
INSERT INTO "office"."t_trade_stock_quote_last" VALUES (153, 2, '601398', '工商银行', 549, 548, 547, 546, 545, 2550230, 3503905, 3304931, 3928700, 5128496, 550, 551, 552, 553, 554, 10850822, 3601000, 3046500, 1131363, 692200, 563, 2141949, 116911731000, 1581922812, 542, 543);
INSERT INTO "office"."t_trade_stock_quote_last" VALUES (151, 1, '601318', '中国平安', 8239, 8238, 8237, 8236, 8235, 193133, 150200, 29800, 67800, 54200, 8240, 8241, 8242, 8243, 8244, 397300, 23100, 14500, 39600, 20700, 8238, 678118, 554528440700, 1581922802, 8100, 8100);

-- ----------------------------
-- Table structure for t_trade_stock_quote_summary
-- ----------------------------
DROP TABLE IF EXISTS "office"."t_trade_stock_quote_summary";
CREATE TABLE "office"."t_trade_stock_quote_summary" (
    -- "id" int4 NOT NULL DEFAULT nextval('t_trade_stock_quote_summary_id_seq'::regclass),
                                                        "id" serial4 primary key,
                                                        "stockid" int8 NOT NULL,
                                                        "stockcode" varchar(12) COLLATE "pg_catalog"."default" NOT NULL,
                                                        "stockname" varchar(32) COLLATE "pg_catalog"."default" NOT NULL,
                                                        "openprice" int8,
                                                        "closeprice" int8,
                                                        "openpricetime" int8,
                                                        "closepricetime" int8
)
;
COMMENT ON COLUMN "office"."t_trade_stock_quote_summary"."id" IS '主键标识';
COMMENT ON COLUMN "office"."t_trade_stock_quote_summary"."stockid" IS '产品ID';
COMMENT ON COLUMN "office"."t_trade_stock_quote_summary"."stockcode" IS '产品编号';
COMMENT ON COLUMN "office"."t_trade_stock_quote_summary"."stockname" IS '产品名称';
COMMENT ON COLUMN "office"."t_trade_stock_quote_summary"."openprice" IS '开盘价';
COMMENT ON COLUMN "office"."t_trade_stock_quote_summary"."closeprice" IS '收盘价';
COMMENT ON COLUMN "office"."t_trade_stock_quote_summary"."openpricetime" IS '开盘时间';
COMMENT ON COLUMN "office"."t_trade_stock_quote_summary"."closepricetime" IS '收盘时间';
COMMENT ON TABLE "office"."t_trade_stock_quote_summary" IS '股票报价概要表';

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "office"."t_account_warn_notify_message_id_seq"
    OWNED BY "office"."t_account_warn_notify_message"."id";
SELECT setval('"office"."t_account_warn_notify_message_id_seq"', 16, true);
ALTER SEQUENCE "office"."t_account_warn_setting_id_seq"
    OWNED BY "office"."t_account_warn_setting"."id";
SELECT setval('"office"."t_account_warn_setting_id_seq"', 4, true);
ALTER SEQUENCE "office"."t_trade_deal_id_seq"
    OWNED BY "office"."t_trade_deal"."id";
SELECT setval('"office"."t_trade_deal_id_seq"', 2658, true);
ALTER SEQUENCE "office"."t_trade_order_id_seq"
    OWNED BY "office"."t_trade_order"."id";
SELECT setval('"office"."t_trade_order_id_seq"', 2518, true);
ALTER SEQUENCE "office"."t_trade_position_id_seq"
    OWNED BY "office"."t_trade_position"."id";
SELECT setval('"office"."t_trade_position_id_seq"', 16, true);
SELECT setval('"office"."t_trade_stock_kline_1_id_seq"', 4, true);
SELECT setval('"office"."t_trade_stock_kline_5_id_seq"', 2, false);
ALTER SEQUENCE "office"."t_trade_stock_kline_id_seq"
    OWNED BY "office"."t_trade_stock_kline"."id";
SELECT setval('"office"."t_trade_stock_kline_id_seq"', 72, true);
ALTER SEQUENCE "office"."t_trade_stock_quote_last_id_seq"
    OWNED BY "office"."t_trade_stock_quote_last"."id";
SELECT setval('"office"."t_trade_stock_quote_last_id_seq"', 154, true);
ALTER SEQUENCE "office"."t_trade_stock_quote_summary_id_seq"
    OWNED BY "office"."t_trade_stock_quote_summary"."id";
SELECT setval('"office"."t_trade_stock_quote_summary_id_seq"', 2, false);

-- ----------------------------
-- Indexes structure for table t_account_warn_notify_message -- 以下代码暂时不能执行
-- ----------------------------
CREATE INDEX "account_warn_notify_retrytimes" ON "office"."t_account_warn_notify_message" USING btree (
    "retrytimes" "pg_catalog"."int4_ops" ASC NULLS LAST
    );
CREATE INDEX "account_warn_notify_sendstatus" ON "office"."t_account_warn_notify_message" USING btree (
    "sendstatus" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
    );

-- ----------------------------
-- Primary Key structure for table t_account_warn_notify_message 这个不能运行
-- ----------------------------
ALTER TABLE "office"."t_account_warn_notify_message" ADD CONSTRAINT "pk_t_account_warn_notify_messa" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table t_account_warn_setting
-- ----------------------------
CREATE INDEX "account_warn_setting_accountno" ON "office"."t_account_warn_setting" USING btree (
    "accountid" "pg_catalog"."int8_ops" ASC NULLS LAST
    );
CREATE INDEX "account_warn_setting_stockid" ON "office"."t_account_warn_setting" USING btree (
    "stockid" "pg_catalog"."int8_ops" ASC NULLS LAST
    );

-- ----------------------------
-- Primary Key structure for table t_account_warn_setting 这个不能运行
-- ----------------------------
ALTER TABLE "office"."t_account_warn_setting" ADD CONSTRAINT "pk_t_account_warn_setting" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table t_trade_deal
-- ----------------------------
CREATE INDEX "trade_deal_idx_accountid" ON "office"."t_trade_deal" USING btree (
    "accountid" "pg_catalog"."int8_ops" ASC NULLS LAST
    );
CREATE INDEX "trade_deal_idx_orderid" ON "office"."t_trade_deal" USING btree (
    "tradeorderid" "pg_catalog"."int8_ops" ASC NULLS LAST
    );

-- ----------------------------
-- Primary Key structure for table t_trade_deal
-- ----------------------------
ALTER TABLE "office"."t_trade_deal" ADD CONSTRAINT "pk_t_trade_deal" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table t_trade_order
-- ----------------------------
CREATE INDEX "trade_order_idx_account_id" ON "office"."t_trade_order" USING btree (
    "accountid" "pg_catalog"."int8_ops" ASC NULLS LAST
    );
CREATE INDEX "trade_order_idx_stockid" ON "office"."t_trade_order" USING btree (
    "stockid" "pg_catalog"."int8_ops" ASC NULLS LAST
    );

-- ----------------------------
-- Primary Key structure for table t_trade_order
-- ----------------------------
ALTER TABLE "office"."t_trade_order" ADD CONSTRAINT "pk_t_trade_order" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table t_trade_position
-- ----------------------------
CREATE INDEX "trade_position_idx_accountid" ON "office"."t_trade_position" USING btree (
    "accountid" "pg_catalog"."int8_ops" ASC NULLS LAST
    );

-- ----------------------------
-- Primary Key structure for table t_trade_position
-- ----------------------------
ALTER TABLE "office"."t_trade_position" ADD CONSTRAINT "pk_t_trade_position" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table t_trade_stock_kline
-- ----------------------------
CREATE INDEX "trade_stock_kline_idx_stockid" ON "office"."t_trade_stock_kline" USING btree (
    "stockid" "pg_catalog"."int8_ops" ASC NULLS LAST
    );

-- ----------------------------
-- Primary Key structure for table t_trade_stock_kline
-- ----------------------------
ALTER TABLE "office"."t_trade_stock_kline" ADD CONSTRAINT "pk_t_trade_stock_kline" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table t_trade_stock_kline_1
-- ----------------------------
CREATE INDEX "trade_stock_kline1_idx_stockid" ON "office"."t_trade_stock_kline_1" USING btree (
    "stockid" "pg_catalog"."int8_ops" ASC NULLS LAST
    );

-- ----------------------------
-- Primary Key structure for table t_trade_stock_kline_1
-- ----------------------------
ALTER TABLE "office"."t_trade_stock_kline_1" ADD CONSTRAINT "pk_t_trade_stock_kline_1" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table t_trade_stock_kline_5
-- ----------------------------
CREATE INDEX "trade_stock_kline5_idx_stockid" ON "office"."t_trade_stock_kline_5" USING btree (
    "stockid" "pg_catalog"."int8_ops" ASC NULLS LAST
    );

-- ----------------------------
-- Primary Key structure for table t_trade_stock_kline_5
-- ----------------------------
ALTER TABLE "office"."t_trade_stock_kline_5" ADD CONSTRAINT "pk_t_trade_stock_kline_5" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table t_trade_stock_quote_last
-- ----------------------------
CREATE INDEX "trade_stock_quote_idx_stockid" ON "office"."t_trade_stock_quote_last" USING btree (
    "stockid" "pg_catalog"."int8_ops" ASC NULLS LAST
    );

-- ----------------------------
-- Primary Key structure for table t_trade_stock_quote_last
-- ----------------------------
ALTER TABLE "office"."t_trade_stock_quote_last" ADD CONSTRAINT "pk_t_trade_stock_quote_last" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table t_trade_stock_quote_summary
-- ----------------------------
CREATE INDEX "trade_stock_quote_summary_idx_s" ON "office"."t_trade_stock_quote_summary" USING btree (
    "stockid" "pg_catalog"."int8_ops" ASC NULLS LAST
    );

-- ----------------------------
-- Primary Key structure for table t_trade_stock_quote_summary
-- ----------------------------
ALTER TABLE "office"."t_trade_stock_quote_summary" ADD CONSTRAINT "pk_t_trade_stock_quote_summary" PRIMARY KEY ("id");
