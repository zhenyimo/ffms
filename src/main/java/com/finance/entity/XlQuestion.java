package com.finance.entity;

import java.io.Serializable;
import java.util.List;

import com.mysql.jdbc.Blob;

public class XlQuestion implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Integer id; // 编号

	//private Integer goodId; // 创建人ID
	//多对一，1个商品多条题目
	private XlGood xlGood;
	private Integer question_num; // 创建人角色
	//private Blob questionContent; // 收入人
	private String questionContent; // 收入人
	//private String versionCode;
	//一对多，1条题目可能有多个答案。
	private List<XlAnswer> xlanswerList;  //一条题目对应的答案列表
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
/*	public Integer getGoodId() {
		return goodId;
	}
	public void setGoodId(Integer goodId) {
		this.goodId = goodId;
	}*/
	public Integer getQuestion_num() {
		return question_num;
	}
	public void setQuestion_num(Integer question_num) {
		this.question_num = question_num;
	}
/*	public Blob getQuestionContent() {
		return questionContent;
	}
	public void setQuestionContent(Blob questionContent) {
		this.questionContent = questionContent;
	}*/
	public String getQuestionContent() {
		return questionContent;
	}
	public void setQuestionContent(String questionContent) {
		this.questionContent = questionContent;
	}
/*	public String getVersionCode() {
		return versionCode;
	}
	public void setVersionCode(String versionCode) {
		this.versionCode = versionCode;
	}*/
	
	
	public List<XlAnswer> getAnswerList() {
		return xlanswerList;
	}
	public XlGood getXlGood() {
		return xlGood;
	}
	public void setXlGood(XlGood xlGood) {
		this.xlGood = xlGood;
	}
	public void setAnswerList(List<XlAnswer> xlanswerList) {
		this.xlanswerList = xlanswerList;
	}
	@Override
	public String toString() {
		return "XlQuestion [id=" + id + ", xlGood=" + xlGood
				+ ", question_num=" + question_num + ", questionContent="
				+ questionContent + ", xlanswerList=" + xlanswerList + "]";
	}
	
    
	
}
