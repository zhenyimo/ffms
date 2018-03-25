package com.finance.service;

import java.util.List;
import java.util.Map;
import com.finance.entity.XlAnswer;

//import com.finance.entity.Datadic;
//import com.finance.entity.Title;
//import com.finance.entity.Title;

/**
 * 答案Service接口
 * @author zhongzh
 *
 */
public interface XlAnswerService{
/*	public List<Datadic> getDatadicIncome();
	
	public List<Datadic> getDatadicPay();
	
	public List<Datadic> getDatadicSecurity();
	
	
	
	public List<Datadic> getDatadicTrade();*/
	//public List<Title> getTitlename();
	/**
	 * 获得所有答案
	 * @return
	 */
	public List<XlAnswer> getXlAnswers();

	/**
	 * 查询答案
	 * @param map
	 * @return
	 */
	//public List<Title> findTitle(Map<String,Object> map);
	public List<XlAnswer> findXlAnswer(Map<String,Object> map);
	
	/**
	 * 获取答案记录数
	 * @param map
	 * @return
	 */
	public Long getTotalXlAnswer(Map<String,Object> map);
	
	/**
	 * 更新答案
	 * @param xlAnswer
	 * @return
	 */
	//public int updateTitle(Title title);
	public int updateXlAnswer(XlAnswer xlAnswer);
	/**
	 * 添加答案
	 * @param xlAnswer
	 * @return
	 */
	//public int addTitle(Title title);
	public int addXlAnswer(XlAnswer xlAnswer);
	/**
	 * 删除答案
	 * @param id
	 * @return
	 */
	public int deleteXlAnswer(Integer id);
}
