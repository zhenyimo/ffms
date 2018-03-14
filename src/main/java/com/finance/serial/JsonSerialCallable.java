package com.finance.serial;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.finance.exception.ErrorCode;

public class JsonSerialCallable implements SerialCallable<Object,String>{

	@Override
	public String serial(Object obj) {
		// TODO Auto-generated method stub
		ObjectMapper om=new ObjectMapper();
		try {
			return om.writeValueAsString(obj);
		} catch (JsonProcessingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			try {
				return om.writeValueAsString(ErrorCode.UNKNOWN_ERROR);
			} catch (JsonProcessingException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
				return "{\"code\":\"1000\",\"desc\":\"服务异常\"}";
			}
		}
	}

}
