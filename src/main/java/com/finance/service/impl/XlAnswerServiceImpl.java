package com.finance.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import com.finance.dao.XlAnswerDao;
import com.finance.entity.XlAnswer;
import com.finance.service.XlAnswerService;



//import com.finance.entity.Datadic;
//import com.finance.entity.Title;
//import com.finance.entity.Title;

/**
 * 答案Service实现类
 * @author zhongzh
 */
@Service("xlAnswerService")
public class XlAnswerServiceImpl implements XlAnswerService{
	@Resource
	private XlAnswerDao xlAnswerDao;
	@Override
	public List<XlAnswer> getXlAnswers() {
		// TODO Auto-generated method stub
		return xlAnswerDao.getXlAnswers();
	}

	@Override
	public List<XlAnswer> findXlAnswer(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return xlAnswerDao.findXlAnswer(map);
	}

	@Override
	public Long getTotalXlAnswer(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return xlAnswerDao.getTotalXlAnswers(map);
	}

	@Override
	public int updateXlAnswer(XlAnswer xlAnswer) {
		// TODO Auto-generated method stub
		return xlAnswerDao.updateXlAnswer(xlAnswer);
	}

	@Override
	public int addXlAnswer(XlAnswer xlAnswer) {
		// TODO Auto-generated method stub
		return xlAnswerDao.addXlAnswer(xlAnswer);
	}

	@Override
	public int deleteXlAnswer(Integer id) {
		// TODO Auto-generated method stub
		return xlAnswerDao.deleteXlAnswer(id);
	}

	
}
