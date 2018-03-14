package com.finance.dao;

import java.util.List;
import java.util.Map;

import com.finance.entity.XlAds;



public interface AdGoodDao{
	public List<XlAds> findByLimit(Map<String,Object> map);
}
