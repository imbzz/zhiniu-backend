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
 * 资金服务的grpc接口
 * </pre>
 */
@javax.annotation.Generated(
    value = "by gRPC proto compiler (version 1.10.0)",
    comments = "Source: grpc/StockFinanceService.proto")
public final class StockFinanceServiceGrpc {

  private StockFinanceServiceGrpc() {}

  public static final String SERVICE_NAME = "StockFinanceService";

  // Static method descriptors that strictly reflect the proto.
  @io.grpc.ExperimentalApi("https://github.com/grpc/grpc-java/issues/1901")
  @java.lang.Deprecated // Use {@link #getGetFinanceOverviewMethod()} instead. 
  public static final io.grpc.MethodDescriptor<com.itcast.bulls.stock.struct.grpc.trade.GetFinanceOverviewRequest,
      com.itcast.bulls.stock.struct.grpc.trade.GetFinanceOverviewResponse> METHOD_GET_FINANCE_OVERVIEW = getGetFinanceOverviewMethodHelper();

  private static volatile io.grpc.MethodDescriptor<com.itcast.bulls.stock.struct.grpc.trade.GetFinanceOverviewRequest,
      com.itcast.bulls.stock.struct.grpc.trade.GetFinanceOverviewResponse> getGetFinanceOverviewMethod;

  @io.grpc.ExperimentalApi("https://github.com/grpc/grpc-java/issues/1901")
  public static io.grpc.MethodDescriptor<com.itcast.bulls.stock.struct.grpc.trade.GetFinanceOverviewRequest,
      com.itcast.bulls.stock.struct.grpc.trade.GetFinanceOverviewResponse> getGetFinanceOverviewMethod() {
    return getGetFinanceOverviewMethodHelper();
  }

  private static io.grpc.MethodDescriptor<com.itcast.bulls.stock.struct.grpc.trade.GetFinanceOverviewRequest,
      com.itcast.bulls.stock.struct.grpc.trade.GetFinanceOverviewResponse> getGetFinanceOverviewMethodHelper() {
    io.grpc.MethodDescriptor<com.itcast.bulls.stock.struct.grpc.trade.GetFinanceOverviewRequest, com.itcast.bulls.stock.struct.grpc.trade.GetFinanceOverviewResponse> getGetFinanceOverviewMethod;
    if ((getGetFinanceOverviewMethod = StockFinanceServiceGrpc.getGetFinanceOverviewMethod) == null) {
      synchronized (StockFinanceServiceGrpc.class) {
        if ((getGetFinanceOverviewMethod = StockFinanceServiceGrpc.getGetFinanceOverviewMethod) == null) {
          StockFinanceServiceGrpc.getGetFinanceOverviewMethod = getGetFinanceOverviewMethod = 
              io.grpc.MethodDescriptor.<com.itcast.bulls.stock.struct.grpc.trade.GetFinanceOverviewRequest, com.itcast.bulls.stock.struct.grpc.trade.GetFinanceOverviewResponse>newBuilder()
              .setType(io.grpc.MethodDescriptor.MethodType.UNARY)
              .setFullMethodName(generateFullMethodName(
                  "StockFinanceService", "getFinanceOverview"))
              .setSampledToLocalTracing(true)
              .setRequestMarshaller(io.grpc.protobuf.ProtoUtils.marshaller(
                  com.itcast.bulls.stock.struct.grpc.trade.GetFinanceOverviewRequest.getDefaultInstance()))
              .setResponseMarshaller(io.grpc.protobuf.ProtoUtils.marshaller(
                  com.itcast.bulls.stock.struct.grpc.trade.GetFinanceOverviewResponse.getDefaultInstance()))
                  .setSchemaDescriptor(new StockFinanceServiceMethodDescriptorSupplier("getFinanceOverview"))
                  .build();
          }
        }
     }
     return getGetFinanceOverviewMethod;
  }
  @io.grpc.ExperimentalApi("https://github.com/grpc/grpc-java/issues/1901")
  @java.lang.Deprecated // Use {@link #getUpdateAccountBalanceMethod()} instead. 
  public static final io.grpc.MethodDescriptor<com.itcast.bulls.stock.struct.grpc.trade.UpdateBalanceRequest,
      com.itcast.bulls.stock.struct.grpc.trade.UpdateBalanceResponse> METHOD_UPDATE_ACCOUNT_BALANCE = getUpdateAccountBalanceMethodHelper();

