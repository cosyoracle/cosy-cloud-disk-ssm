package com.cosyblogs.cloud.disk.common;

/**
 * @author xiadewang
 * API code常量
 */
public interface ApiCodeConstant {
    int RESULT_SUCC = 20000;
    int RESULT_LOGIN_FAIL = 50001;  //用户名或者密码错误
    int RESULT_PERMISSION_EXCEPTION = 50002;         //自定义权限异常
    int RESULT_TOKEN_FAIL = 50014;         //token校验失败
    int RESULT_NULLPOINT_EXCEPTION = 50101;         //空指针异常
    int RESULT_OTHER_EXCEPTION = 50102;         //其他异常

    int RESULT_ID_GEN_EXCEPTION = 502021;         //id派发异常

    String MSG_ID_GEN_EXCEPTION = "ID生成异常";         //id派发异常消息
}
