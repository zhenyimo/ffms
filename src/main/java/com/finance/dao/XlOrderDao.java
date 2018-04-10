package com.finance.dao;

import java.util.List;
import java.util.Map;

import com.finance.entity.XlOrder;

public interface XlOrderDao {
	public static final String PARAM_ORDER_VIP_ID="vipId";
	public static final String PARAM_ORDER_NO="orderNo";
	public static final String PARAM_FLAG="flag";
	public List<XlOrder> findOrderSendByVipId(Map<String,Object> param);
	public double sumOrderMoneyByVipId(Map<String,Object> param);
	public List<XlOrder> findByOrderNo(Map<String,Object> param);
	public void updateStatusByOrderNo(Map<String,Object> param);
	public Integer insertXlOrder(XlOrder order);
	
	public List<XlOrder> findByOrderNoAndVipId(Map<String,Object> param);
}
