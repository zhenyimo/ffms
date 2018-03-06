package com.finance.entity;

import java.io.Serializable;

public class XlAnswer implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Integer id; // 编号

	private String answer_num; // 创建人ID
	private String answer_content; // 创建人角色
	private Integer questionId; //问题id 
	private Integer next_quesionId; //下一题id
	private Integer answer_score; // 该题分数
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getAnswer_num() {
		return answer_num;
	}
	public void setAnswer_num(String answer_num) {
		this.answer_num = answer_num;
	}
	public String getAnswer_content() {
		return answer_content;
	}
	public void setAnswer_content(String answer_content) {
		this.answer_content = answer_content;
	}
	public Integer getQuestionId() {
		return questionId;
	}
	public void setQuestionId(Integer questionId) {
		this.questionId = questionId;
	}
	public Integer getNext_quesionId() {
		return next_quesionId;
	}
	public void setNext_quesionId(Integer next_quesionId) {
		this.next_quesionId = next_quesionId;
	}
	public Integer getAnswer_score() {
		return answer_score;
	}
	public void setAnswer_score(Integer answer_score) {
		this.answer_score = answer_score;
	}
	

}
