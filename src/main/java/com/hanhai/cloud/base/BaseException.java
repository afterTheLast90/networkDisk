package com.hanhai.cloud.base;


import com.hanhai.cloud.constant.ResultCode;

/**
 * @author wmgx
 * @create 2021-02-01-19:21
 **/
public class BaseException extends RuntimeException {
    private Integer code;
    private String msg;

    public BaseException(Integer code, String msg) {
        this.code = code;
        this.msg = msg;
    }

    public BaseException(ResultCode r) {
        this.code = r.getCode();
        this.msg = r.getMsg();
    }

    public BaseException() {
    }

    public Integer getCode() {
        return code;
    }

    public BaseException setCode(Integer code) {
        this.code = code;

        return this;
    }

    public String getMsg() {
        return msg;
    }

    public BaseException setMsg(String msg) {
        this.msg = msg;
        return this;
    }
}
