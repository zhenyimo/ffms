package com.finance.dao;

import java.util.List;
import java.util.Map;

import com.finance.entity.XlVipAnswer;

/**
 * 答案dao层
 * @author jinbang
 *
 */
public interface XlVipAnswerDao {

	/**
	 * 数据库查询会员回答的某题的答案
	 * @param map
	 * @return
	 */
	public List<XlVipAnswer> findVipAnsByGoodIdAndOpenId(Map<String,Object> map);
}
