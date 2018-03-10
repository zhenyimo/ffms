package com.finance.service;

import java.util.List;
import java.util.Map;

import com.finance.entity.Database;
import com.finance.entity.XlAds;

public interface AdGoodService {
	
	/**
	 * 查询广告商品(轮播)
	 * @param map
	 * @return
	 */
	public List<XlAds> findByLimit(Map<String,Object> map);
}
