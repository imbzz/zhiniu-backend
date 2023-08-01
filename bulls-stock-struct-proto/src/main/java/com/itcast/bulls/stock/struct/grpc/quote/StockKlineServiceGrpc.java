package com.itcast.bulls.stock.struct.grpc.quote;

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
 * 股票K线行情的服务接口
 * </pre>
 */
@javax.annotation.Generated(
    value = "by gRPC proto compiler (version 1.10.0)",
    comments = "Source: grpc/StockKlineService.proto")
public final class StockKlineServiceGrpc {

  private StockKlineServiceGrpc() {}

  public static final String SERVICE_NAME = "StockKlineService";

  // Static method descriptors that strictly reflect the proto.
  @io.grpc.ExperimentalApi("https://github.com/grpc/grpc-java/issues/1901")
  @java.lang.Deprecated // Use {@link #getGetKlineMethod()} instead. 
  public static final io.grpc.MethodDescriptor<com.itcast.bulls.stock.struct.grpc.quote.GetKlineRequest,
      com.itcast.bulls.stock.struct.grpc.quote.GetKlineReponse> METHOD_GET_KLINE = getGetKlineMethodHelper();

  private static volatile io.grpc.MethodDescriptor<com.itcast.bulls.stock.struct.grpc.quote.GetKlineRequest,
      com.itcast.bulls.stock.struct.grpc.quote.GetKlineReponse> getGetKlineMethod;

  @io.grpc.ExperimentalApi("https://github.com/grpc/grpc-java/issues/1901")
  public static io.grpc.MethodDescriptor<com.itcast.bulls.stock.struct.grpc.quote.GetKlineRequest,
      com.itcast.bulls.stock.struct.grpc.quote.GetKlineReponse> getGetKlineMethod() {
    return getGetKlineMethodHelper();
  }

  private static io.grpc.MethodDescriptor<com.itcast.bulls.stock.struct.grpc.quote.GetKlineRequest,
      com.itcast.bulls.stock.struct.grpc.quote.GetKlineReponse> getGetKlineMethodHelper() {
    io.grpc.MethodDescriptor<com.itcast.bulls.stock.struct.grpc.quote.GetKlineRequest, com.itcast.bulls.stock.struct.grpc.quote.GetKlineReponse> getGetKlineMethod;
    if ((getGetKlineMethod = StockKlineServiceGrpc.getGetKlineMethod) == null) {
      synchronized (StockKlineServiceGrpc.class) {
        if ((getGetKlineMethod = StockKlineServiceGrpc.getGetKlineMethod) == null) {
          StockKlineServiceGrpc.getGetKlineMethod = getGetKlineMethod = 
              io.grpc.MethodDescriptor.<com.itcast.bulls.stock.struct.grpc.quote.GetKlineRequest, com.itcast.bulls.stock.struct.grpc.quote.GetKlineReponse>newBuilder()
              .setType(io.grpc.MethodDescriptor.MethodType.UNARY)
              .setFullMethodName(generateFullMethodName(
                  "StockKlineService", "getKline"))
              .setSampledToLocalTracing(true)
              .setRequestMarshaller(io.grpc.protobuf.ProtoUtils.marshaller(
                  com.itcast.bulls.stock.struct.grpc.quote.GetKlineRequest.getDefaultInstance()))
              .setResponseMarshaller(io.grpc.protobuf.ProtoUtils.marshaller(
                  com.itcast.bulls.stock.struct.grpc.quote.GetKlineReponse.getDefaultInstance()))
                  .setSchemaDescriptor(new StockKlineServiceMethodDescriptorSupplier("getKline"))
                  .build();
          }
        }
     }
     return getGetKlineMethod;
  }

  /**
   * Creates a new async stub that supports all call types for the service
   */
  public static StockKlineServiceStub newStub(io.grpc.Channel channel) {
    return new StockKlineServiceStub(channel);
  }

