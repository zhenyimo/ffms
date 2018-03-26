package com.finance.dao;

import java.util.List;
import java.util.Map;

import com.finance.entity.XlAnswer;
/**
 * 答案dao层
 * @author zhongzh
 *
 */
public interface XlAnswerDao {

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
	public List<XlAnswer> findXlAnswer(Map<String,Object> map);
	
	/**
	 * 获取答案记录数
	 * @param map
	 * @return
	 */
	public Long getTotalXlAnswers(Map<String,Object> map);
	
	/**
	 * 更新答案
	 * @param xlAnswer
	 * @return
	 */
	public int updateXlAnswer(XlAnswer xlAnswer);
	
	/**
	 * 添加答案
	 * @param xlAnswer
	 * @return
	 */
	public int addXlAnswer(XlAnswer xlAnswer);
	
	/**
	 * 删除答案
	 * @param id
	 * @return
	 */
	public int deleteXlAnswer(Integer id);
}
