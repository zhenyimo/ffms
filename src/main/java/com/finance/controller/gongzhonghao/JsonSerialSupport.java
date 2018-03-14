package com.finance.controller.gongzhonghao;

import com.finance.serial.JsonSerialCallable;
import com.finance.serial.SerialCallable;

public class JsonSerialSupport {
	protected static SerialCallable<Object,String> jsonSerial=new JsonSerialCallable();
}
