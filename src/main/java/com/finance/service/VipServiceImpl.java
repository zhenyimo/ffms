package com.finance.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.finance.dao.VipDao;
import com.finance.entity.XlVip;


@Service
public class VipServiceImpl implements VipService{
	@Resource
	VipDao vipDao;
	@Override
	public List<XlVip> findByOpenId(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return vipDao.findByOpenId(map);
	}

	@Override
	public void insertXlVip(Map<String, Object> map) {
		// TODO Auto-generated method stub
		vipDao.insertXlVip(map);
	}
	
}
