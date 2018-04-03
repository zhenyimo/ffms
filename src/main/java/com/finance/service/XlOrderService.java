package com.finance.service;

import java.util.List;
import java.util.Map;

import com.finance.entity.XlOrder;

public interface XlOrderService {
	public List<XlOrder> findOrderSendByVipId(Map<String,Object> param);
	public double sumOrderMoneyByVipId(Map<String,Object> param);
}
