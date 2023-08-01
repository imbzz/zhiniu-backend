package com.itcast.trade.stock.struct.grpc.trade;

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
 * 代理服务接口
 * </pre>
 */
@javax.annotation.Generated(
    value = "by gRPC proto compiler (version 1.10.0)",
    comments = "Source: grpc/StockProxyService.proto")
public final class StockProxyServiceGrpc {

  private StockProxyServiceGrpc() {}

  public static final String SERVICE_NAME = "StockProxyService";

  // Static method descriptors that strictly reflect the proto.
  @io.grpc.ExperimentalApi("https://github.com/grpc/grpc-java/issues/1901")
  @java.lang.Deprecated // Use {@link #getNotifyWarnMessageMethod()} instead. 
  public static final io.grpc.MethodDescriptor<com.itcast.trade.stock.struct.grpc.trade.WarnMessageDataRequest,
      com.itcast.trade.stock.struct.grpc.trade.WarnMessageResponse> METHOD_NOTIFY_WARN_MESSAGE = getNotifyWarnMessageMethodHelper();

  private static volatile io.grpc.MethodDescriptor<com.itcast.trade.stock.struct.grpc.trade.WarnMessageDataRequest,
      com.itcast.trade.stock.struct.grpc.trade.WarnMessageResponse> getNotifyWarnMessageMethod;

  @io.grpc.ExperimentalApi("https://github.com/grpc/grpc-java/issues/1901")
  public static io.grpc.MethodDescriptor<com.itcast.trade.stock.struct.grpc.trade.WarnMessageDataRequest,
      com.itcast.trade.stock.struct.grpc.trade.WarnMessageResponse> getNotifyWarnMessageMethod() {
    return getNotifyWarnMessageMethodHelper();
  }

  private static io.grpc.MethodDescriptor<com.itcast.trade.stock.struct.grpc.trade.WarnMessageDataRequest,
      com.itcast.trade.stock.struct.grpc.trade.WarnMessageResponse> getNotifyWarnMessageMethodHelper() {
    io.grpc.MethodDescriptor<com.itcast.trade.stock.struct.grpc.trade.WarnMessageDataRequest, com.itcast.trade.stock.struct.grpc.trade.WarnMessageResponse> getNotifyWarnMessageMethod;
    if ((getNotifyWarnMessageMethod = StockProxyServiceGrpc.getNotifyWarnMessageMethod) == null) {
      synchronized (StockProxyServiceGrpc.class) {
        if ((getNotifyWarnMessageMethod = StockProxyServiceGrpc.getNotifyWarnMessageMethod) == null) {
          StockProxyServiceGrpc.getNotifyWarnMessageMethod = getNotifyWarnMessageMethod = 
              io.grpc.MethodDescriptor.<com.itcast.trade.stock.struct.grpc.trade.WarnMessageDataRequest, com.itcast.trade.stock.struct.grpc.trade.WarnMessageResponse>newBuilder()
              .setType(io.grpc.MethodDescriptor.MethodType.UNARY)
              .setFullMethodName(generateFullMethodName(
                  "StockProxyService", "notifyWarnMessage"))
              .setSampledToLocalTracing(true)
              .setRequestMarshaller(io.grpc.protobuf.ProtoUtils.marshaller(
                  com.itcast.trade.stock.struct.grpc.trade.WarnMessageDataRequest.getDefaultInstance()))
              .setResponseMarshaller(io.grpc.protobuf.ProtoUtils.marshaller(
                  com.itcast.trade.stock.struct.grpc.trade.WarnMessageResponse.getDefaultInstance()))
                  .setSchemaDescriptor(new StockProxyServiceMethodDescriptorSupplier("notifyWarnMessage"))
                  .build();
          }
        }
     }
     return getNotifyWarnMessageMethod;
  }

  /**
   * Creates a new async stub that supports all call types for the service
   */
  public static StockProxyServiceStub newStub(io.grpc.Channel channel) {
    return new StockProxyServiceStub(channel);
  }

