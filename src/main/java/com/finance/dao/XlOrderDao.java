package com.finance.dao;

import java.util.List;
import java.util.Map;

import com.finance.entity.XlOrder;

public interface XlOrderDao {
	public static final String PARAM_ORDER_VIP_ID="vipId";
	public List<XlOrder> findOrderSendByVipId(Map<String,Object> param);
	public double sumOrderMoneyByVipId(Map<String,Object> param);
}
