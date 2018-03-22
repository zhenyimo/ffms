package com.finance.service;

import java.util.List;
import java.util.Map;

import com.finance.entity.XlVip;

public interface XlVipService {
	public List<XlVip> findByLimit(Map<String, Object> map);
	public XlVip findByVipId(Map<String,Object> map);
}
