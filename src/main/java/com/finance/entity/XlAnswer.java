package com.finance.entity;

import java.io.Serializable;
import java.util.List;

public class XlAnswer implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Integer id; // 编号

	private String answer_num; // 创建人ID
	//private Integer answer_num; // 创建人ID
	private String answer_content; // 创建人角色
	private Integer questionId; //问题id 
	private Integer next_quesionId; //下一题id
	private Integer answer_score; // 该题分数
	
	private List<XlQuestion> xlQuestionList;// 一个答案亦都可能对应多个问题
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
/*	public Integer getAnswer_num() {
		return answer_num;
	}
	public void setAnswer_num(Integer answer_num) {
		this.answer_num = answer_num;
	}*/
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
	
	@Override
	public String toString() {
		return "XlAnswer [id=" + id + ", answer_num=" + answer_num
				+ ", answer_content=" + answer_content + ", questionId="
				+ questionId + ", next_quesionId=" + next_quesionId
				+ ", answer_score=" + answer_score + ", xlQuestionList="
				+ xlQuestionList + "]";
	}
	
	
	

}
