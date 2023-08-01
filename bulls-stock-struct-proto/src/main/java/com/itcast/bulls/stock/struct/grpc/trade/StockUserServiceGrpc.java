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
 * 用户管理服务接口
 * </pre>
 */
@javax.annotation.Generated(
    value = "by gRPC proto compiler (version 1.10.0)",
    comments = "Source: grpc/StockUserService.proto")
public final class StockUserServiceGrpc {

  private StockUserServiceGrpc() {}

  public static final String SERVICE_NAME = "StockUserService";

  // Static method descriptors that strictly reflect the proto.
  @io.grpc.ExperimentalApi("https://github.com/grpc/grpc-java/issues/1901")
  @java.lang.Deprecated // Use {@link #getUserLoginMethod()} instead. 
  public static final io.grpc.MethodDescriptor<com.itcast.bulls.stock.struct.grpc.trade.LoginRequest,
      com.itcast.bulls.stock.struct.grpc.trade.LoginReponse> METHOD_USER_LOGIN = getUserLoginMethodHelper();

  private static volatile io.grpc.MethodDescriptor<com.itcast.bulls.stock.struct.grpc.trade.LoginRequest,
      com.itcast.bulls.stock.struct.grpc.trade.LoginReponse> getUserLoginMethod;

  @io.grpc.ExperimentalApi("https://github.com/grpc/grpc-java/issues/1901")
  public static io.grpc.MethodDescriptor<com.itcast.bulls.stock.struct.grpc.trade.LoginRequest,
      com.itcast.bulls.stock.struct.grpc.trade.LoginReponse> getUserLoginMethod() {
    return getUserLoginMethodHelper();
  }

  private static io.grpc.MethodDescriptor<com.itcast.bulls.stock.struct.grpc.trade.LoginRequest,
      com.itcast.bulls.stock.struct.grpc.trade.LoginReponse> getUserLoginMethodHelper() {
    io.grpc.MethodDescriptor<com.itcast.bulls.stock.struct.grpc.trade.LoginRequest, com.itcast.bulls.stock.struct.grpc.trade.LoginReponse> getUserLoginMethod;
    if ((getUserLoginMethod = StockUserServiceGrpc.getUserLoginMethod) == null) {
      synchronized (StockUserServiceGrpc.class) {
        if ((getUserLoginMethod = StockUserServiceGrpc.getUserLoginMethod) == null) {
          StockUserServiceGrpc.getUserLoginMethod = getUserLoginMethod = 
              io.grpc.MethodDescriptor.<com.itcast.bulls.stock.struct.grpc.trade.LoginRequest, com.itcast.bulls.stock.struct.grpc.trade.LoginReponse>newBuilder()
              .setType(io.grpc.MethodDescriptor.MethodType.UNARY)
              .setFullMethodName(generateFullMethodName(
                  "StockUserService", "userLogin"))
              .setSampledToLocalTracing(true)
              .setRequestMarshaller(io.grpc.protobuf.ProtoUtils.marshaller(
                  com.itcast.bulls.stock.struct.grpc.trade.LoginRequest.getDefaultInstance()))
              .setResponseMarshaller(io.grpc.protobuf.ProtoUtils.marshaller(
                  com.itcast.bulls.stock.struct.grpc.trade.LoginReponse.getDefaultInstance()))
                  .setSchemaDescriptor(new StockUserServiceMethodDescriptorSupplier("userLogin"))
                  .build();
          }
        }
     }
     return getUserLoginMethod;
  }
  @io.grpc.ExperimentalApi("https://github.com/grpc/grpc-java/issues/1901")
  @java.lang.Deprecated // Use {@link #getAccountWarnSettingMethod()} instead. 
  public static final io.grpc.MethodDescriptor<com.itcast.bulls.stock.struct.grpc.trade.AccountWarnSettingRequest,
      com.itcast.bulls.stock.struct.grpc.trade.AccountWarnSettingResponse> METHOD_ACCOUNT_WARN_SETTING = getAccountWarnSettingMethodHelper();

  private static volatile io.grpc.MethodDescriptor<com.itcast.bulls.stock.struct.grpc.trade.AccountWarnSettingRequest,
      com.itcast.bulls.stock.struct.grpc.trade.AccountWarnSettingResponse> getAccountWarnSettingMethod;

