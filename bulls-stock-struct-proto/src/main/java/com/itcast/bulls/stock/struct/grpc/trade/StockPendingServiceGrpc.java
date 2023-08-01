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
 * 限价委托下单服务接口
 * </pre>
 */
@javax.annotation.Generated(
    value = "by gRPC proto compiler (version 1.10.0)",
    comments = "Source: grpc/StockPendingService.proto")
public final class StockPendingServiceGrpc {

  private StockPendingServiceGrpc() {}

  public static final String SERVICE_NAME = "StockPendingService";

  // Static method descriptors that strictly reflect the proto.
  @io.grpc.ExperimentalApi("https://github.com/grpc/grpc-java/issues/1901")
  @java.lang.Deprecated // Use {@link #getLimitPlaceOrderMethod()} instead. 
  public static final io.grpc.MethodDescriptor<com.itcast.bulls.stock.struct.grpc.trade.LimitPlaceOrderRequest,
      com.itcast.bulls.stock.struct.grpc.trade.LimitPlaceOrderReponse> METHOD_LIMIT_PLACE_ORDER = getLimitPlaceOrderMethodHelper();

  private static volatile io.grpc.MethodDescriptor<com.itcast.bulls.stock.struct.grpc.trade.LimitPlaceOrderRequest,
      com.itcast.bulls.stock.struct.grpc.trade.LimitPlaceOrderReponse> getLimitPlaceOrderMethod;

  @io.grpc.ExperimentalApi("https://github.com/grpc/grpc-java/issues/1901")
  public static io.grpc.MethodDescriptor<com.itcast.bulls.stock.struct.grpc.trade.LimitPlaceOrderRequest,
      com.itcast.bulls.stock.struct.grpc.trade.LimitPlaceOrderReponse> getLimitPlaceOrderMethod() {
    return getLimitPlaceOrderMethodHelper();
  }

  private static io.grpc.MethodDescriptor<com.itcast.bulls.stock.struct.grpc.trade.LimitPlaceOrderRequest,
      com.itcast.bulls.stock.struct.grpc.trade.LimitPlaceOrderReponse> getLimitPlaceOrderMethodHelper() {
    io.grpc.MethodDescriptor<com.itcast.bulls.stock.struct.grpc.trade.LimitPlaceOrderRequest, com.itcast.bulls.stock.struct.grpc.trade.LimitPlaceOrderReponse> getLimitPlaceOrderMethod;
    if ((getLimitPlaceOrderMethod = StockPendingServiceGrpc.getLimitPlaceOrderMethod) == null) {
      synchronized (StockPendingServiceGrpc.class) {
        if ((getLimitPlaceOrderMethod = StockPendingServiceGrpc.getLimitPlaceOrderMethod) == null) {
          StockPendingServiceGrpc.getLimitPlaceOrderMethod = getLimitPlaceOrderMethod = 
              io.grpc.MethodDescriptor.<com.itcast.bulls.stock.struct.grpc.trade.LimitPlaceOrderRequest, com.itcast.bulls.stock.struct.grpc.trade.LimitPlaceOrderReponse>newBuilder()
              .setType(io.grpc.MethodDescriptor.MethodType.UNARY)
              .setFullMethodName(generateFullMethodName(
                  "StockPendingService", "limitPlaceOrder"))
              .setSampledToLocalTracing(true)
              .setRequestMarshaller(io.grpc.protobuf.ProtoUtils.marshaller(
                  com.itcast.bulls.stock.struct.grpc.trade.LimitPlaceOrderRequest.getDefaultInstance()))
              .setResponseMarshaller(io.grpc.protobuf.ProtoUtils.marshaller(
                  com.itcast.bulls.stock.struct.grpc.trade.LimitPlaceOrderReponse.getDefaultInstance()))
                  .setSchemaDescriptor(new StockPendingServiceMethodDescriptorSupplier("limitPlaceOrder"))
                  .build();
          }
        }
     }
     return getLimitPlaceOrderMethod;
  }
  @io.grpc.ExperimentalApi("https://github.com/grpc/grpc-java/issues/1901")
  @java.lang.Deprecated // Use {@link #getRecallOrderMethod()} instead. 
  public static final io.grpc.MethodDescriptor<com.itcast.bulls.stock.struct.grpc.trade.RecallOrderRequest,
      com.itcast.bulls.stock.struct.grpc.trade.RecallOrderResponse> METHOD_RECALL_ORDER = getRecallOrderMethodHelper();

