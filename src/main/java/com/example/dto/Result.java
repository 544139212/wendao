package com.example.dto;

import java.util.List;

/**
 * Created by Administrator on 2017/4/24.
 */
public class Result {

    private int code;
    private String msg;
    private List list;

    public Result() {

    }

    public Result(int code, String msg) {
        this.code = code;
        this.msg = msg;
    }
    public Result(int code, String msg, List list) {
        this.code = code;
        this.msg = msg;
        this.list = list;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public int getCode() {
        return code;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public String getMsg() {
        return msg;
    }

	public List getList() {
		return list;
	}

	public void setList(List list) {
		this.list = list;
	}

    
}
