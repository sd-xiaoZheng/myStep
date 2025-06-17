package org.zaohu.zaohucommon;

public enum ResultEnum implements IResult {

	SUCCESS(200, "接口调用成功"),

	COMMON_FAILED(500, "接口调用失败");

	private Integer code;

	private String message;

	ResultEnum() {
	}

	ResultEnum(Integer code, String message) {
		this.code = code;
		this.message = message;
	}

	@Override
	public Integer getCode() {
		return code;
	}

	@Override
	public String getMessage() {
		return message;
	}

}
