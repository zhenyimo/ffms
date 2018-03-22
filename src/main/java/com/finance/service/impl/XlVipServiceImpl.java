package com.finance.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.finance.dao.GoodDao;
import com.finance.entity.XlVip;
import com.finance.service.XlVipService;

@Service("xlVipService")
public class XlVipServiceImpl implements XlVipService{
	
	@Resource
	GoodDao goodDao;

	@Override
	public XlVip findByVipId(Map<String, Object> map) {
//		return goodDao.findByGoodId(map);
		return null;
	}
	@Override
	public List<XlVip> findByLimit(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}
	
}