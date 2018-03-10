package com.finance.dao;

import java.util.List;
import java.util.Map;

import com.finance.entity.XlAds;



public interface AdGoodDao {
	//查询
	public static final String FINDBYLIMIT_LIMITSTART_PARAM="limitStart";
	public static final String FINDBYLIMIT_LIMIT_LENGTH="limitLength";
	public List<XlAds> findByLimit(Map<String,Object> map);
}
