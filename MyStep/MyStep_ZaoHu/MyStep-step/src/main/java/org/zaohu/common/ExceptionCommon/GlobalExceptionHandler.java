package org.zaohu.common.ExceptionCommon;

import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;
import org.zaohu.Enum.ErrorEnum.ErrorEnum;
import org.zaohu.common.ResultCommon.Result;

@RestControllerAdvice
@Slf4j
public class GlobalExceptionHandler {

    /**
     * 只把空指针抛给前端
     *
     * @param e 空指针异常
     * @return
     */
    @ExceptionHandler(value = NullPointerException.class)
    public Result<?> NullPointerException(NullPointerException e) {
        System.out.println("出现空指针异常咯！");
        e.printStackTrace();
        return Result.failed(ErrorEnum.NULL_POINTER);
    }

    //.....这里可以写更多的异常 上面是一个模板
    //.......

    /**
     * 异常防线，没有这里前端就会拿到一个识别不了的返回
     * @param e 总异常
     * @return Result
     */
//    @ExceptionHandler(value = Throwable.class)
//    public Result<?> Throwable(Throwable e) {
//        System.out.println("异常兜底");
//        log.error(e.getMessage());
//        return Result.failed(ErrorEnum.SYSTEM_ERROR);
//    }
}
