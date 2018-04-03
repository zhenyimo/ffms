package com.finance.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.finance.dao.XlOrderSendDao;
import com.finance.entity.XlOrderSend;
import com.finance.service.XlOrderSendService;
@Service
public class XlOrderSendServiceImpl implements XlOrderSendService {
	@Resource
	XlOrderSendDao xlOrderSendDao;
	@Override
	public List<XlOrderSend> findByFromUser(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return xlOrderSendDao.findByFromUser(param);
	}

	@Override
	public List<XlOrderSend> findByToUser(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return xlOrderSendDao.findByToUser(param);
	}

	@Override
	public double sumOrderMoneyByToUser(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return xlOrderSendDao.sumOrderMoneyByToUser(param);
	}

	@Override
	public List<XlOrderSend> findByToUserWithFromUserVip(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return xlOrderSendDao.findByToUserWithFromUserVip(param);
	}
	
}
