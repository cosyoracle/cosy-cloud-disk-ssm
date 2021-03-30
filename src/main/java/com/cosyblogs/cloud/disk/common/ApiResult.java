package com.cosyblogs.cloud.disk.common;


/**
 * @author xiadewang
 * API消息对象
 */
public class ApiResult<T> {
    public static final int SUCCESS = 20000;
    public static final int ERROR = -1;

    /**
     * 状态码 20000: success, -1: error
     */
    private int code;

    /**
     * 提示消息
     */
    private String msg;

    /**
     * 结果数据
     */
    private T data;

    public ApiResult() {
    }

    public ApiResult(int code, String msg, T data) {
        this.code = code;
        this.msg = msg;
        this.data = data;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public T getData() {
        return data;
    }

    public void setData(T data) {
        this.data = data;
    }

    public static <T> ApiResult<T> success() {
        return success(null);
    }

    public static <T> ApiResult<T> success(T data) {
        return success("Operate Success !", data);
    }

    public static <T> ApiResult<T> successmsg(String msg) {
        return success(msg, null);
    }

    public static <T> ApiResult<T> success(String msg, T data) {
        return new ApiResult<>(ApiResult.SUCCESS, msg, data);
    }

    public static <T> ApiResult<T> failure(String msg) {
        return failure(ApiResult.ERROR, msg);
    }

    public static <T> ApiResult<T> failure(int code, String msg) {
        return new ApiResult<>(code, msg, null);
    }

    public boolean isOk() {
        return code == SUCCESS;
    }

    public boolean isError() {
        return !isOk();
    }

}
