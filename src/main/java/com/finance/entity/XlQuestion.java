package com.finance.entity;

import java.io.Serializable;

import com.mysql.jdbc.Blob;

public class XlQuestion implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Integer id; // 编号

	private Integer goodId; // 创建人ID
	private Integer question_num; // 创建人角色
	private Blob questionContent; // 收入人
	private String versionCode; 
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getGoodId() {
		return goodId;
	}
	public void setGoodId(Integer goodId) {
		this.goodId = goodId;
	}
	public Integer getQuestion_num() {
		return question_num;
	}
	public void setQuestion_num(Integer question_num) {
		this.question_num = question_num;
	}
	public Blob getQuestionContent() {
		return questionContent;
	}
	public void setQuestionContent(Blob questionContent) {
		this.questionContent = questionContent;
	}
	public String getVersionCode() {
		return versionCode;
	}
	public void setVersionCode(String versionCode) {
		this.versionCode = versionCode;
	}
}
