package com.finance.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.finance.dao.XlEvaluationDao;
import com.finance.dao.XlEvaluationRecordDao;
import com.finance.dao.XlQuestionDao;
import com.finance.dao.XlSurveyRecordDao;
import com.finance.dao.XlVipAnswerDao;
import com.finance.entity.XlEvaluation;
import com.finance.entity.XlEvaluationRecord;
import com.finance.entity.XlQuestion;
import com.finance.entity.XlSurveyRecord;
import com.finance.entity.XlVipAnswer;
import com.finance.service.XlQuestionService;

/**
 * 题目Service接口实现类
 * @author zhongzh
 *
 */

@Service("xlQuestionService")
public class XlQuestionServiceImpl implements XlQuestionService{
	@Resource
	private XlQuestionDao xlQuestionDao;
	@Resource
	private XlVipAnswerDao xlVipAnswerDao;
	@Resource
	private XlEvaluationDao xlEvaluationDao;
	@Resource
	private XlEvaluationRecordDao xlEvaluationRecordDao;
	@Resource 
	private XlSurveyRecordDao xlSurveyRecordDao;

	public List<XlQuestion> findXlQuestion(Map<String, Object> map) {
		return xlQuestionDao.findXlQuestion(map);
	}

	public Long getTotalXlQuestion(Map<String, Object> map) {
		return xlQuestionDao.getTotalXlQuestion(map);
	}

	public int updateXlQuestion(XlQuestion xlQuestion) {
		return xlQuestionDao.updateXlQuestion(xlQuestion);
	}


	public int addXlQuestion(XlQuestion xlQuestion) {
		return xlQuestionDao.addXlQuestion(xlQuestion);
	}

	public int deleteXlQuestion(Integer id) {
		return xlQuestionDao.deleteXlQuestion(id);
	}

	public List<XlQuestion> getXlQuestion() {
		// TODO Auto-generated method stub
		return xlQuestionDao.getXlQuestion();
	}

	@Override
	public List<XlQuestion> findQuestionByGoodId(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return xlQuestionDao.findQuestionByGoodId(map);
	}

	@Override
	public XlQuestion findQuestionById(Integer quesId) {
		return xlQuestionDao.findQuestionById(quesId);
	}

	@Override
	public List<XlVipAnswer> findVipAnsByGoodIdAndOpenId(Map<String, Object> map) {
		return xlVipAnswerDao.findVipAnsByGoodIdAndOpenId(map);
	}

	@Override
	public List<XlEvaluation> findEvaluationDetails(Map<String, Object> map) {
		return xlEvaluationDao.findEvaluationDetails(map);
	}

	@Override
	public void saveXlEvaluationRecord(List<XlEvaluationRecord> list) {
		 xlEvaluationRecordDao.saveXlEvaluationRecord(list);
	}

	@Override
	public void saveSurveyRecord(XlSurveyRecord record) {
		xlSurveyRecordDao.saveSurveyRecord(record);
		
	}

	@Override
	public List<XlSurveyRecord> findSurveyRecord(Map<String, Object> map) {
		return xlSurveyRecordDao.findSurveyRecord(map);
	}
}