  private static volatile io.grpc.MethodDescriptor<com.itcast.bulls.stock.struct.grpc.trade.UpdateBalanceRequest,
      com.itcast.bulls.stock.struct.grpc.trade.UpdateBalanceResponse> getUpdateAccountBalanceMethod;

  @io.grpc.ExperimentalApi("https://github.com/grpc/grpc-java/issues/1901")
  public static io.grpc.MethodDescriptor<com.itcast.bulls.stock.struct.grpc.trade.UpdateBalanceRequest,
      com.itcast.bulls.stock.struct.grpc.trade.UpdateBalanceResponse> getUpdateAccountBalanceMethod() {
    return getUpdateAccountBalanceMethodHelper();
  }

  private static io.grpc.MethodDescriptor<com.itcast.bulls.stock.struct.grpc.trade.UpdateBalanceRequest,
      com.itcast.bulls.stock.struct.grpc.trade.UpdateBalanceResponse> getUpdateAccountBalanceMethodHelper() {
    io.grpc.MethodDescriptor<com.itcast.bulls.stock.struct.grpc.trade.UpdateBalanceRequest, com.itcast.bulls.stock.struct.grpc.trade.UpdateBalanceResponse> getUpdateAccountBalanceMethod;
    if ((getUpdateAccountBalanceMethod = StockFinanceServiceGrpc.getUpdateAccountBalanceMethod) == null) {
      synchronized (StockFinanceServiceGrpc.class) {
        if ((getUpdateAccountBalanceMethod = StockFinanceServiceGrpc.getUpdateAccountBalanceMethod) == null) {
          StockFinanceServiceGrpc.getUpdateAccountBalanceMethod = getUpdateAccountBalanceMethod = 
              io.grpc.MethodDescriptor.<com.itcast.bulls.stock.struct.grpc.trade.UpdateBalanceRequest, com.itcast.bulls.stock.struct.grpc.trade.UpdateBalanceResponse>newBuilder()
              .setType(io.grpc.MethodDescriptor.MethodType.UNARY)
              .setFullMethodName(generateFullMethodName(
                  "StockFinanceService", "updateAccountBalance"))
              .setSampledToLocalTracing(true)
              .setRequestMarshaller(io.grpc.protobuf.ProtoUtils.marshaller(
                  com.itcast.bulls.stock.struct.grpc.trade.UpdateBalanceRequest.getDefaultInstance()))
              .setResponseMarshaller(io.grpc.protobuf.ProtoUtils.marshaller(
                  com.itcast.bulls.stock.struct.grpc.trade.UpdateBalanceResponse.getDefaultInstance()))
                  .setSchemaDescriptor(new StockFinanceServiceMethodDescriptorSupplier("updateAccountBalance"))
                  .build();
          }
        }
     }
     return getUpdateAccountBalanceMethod;
  }
  @io.grpc.ExperimentalApi("https://github.com/grpc/grpc-java/issues/1901")
  @java.lang.Deprecated // Use {@link #getGetAccountBalanceMethod()} instead. 
  public static final io.grpc.MethodDescriptor<com.itcast.bulls.stock.struct.grpc.trade.GetBalanceRequest,
      com.itcast.bulls.stock.struct.grpc.trade.GetBalanceResponse> METHOD_GET_ACCOUNT_BALANCE = getGetAccountBalanceMethodHelper();

  private static volatile io.grpc.MethodDescriptor<com.itcast.bulls.stock.struct.grpc.trade.GetBalanceRequest,
      com.itcast.bulls.stock.struct.grpc.trade.GetBalanceResponse> getGetAccountBalanceMethod;

  @io.grpc.ExperimentalApi("https://github.com/grpc/grpc-java/issues/1901")
  public static io.grpc.MethodDescriptor<com.itcast.bulls.stock.struct.grpc.trade.GetBalanceRequest,
      com.itcast.bulls.stock.struct.grpc.trade.GetBalanceResponse> getGetAccountBalanceMethod() {
    return getGetAccountBalanceMethodHelper();
  }

