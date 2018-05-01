package com.finance.dao;

import java.util.List;
import java.util.Map;

import com.finance.entity.XlEvaluation;
import com.finance.entity.XlVipAnswer;

public interface XlEvaluationDao {

	/**
	 * 数据库查询查找测评结果
	 * @param map
	 * @return
	 */
	public List<XlEvaluation> findEvaluationDetails(Map<String,Object> map);
}
