package com.finance.dao;

import java.util.List;
import java.util.Map;

import com.finance.entity.XlAuthority;


/**
 * 权限dao层
 * @author zhongzh
 *
 */

public interface XlAuthorityDao {
	/**
	 * 获得所有权限
	 * @return
	 */
	public List<XlAuthority> getAuthoritys();
	
	/**
	 * 查询权限
	 * @param map
	 * @return
	 */
	public List<XlAuthority> findXlAuthority(Map<String,Object> map);
	
	/**
	 * 获取权限记录数
	 * @param map
	 * @return
	 */
	public Long getTotalXlAuthority(Map<String,Object> map);
	
	/**
	 * 更新权限
	 * @param xlauthority
	 * @return
	 */
	public int updateXlAuthority(XlAuthority xlauthority);
	
	/**
	 * 添加权限
	 * @param xlauthority
	 * @return
	 */
	public int addXlAuthority(XlAuthority xlauthority);
	
	/**
	 * 删除权限
	 * @param id
	 * @return
	 */
	public int deleteXlAuthority(Integer authorityid);
}