  private static io.grpc.MethodDescriptor<com.itcast.bulls.stock.struct.grpc.trade.GetBalanceRequest,
      com.itcast.bulls.stock.struct.grpc.trade.GetBalanceResponse> getGetAccountBalanceMethodHelper() {
    io.grpc.MethodDescriptor<com.itcast.bulls.stock.struct.grpc.trade.GetBalanceRequest, com.itcast.bulls.stock.struct.grpc.trade.GetBalanceResponse> getGetAccountBalanceMethod;
    if ((getGetAccountBalanceMethod = StockFinanceServiceGrpc.getGetAccountBalanceMethod) == null) {
      synchronized (StockFinanceServiceGrpc.class) {
        if ((getGetAccountBalanceMethod = StockFinanceServiceGrpc.getGetAccountBalanceMethod) == null) {
          StockFinanceServiceGrpc.getGetAccountBalanceMethod = getGetAccountBalanceMethod = 
              io.grpc.MethodDescriptor.<com.itcast.bulls.stock.struct.grpc.trade.GetBalanceRequest, com.itcast.bulls.stock.struct.grpc.trade.GetBalanceResponse>newBuilder()
              .setType(io.grpc.MethodDescriptor.MethodType.UNARY)
              .setFullMethodName(generateFullMethodName(
                  "StockFinanceService", "getAccountBalance"))
              .setSampledToLocalTracing(true)
              .setRequestMarshaller(io.grpc.protobuf.ProtoUtils.marshaller(
                  com.itcast.bulls.stock.struct.grpc.trade.GetBalanceRequest.getDefaultInstance()))
              .setResponseMarshaller(io.grpc.protobuf.ProtoUtils.marshaller(
                  com.itcast.bulls.stock.struct.grpc.trade.GetBalanceResponse.getDefaultInstance()))
                  .setSchemaDescriptor(new StockFinanceServiceMethodDescriptorSupplier("getAccountBalance"))
                  .build();
          }
        }
     }
     return getGetAccountBalanceMethod;
  }
  @io.grpc.ExperimentalApi("https://github.com/grpc/grpc-java/issues/1901")
  @java.lang.Deprecated // Use {@link #getGetAccountSettlementMethod()} instead. 
  public static final io.grpc.MethodDescriptor<com.itcast.bulls.stock.struct.grpc.trade.GetAccountSettlementRequest,
      com.itcast.bulls.stock.struct.grpc.trade.GetAccountSettlementResponse> METHOD_GET_ACCOUNT_SETTLEMENT = getGetAccountSettlementMethodHelper();

  private static volatile io.grpc.MethodDescriptor<com.itcast.bulls.stock.struct.grpc.trade.GetAccountSettlementRequest,
      com.itcast.bulls.stock.struct.grpc.trade.GetAccountSettlementResponse> getGetAccountSettlementMethod;

  @io.grpc.ExperimentalApi("https://github.com/grpc/grpc-java/issues/1901")
  public static io.grpc.MethodDescriptor<com.itcast.bulls.stock.struct.grpc.trade.GetAccountSettlementRequest,
      com.itcast.bulls.stock.struct.grpc.trade.GetAccountSettlementResponse> getGetAccountSettlementMethod() {
    return getGetAccountSettlementMethodHelper();
  }

  private static io.grpc.MethodDescriptor<com.itcast.bulls.stock.struct.grpc.trade.GetAccountSettlementRequest,
      com.itcast.bulls.stock.struct.grpc.trade.GetAccountSettlementResponse> getGetAccountSettlementMethodHelper() {
    io.grpc.MethodDescriptor<com.itcast.bulls.stock.struct.grpc.trade.GetAccountSettlementRequest, com.itcast.bulls.stock.struct.grpc.trade.GetAccountSettlementResponse> getGetAccountSettlementMethod;
    if ((getGetAccountSettlementMethod = StockFinanceServiceGrpc.getGetAccountSettlementMethod) == null) {
      synchronized (StockFinanceServiceGrpc.class) {
        if ((getGetAccountSettlementMethod = StockFinanceServiceGrpc.getGetAccountSettlementMethod) == null) {
          StockFinanceServiceGrpc.getGetAccountSettlementMethod = getGetAccountSettlementMethod = 
              io.grpc.MethodDescriptor.<com.itcast.bulls.stock.struct.grpc.trade.GetAccountSettlementRequest, com.itcast.bulls.stock.struct.grpc.trade.GetAccountSettlementResponse>newBuilder()
              .setType(io.grpc.MethodDescriptor.MethodType.UNARY)
              .setFullMethodName(generateFullMethodName(
                  "StockFinanceService", "getAccountSettlement"))
              .setSampledToLocalTracing(true)
              .setRequestMarshaller(io.grpc.protobuf.ProtoUtils.marshaller(
                  com.itcast.bulls.stock.struct.grpc.trade.GetAccountSettlementRequest.getDefaultInstance()))
              .setResponseMarshaller(io.grpc.protobuf.ProtoUtils.marshaller(
                  com.itcast.bulls.stock.struct.grpc.trade.GetAccountSettlementResponse.getDefaultInstance()))
                  .setSchemaDescriptor(new StockFinanceServiceMethodDescriptorSupplier("getAccountSettlement"))
                  .build();
          }
        }
     }
     return getGetAccountSettlementMethod;
  }