  private static volatile io.grpc.MethodDescriptor<com.itcast.bulls.stock.struct.grpc.trade.RecallOrderRequest,
      com.itcast.bulls.stock.struct.grpc.trade.RecallOrderResponse> getRecallOrderMethod;

  @io.grpc.ExperimentalApi("https://github.com/grpc/grpc-java/issues/1901")
  public static io.grpc.MethodDescriptor<com.itcast.bulls.stock.struct.grpc.trade.RecallOrderRequest,
      com.itcast.bulls.stock.struct.grpc.trade.RecallOrderResponse> getRecallOrderMethod() {
    return getRecallOrderMethodHelper();
  }

  private static io.grpc.MethodDescriptor<com.itcast.bulls.stock.struct.grpc.trade.RecallOrderRequest,
      com.itcast.bulls.stock.struct.grpc.trade.RecallOrderResponse> getRecallOrderMethodHelper() {
    io.grpc.MethodDescriptor<com.itcast.bulls.stock.struct.grpc.trade.RecallOrderRequest, com.itcast.bulls.stock.struct.grpc.trade.RecallOrderResponse> getRecallOrderMethod;
    if ((getRecallOrderMethod = StockPendingServiceGrpc.getRecallOrderMethod) == null) {
      synchronized (StockPendingServiceGrpc.class) {
        if ((getRecallOrderMethod = StockPendingServiceGrpc.getRecallOrderMethod) == null) {
          StockPendingServiceGrpc.getRecallOrderMethod = getRecallOrderMethod = 
              io.grpc.MethodDescriptor.<com.itcast.bulls.stock.struct.grpc.trade.RecallOrderRequest, com.itcast.bulls.stock.struct.grpc.trade.RecallOrderResponse>newBuilder()
              .setType(io.grpc.MethodDescriptor.MethodType.UNARY)
              .setFullMethodName(generateFullMethodName(
                  "StockPendingService", "recallOrder"))
              .setSampledToLocalTracing(true)
              .setRequestMarshaller(io.grpc.protobuf.ProtoUtils.marshaller(
                  com.itcast.bulls.stock.struct.grpc.trade.RecallOrderRequest.getDefaultInstance()))
              .setResponseMarshaller(io.grpc.protobuf.ProtoUtils.marshaller(
                  com.itcast.bulls.stock.struct.grpc.trade.RecallOrderResponse.getDefaultInstance()))
                  .setSchemaDescriptor(new StockPendingServiceMethodDescriptorSupplier("recallOrder"))
                  .build();
          }
        }
     }
     return getRecallOrderMethod;
  }

  /**
   * Creates a new async stub that supports all call types for the service
   */
  public static StockPendingServiceStub newStub(io.grpc.Channel channel) {
    return new StockPendingServiceStub(channel);
  }

  /**
   * Creates a new blocking-style stub that supports unary and streaming output calls on the service
   */
  public static StockPendingServiceBlockingStub newBlockingStub(
      io.grpc.Channel channel) {
    return new StockPendingServiceBlockingStub(channel);
  }

  /**
   * Creates a new ListenableFuture-style stub that supports unary calls on the service
   */
  public static StockPendingServiceFutureStub newFutureStub(
      io.grpc.Channel channel) {
    return new StockPendingServiceFutureStub(channel);
  }

  /**
   * <pre>
   * 限价委托下单服务接口
   * </pre>
   */
  public static abstract class StockPendingServiceImplBase implements io.grpc.BindableService {

    /**
     * <pre>
     * 限价委托下单接口
     * </pre>
     */
    public void limitPlaceOrder(com.itcast.bulls.stock.struct.grpc.trade.LimitPlaceOrderRequest request,
        io.grpc.stub.StreamObserver<com.itcast.bulls.stock.struct.grpc.trade.LimitPlaceOrderReponse> responseObserver) {
      asyncUnimplementedUnaryCall(getLimitPlaceOrderMethodHelper(), responseObserver);
    }

    /**
     * <pre>
     * 用户撤单接口
     * </pre>
     */
    public void recallOrder(com.itcast.bulls.stock.struct.grpc.trade.RecallOrderRequest request,
        io.grpc.stub.StreamObserver<com.itcast.bulls.stock.struct.grpc.trade.RecallOrderResponse> responseObserver) {
      asyncUnimplementedUnaryCall(getRecallOrderMethodHelper(), responseObserver);
    }

