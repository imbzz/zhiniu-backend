package com.itcast.bulls.stock.struct.grpc.trade;

import static io.grpc.MethodDescriptor.generateFullMethodName;
import static io.grpc.stub.ClientCalls.asyncBidiStreamingCall;
import static io.grpc.stub.ClientCalls.asyncClientStreamingCall;
import static io.grpc.stub.ClientCalls.asyncServerStreamingCall;
import static io.grpc.stub.ClientCalls.asyncUnaryCall;
import static io.grpc.stub.ClientCalls.blockingServerStreamingCall;
import static io.grpc.stub.ClientCalls.blockingUnaryCall;
import static io.grpc.stub.ClientCalls.futureUnaryCall;
import static io.grpc.stub.ServerCalls.asyncBidiStreamingCall;
import static io.grpc.stub.ServerCalls.asyncClientStreamingCall;
import static io.grpc.stub.ServerCalls.asyncServerStreamingCall;
import static io.grpc.stub.ServerCalls.asyncUnaryCall;
import static io.grpc.stub.ServerCalls.asyncUnimplementedStreamingCall;
import static io.grpc.stub.ServerCalls.asyncUnimplementedUnaryCall;

/**
 * <pre>
 * The stock trade deal service definition.
 * </pre>
 */
@javax.annotation.Generated(
    value = "by gRPC proto compiler (version 1.10.0)",
    comments = "Source: grpc/StockTradeDealService.proto")
public final class StockTradeDealServiceGrpc {

  private StockTradeDealServiceGrpc() {}

  public static final String SERVICE_NAME = "StockTradeDealService";

  // Static method descriptors that strictly reflect the proto.
  @io.grpc.ExperimentalApi("https://github.com/grpc/grpc-java/issues/1901")
  @java.lang.Deprecated // Use {@link #getPlaceOrderMethod()} instead. 
  public static final io.grpc.MethodDescriptor<com.itcast.bulls.stock.struct.grpc.trade.PlaceOrderRequest,
      com.itcast.bulls.stock.struct.grpc.trade.PlaceOrderReponse> METHOD_PLACE_ORDER = getPlaceOrderMethodHelper();

  private static volatile io.grpc.MethodDescriptor<com.itcast.bulls.stock.struct.grpc.trade.PlaceOrderRequest,
      com.itcast.bulls.stock.struct.grpc.trade.PlaceOrderReponse> getPlaceOrderMethod;

  @io.grpc.ExperimentalApi("https://github.com/grpc/grpc-java/issues/1901")
  public static io.grpc.MethodDescriptor<com.itcast.bulls.stock.struct.grpc.trade.PlaceOrderRequest,
      com.itcast.bulls.stock.struct.grpc.trade.PlaceOrderReponse> getPlaceOrderMethod() {
    return getPlaceOrderMethodHelper();
  }

  private static io.grpc.MethodDescriptor<com.itcast.bulls.stock.struct.grpc.trade.PlaceOrderRequest,
      com.itcast.bulls.stock.struct.grpc.trade.PlaceOrderReponse> getPlaceOrderMethodHelper() {
    io.grpc.MethodDescriptor<com.itcast.bulls.stock.struct.grpc.trade.PlaceOrderRequest, com.itcast.bulls.stock.struct.grpc.trade.PlaceOrderReponse> getPlaceOrderMethod;
    if ((getPlaceOrderMethod = StockTradeDealServiceGrpc.getPlaceOrderMethod) == null) {
      synchronized (StockTradeDealServiceGrpc.class) {
        if ((getPlaceOrderMethod = StockTradeDealServiceGrpc.getPlaceOrderMethod) == null) {
          StockTradeDealServiceGrpc.getPlaceOrderMethod = getPlaceOrderMethod = 
              io.grpc.MethodDescriptor.<com.itcast.bulls.stock.struct.grpc.trade.PlaceOrderRequest, com.itcast.bulls.stock.struct.grpc.trade.PlaceOrderReponse>newBuilder()
              .setType(io.grpc.MethodDescriptor.MethodType.UNARY)
              .setFullMethodName(generateFullMethodName(
                  "StockTradeDealService", "placeOrder"))
              .setSampledToLocalTracing(true)
              .setRequestMarshaller(io.grpc.protobuf.ProtoUtils.marshaller(
                  com.itcast.bulls.stock.struct.grpc.trade.PlaceOrderRequest.getDefaultInstance()))
              .setResponseMarshaller(io.grpc.protobuf.ProtoUtils.marshaller(
                  com.itcast.bulls.stock.struct.grpc.trade.PlaceOrderReponse.getDefaultInstance()))
                  .setSchemaDescriptor(new StockTradeDealServiceMethodDescriptorSupplier("placeOrder"))
                  .build();
          }
        }
     }
     return getPlaceOrderMethod;
  }
  @io.grpc.ExperimentalApi("https://github.com/grpc/grpc-java/issues/1901")
  @java.lang.Deprecated // Use {@link #getGetOrderMethod()} instead. 
  public static final io.grpc.MethodDescriptor<com.itcast.bulls.stock.struct.grpc.trade.GetOrderRequest,
      com.itcast.bulls.stock.struct.grpc.trade.GetOrderReponse> METHOD_GET_ORDER = getGetOrderMethodHelper();

