package org.zaohu.common.myException;

import lombok.Getter;
import org.zaohu.Enum.ErrorEnum.ErrorEnum;

/**
 * 业务异常
 */
@Getter
public class BusinessException extends RuntimeException {

    private final String message;

    /**
     * 错误码<br>
     * 调用成功时，为 null。<br>
     * 示例：10001
     */
    private final Integer code;


    public BusinessException(ErrorEnum errorEnum) {
        super(String.format("错误码：[%s]，错误信息：[%s]", errorEnum.getCode(), errorEnum.getMessage()));
        this.message = errorEnum.getMessage();
        this.code = errorEnum.getCode();
    }

    public BusinessException(Integer errorCode, String errorMessage) {
        super(String.format("错误码：[%s]，错误信息：[%s]，用户提示：[%s]", errorCode, errorMessage));
        this.message = errorMessage;
        this.code = errorCode;
    }

}
