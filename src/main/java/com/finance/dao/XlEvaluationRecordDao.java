package com.finance.dao;

import java.util.List;

import com.finance.entity.XlEvaluationRecord;

public interface XlEvaluationRecordDao {

	/**jinbang
	 * 测试出结果以后将结果信息保存到db
	 * @param list
	 * @return
	 */
	public void saveXlEvaluationRecord(List<XlEvaluationRecord> list);
}
