// Generated by the protocol buffer compiler.  DO NOT EDIT!
// source: grpc/StockTradeDealService.proto

package com.itcast.bulls.stock.struct.grpc.trade;

public final class StockTradeDealServiceProto {
  private StockTradeDealServiceProto() {}
  public static void registerAllExtensions(
      com.google.protobuf.ExtensionRegistryLite registry) {
  }

  public static void registerAllExtensions(
      com.google.protobuf.ExtensionRegistry registry) {
    registerAllExtensions(
        (com.google.protobuf.ExtensionRegistryLite) registry);
  }
  static final com.google.protobuf.Descriptors.Descriptor
    internal_static_PlaceOrderRequest_descriptor;
  static final 
    com.google.protobuf.GeneratedMessageV3.FieldAccessorTable
      internal_static_PlaceOrderRequest_fieldAccessorTable;
  static final com.google.protobuf.Descriptors.Descriptor
    internal_static_PlaceOrderReponse_descriptor;
  static final 
    com.google.protobuf.GeneratedMessageV3.FieldAccessorTable
      internal_static_PlaceOrderReponse_fieldAccessorTable;
  static final com.google.protobuf.Descriptors.Descriptor
    internal_static_GetOrderRequest_descriptor;
  static final 
    com.google.protobuf.GeneratedMessageV3.FieldAccessorTable
      internal_static_GetOrderRequest_fieldAccessorTable;
  static final com.google.protobuf.Descriptors.Descriptor
    internal_static_GetOrderReponse_descriptor;
  static final 
    com.google.protobuf.GeneratedMessageV3.FieldAccessorTable
      internal_static_GetOrderReponse_fieldAccessorTable;
  static final com.google.protobuf.Descriptors.Descriptor
    internal_static_GetAllOrdersRequest_descriptor;
  static final 
    com.google.protobuf.GeneratedMessageV3.FieldAccessorTable
      internal_static_GetAllOrdersRequest_fieldAccessorTable;
  static final com.google.protobuf.Descriptors.Descriptor
    internal_static_GetAllOrdersReponse_descriptor;
  static final 
    com.google.protobuf.GeneratedMessageV3.FieldAccessorTable
      internal_static_GetAllOrdersReponse_fieldAccessorTable;

