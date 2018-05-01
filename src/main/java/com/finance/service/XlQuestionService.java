package com.finance.service;

import java.util.List;
import java.util.Map;

import com.finance.entity.XlEvaluation;
import com.finance.entity.XlQuestion;
import com.finance.entity.XlVipAnswer;

//import com.finance.entity.Datadic;
//import com.finance.entity.Title;
//import com.finance.entity.Title;

/**
 * 题目Service接口
 * @author zhongzh
 *
 */
public interface XlQuestionService {
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
	
	//根据quesId获取XlQuestion
	public XlQuestion findQuestionById(Integer quesId);
	
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
	public int addXlQuestion(XlQuestion xlQuestion);
	/**
	 * 删除题目
	 * @param id
	 * @return
	 */
	public int deleteXlQuestion(Integer id);
	/**
	 * 根据goodId返回question
	 * @return
	 */
	public List<XlQuestion> findQuestionByGoodId(Map<String,Object> map);
	
	/**
	 * 根据goodId和openId获取用户回答的答案
	 * @param map
	 * @return
	 */
	public List<XlVipAnswer> findVipAnsByGoodIdAndOpenId(Map<String,Object> map);
	
	public List<XlEvaluation> findEvaluationDetails(Map<String,Object> map);
	
	
}
