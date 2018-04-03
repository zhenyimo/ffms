package com.finance.dao;

import java.util.List;
import java.util.Map;

import com.finance.entity.XlOrderSend;

public interface XlOrderSendDao {
	public static final String PARAM_FROM_USER="fromUser";
	public static final String PARAM_TO_USER="toUser";
	public List<XlOrderSend> findByFromUser(Map<String,Object> param);
	public List<XlOrderSend> findByToUser(Map<String,Object> param); 
	public List<XlOrderSend> findByFromUserAndOrderNo(Map<String,Object> param); 
	public List<XlOrderSend> findByToUserAndOrderNo(Map<String,Object> param); 
	public List<XlOrderSend> findByToUserWithFromUserVip(Map<String,Object> param); 
	
	public double sumOrderMoneyByToUser(Map<String,Object> param); 
	
}
