package com.hanhai.cloud.constant;

import lombok.Data;
import lombok.experimental.Accessors;

/**
 * @author wmgx
 * @create 2021-05-03-8:09
 **/
public enum ResultCode {


    /**
     * 操作成功
     */
    SUCCESS(200, "操作成功"),

    /**
     * 更新成功
     */
    UPDATE_SUCCESS(200,"更新成功") ,

    /**
     * 参数错误
     */
    PARAMETER_ERROR(451,"参数错误"),


    /**
     * 登录失败
     */
    LOGIN_ERROR(452,"用户名或密码错误"),

    /**
     * 验证码错误
     */
    CAPTCHA_ERROR(453,"验证码错误");
    ResultCode(Integer code, String msg) {
        this.code = code;
        this.msg = msg;
    }

    private Integer code;

    private String msg;

    public Integer getCode() {
        return code;
    }

    public String getMsg() {
        return msg;
    }
}
