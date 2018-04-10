package com.finance.service.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finance.config.WeChatConfigApi;
import com.finance.controller.gongzhonghao.WeiXinController;
import com.finance.dao.XlOrderDao;
import com.finance.entity.XlGood;
import com.finance.entity.XlOrder;
import com.finance.service.XlOrderService;
import com.finance.util.ArrayUtil;
import com.finance.util.SequenceUtil;
@Service
public class XlOrderServiceImpl implements XlOrderService{
	public final Logger logger=LoggerFactory.getLogger(XlOrderServiceImpl.class);
	@Resource
	private WeChatConfigApi weChatConfigApi;
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
	@Override
	public List<XlOrder> findByOrderNo(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return xlOrderDao.findByOrderNo(param);
	}
	
	public List<XlOrder> findByOrderNoAndVipId(String orderNo,Object vipId){
		Map<String,Object> param=new HashMap<String,Object>();
		param.put(XlOrderDao.PARAM_ORDER_NO,orderNo);
		param.put(XlOrderDao.PARAM_ORDER_VIP_ID, vipId);
		return xlOrderDao.findByOrderNoAndVipId(param);
	}
	@Override
	public boolean isOrderPay(String orderNo) {
		// TODO Auto-generated method stub
		Map<String,Object> param=new HashMap<String,Object>();
		param.put(XlOrderDao.PARAM_ORDER_NO,orderNo);
		List<XlOrder> result=findByOrderNo(param);
		if(ArrayUtil.isNotBlank(result)&&result.size()==1){
			XlOrder order=result.get(0);
			return order.isPay();
		}else {
			logger.error("find the same orderNo . it is wrong!");
		}
		return false;
	}
	@Override
	public void updateStatusByOrderNo(Map<String, Object> param) {
		// TODO Auto-generated method stub
		xlOrderDao.updateStatusByOrderNo(param);
	}
	@Override
	public String insertXlOrder(Integer vipId, Integer goodNum,String openId, XlGood good) {
		String mchId=weChatConfigApi.getWeChatPayConfig().getMchId();
		// TODO Auto-generated method stub
		XlOrder order=new XlOrder();
		order.setClaimNum(0);
		order.setGoodId(good.getId().toString());
		order.setFlag(XlOrder.FLAG_NOT_PAY);
		order.setTime(new Date());
		order.setVipId(vipId);
		order.setCommentId(null);
		order.setOrderNum(goodNum);
		order.setOrderNo(SequenceUtil.getOrderSequence(mchId, openId));
		order.setMoney(good.getPrice()*goodNum);
		xlOrderDao.insertXlOrder(order);
		return order.getOrderNo();
	}

}
