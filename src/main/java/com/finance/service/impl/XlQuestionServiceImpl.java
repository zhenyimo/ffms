package com.finance.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.finance.dao.XlQuestionDao;
import com.finance.entity.XlQuestion;
import com.finance.service.XlQuestionService;



//import com.finance.dao.DatadicDao;
//import com.finance.dao.QuestionDao;
//import com.finance.entity.Datadic;
//import com.finance.entity.Title;
//import com.finance.entity.Datadic;
//import com.finance.service.DatadicService;
//import com.finance.service.TitleService;
/**
 * 题目Service接口实现类
 * @author zhongzh
 *
 */
//@Service("datadicService")
//@Service("titleService")
//public class TitleServiceImpl implements TitleService{
public class XlQuestionServiceImpl implements XlQuestionService{
	@Resource
	//private  DatadicDao datadicDao;
    //private QuestionDao titleDao;
	private XlQuestionDao xlQuestionDao;
/*	public List<Title> findTitle(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return titleDao.findTitle(map);
	}*/
	public List<XlQuestion> findXlQuestion(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return xlQuestionDao.findXlQuestion(map);
	}
/*	public Long getTotalTitle(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return titleDao.getTotalTitle(map);
	}*/
	public Long getTotalXlQuestion(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return xlQuestionDao.getTotalXlQuestion(map);
	}

/*	public int updateTitle(Title title) {
		// TODO Auto-generated method stub
		return titleDao.updateTitle(title);
	}*/
	public int updateXlQuestion(XlQuestion xlQuestion) {
		// TODO Auto-generated method stub
		return xlQuestionDao.updateXlQuestion(xlQuestion);
	}

/*	public int addTitle(Title title) {
		// TODO Auto-generated method stub
		return titleDao.addTitle(title);
	}*/
	public int addXlQuestion(XlQuestion xlQuestion) {
		// TODO Auto-generated method stub
		return xlQuestionDao.addXlQuestion(xlQuestion);
	}
/*	public int deleteTitle(Integer id) {
		// TODO Auto-generated method stub
		return titleDao.deleteTitle(id);
	}*/
	public int deleteXlQuestion(Integer id) {
		// TODO Auto-generated method stub
		return xlQuestionDao.deleteXlQuestion(id);
	}

	
/*	public List<Datadic> getDatadicIncome() {
		// TODO Auto-generated method stub
		return datadicDao.getDatadicIncome();
	}

	
	public List<Datadic> getDatadicPay() {
		// TODO Auto-generated method stub
		return datadicDao.getDatadicPay();
	}

	
	public List<Datadic> getDatadicSecurity() {
		// TODO Auto-generated method stub
		return datadicDao.getDatadicSecurity();
	}

	
	public List<Datadic> findDatadic(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return datadicDao.findDatadic(map);
	}

	
	public Long getTotalDatadic(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return datadicDao.getTotalDatadic(map);
	}

	
	public int updateDatadic(Datadic datadic) {
		// TODO Auto-generated method stub
		return datadicDao.updateDatadic(datadic);
	}

	
	public int addDatadic(Datadic datadic) {
		// TODO Auto-generated method stub
		return datadicDao.addDatadic(datadic);
	}

	
	public int deleteDatadic(Integer id) {
		// TODO Auto-generated method stub
		return datadicDao.deleteDatadic(id);
	}
	
	public List<Datadic> getDatadicname(){
		return datadicDao.getDatadicname();
	}


	public List<Title> getTitleTrade() {
		// TODO Auto-generated method stub
		return titleDao.getDatadicTrade();
	}
	*/
/*	public List<Title> getTitlename() {
		// TODO Auto-generated method stub
		return titleDao.getTitlename();
	}*/
	public List<XlQuestion> getXlQuestion() {
		// TODO Auto-generated method stub
		return xlQuestionDao.getXlQuestion();
	}
}