  /**
   * Creates a new async stub that supports all call types for the service
   */
  public static StockFinanceServiceStub newStub(io.grpc.Channel channel) {
    return new StockFinanceServiceStub(channel);
  }

  /**
   * Creates a new blocking-style stub that supports unary and streaming output calls on the service
   */
  public static StockFinanceServiceBlockingStub newBlockingStub(
      io.grpc.Channel channel) {
    return new StockFinanceServiceBlockingStub(channel);
  }

  /**
   * Creates a new ListenableFuture-style stub that supports unary calls on the service
   */
  public static StockFinanceServiceFutureStub newFutureStub(
      io.grpc.Channel channel) {
    return new StockFinanceServiceFutureStub(channel);
  }

  /**
   * <pre>
   * 资金服务的grpc接口
   * </pre>
   */
  public static abstract class StockFinanceServiceImplBase implements io.grpc.BindableService {

    /**
     * <pre>
     * 获取账户资金总览接口
     * </pre>
     */
    public void getFinanceOverview(com.itcast.bulls.stock.struct.grpc.trade.GetFinanceOverviewRequest request,
        io.grpc.stub.StreamObserver<com.itcast.bulls.stock.struct.grpc.trade.GetFinanceOverviewResponse> responseObserver) {
      asyncUnimplementedUnaryCall(getGetFinanceOverviewMethodHelper(), responseObserver);
    }

    /**
     * <pre>
     * 修改账户资金的接口
     * </pre>
     */
    public void updateAccountBalance(com.itcast.bulls.stock.struct.grpc.trade.UpdateBalanceRequest request,
        io.grpc.stub.StreamObserver<com.itcast.bulls.stock.struct.grpc.trade.UpdateBalanceResponse> responseObserver) {
      asyncUnimplementedUnaryCall(getUpdateAccountBalanceMethodHelper(), responseObserver);
    }

    /**
     * <pre>
     * 获取账户资金接口
     * </pre>
     */
    public void getAccountBalance(com.itcast.bulls.stock.struct.grpc.trade.GetBalanceRequest request,
        io.grpc.stub.StreamObserver<com.itcast.bulls.stock.struct.grpc.trade.GetBalanceResponse> responseObserver) {
      asyncUnimplementedUnaryCall(getGetAccountBalanceMethodHelper(), responseObserver);
    }

    /**
     * <pre>
     * 获取账户交割单数据接口
     * </pre>
     */
    public void getAccountSettlement(com.itcast.bulls.stock.struct.grpc.trade.GetAccountSettlementRequest request,
        io.grpc.stub.StreamObserver<com.itcast.bulls.stock.struct.grpc.trade.GetAccountSettlementResponse> responseObserver) {
      asyncUnimplementedUnaryCall(getGetAccountSettlementMethodHelper(), responseObserver);
    }

    @java.lang.Override public final io.grpc.ServerServiceDefinition bindService() {
      return io.grpc.ServerServiceDefinition.builder(getServiceDescriptor())
          .addMethod(
            getGetFinanceOverviewMethodHelper(),
            asyncUnaryCall(
              new MethodHandlers<
                com.itcast.bulls.stock.struct.grpc.trade.GetFinanceOverviewRequest,
                com.itcast.bulls.stock.struct.grpc.trade.GetFinanceOverviewResponse>(
                  this, METHODID_GET_FINANCE_OVERVIEW)))
          .addMethod(
            getUpdateAccountBalanceMethodHelper(),
            asyncUnaryCall(
              new MethodHandlers<
                com.itcast.bulls.stock.struct.grpc.trade.UpdateBalanceRequest,
                com.itcast.bulls.stock.struct.grpc.trade.UpdateBalanceResponse>(
                  this, METHODID_UPDATE_ACCOUNT_BALANCE)))
          .addMethod(
            getGetAccountBalanceMethodHelper(),
            asyncUnaryCall(
              new MethodHandlers<
                com.itcast.bulls.stock.struct.grpc.trade.GetBalanceRequest,
                com.itcast.bulls.stock.struct.grpc.trade.GetBalanceResponse>(
                  this, METHODID_GET_ACCOUNT_BALANCE)))
          .addMethod(
            getGetAccountSettlementMethodHelper(),
            asyncUnaryCall(
              new MethodHandlers<
                com.itcast.bulls.stock.struct.grpc.trade.GetAccountSettlementRequest,
                com.itcast.bulls.stock.struct.grpc.trade.GetAccountSettlementResponse>(
                  this, METHODID_GET_ACCOUNT_SETTLEMENT)))
          .build();
    }
  }