    @java.lang.Override public final io.grpc.ServerServiceDefinition bindService() {
      return io.grpc.ServerServiceDefinition.builder(getServiceDescriptor())
          .addMethod(
            getLimitPlaceOrderMethodHelper(),
            asyncUnaryCall(
              new MethodHandlers<
                com.itcast.bulls.stock.struct.grpc.trade.LimitPlaceOrderRequest,
                com.itcast.bulls.stock.struct.grpc.trade.LimitPlaceOrderReponse>(
                  this, METHODID_LIMIT_PLACE_ORDER)))
          .addMethod(
            getRecallOrderMethodHelper(),
            asyncUnaryCall(
              new MethodHandlers<
                com.itcast.bulls.stock.struct.grpc.trade.RecallOrderRequest,
                com.itcast.bulls.stock.struct.grpc.trade.RecallOrderResponse>(
                  this, METHODID_RECALL_ORDER)))
          .build();
    }
  }

  /**
   * <pre>
   * 限价委托下单服务接口
   * </pre>
   */
  public static final class StockPendingServiceStub extends io.grpc.stub.AbstractStub<StockPendingServiceStub> {
    private StockPendingServiceStub(io.grpc.Channel channel) {
      super(channel);
    }

    private StockPendingServiceStub(io.grpc.Channel channel,
        io.grpc.CallOptions callOptions) {
      super(channel, callOptions);
    }

    @java.lang.Override
    protected StockPendingServiceStub build(io.grpc.Channel channel,
        io.grpc.CallOptions callOptions) {
      return new StockPendingServiceStub(channel, callOptions);
    }

    /**
     * <pre>
     * 限价委托下单接口
     * </pre>
     */
    public void limitPlaceOrder(com.itcast.bulls.stock.struct.grpc.trade.LimitPlaceOrderRequest request,
        io.grpc.stub.StreamObserver<com.itcast.bulls.stock.struct.grpc.trade.LimitPlaceOrderReponse> responseObserver) {
      asyncUnaryCall(
          getChannel().newCall(getLimitPlaceOrderMethodHelper(), getCallOptions()), request, responseObserver);
    }

    /**
     * <pre>
     * 用户撤单接口
     * </pre>
     */
    public void recallOrder(com.itcast.bulls.stock.struct.grpc.trade.RecallOrderRequest request,
        io.grpc.stub.StreamObserver<com.itcast.bulls.stock.struct.grpc.trade.RecallOrderResponse> responseObserver) {
      asyncUnaryCall(
          getChannel().newCall(getRecallOrderMethodHelper(), getCallOptions()), request, responseObserver);
    }
  }

  /**
   * <pre>
   * 限价委托下单服务接口
   * </pre>
   */
  public static final class StockPendingServiceBlockingStub extends io.grpc.stub.AbstractStub<StockPendingServiceBlockingStub> {
    private StockPendingServiceBlockingStub(io.grpc.Channel channel) {
      super(channel);
    }

    private StockPendingServiceBlockingStub(io.grpc.Channel channel,
        io.grpc.CallOptions callOptions) {
      super(channel, callOptions);
    }

    @java.lang.Override
    protected StockPendingServiceBlockingStub build(io.grpc.Channel channel,
        io.grpc.CallOptions callOptions) {
      return new StockPendingServiceBlockingStub(channel, callOptions);
    }

    /**
     * <pre>
     * 限价委托下单接口
     * </pre>
     */
    public com.itcast.bulls.stock.struct.grpc.trade.LimitPlaceOrderReponse limitPlaceOrder(com.itcast.bulls.stock.struct.grpc.trade.LimitPlaceOrderRequest request) {
      return blockingUnaryCall(
          getChannel(), getLimitPlaceOrderMethodHelper(), getCallOptions(), request);
    }

    /**
     * <pre>
     * 用户撤单接口
     * </pre>
     */
    public com.itcast.bulls.stock.struct.grpc.trade.RecallOrderResponse recallOrder(com.itcast.bulls.stock.struct.grpc.trade.RecallOrderRequest request) {
      return blockingUnaryCall(
          getChannel(), getRecallOrderMethodHelper(), getCallOptions(), request);
    }
  }

  /**
   * <pre>
   * 限价委托下单服务接口
   * </pre>
   */
  public static final class StockPendingServiceFutureStub extends io.grpc.stub.AbstractStub<StockPendingServiceFutureStub> {
    private StockPendingServiceFutureStub(io.grpc.Channel channel) {
      super(channel);
    }

    private StockPendingServiceFutureStub(io.grpc.Channel channel,
        io.grpc.CallOptions callOptions) {
      super(channel, callOptions);
    }