  @io.grpc.ExperimentalApi("https://github.com/grpc/grpc-java/issues/1901")
  public static io.grpc.MethodDescriptor<com.itcast.bulls.stock.struct.grpc.trade.AccountWarnSettingRequest,
      com.itcast.bulls.stock.struct.grpc.trade.AccountWarnSettingResponse> getAccountWarnSettingMethod() {
    return getAccountWarnSettingMethodHelper();
  }

  private static io.grpc.MethodDescriptor<com.itcast.bulls.stock.struct.grpc.trade.AccountWarnSettingRequest,
      com.itcast.bulls.stock.struct.grpc.trade.AccountWarnSettingResponse> getAccountWarnSettingMethodHelper() {
    io.grpc.MethodDescriptor<com.itcast.bulls.stock.struct.grpc.trade.AccountWarnSettingRequest, com.itcast.bulls.stock.struct.grpc.trade.AccountWarnSettingResponse> getAccountWarnSettingMethod;
    if ((getAccountWarnSettingMethod = StockUserServiceGrpc.getAccountWarnSettingMethod) == null) {
      synchronized (StockUserServiceGrpc.class) {
        if ((getAccountWarnSettingMethod = StockUserServiceGrpc.getAccountWarnSettingMethod) == null) {
          StockUserServiceGrpc.getAccountWarnSettingMethod = getAccountWarnSettingMethod = 
              io.grpc.MethodDescriptor.<com.itcast.bulls.stock.struct.grpc.trade.AccountWarnSettingRequest, com.itcast.bulls.stock.struct.grpc.trade.AccountWarnSettingResponse>newBuilder()
              .setType(io.grpc.MethodDescriptor.MethodType.UNARY)
              .setFullMethodName(generateFullMethodName(
                  "StockUserService", "accountWarnSetting"))
              .setSampledToLocalTracing(true)
              .setRequestMarshaller(io.grpc.protobuf.ProtoUtils.marshaller(
                  com.itcast.bulls.stock.struct.grpc.trade.AccountWarnSettingRequest.getDefaultInstance()))
              .setResponseMarshaller(io.grpc.protobuf.ProtoUtils.marshaller(
                  com.itcast.bulls.stock.struct.grpc.trade.AccountWarnSettingResponse.getDefaultInstance()))
                  .setSchemaDescriptor(new StockUserServiceMethodDescriptorSupplier("accountWarnSetting"))
                  .build();
          }
        }
     }
     return getAccountWarnSettingMethod;
  }

  /**
   * Creates a new async stub that supports all call types for the service
   */
  public static StockUserServiceStub newStub(io.grpc.Channel channel) {
    return new StockUserServiceStub(channel);
  }

  /**
   * Creates a new blocking-style stub that supports unary and streaming output calls on the service
   */
  public static StockUserServiceBlockingStub newBlockingStub(
      io.grpc.Channel channel) {
    return new StockUserServiceBlockingStub(channel);
  }

  /**
   * Creates a new ListenableFuture-style stub that supports unary calls on the service
   */
  public static StockUserServiceFutureStub newFutureStub(
      io.grpc.Channel channel) {
    return new StockUserServiceFutureStub(channel);
  }

  /**
   * <pre>
   * 用户管理服务接口
   * </pre>
   */
  public static abstract class StockUserServiceImplBase implements io.grpc.BindableService {

    /**
     * <pre>
     * 用户登陆
     * </pre>
     */
    public void userLogin(com.itcast.bulls.stock.struct.grpc.trade.LoginRequest request,
        io.grpc.stub.StreamObserver<com.itcast.bulls.stock.struct.grpc.trade.LoginReponse> responseObserver) {
      asyncUnimplementedUnaryCall(getUserLoginMethodHelper(), responseObserver);
    }

    /**
     * <pre>
     * 账户预警设置接口
     * </pre>
     */
    public void accountWarnSetting(com.itcast.bulls.stock.struct.grpc.trade.AccountWarnSettingRequest request,
        io.grpc.stub.StreamObserver<com.itcast.bulls.stock.struct.grpc.trade.AccountWarnSettingResponse> responseObserver) {
      asyncUnimplementedUnaryCall(getAccountWarnSettingMethodHelper(), responseObserver);
    }