  public static com.google.protobuf.Descriptors.FileDescriptor
      getDescriptor() {
    return descriptor;
  }
  private static  com.google.protobuf.Descriptors.FileDescriptor
      descriptor;
  static {
    java.lang.String[] descriptorData = {
      "\n grpc/StockTradeDealService.proto\"\214\001\n\021P" +
      "laceOrderRequest\022\021\n\taccountId\030\001 \001(\003\022\017\n\007s" +
      "tockId\030\002 \001(\003\022\021\n\tdirection\030\003 \001(\005\022\014\n\004type\030" +
      "\004 \001(\005\022\022\n\nexecVolume\030\005 \001(\005\022\021\n\texecPrice\030\006" +
      " \001(\003\022\013\n\003xid\030\007 \001(\t\"|\n\021PlaceOrderReponse\022\016" +
      "\n\006status\030\001 \001(\t\022\017\n\007message\030\002 \001(\t\022\017\n\007order" +
      "Id\030\003 \001(\003\022\016\n\006dealId\030\004 \001(\003\022\022\n\nexecVolume\030\005" +
      " \001(\005\022\021\n\texecPrice\030\006 \001(\003\"5\n\017GetOrderReque" +
      "st\022\021\n\taccountId\030\001 \001(\003\022\017\n\007orderId\030\002 \001(\003\"\373" +
      "\001\n\017GetOrderReponse\022\n\n\002id\030\001 \001(\003\022\021\n\taccoun" +
      "tId\030\002 \001(\003\022\017\n\007stockId\030\003 \001(\003\022\016\n\006status\030\004 \001" +
      "(\005\022\014\n\004type\030\005 \001(\005\022\021\n\tdirection\030\006 \001(\005\022\022\n\ni" +
      "nitVolume\030\007 \001(\005\022\022\n\nexecVolume\030\010 \001(\005\022\021\n\te" +
      "xecPrice\030\t \001(\003\022\024\n\014requestPrice\030\n \001(\003\022\020\n\010" +
      "execTime\030\013 \001(\003\022\021\n\tstockCode\030\014 \001(\t\022\021\n\tsto" +
      "ckName\030\r \001(\t\"\\\n\023GetAllOrdersRequest\022\021\n\ta" +
      "ccountId\030\001 \001(\003\022\016\n\006status\030\002 \001(\t\022\021\n\ttimeSt" +
      "art\030\003 \001(\003\022\017\n\007timeEnd\030\004 \001(\003\"a\n\023GetAllOrde" +
      "rsReponse\022\016\n\006status\030\001 \001(\t\022\017\n\007message\030\002 \001" +
      "(\t\022)\n\017getOrderReponse\030\003 \003(\0132\020.GetOrderRe" +
      "ponse2\277\001\n\025StockTradeDealService\0226\n\nplace" +
      "Order\022\022.PlaceOrderRequest\032\022.PlaceOrderRe" +
      "ponse\"\000\0220\n\010getOrder\022\020.GetOrderRequest\032\020." +
      "GetOrderReponse\"\000\022<\n\014getAllOrders\022\024.GetA" +
      "llOrdersRequest\032\024.GetAllOrdersReponse\"\000B" +
      "H\n(com.itcast.bulls.stock.struct.grpc.tr" +
      "adeB\032StockTradeDealServiceProtoP\001b\006proto" +
      "3"
    };
    descriptor = com.google.protobuf.Descriptors.FileDescriptor
      .internalBuildGeneratedFileFrom(descriptorData,
        new com.google.protobuf.Descriptors.FileDescriptor[] {
        });
    internal_static_PlaceOrderRequest_descriptor =
      getDescriptor().getMessageTypes().get(0);
    internal_static_PlaceOrderRequest_fieldAccessorTable = new
      com.google.protobuf.GeneratedMessageV3.FieldAccessorTable(
        internal_static_PlaceOrderRequest_descriptor,
        new java.lang.String[] { "AccountId", "StockId", "Direction", "Type", "ExecVolume", "ExecPrice", "Xid", });
    internal_static_PlaceOrderReponse_descriptor =
      getDescriptor().getMessageTypes().get(1);
    internal_static_PlaceOrderReponse_fieldAccessorTable = new
      com.google.protobuf.GeneratedMessageV3.FieldAccessorTable(
        internal_static_PlaceOrderReponse_descriptor,
        new java.lang.String[] { "Status", "Message", "OrderId", "DealId", "ExecVolume", "ExecPrice", });
    internal_static_GetOrderRequest_descriptor =
      getDescriptor().getMessageTypes().get(2);
    internal_static_GetOrderRequest_fieldAccessorTable = new
      com.google.protobuf.GeneratedMessageV3.FieldAccessorTable(
        internal_static_GetOrderRequest_descriptor,
        new java.lang.String[] { "AccountId", "OrderId", });
    internal_static_GetOrderReponse_descriptor =
      getDescriptor().getMessageTypes().get(3);
    internal_static_GetOrderReponse_fieldAccessorTable = new
      com.google.protobuf.GeneratedMessageV3.FieldAccessorTable(
        internal_static_GetOrderReponse_descriptor,
        new java.lang.String[] { "Id", "AccountId", "StockId", "Status", "Type", "Direction", "InitVolume", "ExecVolume", "ExecPrice", "RequestPrice", "ExecTime", "StockCode", "StockName", });
    internal_static_GetAllOrdersRequest_descriptor =
      getDescriptor().getMessageTypes().get(4);
    internal_static_GetAllOrdersRequest_fieldAccessorTable = new
      com.google.protobuf.GeneratedMessageV3.FieldAccessorTable(
        internal_static_GetAllOrdersRequest_descriptor,
        new java.lang.String[] { "AccountId", "Status", "TimeStart", "TimeEnd", });
    internal_static_GetAllOrdersReponse_descriptor =
      getDescriptor().getMessageTypes().get(5);
    internal_static_GetAllOrdersReponse_fieldAccessorTable = new
      com.google.protobuf.GeneratedMessageV3.FieldAccessorTable(
        internal_static_GetAllOrdersReponse_descriptor,
        new java.lang.String[] { "Status", "Message", "GetOrderReponse", });
  }

  // @@protoc_insertion_point(outer_class_scope)
}