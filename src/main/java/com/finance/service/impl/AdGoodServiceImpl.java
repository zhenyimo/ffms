package com.finance.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.finance.dao.AdGoodDao;
import com.finance.entity.XlAds;
import com.finance.service.AdGoodService;
@Service("adGoodService")
public class AdGoodServiceImpl implements AdGoodService {
	@Resource
	AdGoodDao adGoodDao;
	public List<XlAds> findByLimit(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return adGoodDao.findByLimit(map);
	}

}