  /**
   * Creates a new blocking-style stub that supports unary and streaming output calls on the service
   */
  public static StockProxyServiceBlockingStub newBlockingStub(
      io.grpc.Channel channel) {
    return new StockProxyServiceBlockingStub(channel);
  }

  /**
   * Creates a new ListenableFuture-style stub that supports unary calls on the service
   */
  public static StockProxyServiceFutureStub newFutureStub(
      io.grpc.Channel channel) {
    return new StockProxyServiceFutureStub(channel);
  }

  /**
   * <pre>
   * 代理服务接口
   * </pre>
   */
  public static abstract class StockProxyServiceImplBase implements io.grpc.BindableService {

    /**
     * <pre>
     * 发送预警通知消息
     * </pre>
     */
    public void notifyWarnMessage(com.itcast.trade.stock.struct.grpc.trade.WarnMessageDataRequest request,
        io.grpc.stub.StreamObserver<com.itcast.trade.stock.struct.grpc.trade.WarnMessageResponse> responseObserver) {
      asyncUnimplementedUnaryCall(getNotifyWarnMessageMethodHelper(), responseObserver);
    }

    @java.lang.Override public final io.grpc.ServerServiceDefinition bindService() {
      return io.grpc.ServerServiceDefinition.builder(getServiceDescriptor())
          .addMethod(
            getNotifyWarnMessageMethodHelper(),
            asyncUnaryCall(
              new MethodHandlers<
                com.itcast.trade.stock.struct.grpc.trade.WarnMessageDataRequest,
                com.itcast.trade.stock.struct.grpc.trade.WarnMessageResponse>(
                  this, METHODID_NOTIFY_WARN_MESSAGE)))
          .build();
    }
  }

  /**
   * <pre>
   * 代理服务接口
   * </pre>
   */
  public static final class StockProxyServiceStub extends io.grpc.stub.AbstractStub<StockProxyServiceStub> {
    private StockProxyServiceStub(io.grpc.Channel channel) {
      super(channel);
    }

    private StockProxyServiceStub(io.grpc.Channel channel,
        io.grpc.CallOptions callOptions) {
      super(channel, callOptions);
    }

    @java.lang.Override
    protected StockProxyServiceStub build(io.grpc.Channel channel,
        io.grpc.CallOptions callOptions) {
      return new StockProxyServiceStub(channel, callOptions);
    }

    /**
     * <pre>
     * 发送预警通知消息
     * </pre>
     */
    public void notifyWarnMessage(com.itcast.trade.stock.struct.grpc.trade.WarnMessageDataRequest request,
        io.grpc.stub.StreamObserver<com.itcast.trade.stock.struct.grpc.trade.WarnMessageResponse> responseObserver) {
      asyncUnaryCall(
          getChannel().newCall(getNotifyWarnMessageMethodHelper(), getCallOptions()), request, responseObserver);
    }
  }

  /**
   * <pre>
   * 代理服务接口
   * </pre>
   */
  public static final class StockProxyServiceBlockingStub extends io.grpc.stub.AbstractStub<StockProxyServiceBlockingStub> {
    private StockProxyServiceBlockingStub(io.grpc.Channel channel) {
      super(channel);
    }

    private StockProxyServiceBlockingStub(io.grpc.Channel channel,
        io.grpc.CallOptions callOptions) {
      super(channel, callOptions);
    }

    @java.lang.Override
    protected StockProxyServiceBlockingStub build(io.grpc.Channel channel,
        io.grpc.CallOptions callOptions) {
      return new StockProxyServiceBlockingStub(channel, callOptions);
    }

    /**
     * <pre>
     * 发送预警通知消息
     * </pre>
     */
    public com.itcast.trade.stock.struct.grpc.trade.WarnMessageResponse notifyWarnMessage(com.itcast.trade.stock.struct.grpc.trade.WarnMessageDataRequest request) {
      return blockingUnaryCall(
          getChannel(), getNotifyWarnMessageMethodHelper(), getCallOptions(), request);
    }
  }

