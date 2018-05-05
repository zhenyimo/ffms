package com.finance.dao;

import java.util.List;
import java.util.Map;

import com.finance.entity.XlQuestion;
import com.finance.entity.XlVipAnswer;
/**
 * 题目dao层接口
 * @author zhongzh
 *
 */
public interface XlQuestionDao {

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
	 * 根据quesId获取XlQuestion
	 * @param quesId
	 * @return
	 */
	public XlQuestion findQuestionById(Integer quesId);
	
	/**
	 * 更新题目
	 * @param xlQuestion
	 * @return
	 */
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
	 * 查询题目
	 * @param map
	 * @return
	 */
	public List<XlQuestion> findQuestionByGoodId(Map<String,Object> map);
	
	
	
	

}
