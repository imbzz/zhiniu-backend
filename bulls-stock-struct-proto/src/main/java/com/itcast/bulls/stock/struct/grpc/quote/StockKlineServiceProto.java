// Generated by the protocol buffer compiler.  DO NOT EDIT!
// source: grpc/StockKlineService.proto

package com.itcast.bulls.stock.struct.grpc.quote;

public final class StockKlineServiceProto {
  private StockKlineServiceProto() {}
  public static void registerAllExtensions(
      com.google.protobuf.ExtensionRegistryLite registry) {
  }

  public static void registerAllExtensions(
      com.google.protobuf.ExtensionRegistry registry) {
    registerAllExtensions(
        (com.google.protobuf.ExtensionRegistryLite) registry);
  }
  static final com.google.protobuf.Descriptors.Descriptor
    internal_static_GetKlineRequest_descriptor;
  static final 
    com.google.protobuf.GeneratedMessageV3.FieldAccessorTable
      internal_static_GetKlineRequest_fieldAccessorTable;
  static final com.google.protobuf.Descriptors.Descriptor
    internal_static_KlineData_descriptor;
  static final 
    com.google.protobuf.GeneratedMessageV3.FieldAccessorTable
      internal_static_KlineData_fieldAccessorTable;
  static final com.google.protobuf.Descriptors.Descriptor
    internal_static_GetKlineReponse_descriptor;
  static final 
    com.google.protobuf.GeneratedMessageV3.FieldAccessorTable
      internal_static_GetKlineReponse_fieldAccessorTable;

  public static com.google.protobuf.Descriptors.FileDescriptor
      getDescriptor() {
    return descriptor;
  }
  private static  com.google.protobuf.Descriptors.FileDescriptor
      descriptor;
  static {
    java.lang.String[] descriptorData = {
      "\n\034grpc/StockKlineService.proto\"Y\n\017GetKli" +
      "neRequest\022\017\n\007stockId\030\001 \001(\003\022\021\n\tstockCode\030" +
      "\002 \001(\t\022\021\n\ttimeStart\030\003 \001(\003\022\017\n\007timeEnd\030\004 \001(" +
      "\003\"\324\001\n\tKlineData\022\017\n\007stockId\030\001 \001(\003\022\021\n\tstoc" +
      "kCode\030\002 \001(\t\022\021\n\tstockName\030\003 \001(\t\022\021\n\tpriceO" +
      "pen\030\004 \001(\003\022\021\n\tpriceHigh\030\005 \001(\003\022\020\n\010priceLow" +
      "\030\006 \001(\003\022\022\n\npriceClose\030\007 \001(\003\022\016\n\006volume\030\010 \001" +
      "(\003\022\016\n\006amount\030\t \001(\003\022\014\n\004time\030\n \001(\003\022\026\n\016last" +
      "ClosePrice\030\013 \001(\003\"Q\n\017GetKlineReponse\022\016\n\006s" +
      "tatus\030\001 \001(\t\022\017\n\007message\030\002 \001(\t\022\035\n\tklineDat" +
      "a\030\003 \003(\0132\n.KlineData2E\n\021StockKlineService" +
      "\0220\n\010getKline\022\020.GetKlineRequest\032\020.GetKlin" +
      "eReponse\"\000BD\n(com.itcast.bulls.stock.str" +
      "uct.grpc.quoteB\026StockKlineServiceProtoP\001" +
      "b\006proto3"
    };
    descriptor = com.google.protobuf.Descriptors.FileDescriptor
      .internalBuildGeneratedFileFrom(descriptorData,
        new com.google.protobuf.Descriptors.FileDescriptor[] {
        });
    internal_static_GetKlineRequest_descriptor =
      getDescriptor().getMessageTypes().get(0);
    internal_static_GetKlineRequest_fieldAccessorTable = new
      com.google.protobuf.GeneratedMessageV3.FieldAccessorTable(
        internal_static_GetKlineRequest_descriptor,
        new java.lang.String[] { "StockId", "StockCode", "TimeStart", "TimeEnd", });
    internal_static_KlineData_descriptor =
      getDescriptor().getMessageTypes().get(1);
    internal_static_KlineData_fieldAccessorTable = new
      com.google.protobuf.GeneratedMessageV3.FieldAccessorTable(
        internal_static_KlineData_descriptor,
        new java.lang.String[] { "StockId", "StockCode", "StockName", "PriceOpen", "PriceHigh", "PriceLow", "PriceClose", "Volume", "Amount", "Time", "LastClosePrice", });
    internal_static_GetKlineReponse_descriptor =
      getDescriptor().getMessageTypes().get(2);
    internal_static_GetKlineReponse_fieldAccessorTable = new
      com.google.protobuf.GeneratedMessageV3.FieldAccessorTable(
        internal_static_GetKlineReponse_descriptor,
        new java.lang.String[] { "Status", "Message", "KlineData", });
  }

  // @@protoc_insertion_point(outer_class_scope)
}
