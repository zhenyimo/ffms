package com.finance.service;

import java.util.List;
import java.util.Map;

import com.finance.entity.XlVip;

public interface VipService {
	/**
	 * 根据openId查询用户信息
	 * @param map
	 * @return
	 */
	public List<XlVip> findByOpenId(Map<String, Object> map);
	/**
	 * 添加一条记录
	 * @param map
	 */
	public void insertXlVip(Map<String, Object> map);
}