    @java.lang.Override public final io.grpc.ServerServiceDefinition bindService() {
      return io.grpc.ServerServiceDefinition.builder(getServiceDescriptor())
          .addMethod(
            getUserLoginMethodHelper(),
            asyncUnaryCall(
              new MethodHandlers<
                com.itcast.bulls.stock.struct.grpc.trade.LoginRequest,
                com.itcast.bulls.stock.struct.grpc.trade.LoginReponse>(
                  this, METHODID_USER_LOGIN)))
          .addMethod(
            getAccountWarnSettingMethodHelper(),
            asyncUnaryCall(
              new MethodHandlers<
                com.itcast.bulls.stock.struct.grpc.trade.AccountWarnSettingRequest,
                com.itcast.bulls.stock.struct.grpc.trade.AccountWarnSettingResponse>(
                  this, METHODID_ACCOUNT_WARN_SETTING)))
          .build();
    }
  }

  /**
   * <pre>
   * 用户管理服务接口
   * </pre>
   */
  public static final class StockUserServiceStub extends io.grpc.stub.AbstractStub<StockUserServiceStub> {
    private StockUserServiceStub(io.grpc.Channel channel) {
      super(channel);
    }

    private StockUserServiceStub(io.grpc.Channel channel,
        io.grpc.CallOptions callOptions) {
      super(channel, callOptions);
    }

    @java.lang.Override
    protected StockUserServiceStub build(io.grpc.Channel channel,
        io.grpc.CallOptions callOptions) {
      return new StockUserServiceStub(channel, callOptions);
    }

    /**
     * <pre>
     * 用户登陆
     * </pre>
     */
    public void userLogin(com.itcast.bulls.stock.struct.grpc.trade.LoginRequest request,
        io.grpc.stub.StreamObserver<com.itcast.bulls.stock.struct.grpc.trade.LoginReponse> responseObserver) {
      asyncUnaryCall(
          getChannel().newCall(getUserLoginMethodHelper(), getCallOptions()), request, responseObserver);
    }

    /**
     * <pre>
     * 账户预警设置接口
     * </pre>
     */
    public void accountWarnSetting(com.itcast.bulls.stock.struct.grpc.trade.AccountWarnSettingRequest request,
        io.grpc.stub.StreamObserver<com.itcast.bulls.stock.struct.grpc.trade.AccountWarnSettingResponse> responseObserver) {
      asyncUnaryCall(
          getChannel().newCall(getAccountWarnSettingMethodHelper(), getCallOptions()), request, responseObserver);
    }
  }

  /**
   * <pre>
   * 用户管理服务接口
   * </pre>
   */
  public static final class StockUserServiceBlockingStub extends io.grpc.stub.AbstractStub<StockUserServiceBlockingStub> {
    private StockUserServiceBlockingStub(io.grpc.Channel channel) {
      super(channel);
    }

    private StockUserServiceBlockingStub(io.grpc.Channel channel,
        io.grpc.CallOptions callOptions) {
      super(channel, callOptions);
    }

    @java.lang.Override
    protected StockUserServiceBlockingStub build(io.grpc.Channel channel,
        io.grpc.CallOptions callOptions) {
      return new StockUserServiceBlockingStub(channel, callOptions);
    }

    /**
     * <pre>
     * 用户登陆
     * </pre>
     */
    public com.itcast.bulls.stock.struct.grpc.trade.LoginReponse userLogin(com.itcast.bulls.stock.struct.grpc.trade.LoginRequest request) {
      return blockingUnaryCall(
          getChannel(), getUserLoginMethodHelper(), getCallOptions(), request);
    }

    /**
     * <pre>
     * 账户预警设置接口
     * </pre>
     */
    public com.itcast.bulls.stock.struct.grpc.trade.AccountWarnSettingResponse accountWarnSetting(com.itcast.bulls.stock.struct.grpc.trade.AccountWarnSettingRequest request) {
      return blockingUnaryCall(
          getChannel(), getAccountWarnSettingMethodHelper(), getCallOptions(), request);
    }
  }

  /**
   * <pre>
   * 用户管理服务接口
   * </pre>
   */
  public static final class StockUserServiceFutureStub extends io.grpc.stub.AbstractStub<StockUserServiceFutureStub> {
    private StockUserServiceFutureStub(io.grpc.Channel channel) {
      super(channel);
    }

    private StockUserServiceFutureStub(io.grpc.Channel channel,
        io.grpc.CallOptions callOptions) {
      super(channel, callOptions);
    }

    @java.lang.Override
    protected StockUserServiceFutureStub build(io.grpc.Channel channel,
        io.grpc.CallOptions callOptions) {
      return new StockUserServiceFutureStub(channel, callOptions);
    }