  /**
   * <pre>
   * 资金服务的grpc接口
   * </pre>
   */
  public static final class StockFinanceServiceStub extends io.grpc.stub.AbstractStub<StockFinanceServiceStub> {
    private StockFinanceServiceStub(io.grpc.Channel channel) {
      super(channel);
    }

    private StockFinanceServiceStub(io.grpc.Channel channel,
        io.grpc.CallOptions callOptions) {
      super(channel, callOptions);
    }

    @java.lang.Override
    protected StockFinanceServiceStub build(io.grpc.Channel channel,
        io.grpc.CallOptions callOptions) {
      return new StockFinanceServiceStub(channel, callOptions);
    }

    /**
     * <pre>
     * 获取账户资金总览接口
     * </pre>
     */
    public void getFinanceOverview(com.itcast.bulls.stock.struct.grpc.trade.GetFinanceOverviewRequest request,
        io.grpc.stub.StreamObserver<com.itcast.bulls.stock.struct.grpc.trade.GetFinanceOverviewResponse> responseObserver) {
      asyncUnaryCall(
          getChannel().newCall(getGetFinanceOverviewMethodHelper(), getCallOptions()), request, responseObserver);
    }

    /**
     * <pre>
     * 修改账户资金的接口
     * </pre>
     */
    public void updateAccountBalance(com.itcast.bulls.stock.struct.grpc.trade.UpdateBalanceRequest request,
        io.grpc.stub.StreamObserver<com.itcast.bulls.stock.struct.grpc.trade.UpdateBalanceResponse> responseObserver) {
      asyncUnaryCall(
          getChannel().newCall(getUpdateAccountBalanceMethodHelper(), getCallOptions()), request, responseObserver);
    }

    /**
     * <pre>
     * 获取账户资金接口
     * </pre>
     */
    public void getAccountBalance(com.itcast.bulls.stock.struct.grpc.trade.GetBalanceRequest request,
        io.grpc.stub.StreamObserver<com.itcast.bulls.stock.struct.grpc.trade.GetBalanceResponse> responseObserver) {
      asyncUnaryCall(
          getChannel().newCall(getGetAccountBalanceMethodHelper(), getCallOptions()), request, responseObserver);
    }

    /**
     * <pre>
     * 获取账户交割单数据接口
     * </pre>
     */
    public void getAccountSettlement(com.itcast.bulls.stock.struct.grpc.trade.GetAccountSettlementRequest request,
        io.grpc.stub.StreamObserver<com.itcast.bulls.stock.struct.grpc.trade.GetAccountSettlementResponse> responseObserver) {
      asyncUnaryCall(
          getChannel().newCall(getGetAccountSettlementMethodHelper(), getCallOptions()), request, responseObserver);
    }
  }

  /**
   * <pre>
   * 资金服务的grpc接口
   * </pre>
   */
  public static final class StockFinanceServiceBlockingStub extends io.grpc.stub.AbstractStub<StockFinanceServiceBlockingStub> {
    private StockFinanceServiceBlockingStub(io.grpc.Channel channel) {
      super(channel);
    }

    private StockFinanceServiceBlockingStub(io.grpc.Channel channel,
        io.grpc.CallOptions callOptions) {
      super(channel, callOptions);
    }

    @java.lang.Override
    protected StockFinanceServiceBlockingStub build(io.grpc.Channel channel,
        io.grpc.CallOptions callOptions) {
      return new StockFinanceServiceBlockingStub(channel, callOptions);
    }

