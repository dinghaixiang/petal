package com.maiya.model;

/**
 * Created by beck on 2017/1/3.
 */
public class RespBean {
    private String code;
    private String message;
    private Object data;
    public RespBean(Object data){
        this.code="0";
        this.message="success";
        this.data=data;
    }

    public RespBean(String code, String message){
        this.code=code;
        this.message=message;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }
}