  /**
   * <pre>
   * 代理服务接口
   * </pre>
   */
  public static final class StockProxyServiceFutureStub extends io.grpc.stub.AbstractStub<StockProxyServiceFutureStub> {
    private StockProxyServiceFutureStub(io.grpc.Channel channel) {
      super(channel);
    }

    private StockProxyServiceFutureStub(io.grpc.Channel channel,
        io.grpc.CallOptions callOptions) {
      super(channel, callOptions);
    }

    @java.lang.Override
    protected StockProxyServiceFutureStub build(io.grpc.Channel channel,
        io.grpc.CallOptions callOptions) {
      return new StockProxyServiceFutureStub(channel, callOptions);
    }

    /**
     * <pre>
     * 发送预警通知消息
     * </pre>
     */
    public com.google.common.util.concurrent.ListenableFuture<com.itcast.trade.stock.struct.grpc.trade.WarnMessageResponse> notifyWarnMessage(
        com.itcast.trade.stock.struct.grpc.trade.WarnMessageDataRequest request) {
      return futureUnaryCall(
          getChannel().newCall(getNotifyWarnMessageMethodHelper(), getCallOptions()), request);
    }
  }

  private static final int METHODID_NOTIFY_WARN_MESSAGE = 0;

  private static final class MethodHandlers<Req, Resp> implements
      io.grpc.stub.ServerCalls.UnaryMethod<Req, Resp>,
      io.grpc.stub.ServerCalls.ServerStreamingMethod<Req, Resp>,
      io.grpc.stub.ServerCalls.ClientStreamingMethod<Req, Resp>,
      io.grpc.stub.ServerCalls.BidiStreamingMethod<Req, Resp> {
    private final StockProxyServiceImplBase serviceImpl;
    private final int methodId;

    MethodHandlers(StockProxyServiceImplBase serviceImpl, int methodId) {
      this.serviceImpl = serviceImpl;
      this.methodId = methodId;
    }

    @java.lang.Override
    @java.lang.SuppressWarnings("unchecked")
    public void invoke(Req request, io.grpc.stub.StreamObserver<Resp> responseObserver) {
      switch (methodId) {
        case METHODID_NOTIFY_WARN_MESSAGE:
          serviceImpl.notifyWarnMessage((com.itcast.trade.stock.struct.grpc.trade.WarnMessageDataRequest) request,
              (io.grpc.stub.StreamObserver<com.itcast.trade.stock.struct.grpc.trade.WarnMessageResponse>) responseObserver);
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

  private static abstract class StockProxyServiceBaseDescriptorSupplier
      implements io.grpc.protobuf.ProtoFileDescriptorSupplier, io.grpc.protobuf.ProtoServiceDescriptorSupplier {
    StockProxyServiceBaseDescriptorSupplier() {}

    @java.lang.Override
    public com.google.protobuf.Descriptors.FileDescriptor getFileDescriptor() {
      return com.itcast.trade.stock.struct.grpc.trade.StockProxyServiceProto.getDescriptor();
    }

    @java.lang.Override
    public com.google.protobuf.Descriptors.ServiceDescriptor getServiceDescriptor() {
      return getFileDescriptor().findServiceByName("StockProxyService");
    }
  }

  private static final class StockProxyServiceFileDescriptorSupplier
      extends StockProxyServiceBaseDescriptorSupplier {
    StockProxyServiceFileDescriptorSupplier() {}
  }

  private static final class StockProxyServiceMethodDescriptorSupplier
      extends StockProxyServiceBaseDescriptorSupplier
      implements io.grpc.protobuf.ProtoMethodDescriptorSupplier {
    private final String methodName;

    StockProxyServiceMethodDescriptorSupplier(String methodName) {
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
      synchronized (StockProxyServiceGrpc.class) {
        result = serviceDescriptor;
        if (result == null) {
          serviceDescriptor = result = io.grpc.ServiceDescriptor.newBuilder(SERVICE_NAME)
              .setSchemaDescriptor(new StockProxyServiceFileDescriptorSupplier())
              .addMethod(getNotifyWarnMessageMethodHelper())
              .build();
        }
      }
    }
    return result;
  }
}