  /**
   * Creates a new blocking-style stub that supports unary and streaming output calls on the service
   */
  public static StockKlineServiceBlockingStub newBlockingStub(
      io.grpc.Channel channel) {
    return new StockKlineServiceBlockingStub(channel);
  }

  /**
   * Creates a new ListenableFuture-style stub that supports unary calls on the service
   */
  public static StockKlineServiceFutureStub newFutureStub(
      io.grpc.Channel channel) {
    return new StockKlineServiceFutureStub(channel);
  }

  /**
   * <pre>
   * 股票K线行情的服务接口
   * </pre>
   */
  public static abstract class StockKlineServiceImplBase implements io.grpc.BindableService {

    /**
     * <pre>
     * 获取股票K线数据的接口
     * </pre>
     */
    public void getKline(com.itcast.bulls.stock.struct.grpc.quote.GetKlineRequest request,
        io.grpc.stub.StreamObserver<com.itcast.bulls.stock.struct.grpc.quote.GetKlineReponse> responseObserver) {
      asyncUnimplementedUnaryCall(getGetKlineMethodHelper(), responseObserver);
    }

    @java.lang.Override public final io.grpc.ServerServiceDefinition bindService() {
      return io.grpc.ServerServiceDefinition.builder(getServiceDescriptor())
          .addMethod(
            getGetKlineMethodHelper(),
            asyncUnaryCall(
              new MethodHandlers<
                com.itcast.bulls.stock.struct.grpc.quote.GetKlineRequest,
                com.itcast.bulls.stock.struct.grpc.quote.GetKlineReponse>(
                  this, METHODID_GET_KLINE)))
          .build();
    }
  }

  /**
   * <pre>
   * 股票K线行情的服务接口
   * </pre>
   */
  public static final class StockKlineServiceStub extends io.grpc.stub.AbstractStub<StockKlineServiceStub> {
    private StockKlineServiceStub(io.grpc.Channel channel) {
      super(channel);
    }

    private StockKlineServiceStub(io.grpc.Channel channel,
        io.grpc.CallOptions callOptions) {
      super(channel, callOptions);
    }

    @java.lang.Override
    protected StockKlineServiceStub build(io.grpc.Channel channel,
        io.grpc.CallOptions callOptions) {
      return new StockKlineServiceStub(channel, callOptions);
    }

    /**
     * <pre>
     * 获取股票K线数据的接口
     * </pre>
     */
    public void getKline(com.itcast.bulls.stock.struct.grpc.quote.GetKlineRequest request,
        io.grpc.stub.StreamObserver<com.itcast.bulls.stock.struct.grpc.quote.GetKlineReponse> responseObserver) {
      asyncUnaryCall(
          getChannel().newCall(getGetKlineMethodHelper(), getCallOptions()), request, responseObserver);
    }
  }

  /**
   * <pre>
   * 股票K线行情的服务接口
   * </pre>
   */
  public static final class StockKlineServiceBlockingStub extends io.grpc.stub.AbstractStub<StockKlineServiceBlockingStub> {
    private StockKlineServiceBlockingStub(io.grpc.Channel channel) {
      super(channel);
    }

    private StockKlineServiceBlockingStub(io.grpc.Channel channel,
        io.grpc.CallOptions callOptions) {
      super(channel, callOptions);
    }

    @java.lang.Override
    protected StockKlineServiceBlockingStub build(io.grpc.Channel channel,
        io.grpc.CallOptions callOptions) {
      return new StockKlineServiceBlockingStub(channel, callOptions);
    }

    /**
     * <pre>
     * 获取股票K线数据的接口
     * </pre>
     */
    public com.itcast.bulls.stock.struct.grpc.quote.GetKlineReponse getKline(com.itcast.bulls.stock.struct.grpc.quote.GetKlineRequest request) {
      return blockingUnaryCall(
          getChannel(), getGetKlineMethodHelper(), getCallOptions(), request);
    }
  }

