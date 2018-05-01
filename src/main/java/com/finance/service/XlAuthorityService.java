package com.finance.service;

import java.util.List;
import java.util.Map;


import com.finance.entity.XlAuthority;

/**
 * 权限
 * @author zhongzh
 *
 */
public interface XlAuthorityService {
    /**
     * 查询权限
     * @param map
     * @return
     */
	public List<XlAuthority> findXlAuthority(Map<String, Object> map);
    /**
     * 获得权限记录数
     * @param map
     * @return
     */
	public Long getTotalXlAuthority(Map<String, Object> map);
    /**
     * 添加权限
     * @param xlauthority
     * @return
     */
	public int addXlAuthority(XlAuthority xlauthority);
    /**
     * 更新权限
     * @param xlauthority
     * @return
     */
	public int updateXlAuthority(XlAuthority xlauthority);
    /**
     * 删除权限
     * @param id
     */
	public int deleteXlAuthority(Integer id);
	
	

}
