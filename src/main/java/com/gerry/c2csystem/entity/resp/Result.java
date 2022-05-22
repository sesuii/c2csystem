package com.gerry.c2csystem.entity.resp;

import com.gerry.c2csystem.constant.ResultEnum;
import lombok.AllArgsConstructor;
import lombok.Data;

/**
 * 返回前端结果
 *
 * @author Gerry
 * @email sjiahui@gmail.com
 * @since 2022/5/21 21:37
 **/
@Data
@AllArgsConstructor
public class Result<T> {
    int code;
    String reason;
    T data;

    public Result(int code, String reason) {
        this.code = code;
        this.reason = reason;
    }

    public static Result<?> success() {
        return new Result<>(ResultEnum.SUCCESS.getCode(), ResultEnum.SUCCESS.getMessage());
    }

    public static Result<?> success(Object obj) {
        return new Result<>(ResultEnum.SUCCESS.getCode(), ResultEnum.SUCCESS.getMessage(), obj);
    }

    public static Result<?> failed(ResultEnum resultEnum) {
        return new Result<>(resultEnum.getCode(), resultEnum.getMessage());
    }

    public static Result<?> failed(ResultEnum resultEnum, Object obj) {
        return new Result<>(resultEnum.getCode(), resultEnum.getMessage(), obj);
    }

}