  private static volatile io.grpc.MethodDescriptor<com.itcast.bulls.stock.struct.grpc.trade.GetOrderRequest,
      com.itcast.bulls.stock.struct.grpc.trade.GetOrderReponse> getGetOrderMethod;

  @io.grpc.ExperimentalApi("https://github.com/grpc/grpc-java/issues/1901")
  public static io.grpc.MethodDescriptor<com.itcast.bulls.stock.struct.grpc.trade.GetOrderRequest,
      com.itcast.bulls.stock.struct.grpc.trade.GetOrderReponse> getGetOrderMethod() {
    return getGetOrderMethodHelper();
  }

  private static io.grpc.MethodDescriptor<com.itcast.bulls.stock.struct.grpc.trade.GetOrderRequest,
      com.itcast.bulls.stock.struct.grpc.trade.GetOrderReponse> getGetOrderMethodHelper() {
    io.grpc.MethodDescriptor<com.itcast.bulls.stock.struct.grpc.trade.GetOrderRequest, com.itcast.bulls.stock.struct.grpc.trade.GetOrderReponse> getGetOrderMethod;
    if ((getGetOrderMethod = StockTradeDealServiceGrpc.getGetOrderMethod) == null) {
      synchronized (StockTradeDealServiceGrpc.class) {
        if ((getGetOrderMethod = StockTradeDealServiceGrpc.getGetOrderMethod) == null) {
          StockTradeDealServiceGrpc.getGetOrderMethod = getGetOrderMethod = 
              io.grpc.MethodDescriptor.<com.itcast.bulls.stock.struct.grpc.trade.GetOrderRequest, com.itcast.bulls.stock.struct.grpc.trade.GetOrderReponse>newBuilder()
              .setType(io.grpc.MethodDescriptor.MethodType.UNARY)
              .setFullMethodName(generateFullMethodName(
                  "StockTradeDealService", "getOrder"))
              .setSampledToLocalTracing(true)
              .setRequestMarshaller(io.grpc.protobuf.ProtoUtils.marshaller(
                  com.itcast.bulls.stock.struct.grpc.trade.GetOrderRequest.getDefaultInstance()))
              .setResponseMarshaller(io.grpc.protobuf.ProtoUtils.marshaller(
                  com.itcast.bulls.stock.struct.grpc.trade.GetOrderReponse.getDefaultInstance()))
                  .setSchemaDescriptor(new StockTradeDealServiceMethodDescriptorSupplier("getOrder"))
                  .build();
          }
        }
     }
     return getGetOrderMethod;
  }
  @io.grpc.ExperimentalApi("https://github.com/grpc/grpc-java/issues/1901")
  @java.lang.Deprecated // Use {@link #getGetAllOrdersMethod()} instead. 
  public static final io.grpc.MethodDescriptor<com.itcast.bulls.stock.struct.grpc.trade.GetAllOrdersRequest,
      com.itcast.bulls.stock.struct.grpc.trade.GetAllOrdersReponse> METHOD_GET_ALL_ORDERS = getGetAllOrdersMethodHelper();

  private static volatile io.grpc.MethodDescriptor<com.itcast.bulls.stock.struct.grpc.trade.GetAllOrdersRequest,
      com.itcast.bulls.stock.struct.grpc.trade.GetAllOrdersReponse> getGetAllOrdersMethod;

