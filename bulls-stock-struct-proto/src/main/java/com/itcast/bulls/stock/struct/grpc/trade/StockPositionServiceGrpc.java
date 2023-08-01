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
 */
@javax.annotation.Generated(
    value = "by gRPC proto compiler (version 1.10.0)",
    comments = "Source: grpc/StockPositionService.proto")
public final class StockPositionServiceGrpc {

  private StockPositionServiceGrpc() {}

  public static final String SERVICE_NAME = "StockPositionService";

  // Static method descriptors that strictly reflect the proto.
  @io.grpc.ExperimentalApi("https://github.com/grpc/grpc-java/issues/1901")
  @java.lang.Deprecated // Use {@link #getGetAllPositionsMethod()} instead. 
  public static final io.grpc.MethodDescriptor<com.itcast.bulls.stock.struct.grpc.trade.GetAllPositionRequest,
      com.itcast.bulls.stock.struct.grpc.trade.GetAllPositionReponse> METHOD_GET_ALL_POSITIONS = getGetAllPositionsMethodHelper();

  private static volatile io.grpc.MethodDescriptor<com.itcast.bulls.stock.struct.grpc.trade.GetAllPositionRequest,
      com.itcast.bulls.stock.struct.grpc.trade.GetAllPositionReponse> getGetAllPositionsMethod;

  @io.grpc.ExperimentalApi("https://github.com/grpc/grpc-java/issues/1901")
  public static io.grpc.MethodDescriptor<com.itcast.bulls.stock.struct.grpc.trade.GetAllPositionRequest,
      com.itcast.bulls.stock.struct.grpc.trade.GetAllPositionReponse> getGetAllPositionsMethod() {
    return getGetAllPositionsMethodHelper();
  }

  private static io.grpc.MethodDescriptor<com.itcast.bulls.stock.struct.grpc.trade.GetAllPositionRequest,
      com.itcast.bulls.stock.struct.grpc.trade.GetAllPositionReponse> getGetAllPositionsMethodHelper() {
    io.grpc.MethodDescriptor<com.itcast.bulls.stock.struct.grpc.trade.GetAllPositionRequest, com.itcast.bulls.stock.struct.grpc.trade.GetAllPositionReponse> getGetAllPositionsMethod;
    if ((getGetAllPositionsMethod = StockPositionServiceGrpc.getGetAllPositionsMethod) == null) {
      synchronized (StockPositionServiceGrpc.class) {
        if ((getGetAllPositionsMethod = StockPositionServiceGrpc.getGetAllPositionsMethod) == null) {
          StockPositionServiceGrpc.getGetAllPositionsMethod = getGetAllPositionsMethod = 
              io.grpc.MethodDescriptor.<com.itcast.bulls.stock.struct.grpc.trade.GetAllPositionRequest, com.itcast.bulls.stock.struct.grpc.trade.GetAllPositionReponse>newBuilder()
              .setType(io.grpc.MethodDescriptor.MethodType.UNARY)
              .setFullMethodName(generateFullMethodName(
                  "StockPositionService", "getAllPositions"))
              .setSampledToLocalTracing(true)
              .setRequestMarshaller(io.grpc.protobuf.ProtoUtils.marshaller(
                  com.itcast.bulls.stock.struct.grpc.trade.GetAllPositionRequest.getDefaultInstance()))
              .setResponseMarshaller(io.grpc.protobuf.ProtoUtils.marshaller(
                  com.itcast.bulls.stock.struct.grpc.trade.GetAllPositionReponse.getDefaultInstance()))
                  .setSchemaDescriptor(new StockPositionServiceMethodDescriptorSupplier("getAllPositions"))
                  .build();
          }
        }
     }
     return getGetAllPositionsMethod;
  }

  /**
   * Creates a new async stub that supports all call types for the service
   */
  public static StockPositionServiceStub newStub(io.grpc.Channel channel) {
    return new StockPositionServiceStub(channel);
  }