  /**
   * <pre>
   * 股票K线行情的服务接口
   * </pre>
   */
  public static final class StockKlineServiceFutureStub extends io.grpc.stub.AbstractStub<StockKlineServiceFutureStub> {
    private StockKlineServiceFutureStub(io.grpc.Channel channel) {
      super(channel);
    }

    private StockKlineServiceFutureStub(io.grpc.Channel channel,
        io.grpc.CallOptions callOptions) {
      super(channel, callOptions);
    }

    @java.lang.Override
    protected StockKlineServiceFutureStub build(io.grpc.Channel channel,
        io.grpc.CallOptions callOptions) {
      return new StockKlineServiceFutureStub(channel, callOptions);
    }

    /**
     * <pre>
     * 获取股票K线数据的接口
     * </pre>
     */
    public com.google.common.util.concurrent.ListenableFuture<com.itcast.bulls.stock.struct.grpc.quote.GetKlineReponse> getKline(
        com.itcast.bulls.stock.struct.grpc.quote.GetKlineRequest request) {
      return futureUnaryCall(
          getChannel().newCall(getGetKlineMethodHelper(), getCallOptions()), request);
    }
  }

  private static final int METHODID_GET_KLINE = 0;

  private static final class MethodHandlers<Req, Resp> implements
      io.grpc.stub.ServerCalls.UnaryMethod<Req, Resp>,
      io.grpc.stub.ServerCalls.ServerStreamingMethod<Req, Resp>,
      io.grpc.stub.ServerCalls.ClientStreamingMethod<Req, Resp>,
      io.grpc.stub.ServerCalls.BidiStreamingMethod<Req, Resp> {
    private final StockKlineServiceImplBase serviceImpl;
    private final int methodId;

    MethodHandlers(StockKlineServiceImplBase serviceImpl, int methodId) {
      this.serviceImpl = serviceImpl;
      this.methodId = methodId;
    }

    @java.lang.Override
    @java.lang.SuppressWarnings("unchecked")
    public void invoke(Req request, io.grpc.stub.StreamObserver<Resp> responseObserver) {
      switch (methodId) {
        case METHODID_GET_KLINE:
          serviceImpl.getKline((com.itcast.bulls.stock.struct.grpc.quote.GetKlineRequest) request,
              (io.grpc.stub.StreamObserver<com.itcast.bulls.stock.struct.grpc.quote.GetKlineReponse>) responseObserver);
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

  private static abstract class StockKlineServiceBaseDescriptorSupplier
      implements io.grpc.protobuf.ProtoFileDescriptorSupplier, io.grpc.protobuf.ProtoServiceDescriptorSupplier {
    StockKlineServiceBaseDescriptorSupplier() {}

    @java.lang.Override
    public com.google.protobuf.Descriptors.FileDescriptor getFileDescriptor() {
      return com.itcast.bulls.stock.struct.grpc.quote.StockKlineServiceProto.getDescriptor();
    }

    @java.lang.Override
    public com.google.protobuf.Descriptors.ServiceDescriptor getServiceDescriptor() {
      return getFileDescriptor().findServiceByName("StockKlineService");
    }
  }

  private static final class StockKlineServiceFileDescriptorSupplier
      extends StockKlineServiceBaseDescriptorSupplier {
    StockKlineServiceFileDescriptorSupplier() {}
  }

  private static final class StockKlineServiceMethodDescriptorSupplier
      extends StockKlineServiceBaseDescriptorSupplier
      implements io.grpc.protobuf.ProtoMethodDescriptorSupplier {
    private final String methodName;

    StockKlineServiceMethodDescriptorSupplier(String methodName) {
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
      synchronized (StockKlineServiceGrpc.class) {
        result = serviceDescriptor;
        if (result == null) {
          serviceDescriptor = result = io.grpc.ServiceDescriptor.newBuilder(SERVICE_NAME)
              .setSchemaDescriptor(new StockKlineServiceFileDescriptorSupplier())
              .addMethod(getGetKlineMethodHelper())
              .build();
        }
      }
    }
    return result;
  }
}