  @io.grpc.ExperimentalApi("https://github.com/grpc/grpc-java/issues/1901")
  public static io.grpc.MethodDescriptor<com.itcast.bulls.stock.struct.grpc.trade.GetAllOrdersRequest,
      com.itcast.bulls.stock.struct.grpc.trade.GetAllOrdersReponse> getGetAllOrdersMethod() {
    return getGetAllOrdersMethodHelper();
  }

  private static io.grpc.MethodDescriptor<com.itcast.bulls.stock.struct.grpc.trade.GetAllOrdersRequest,
      com.itcast.bulls.stock.struct.grpc.trade.GetAllOrdersReponse> getGetAllOrdersMethodHelper() {
    io.grpc.MethodDescriptor<com.itcast.bulls.stock.struct.grpc.trade.GetAllOrdersRequest, com.itcast.bulls.stock.struct.grpc.trade.GetAllOrdersReponse> getGetAllOrdersMethod;
    if ((getGetAllOrdersMethod = StockTradeDealServiceGrpc.getGetAllOrdersMethod) == null) {
      synchronized (StockTradeDealServiceGrpc.class) {
        if ((getGetAllOrdersMethod = StockTradeDealServiceGrpc.getGetAllOrdersMethod) == null) {
          StockTradeDealServiceGrpc.getGetAllOrdersMethod = getGetAllOrdersMethod = 
              io.grpc.MethodDescriptor.<com.itcast.bulls.stock.struct.grpc.trade.GetAllOrdersRequest, com.itcast.bulls.stock.struct.grpc.trade.GetAllOrdersReponse>newBuilder()
              .setType(io.grpc.MethodDescriptor.MethodType.UNARY)
              .setFullMethodName(generateFullMethodName(
                  "StockTradeDealService", "getAllOrders"))
              .setSampledToLocalTracing(true)
              .setRequestMarshaller(io.grpc.protobuf.ProtoUtils.marshaller(
                  com.itcast.bulls.stock.struct.grpc.trade.GetAllOrdersRequest.getDefaultInstance()))
              .setResponseMarshaller(io.grpc.protobuf.ProtoUtils.marshaller(
                  com.itcast.bulls.stock.struct.grpc.trade.GetAllOrdersReponse.getDefaultInstance()))
                  .setSchemaDescriptor(new StockTradeDealServiceMethodDescriptorSupplier("getAllOrders"))
                  .build();
          }
        }
     }
     return getGetAllOrdersMethod;
  }

  /**
   * Creates a new async stub that supports all call types for the service
   */
  public static StockTradeDealServiceStub newStub(io.grpc.Channel channel) {
    return new StockTradeDealServiceStub(channel);
  }

  /**
   * Creates a new blocking-style stub that supports unary and streaming output calls on the service
   */
  public static StockTradeDealServiceBlockingStub newBlockingStub(
      io.grpc.Channel channel) {
    return new StockTradeDealServiceBlockingStub(channel);
  }

  /**
   * Creates a new ListenableFuture-style stub that supports unary calls on the service
   */
  public static StockTradeDealServiceFutureStub newFutureStub(
      io.grpc.Channel channel) {
    return new StockTradeDealServiceFutureStub(channel);
  }

  /**
   * <pre>
   * The stock trade deal service definition.
   * </pre>
   */
  public static abstract class StockTradeDealServiceImplBase implements io.grpc.BindableService {

    /**
     * <pre>
     * 下单接口
     * </pre>
     */
    public void placeOrder(com.itcast.bulls.stock.struct.grpc.trade.PlaceOrderRequest request,
        io.grpc.stub.StreamObserver<com.itcast.bulls.stock.struct.grpc.trade.PlaceOrderReponse> responseObserver) {
      asyncUnimplementedUnaryCall(getPlaceOrderMethodHelper(), responseObserver);
    }

    /**
     * <pre>
     * 获取订单详情接口
     * </pre>
     */
    public void getOrder(com.itcast.bulls.stock.struct.grpc.trade.GetOrderRequest request,
        io.grpc.stub.StreamObserver<com.itcast.bulls.stock.struct.grpc.trade.GetOrderReponse> responseObserver) {
      asyncUnimplementedUnaryCall(getGetOrderMethodHelper(), responseObserver);
    }