  /**
   * Creates a new blocking-style stub that supports unary and streaming output calls on the service
   */
  public static StockPositionServiceBlockingStub newBlockingStub(
      io.grpc.Channel channel) {
    return new StockPositionServiceBlockingStub(channel);
  }

  /**
   * Creates a new ListenableFuture-style stub that supports unary calls on the service
   */
  public static StockPositionServiceFutureStub newFutureStub(
      io.grpc.Channel channel) {
    return new StockPositionServiceFutureStub(channel);
  }

  /**
   */
  public static abstract class StockPositionServiceImplBase implements io.grpc.BindableService {

    /**
     * <pre>
     * 获取所有持仓信息接口
     * </pre>
     */
    public void getAllPositions(com.itcast.bulls.stock.struct.grpc.trade.GetAllPositionRequest request,
        io.grpc.stub.StreamObserver<com.itcast.bulls.stock.struct.grpc.trade.GetAllPositionReponse> responseObserver) {
      asyncUnimplementedUnaryCall(getGetAllPositionsMethodHelper(), responseObserver);
    }

    @java.lang.Override public final io.grpc.ServerServiceDefinition bindService() {
      return io.grpc.ServerServiceDefinition.builder(getServiceDescriptor())
          .addMethod(
            getGetAllPositionsMethodHelper(),
            asyncUnaryCall(
              new MethodHandlers<
                com.itcast.bulls.stock.struct.grpc.trade.GetAllPositionRequest,
                com.itcast.bulls.stock.struct.grpc.trade.GetAllPositionReponse>(
                  this, METHODID_GET_ALL_POSITIONS)))
          .build();
    }
  }

  /**
   */
  public static final class StockPositionServiceStub extends io.grpc.stub.AbstractStub<StockPositionServiceStub> {
    private StockPositionServiceStub(io.grpc.Channel channel) {
      super(channel);
    }

    private StockPositionServiceStub(io.grpc.Channel channel,
        io.grpc.CallOptions callOptions) {
      super(channel, callOptions);
    }

    @java.lang.Override
    protected StockPositionServiceStub build(io.grpc.Channel channel,
        io.grpc.CallOptions callOptions) {
      return new StockPositionServiceStub(channel, callOptions);
    }

    /**
     * <pre>
     * 获取所有持仓信息接口
     * </pre>
     */
    public void getAllPositions(com.itcast.bulls.stock.struct.grpc.trade.GetAllPositionRequest request,
        io.grpc.stub.StreamObserver<com.itcast.bulls.stock.struct.grpc.trade.GetAllPositionReponse> responseObserver) {
      asyncUnaryCall(
          getChannel().newCall(getGetAllPositionsMethodHelper(), getCallOptions()), request, responseObserver);
    }
  }

  /**
   */
  public static final class StockPositionServiceBlockingStub extends io.grpc.stub.AbstractStub<StockPositionServiceBlockingStub> {
    private StockPositionServiceBlockingStub(io.grpc.Channel channel) {
      super(channel);
    }

    private StockPositionServiceBlockingStub(io.grpc.Channel channel,
        io.grpc.CallOptions callOptions) {
      super(channel, callOptions);
    }

    @java.lang.Override
    protected StockPositionServiceBlockingStub build(io.grpc.Channel channel,
        io.grpc.CallOptions callOptions) {
      return new StockPositionServiceBlockingStub(channel, callOptions);
    }

    /**
     * <pre>
     * 获取所有持仓信息接口
     * </pre>
     */
    public com.itcast.bulls.stock.struct.grpc.trade.GetAllPositionReponse getAllPositions(com.itcast.bulls.stock.struct.grpc.trade.GetAllPositionRequest request) {
      return blockingUnaryCall(
          getChannel(), getGetAllPositionsMethodHelper(), getCallOptions(), request);
    }
  }

  /**
   */
  public static final class StockPositionServiceFutureStub extends io.grpc.stub.AbstractStub<StockPositionServiceFutureStub> {
    private StockPositionServiceFutureStub(io.grpc.Channel channel) {
      super(channel);
    }

