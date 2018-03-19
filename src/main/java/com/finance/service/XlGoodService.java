package com.finance.service;

import java.util.List;
import java.util.Map;

import com.finance.entity.XlGood;

public interface XlGoodService {
	public List<XlGood> findByLimit(Map<String, Object> map);
	public XlGood findByGoodId(Map<String,Object> map);
}