    @java.lang.Override
    protected StockPendingServiceFutureStub build(io.grpc.Channel channel,
        io.grpc.CallOptions callOptions) {
      return new StockPendingServiceFutureStub(channel, callOptions);
    }

    /**
     * <pre>
     * 限价委托下单接口
     * </pre>
     */
    public com.google.common.util.concurrent.ListenableFuture<com.itcast.bulls.stock.struct.grpc.trade.LimitPlaceOrderReponse> limitPlaceOrder(
        com.itcast.bulls.stock.struct.grpc.trade.LimitPlaceOrderRequest request) {
      return futureUnaryCall(
          getChannel().newCall(getLimitPlaceOrderMethodHelper(), getCallOptions()), request);
    }

    /**
     * <pre>
     * 用户撤单接口
     * </pre>
     */
    public com.google.common.util.concurrent.ListenableFuture<com.itcast.bulls.stock.struct.grpc.trade.RecallOrderResponse> recallOrder(
        com.itcast.bulls.stock.struct.grpc.trade.RecallOrderRequest request) {
      return futureUnaryCall(
          getChannel().newCall(getRecallOrderMethodHelper(), getCallOptions()), request);
    }
  }

  private static final int METHODID_LIMIT_PLACE_ORDER = 0;
  private static final int METHODID_RECALL_ORDER = 1;

  private static final class MethodHandlers<Req, Resp> implements
      io.grpc.stub.ServerCalls.UnaryMethod<Req, Resp>,
      io.grpc.stub.ServerCalls.ServerStreamingMethod<Req, Resp>,
      io.grpc.stub.ServerCalls.ClientStreamingMethod<Req, Resp>,
      io.grpc.stub.ServerCalls.BidiStreamingMethod<Req, Resp> {
    private final StockPendingServiceImplBase serviceImpl;
    private final int methodId;

    MethodHandlers(StockPendingServiceImplBase serviceImpl, int methodId) {
      this.serviceImpl = serviceImpl;
      this.methodId = methodId;
    }

    @java.lang.Override
    @java.lang.SuppressWarnings("unchecked")
    public void invoke(Req request, io.grpc.stub.StreamObserver<Resp> responseObserver) {
      switch (methodId) {
        case METHODID_LIMIT_PLACE_ORDER:
          serviceImpl.limitPlaceOrder((com.itcast.bulls.stock.struct.grpc.trade.LimitPlaceOrderRequest) request,
              (io.grpc.stub.StreamObserver<com.itcast.bulls.stock.struct.grpc.trade.LimitPlaceOrderReponse>) responseObserver);
          break;
        case METHODID_RECALL_ORDER:
          serviceImpl.recallOrder((com.itcast.bulls.stock.struct.grpc.trade.RecallOrderRequest) request,
              (io.grpc.stub.StreamObserver<com.itcast.bulls.stock.struct.grpc.trade.RecallOrderResponse>) responseObserver);
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

  private static abstract class StockPendingServiceBaseDescriptorSupplier
      implements io.grpc.protobuf.ProtoFileDescriptorSupplier, io.grpc.protobuf.ProtoServiceDescriptorSupplier {
    StockPendingServiceBaseDescriptorSupplier() {}

    @java.lang.Override
    public com.google.protobuf.Descriptors.FileDescriptor getFileDescriptor() {
      return com.itcast.bulls.stock.struct.grpc.trade.StockPendingServiceProto.getDescriptor();
    }

    @java.lang.Override
    public com.google.protobuf.Descriptors.ServiceDescriptor getServiceDescriptor() {
      return getFileDescriptor().findServiceByName("StockPendingService");
    }
  }

  private static final class StockPendingServiceFileDescriptorSupplier
      extends StockPendingServiceBaseDescriptorSupplier {
    StockPendingServiceFileDescriptorSupplier() {}
  }

  private static final class StockPendingServiceMethodDescriptorSupplier
      extends StockPendingServiceBaseDescriptorSupplier
      implements io.grpc.protobuf.ProtoMethodDescriptorSupplier {
    private final String methodName;

    StockPendingServiceMethodDescriptorSupplier(String methodName) {
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
      synchronized (StockPendingServiceGrpc.class) {
        result = serviceDescriptor;
        if (result == null) {
          serviceDescriptor = result = io.grpc.ServiceDescriptor.newBuilder(SERVICE_NAME)
              .setSchemaDescriptor(new StockPendingServiceFileDescriptorSupplier())
              .addMethod(getLimitPlaceOrderMethodHelper())
              .addMethod(getRecallOrderMethodHelper())
              .build();
        }
      }
    }
    return result;
  }
}
