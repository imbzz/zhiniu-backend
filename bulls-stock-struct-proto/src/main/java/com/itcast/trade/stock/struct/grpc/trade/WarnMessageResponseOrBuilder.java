// Generated by the protocol buffer compiler.  DO NOT EDIT!
// source: grpc/StockProxyService.proto

package com.itcast.trade.stock.struct.grpc.trade;

public interface WarnMessageResponseOrBuilder extends
    // @@protoc_insertion_point(interface_extends:WarnMessageResponse)
    com.google.protobuf.MessageOrBuilder {

  /**
   * <code>string status = 1;</code>
   */
  java.lang.String getStatus();
  /**
   * <code>string status = 1;</code>
   */
  com.google.protobuf.ByteString
      getStatusBytes();

  /**
   * <code>string message = 2;</code>
   */
  java.lang.String getMessage();
  /**
   * <code>string message = 2;</code>
   */
  com.google.protobuf.ByteString
      getMessageBytes();

  /**
   * <code>repeated int64 ids = 3;</code>
   */
  java.util.List<java.lang.Long> getIdsList();
  /**
   * <code>repeated int64 ids = 3;</code>
   */
  int getIdsCount();
  /**
   * <code>repeated int64 ids = 3;</code>
   */
  long getIds(int index);
}
