package com.finance.entity;

public class XlVipAnswer {
	private static final long serialVersionUID = 1L;
	private Integer id; // 编号
	private String ansId; // 第几个答案
	private Integer quesId; //问题id 
	private Integer nextQuestionId; //下一题id
	private Integer answerScore; // 该题分数	
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getAnsId() {
		return ansId;
	}
	public void setAnsId(String ansId) {
		this.ansId = ansId;
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
}
