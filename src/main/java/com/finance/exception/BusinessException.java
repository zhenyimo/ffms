package com.finance.exception;

import com.finance.serial.JsonSerialCallable;
import com.finance.serial.SerialCallable;

public class BusinessException extends RuntimeException {
    private static final long serialVersionUID = 1L; 
    private static SerialCallable<Object,String> DEFAULT_SERIAL=new JsonSerialCallable();
    public Exception origin;
    public BusinessException(ErrorCode errorCode) {
    	this(errorCode,null);
    } 
    public BusinessException(ErrorCode errorCode,Exception origin) {
    	this(errorCode,origin,DEFAULT_SERIAL);
    }  
    public BusinessException(ErrorCode errorCode,Exception origin,SerialCallable<Object,String> serialCall){
    	super(errorCode.toString(serialCall));
    	this.origin=origin;
    }
}  
