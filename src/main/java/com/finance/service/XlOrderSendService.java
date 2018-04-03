package com.finance.service;

import java.util.List;
import java.util.Map;

import com.finance.entity.XlOrderSend;

public interface XlOrderSendService {
	public List<XlOrderSend> findByFromUser(Map<String,Object> param);
	public List<XlOrderSend> findByToUser(Map<String,Object> param); 
	public double sumOrderMoneyByToUser(Map<String,Object> param); 
	public List<XlOrderSend> findByToUserWithFromUserVip(Map<String,Object> param); 
}
