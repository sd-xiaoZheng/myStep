package org.zaohu.Enum.ErrorEnum;

import lombok.AllArgsConstructor;
import lombok.Getter;

@AllArgsConstructor
@Getter
public enum ErrorEnum implements IErrorEnum {
    SYSTEM_ERROR(-1, "系统出小差了，请稍后再试哦~"),
    NULL_POINTER(0, "空指针了你个笨蛋！");
    private final Integer code;
    private final String message;

    @Override
    public Integer getCode() {
        return code;
    }

    @Override
    public String getMessage() {
        return message;
    }
}