    private StockPositionServiceFutureStub(io.grpc.Channel channel,
        io.grpc.CallOptions callOptions) {
      super(channel, callOptions);
    }

    @java.lang.Override
    protected StockPositionServiceFutureStub build(io.grpc.Channel channel,
        io.grpc.CallOptions callOptions) {
      return new StockPositionServiceFutureStub(channel, callOptions);
    }

    /**
     * <pre>
     * 获取所有持仓信息接口
     * </pre>
     */
    public com.google.common.util.concurrent.ListenableFuture<com.itcast.bulls.stock.struct.grpc.trade.GetAllPositionReponse> getAllPositions(
        com.itcast.bulls.stock.struct.grpc.trade.GetAllPositionRequest request) {
      return futureUnaryCall(
          getChannel().newCall(getGetAllPositionsMethodHelper(), getCallOptions()), request);
    }
  }

  private static final int METHODID_GET_ALL_POSITIONS = 0;

  private static final class MethodHandlers<Req, Resp> implements
      io.grpc.stub.ServerCalls.UnaryMethod<Req, Resp>,
      io.grpc.stub.ServerCalls.ServerStreamingMethod<Req, Resp>,
      io.grpc.stub.ServerCalls.ClientStreamingMethod<Req, Resp>,
      io.grpc.stub.ServerCalls.BidiStreamingMethod<Req, Resp> {
    private final StockPositionServiceImplBase serviceImpl;
    private final int methodId;

    MethodHandlers(StockPositionServiceImplBase serviceImpl, int methodId) {
      this.serviceImpl = serviceImpl;
      this.methodId = methodId;
    }

    @java.lang.Override
    @java.lang.SuppressWarnings("unchecked")
    public void invoke(Req request, io.grpc.stub.StreamObserver<Resp> responseObserver) {
      switch (methodId) {
        case METHODID_GET_ALL_POSITIONS:
          serviceImpl.getAllPositions((com.itcast.bulls.stock.struct.grpc.trade.GetAllPositionRequest) request,
              (io.grpc.stub.StreamObserver<com.itcast.bulls.stock.struct.grpc.trade.GetAllPositionReponse>) responseObserver);
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

  private static abstract class StockPositionServiceBaseDescriptorSupplier
      implements io.grpc.protobuf.ProtoFileDescriptorSupplier, io.grpc.protobuf.ProtoServiceDescriptorSupplier {
    StockPositionServiceBaseDescriptorSupplier() {}

    @java.lang.Override
    public com.google.protobuf.Descriptors.FileDescriptor getFileDescriptor() {
      return com.itcast.bulls.stock.struct.grpc.trade.StockPositionServiceProto.getDescriptor();
    }

    @java.lang.Override
    public com.google.protobuf.Descriptors.ServiceDescriptor getServiceDescriptor() {
      return getFileDescriptor().findServiceByName("StockPositionService");
    }
  }

  private static final class StockPositionServiceFileDescriptorSupplier
      extends StockPositionServiceBaseDescriptorSupplier {
    StockPositionServiceFileDescriptorSupplier() {}
  }

  private static final class StockPositionServiceMethodDescriptorSupplier
      extends StockPositionServiceBaseDescriptorSupplier
      implements io.grpc.protobuf.ProtoMethodDescriptorSupplier {
    private final String methodName;

    StockPositionServiceMethodDescriptorSupplier(String methodName) {
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
      synchronized (StockPositionServiceGrpc.class) {
        result = serviceDescriptor;
        if (result == null) {
          serviceDescriptor = result = io.grpc.ServiceDescriptor.newBuilder(SERVICE_NAME)
              .setSchemaDescriptor(new StockPositionServiceFileDescriptorSupplier())
              .addMethod(getGetAllPositionsMethodHelper())
              .build();
        }
      }
    }
    return result;
  }
}
