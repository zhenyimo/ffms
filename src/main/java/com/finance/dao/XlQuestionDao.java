package com.finance.dao;

import java.util.List;
import java.util.Map;

import com.finance.entity.XlQuestion;

//import com.finance.entity.Question;

//import com.finance.entity.Datadic;
//import com.finance.entity.Title;


/**
 * 题目dao层接口
 * @author zhongzh
 *
 */
public interface XlQuestionDao {
/*	public List<Datadic> getDatadicIncome();
	
	public List<Datadic> getDatadicPay();
	
	public List<Datadic> getDatadicSecurity();
	
	public List<Datadic> getDatadicTrade();
	*/
	//public List<Question> getTitlename();
	public List<XlQuestion> getXlQuestion();
	/**
	 * 查询题目
	 * @param map
	 * @return
	 */
	public List<XlQuestion> findXlQuestion(Map<String,Object> map);
	
	/**
	 * 获取题目数
	 * @param map
	 * @return
	 */
	public Long getTotalXlQuestion(Map<String,Object> map);
	
	/**
	 * 更新题目
	 * @param xlquestion
	 * @return
	 */
	public int updateXlQuestion(XlQuestion xlquestion);
	
	/**
	 * 添加题目
	 * @param title
	 * @return
	 */
	public int addXlQuestion(XlQuestion question);
	
	/**
	 * 删除题目
	 * @param id
	 * @return
	 */
	public int deleteXlQuestion(Integer id);

}
