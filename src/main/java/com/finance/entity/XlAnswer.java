package com.finance.entity;

import java.io.Serializable;
public class XlAnswer implements Serializable{

	private static final long serialVersionUID = 1L;
	private Integer id; // 编号
	private String ansNum; // 第几个答案
	private String ansContent; // 答案内容
	private Integer quesId; //问题id 
	private Integer nextQuestionId; //下一题id
	private Integer nextQuesNum;
	private Integer answerScore; // 该题分数	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	
	public String getAnsNum() {
		return ansNum;
	}
	public void setAnsNum(String ansNum) {
		this.ansNum = ansNum;
	}
	public String getAnsContent() {
		return ansContent;
	}
	public void setAnsContent(String ansContent) {
		this.ansContent = ansContent;
	}
	public Integer getQuesId() {
		return quesId;
	}
	public void setQuesId(Integer quesId) {
		this.quesId = quesId;
	}
	public Integer getNextQuestionId() {
		return nextQuestionId;
	}
	public void setNextQuestionId(Integer nextQuestionId) {
		this.nextQuestionId = nextQuestionId;
	}
	public Integer getAnswerScore() {
		return answerScore;
	}
	public void setAnswerScore(Integer answerScore) {
		this.answerScore = answerScore;
	}
	public Integer getNextQuesNum() {
		return nextQuesNum;
	}
	public void setNextQuesNum(Integer nextQuesNum) {
		this.nextQuesNum = nextQuesNum;
	}
	@Override
	public String toString() {
		return "XlAnswer [id=" + id + ", ansNum=" + ansNum + ", ansContent="
				+ ansContent + ", quesId=" + quesId + ", nextQuestionId="
				+ nextQuestionId + ", answerScore=" + answerScore
				+ ", getAid()=" + getId() + ", getAnsNum()=" + getAnsNum()
				+ ", getAnsContent()=" + getAnsContent() + ", getQuesId()="
				+ getQuesId() + ", getNextQuestionId()=" + getNextQuestionId()
				+ ", getAnswerScore()=" + getAnswerScore() + "]";
	}
	
	

}
