package org.zaohu.Enum.ErrorEnum;

import lombok.AllArgsConstructor;
import lombok.Getter;

@AllArgsConstructor
@Getter
public enum ErrorEnum implements IErrorEnum {
    SYSTEM_ERROR(-1, "系统出小差了，请稍后再试哦~"),
    NULL_POINTER(0, "空指针了你个笨蛋！"),
    FORGET_ERROR(500, "没有上传手机号密码"),
    CODE_NO_ACCOUNT(500, "验证码已过期"),
    CODE_OVERDUE(500, "无此账号信息");
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
