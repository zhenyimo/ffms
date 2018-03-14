package com.finance.dao;

import java.util.List;
import java.util.Map;

//import com.finance.entity.Datadic;
import com.finance.entity.Title;

/**
 * 题目dao层接口
 * @author zhongzh
 *
 */
public interface TitleDao {
/*	public List<Datadic> getDatadicIncome();
	
	public List<Datadic> getDatadicPay();
	
	public List<Datadic> getDatadicSecurity();
	
	public List<Datadic> getDatadicTrade();
	*/
	public List<Title> getTitlename();
	
	/**
	 * 查询题目
	 * @param map
	 * @return
	 */
	public List<Title> findTitle(Map<String,Object> map);
	
	/**
	 * 获取题目数
	 * @param map
	 * @return
	 */
	public Long getTotalTitle(Map<String,Object> map);
	
	/**
	 * 更新题目
	 * @param title
	 * @return
	 */
	public int updateTitle(Title title);
	
	/**
	 * 添加题目
	 * @param title
	 * @return
	 */
	public int addTitle(Title title);
	
	/**
	 * 删除题目
	 * @param id
	 * @return
	 */
	public int deleteTitle(Integer id);

}