    /**
     * <pre>
     * 获取所有订单详情接口
     * </pre>
     */
    public void getAllOrders(com.itcast.bulls.stock.struct.grpc.trade.GetAllOrdersRequest request,
        io.grpc.stub.StreamObserver<com.itcast.bulls.stock.struct.grpc.trade.GetAllOrdersReponse> responseObserver) {
      asyncUnimplementedUnaryCall(getGetAllOrdersMethodHelper(), responseObserver);
    }

    @java.lang.Override public final io.grpc.ServerServiceDefinition bindService() {
      return io.grpc.ServerServiceDefinition.builder(getServiceDescriptor())
          .addMethod(
            getPlaceOrderMethodHelper(),
            asyncUnaryCall(
              new MethodHandlers<
                com.itcast.bulls.stock.struct.grpc.trade.PlaceOrderRequest,
                com.itcast.bulls.stock.struct.grpc.trade.PlaceOrderReponse>(
                  this, METHODID_PLACE_ORDER)))
          .addMethod(
            getGetOrderMethodHelper(),
            asyncUnaryCall(
              new MethodHandlers<
                com.itcast.bulls.stock.struct.grpc.trade.GetOrderRequest,
                com.itcast.bulls.stock.struct.grpc.trade.GetOrderReponse>(
                  this, METHODID_GET_ORDER)))
          .addMethod(
            getGetAllOrdersMethodHelper(),
            asyncUnaryCall(
              new MethodHandlers<
                com.itcast.bulls.stock.struct.grpc.trade.GetAllOrdersRequest,
                com.itcast.bulls.stock.struct.grpc.trade.GetAllOrdersReponse>(
                  this, METHODID_GET_ALL_ORDERS)))
          .build();
    }
  }

  /**
   * <pre>
   * The stock trade deal service definition.
   * </pre>
   */
  public static final class StockTradeDealServiceStub extends io.grpc.stub.AbstractStub<StockTradeDealServiceStub> {
    private StockTradeDealServiceStub(io.grpc.Channel channel) {
      super(channel);
    }

    private StockTradeDealServiceStub(io.grpc.Channel channel,
        io.grpc.CallOptions callOptions) {
      super(channel, callOptions);
    }

    @java.lang.Override
    protected StockTradeDealServiceStub build(io.grpc.Channel channel,
        io.grpc.CallOptions callOptions) {
      return new StockTradeDealServiceStub(channel, callOptions);
    }

    /**
     * <pre>
     * 下单接口
     * </pre>
     */
    public void placeOrder(com.itcast.bulls.stock.struct.grpc.trade.PlaceOrderRequest request,
        io.grpc.stub.StreamObserver<com.itcast.bulls.stock.struct.grpc.trade.PlaceOrderReponse> responseObserver) {
      asyncUnaryCall(
          getChannel().newCall(getPlaceOrderMethodHelper(), getCallOptions()), request, responseObserver);
    }

    /**
     * <pre>
     * 获取订单详情接口
     * </pre>
     */
    public void getOrder(com.itcast.bulls.stock.struct.grpc.trade.GetOrderRequest request,
        io.grpc.stub.StreamObserver<com.itcast.bulls.stock.struct.grpc.trade.GetOrderReponse> responseObserver) {
      asyncUnaryCall(
          getChannel().newCall(getGetOrderMethodHelper(), getCallOptions()), request, responseObserver);
    }

    /**
     * <pre>
     * 获取所有订单详情接口
     * </pre>
     */
    public void getAllOrders(com.itcast.bulls.stock.struct.grpc.trade.GetAllOrdersRequest request,
        io.grpc.stub.StreamObserver<com.itcast.bulls.stock.struct.grpc.trade.GetAllOrdersReponse> responseObserver) {
      asyncUnaryCall(
          getChannel().newCall(getGetAllOrdersMethodHelper(), getCallOptions()), request, responseObserver);
    }
  }

  /**
   * <pre>
   * The stock trade deal service definition.
   * </pre>
   */
  public static final class StockTradeDealServiceBlockingStub extends io.grpc.stub.AbstractStub<StockTradeDealServiceBlockingStub> {
    private StockTradeDealServiceBlockingStub(io.grpc.Channel channel) {
      super(channel);
    }

