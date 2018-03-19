package com.finance.exception;

import com.finance.serial.SerialCallable;

public enum ErrorCode { 
    UNKNOWN_ERROR("error_0003", "系统繁忙，请稍后再试...."),
    UNKNOWN_GOOD_ERROR("error_0001", "不存此商品"),  
    PLACE_ORDER_ERROR("error_0004", "生成订单失败"); 
    private String code;  
    private String desc;  
    private ErrorCode(String code, String desc) {  
       this.code=code;
       this.desc=desc;
    }
	public String getCode() {
		return code;
	}
	public String getDesc() {
		return desc;
	}  
    
    public String toString(SerialCallable<Object,String> call){
    	return call.serial(this);
    }
}