    /**
     * <pre>
     * 获取账户资金总览接口
     * </pre>
     */
    public com.itcast.bulls.stock.struct.grpc.trade.GetFinanceOverviewResponse getFinanceOverview(com.itcast.bulls.stock.struct.grpc.trade.GetFinanceOverviewRequest request) {
      return blockingUnaryCall(
          getChannel(), getGetFinanceOverviewMethodHelper(), getCallOptions(), request);
    }

    /**
     * <pre>
     * 修改账户资金的接口
     * </pre>
     */
    public com.itcast.bulls.stock.struct.grpc.trade.UpdateBalanceResponse updateAccountBalance(com.itcast.bulls.stock.struct.grpc.trade.UpdateBalanceRequest request) {
      return blockingUnaryCall(
          getChannel(), getUpdateAccountBalanceMethodHelper(), getCallOptions(), request);
    }

    /**
     * <pre>
     * 获取账户资金接口
     * </pre>
     */
    public com.itcast.bulls.stock.struct.grpc.trade.GetBalanceResponse getAccountBalance(com.itcast.bulls.stock.struct.grpc.trade.GetBalanceRequest request) {
      return blockingUnaryCall(
          getChannel(), getGetAccountBalanceMethodHelper(), getCallOptions(), request);
    }

    /**
     * <pre>
     * 获取账户交割单数据接口
     * </pre>
     */
    public com.itcast.bulls.stock.struct.grpc.trade.GetAccountSettlementResponse getAccountSettlement(com.itcast.bulls.stock.struct.grpc.trade.GetAccountSettlementRequest request) {
      return blockingUnaryCall(
          getChannel(), getGetAccountSettlementMethodHelper(), getCallOptions(), request);
    }
  }

  /**
   * <pre>
   * 资金服务的grpc接口
   * </pre>
   */
  public static final class StockFinanceServiceFutureStub extends io.grpc.stub.AbstractStub<StockFinanceServiceFutureStub> {
    private StockFinanceServiceFutureStub(io.grpc.Channel channel) {
      super(channel);
    }

    private StockFinanceServiceFutureStub(io.grpc.Channel channel,
        io.grpc.CallOptions callOptions) {
      super(channel, callOptions);
    }

    @java.lang.Override
    protected StockFinanceServiceFutureStub build(io.grpc.Channel channel,
        io.grpc.CallOptions callOptions) {
      return new StockFinanceServiceFutureStub(channel, callOptions);
    }

    /**
     * <pre>
     * 获取账户资金总览接口
     * </pre>
     */
    public com.google.common.util.concurrent.ListenableFuture<com.itcast.bulls.stock.struct.grpc.trade.GetFinanceOverviewResponse> getFinanceOverview(
        com.itcast.bulls.stock.struct.grpc.trade.GetFinanceOverviewRequest request) {
      return futureUnaryCall(
          getChannel().newCall(getGetFinanceOverviewMethodHelper(), getCallOptions()), request);
    }

    /**
     * <pre>
     * 修改账户资金的接口
     * </pre>
     */
    public com.google.common.util.concurrent.ListenableFuture<com.itcast.bulls.stock.struct.grpc.trade.UpdateBalanceResponse> updateAccountBalance(
        com.itcast.bulls.stock.struct.grpc.trade.UpdateBalanceRequest request) {
      return futureUnaryCall(
          getChannel().newCall(getUpdateAccountBalanceMethodHelper(), getCallOptions()), request);
    }

    /**
     * <pre>
     * 获取账户资金接口
     * </pre>
     */
    public com.google.common.util.concurrent.ListenableFuture<com.itcast.bulls.stock.struct.grpc.trade.GetBalanceResponse> getAccountBalance(
        com.itcast.bulls.stock.struct.grpc.trade.GetBalanceRequest request) {
      return futureUnaryCall(
          getChannel().newCall(getGetAccountBalanceMethodHelper(), getCallOptions()), request);
    }

    /**
     * <pre>
     * 获取账户交割单数据接口
     * </pre>
     */
    public com.google.common.util.concurrent.ListenableFuture<com.itcast.bulls.stock.struct.grpc.trade.GetAccountSettlementResponse> getAccountSettlement(
        com.itcast.bulls.stock.struct.grpc.trade.GetAccountSettlementRequest request) {
      return futureUnaryCall(
          getChannel().newCall(getGetAccountSettlementMethodHelper(), getCallOptions()), request);
    }
  }