    private StockTradeDealServiceBlockingStub(io.grpc.Channel channel,
        io.grpc.CallOptions callOptions) {
      super(channel, callOptions);
    }

    @java.lang.Override
    protected StockTradeDealServiceBlockingStub build(io.grpc.Channel channel,
        io.grpc.CallOptions callOptions) {
      return new StockTradeDealServiceBlockingStub(channel, callOptions);
    }

    /**
     * <pre>
     * 下单接口
     * </pre>
     */
    public com.itcast.bulls.stock.struct.grpc.trade.PlaceOrderReponse placeOrder(com.itcast.bulls.stock.struct.grpc.trade.PlaceOrderRequest request) {
      return blockingUnaryCall(
          getChannel(), getPlaceOrderMethodHelper(), getCallOptions(), request);
    }

    /**
     * <pre>
     * 获取订单详情接口
     * </pre>
     */
    public com.itcast.bulls.stock.struct.grpc.trade.GetOrderReponse getOrder(com.itcast.bulls.stock.struct.grpc.trade.GetOrderRequest request) {
      return blockingUnaryCall(
          getChannel(), getGetOrderMethodHelper(), getCallOptions(), request);
    }

    /**
     * <pre>
     * 获取所有订单详情接口
     * </pre>
     */
    public com.itcast.bulls.stock.struct.grpc.trade.GetAllOrdersReponse getAllOrders(com.itcast.bulls.stock.struct.grpc.trade.GetAllOrdersRequest request) {
      return blockingUnaryCall(
          getChannel(), getGetAllOrdersMethodHelper(), getCallOptions(), request);
    }
  }

  /**
   * <pre>
   * The stock trade deal service definition.
   * </pre>
   */
  public static final class StockTradeDealServiceFutureStub extends io.grpc.stub.AbstractStub<StockTradeDealServiceFutureStub> {
    private StockTradeDealServiceFutureStub(io.grpc.Channel channel) {
      super(channel);
    }

    private StockTradeDealServiceFutureStub(io.grpc.Channel channel,
        io.grpc.CallOptions callOptions) {
      super(channel, callOptions);
    }

    @java.lang.Override
    protected StockTradeDealServiceFutureStub build(io.grpc.Channel channel,
        io.grpc.CallOptions callOptions) {
      return new StockTradeDealServiceFutureStub(channel, callOptions);
    }

    /**
     * <pre>
     * 下单接口
     * </pre>
     */
    public com.google.common.util.concurrent.ListenableFuture<com.itcast.bulls.stock.struct.grpc.trade.PlaceOrderReponse> placeOrder(
        com.itcast.bulls.stock.struct.grpc.trade.PlaceOrderRequest request) {
      return futureUnaryCall(
          getChannel().newCall(getPlaceOrderMethodHelper(), getCallOptions()), request);
    }

    /**
     * <pre>
     * 获取订单详情接口
     * </pre>
     */
    public com.google.common.util.concurrent.ListenableFuture<com.itcast.bulls.stock.struct.grpc.trade.GetOrderReponse> getOrder(
        com.itcast.bulls.stock.struct.grpc.trade.GetOrderRequest request) {
      return futureUnaryCall(
          getChannel().newCall(getGetOrderMethodHelper(), getCallOptions()), request);
    }

    /**
     * <pre>
     * 获取所有订单详情接口
     * </pre>
     */
    public com.google.common.util.concurrent.ListenableFuture<com.itcast.bulls.stock.struct.grpc.trade.GetAllOrdersReponse> getAllOrders(
        com.itcast.bulls.stock.struct.grpc.trade.GetAllOrdersRequest request) {
      return futureUnaryCall(
          getChannel().newCall(getGetAllOrdersMethodHelper(), getCallOptions()), request);
    }
  }

  private static final int METHODID_PLACE_ORDER = 0;
  private static final int METHODID_GET_ORDER = 1;
  private static final int METHODID_GET_ALL_ORDERS = 2;

