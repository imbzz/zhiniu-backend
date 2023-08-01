package com.itcast.bulls.stock.common.exception;


import com.itcast.bulls.stock.common.exception.constants.IErrorCodeEnum;
import lombok.Getter;

/**
 * 自定义业务异常
 */
@Getter
public class BusinessException extends AbstractException {

	/**
	 *
	 */
	private static final long serialVersionUID = -1L;

	/**
	 * 错误码
	 */
	private IErrorCodeEnum errorCodeEnum;


	public BusinessException(IErrorCodeEnum errorCodeEnum) {
		super(errorCodeEnum.getCode() + ":" + errorCodeEnum.getMessage());
		this.errorCodeEnum = errorCodeEnum;
	}

	public IErrorCodeEnum getErrorCodeEnum() {
		return errorCodeEnum;
	}

}