  private static final int METHODID_GET_FINANCE_OVERVIEW = 0;
  private static final int METHODID_UPDATE_ACCOUNT_BALANCE = 1;
  private static final int METHODID_GET_ACCOUNT_BALANCE = 2;
  private static final int METHODID_GET_ACCOUNT_SETTLEMENT = 3;

  private static final class MethodHandlers<Req, Resp> implements
      io.grpc.stub.ServerCalls.UnaryMethod<Req, Resp>,
      io.grpc.stub.ServerCalls.ServerStreamingMethod<Req, Resp>,
      io.grpc.stub.ServerCalls.ClientStreamingMethod<Req, Resp>,
      io.grpc.stub.ServerCalls.BidiStreamingMethod<Req, Resp> {
    private final StockFinanceServiceImplBase serviceImpl;
    private final int methodId;

    MethodHandlers(StockFinanceServiceImplBase serviceImpl, int methodId) {
      this.serviceImpl = serviceImpl;
      this.methodId = methodId;
    }

    @java.lang.Override
    @java.lang.SuppressWarnings("unchecked")
    public void invoke(Req request, io.grpc.stub.StreamObserver<Resp> responseObserver) {
      switch (methodId) {
        case METHODID_GET_FINANCE_OVERVIEW:
          serviceImpl.getFinanceOverview((com.itcast.bulls.stock.struct.grpc.trade.GetFinanceOverviewRequest) request,
              (io.grpc.stub.StreamObserver<com.itcast.bulls.stock.struct.grpc.trade.GetFinanceOverviewResponse>) responseObserver);
          break;
        case METHODID_UPDATE_ACCOUNT_BALANCE:
          serviceImpl.updateAccountBalance((com.itcast.bulls.stock.struct.grpc.trade.UpdateBalanceRequest) request,
              (io.grpc.stub.StreamObserver<com.itcast.bulls.stock.struct.grpc.trade.UpdateBalanceResponse>) responseObserver);
          break;
        case METHODID_GET_ACCOUNT_BALANCE:
          serviceImpl.getAccountBalance((com.itcast.bulls.stock.struct.grpc.trade.GetBalanceRequest) request,
              (io.grpc.stub.StreamObserver<com.itcast.bulls.stock.struct.grpc.trade.GetBalanceResponse>) responseObserver);
          break;
        case METHODID_GET_ACCOUNT_SETTLEMENT:
          serviceImpl.getAccountSettlement((com.itcast.bulls.stock.struct.grpc.trade.GetAccountSettlementRequest) request,
              (io.grpc.stub.StreamObserver<com.itcast.bulls.stock.struct.grpc.trade.GetAccountSettlementResponse>) responseObserver);
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

  private static abstract class StockFinanceServiceBaseDescriptorSupplier
      implements io.grpc.protobuf.ProtoFileDescriptorSupplier, io.grpc.protobuf.ProtoServiceDescriptorSupplier {
    StockFinanceServiceBaseDescriptorSupplier() {}

    @java.lang.Override
    public com.google.protobuf.Descriptors.FileDescriptor getFileDescriptor() {
      return com.itcast.bulls.stock.struct.grpc.trade.StockFinanceServiceProto.getDescriptor();
    }

    @java.lang.Override
    public com.google.protobuf.Descriptors.ServiceDescriptor getServiceDescriptor() {
      return getFileDescriptor().findServiceByName("StockFinanceService");
    }
  }

  private static final class StockFinanceServiceFileDescriptorSupplier
      extends StockFinanceServiceBaseDescriptorSupplier {
    StockFinanceServiceFileDescriptorSupplier() {}
  }

  private static final class StockFinanceServiceMethodDescriptorSupplier
      extends StockFinanceServiceBaseDescriptorSupplier
      implements io.grpc.protobuf.ProtoMethodDescriptorSupplier {
    private final String methodName;

    StockFinanceServiceMethodDescriptorSupplier(String methodName) {
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
      synchronized (StockFinanceServiceGrpc.class) {
        result = serviceDescriptor;
        if (result == null) {
          serviceDescriptor = result = io.grpc.ServiceDescriptor.newBuilder(SERVICE_NAME)
              .setSchemaDescriptor(new StockFinanceServiceFileDescriptorSupplier())
              .addMethod(getGetFinanceOverviewMethodHelper())
              .addMethod(getUpdateAccountBalanceMethodHelper())
              .addMethod(getGetAccountBalanceMethodHelper())
              .addMethod(getGetAccountSettlementMethodHelper())
              .build();
        }
      }
    }
    return result;
  }
}
