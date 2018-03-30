package com.finance.dao;

import java.util.List;
import java.util.Map;


import com.finance.entity.XlVip;

public interface VipDao {
	
	public static final String PARM_VIP_OPEN_ID="openId";
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
	public void insertXlVip(XlVip xlVip);
}