    /**
     * <pre>
     * 用户登陆
     * </pre>
     */
    public com.google.common.util.concurrent.ListenableFuture<com.itcast.bulls.stock.struct.grpc.trade.LoginReponse> userLogin(
        com.itcast.bulls.stock.struct.grpc.trade.LoginRequest request) {
      return futureUnaryCall(
          getChannel().newCall(getUserLoginMethodHelper(), getCallOptions()), request);
    }

    /**
     * <pre>
     * 账户预警设置接口
     * </pre>
     */
    public com.google.common.util.concurrent.ListenableFuture<com.itcast.bulls.stock.struct.grpc.trade.AccountWarnSettingResponse> accountWarnSetting(
        com.itcast.bulls.stock.struct.grpc.trade.AccountWarnSettingRequest request) {
      return futureUnaryCall(
          getChannel().newCall(getAccountWarnSettingMethodHelper(), getCallOptions()), request);
    }
  }

  private static final int METHODID_USER_LOGIN = 0;
  private static final int METHODID_ACCOUNT_WARN_SETTING = 1;

  private static final class MethodHandlers<Req, Resp> implements
      io.grpc.stub.ServerCalls.UnaryMethod<Req, Resp>,
      io.grpc.stub.ServerCalls.ServerStreamingMethod<Req, Resp>,
      io.grpc.stub.ServerCalls.ClientStreamingMethod<Req, Resp>,
      io.grpc.stub.ServerCalls.BidiStreamingMethod<Req, Resp> {
    private final StockUserServiceImplBase serviceImpl;
    private final int methodId;

    MethodHandlers(StockUserServiceImplBase serviceImpl, int methodId) {
      this.serviceImpl = serviceImpl;
      this.methodId = methodId;
    }

    @java.lang.Override
    @java.lang.SuppressWarnings("unchecked")
    public void invoke(Req request, io.grpc.stub.StreamObserver<Resp> responseObserver) {
      switch (methodId) {
        case METHODID_USER_LOGIN:
          serviceImpl.userLogin((com.itcast.bulls.stock.struct.grpc.trade.LoginRequest) request,
              (io.grpc.stub.StreamObserver<com.itcast.bulls.stock.struct.grpc.trade.LoginReponse>) responseObserver);
          break;
        case METHODID_ACCOUNT_WARN_SETTING:
          serviceImpl.accountWarnSetting((com.itcast.bulls.stock.struct.grpc.trade.AccountWarnSettingRequest) request,
              (io.grpc.stub.StreamObserver<com.itcast.bulls.stock.struct.grpc.trade.AccountWarnSettingResponse>) responseObserver);
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

  private static abstract class StockUserServiceBaseDescriptorSupplier
      implements io.grpc.protobuf.ProtoFileDescriptorSupplier, io.grpc.protobuf.ProtoServiceDescriptorSupplier {
    StockUserServiceBaseDescriptorSupplier() {}

    @java.lang.Override
    public com.google.protobuf.Descriptors.FileDescriptor getFileDescriptor() {
      return com.itcast.bulls.stock.struct.grpc.trade.StockUserServiceProto.getDescriptor();
    }

    @java.lang.Override
    public com.google.protobuf.Descriptors.ServiceDescriptor getServiceDescriptor() {
      return getFileDescriptor().findServiceByName("StockUserService");
    }
  }

  private static final class StockUserServiceFileDescriptorSupplier
      extends StockUserServiceBaseDescriptorSupplier {
    StockUserServiceFileDescriptorSupplier() {}
  }

  private static final class StockUserServiceMethodDescriptorSupplier
      extends StockUserServiceBaseDescriptorSupplier
      implements io.grpc.protobuf.ProtoMethodDescriptorSupplier {
    private final String methodName;

    StockUserServiceMethodDescriptorSupplier(String methodName) {
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
      synchronized (StockUserServiceGrpc.class) {
        result = serviceDescriptor;
        if (result == null) {
          serviceDescriptor = result = io.grpc.ServiceDescriptor.newBuilder(SERVICE_NAME)
              .setSchemaDescriptor(new StockUserServiceFileDescriptorSupplier())
              .addMethod(getUserLoginMethodHelper())
              .addMethod(getAccountWarnSettingMethodHelper())
              .build();
        }
      }
    }
    return result;
  }
}
