// Generated by the protocol buffer compiler.  DO NOT EDIT!
// source: StockMessage.proto

package com.itcast.bulls.stock.struct.netty.trade;

public interface GetOrderRespOrBuilder extends
    // @@protoc_insertion_point(interface_extends:GetOrderResp)
    com.google.protobuf.MessageOrBuilder {

  /**
   * <pre>
   * 订单ID
   * </pre>
   *
   * <code>int64 id = 1;</code>
   */
  long getId();

  /**
   * <pre>
   * 账号ID
   * </pre>
   *
   * <code>int64 accountId = 2;</code>
   */
  long getAccountId();

  /**
   * <pre>
   * 股票产品ID
   * </pre>
   *
   * <code>int64 stockId = 3;</code>
   */
  long getStockId();

  /**
   * <pre>
   * 订单状态(0:待成交, 1:部分成交， 2：完全成交, 3:手工撤单， 4:系统撤单)
   * </pre>
   *
   * <code>int32 status = 4;</code>
   */
  int getStatus();

  /**
   * <pre>
   * 挂单类型(0:市价单， 1:限价单)
   * </pre>
   *
   * <code>int32 type = 5;</code>
   */
  int getType();

  /**
   * <pre>
   * 买卖方向（0: 买入， 1: 卖出）
   * </pre>
   *
   * <code>int32 direction = 6;</code>
   */
  int getDirection();

  /**
   * <pre>
   * 初始请求数量
   * </pre>
   *
   * <code>int32 initVolume = 7;</code>
   */
  int getInitVolume();

  /**
   * <pre>
   * 实际成交数量
   * </pre>
   *
   * <code>int32 execVolume = 8;</code>
   */
  int getExecVolume();

  /**
   * <pre>
   * 实际成交价格
   * </pre>
   *
   * <code>int64 execPrice = 9;</code>
   */
  long getExecPrice();

  /**
   * <pre>
   * 请求价格
   * </pre>
   *
   * <code>int64 requestPrice = 10;</code>
   */
  long getRequestPrice();

  /**
   * <pre>
   * 执行成交时间
   * </pre>
   *
   * <code>int64 execTime = 11;</code>
   */
  long getExecTime();

  /**
   * <pre>
   * 股票名称
   * </pre>
   *
   * <code>string stockCode = 12;</code>
   */
  java.lang.String getStockCode();
  /**
   * <pre>
   * 股票名称
   * </pre>
   *
   * <code>string stockCode = 12;</code>
   */
  com.google.protobuf.ByteString
      getStockCodeBytes();

  /**
   * <pre>
   * 股票代码
   * </pre>
   *
   * <code>string stockName = 13;</code>
   */
  java.lang.String getStockName();
  /**
   * <pre>
   * 股票代码
   * </pre>
   *
   * <code>string stockName = 13;</code>
   */
  com.google.protobuf.ByteString
      getStockNameBytes();
}