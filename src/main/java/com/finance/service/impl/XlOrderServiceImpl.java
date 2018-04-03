package com.finance.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.finance.dao.XlOrderDao;
import com.finance.entity.XlOrder;
import com.finance.service.XlOrderService;
@Service
public class XlOrderServiceImpl implements XlOrderService{
	@Resource
	public XlOrderDao xlOrderDao;
	@Override
	public List<XlOrder> findOrderSendByVipId(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return xlOrderDao.findOrderSendByVipId(param);
	}
	@Override
	public double sumOrderMoneyByVipId(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return xlOrderDao.sumOrderMoneyByVipId(param);
	}

}
