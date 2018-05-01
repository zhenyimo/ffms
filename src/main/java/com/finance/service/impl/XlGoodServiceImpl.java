package com.finance.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.finance.dao.GoodDao;
import com.finance.entity.XlGood;
import com.finance.service.XlGoodService;
@Service("xlGoodService")
public class XlGoodServiceImpl implements XlGoodService{
	
	@Resource
	GoodDao goodDao;
	@Override
	public List<XlGood> findByLimit(Map<String, Object> map) {
		// TODO Auto-generated method stub
		
		return goodDao.findByLimit(map);
	}
	@Override
	public XlGood findByGoodId(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return goodDao.findByGoodId(map);
	}
	@Override
	public List<XlGood> getXlGoods() {
		// TODO Auto-generated method stub
		return goodDao.getXlGoods();
	}
	
}
