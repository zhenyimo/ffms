package com.finance.dao;

import java.util.List;
import java.util.Map;

import com.finance.entity.XlGood;

public interface GoodDao {
	public static final String PARAM_TYPE_ID="typeId";
	public List<XlGood> findByLimit(Map<String, Object> map);
}
