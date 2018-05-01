package com.finance.service;

import java.util.List;
import java.util.Map;

import com.finance.entity.XlGood;
import com.finance.entity.XlOrder;

public interface XlOrderService {
	public List<XlOrder> findOrderSendByVipId(Map<String,Object> param);
	public double sumOrderMoneyByVipId(Map<String,Object> param);
	public List<XlOrder> findByOrderNo(Map<String,Object> param);
	public boolean isOrderPay(String orderNo);
	public void updateStatusByOrderNo(Map<String,Object> param);
	//public String insertXlOrder(Integer vipId,Integer goodNum,String openId,XlGood good);
	public List<XlOrder> findByOrderNoAndVipId(String orderNo,Object vipId);
	String insertXlOrder(Integer vipId, Integer goodNum,
			String openId, XlGood good);
	public void updateOne(XlOrder order);
	
}
