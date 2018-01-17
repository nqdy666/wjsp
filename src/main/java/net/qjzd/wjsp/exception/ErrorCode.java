package net.qjzd.wjsp.exception;

/**
 * <p>Title: ErrorCode </p>
 * <p>Description: 错误码枚举 </p>
 * <p>Copyright: Copyright (c) 2015 </p>
 * <p>Company: ND Websoft Inc. </p>
 * <p>Create Time: 2015年07月14日 </p>
 * @author lianggz
 */
public enum ErrorCode {
    //无效请求
    URI_NOT_FOUND(400, "URI_NOT_FOUND"),
    //服务器错误
    INTERNAL_SERVER_ERROR(500, "INTERNAL_SERVER_ERROR"),
    ;
    protected String PROVIDER = "WJSP/";

    private final int value;
    private final String code;

    ErrorCode(int value, String code) {
        this.value = value;
        this.code = code;
    }

    public int getValue() {
        return this.value;
    }

    public String getCode() {
        return this.PROVIDER + this.code;
    }
}