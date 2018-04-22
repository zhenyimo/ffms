package com.finance.dao;

import java.util.List;
import java.util.Map;

import com.finance.entity.XlType;
/**
 * 类型dao层
 * @author zhongzh
 *
 */
public interface XlTypeDao {
	/**
	 * 获得所有类型
	 * @return
	 */
	public List<XlType> getXlTypes();
	
	/**
	 * 查询类型
	 * @param map
	 * @return
	 */
	public List<XlType> findXlType(Map<String,Object> map);
	
	/**
	 * 获取类型记录数
	 * @param map
	 * @return
	 */
	public Long getTotalXlType(Map<String,Object> map);
	
	/**
	 * 更新类型
	 * @param xlType
	 * @return
	 */
	public int updateXlType(XlType xlType);
	
	/**
	 * 添加类型
	 * @param xlType
	 * @return
	 */
	public int addXlType(XlType xlType);
	
	/**
	 * 删除类型
	 * @param id
	 * @return
	 */
	public int deleteXlType(Integer id);
}
