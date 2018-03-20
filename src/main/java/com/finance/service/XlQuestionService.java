package com.finance.service;

import java.util.List;
import java.util.Map;

import com.finance.entity.XlQuestion;

//import com.finance.entity.Datadic;
//import com.finance.entity.Title;
//import com.finance.entity.Title;

/**
 * 题目Service接口
 * @author zhongzh
 *
 */
public interface XlQuestionService {
/*	public List<Datadic> getDatadicIncome();
	
	public List<Datadic> getDatadicPay();
	
	public List<Datadic> getDatadicSecurity();
	
	
	
	public List<Datadic> getDatadicTrade();*/
	//public List<Title> getTitlename();
	public List<XlQuestion> getXlQuestion();

	/**
	 * 查询题目
	 * @param map
	 * @return
	 */
	//public List<Title> findTitle(Map<String,Object> map);
	public List<XlQuestion> findXlQuestion(Map<String,Object> map);
	
	/**
	 * 获取题目数
	 * @param map
	 * @return
	 */
	public Long getTotalXlQuestion(Map<String,Object> map);
	
	/**
	 * 更新题目
	 * @param xlQuestion
	 * @return
	 */
	//public int updateTitle(Title title);
	public int updateXlQuestion(XlQuestion xlQuestion);
	/**
	 * 添加题目
	 * @param xlQuestion
	 * @return
	 */
	//public int addTitle(Title title);
	public int addXlQuestion(XlQuestion xlQuestion);
	/**
	 * 删除题目
	 * @param id
	 * @return
	 */
	public int deleteXlQuestion(Integer id);
}