  private static final class MethodHandlers<Req, Resp> implements
      io.grpc.stub.ServerCalls.UnaryMethod<Req, Resp>,
      io.grpc.stub.ServerCalls.ServerStreamingMethod<Req, Resp>,
      io.grpc.stub.ServerCalls.ClientStreamingMethod<Req, Resp>,
      io.grpc.stub.ServerCalls.BidiStreamingMethod<Req, Resp> {
    private final StockTradeDealServiceImplBase serviceImpl;
    private final int methodId;

    MethodHandlers(StockTradeDealServiceImplBase serviceImpl, int methodId) {
      this.serviceImpl = serviceImpl;
      this.methodId = methodId;
    }

    @java.lang.Override
    @java.lang.SuppressWarnings("unchecked")
    public void invoke(Req request, io.grpc.stub.StreamObserver<Resp> responseObserver) {
      switch (methodId) {
        case METHODID_PLACE_ORDER:
          serviceImpl.placeOrder((com.itcast.bulls.stock.struct.grpc.trade.PlaceOrderRequest) request,
              (io.grpc.stub.StreamObserver<com.itcast.bulls.stock.struct.grpc.trade.PlaceOrderReponse>) responseObserver);
          break;
        case METHODID_GET_ORDER:
          serviceImpl.getOrder((com.itcast.bulls.stock.struct.grpc.trade.GetOrderRequest) request,
              (io.grpc.stub.StreamObserver<com.itcast.bulls.stock.struct.grpc.trade.GetOrderReponse>) responseObserver);
          break;
        case METHODID_GET_ALL_ORDERS:
          serviceImpl.getAllOrders((com.itcast.bulls.stock.struct.grpc.trade.GetAllOrdersRequest) request,
              (io.grpc.stub.StreamObserver<com.itcast.bulls.stock.struct.grpc.trade.GetAllOrdersReponse>) responseObserver);
          break;
        default:
          throw new AssertionError();
      }
    }

    @java.lang.Override
    @java.lang.SuppressWarnings("unchecked")
    public io.grpc.stub.StreamObserver<Req> invoke(
        io.grpc.stub.StreamObserver<Resp> responseObserver) {
      switch (methodId) {
        default:
          throw new AssertionError();
      }
    }
  }

  private static abstract class StockTradeDealServiceBaseDescriptorSupplier
      implements io.grpc.protobuf.ProtoFileDescriptorSupplier, io.grpc.protobuf.ProtoServiceDescriptorSupplier {
    StockTradeDealServiceBaseDescriptorSupplier() {}

    @java.lang.Override
    public com.google.protobuf.Descriptors.FileDescriptor getFileDescriptor() {
      return com.itcast.bulls.stock.struct.grpc.trade.StockTradeDealServiceProto.getDescriptor();
    }

    @java.lang.Override
    public com.google.protobuf.Descriptors.ServiceDescriptor getServiceDescriptor() {
      return getFileDescriptor().findServiceByName("StockTradeDealService");
    }
  }

  private static final class StockTradeDealServiceFileDescriptorSupplier
      extends StockTradeDealServiceBaseDescriptorSupplier {
    StockTradeDealServiceFileDescriptorSupplier() {}
  }

  private static final class StockTradeDealServiceMethodDescriptorSupplier
      extends StockTradeDealServiceBaseDescriptorSupplier
      implements io.grpc.protobuf.ProtoMethodDescriptorSupplier {
    private final String methodName;

    StockTradeDealServiceMethodDescriptorSupplier(String methodName) {
      this.methodName = methodName;
    }

    @java.lang.Override
    public com.google.protobuf.Descriptors.MethodDescriptor getMethodDescriptor() {
      return getServiceDescriptor().findMethodByName(methodName);
    }
  }

  private static volatile io.grpc.ServiceDescriptor serviceDescriptor;

  public static io.grpc.ServiceDescriptor getServiceDescriptor() {
    io.grpc.ServiceDescriptor result = serviceDescriptor;
    if (result == null) {
      synchronized (StockTradeDealServiceGrpc.class) {
        result = serviceDescriptor;
        if (result == null) {
          serviceDescriptor = result = io.grpc.ServiceDescriptor.newBuilder(SERVICE_NAME)
              .setSchemaDescriptor(new StockTradeDealServiceFileDescriptorSupplier())
              .addMethod(getPlaceOrderMethodHelper())
              .addMethod(getGetOrderMethodHelper())
              .addMethod(getGetAllOrdersMethodHelper())
              .build();
        }
      }
    }
    return result;
  }
}
