package com.finance.service.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.finance.controller.gongzhonghao.GiftController;
import com.finance.dao.XlOrderSendDao;
import com.finance.entity.XlOrder;
import com.finance.entity.XlOrderSend;
import com.finance.service.XlOrderSendService;
import com.finance.service.XlOrderService;
import com.finance.util.ArrayUtil;
@Service
public class XlOrderSendServiceImpl implements XlOrderSendService {
	private Logger logger=LoggerFactory.getLogger(XlOrderSendServiceImpl.class);
	@Resource
	XlOrderSendDao xlOrderSendDao;
	@Resource
	XlOrderService xlOrderService;
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
	/*
	 * 事务隔离为可重复读，避免使用锁机制
	 * @see 
	 */
	@Override
	//@Transactional(isolation=Isolation.REPEATABLE_READ,propagation=Propagation.REQUIRED,rollbackFor=Exception.class)
	public boolean claimIfOrderHasRest(String orderNo, Object fromUser,Object toUser) {
		// TODO Auto-generated method stub
		List<XlOrder> orderList=xlOrderService.findByOrderNoAndVipId(orderNo, fromUser);
		if(!ArrayUtil.isUnique(orderList)){
			logger.info("不存在，此订单号为:"+orderNo);
			return false;
		}
		Map<String,Object> param=new HashMap<String,Object>();
		param.put(XlOrderSendDao.PARAM_TO_USER, toUser);
		param.put(XlOrderSendDao.PARAM_ORDER_NO, orderNo);
		List<XlOrderSend> orderReceiveList=xlOrderSendDao.findByToUserAndOrderNo(param);
		if(ArrayUtil.isNotBlank(orderReceiveList)){
			logger.info(toUser+"已认领过，不能再次认领,订单号为:"+orderNo);
			return false;
		}
		XlOrder order=orderList.get(0);
		if(order.getClaimNum()<order.getOrderNum()){
			XlOrderSend orderSend=new XlOrderSend();
			orderSend.setFromUser((Integer)fromUser);
			orderSend.setToUser((Integer)toUser);
			orderSend.setIsClaim(XlOrderSend.CLAIMED);
			orderSend.setTime(new Date());
			orderSend.setOrderNo(orderNo);
			orderSend.setMoney(0);
			orderSend.setGoodId(order.getGoodId());
			xlOrderSendDao.insertXlOrderSend(orderSend);
			XlOrder orderNew=new XlOrder();
			orderNew.setId(order.getId());
			orderNew.setClaimNum(order.getClaimNum()+1);
			xlOrderService.updateOne(orderNew);
		}
		logger.info(toUser+"认领记录插入成功，订单号为:"+orderNo);
		return true;
	}
	
}
