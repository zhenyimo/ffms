package com.finance.entity;

public class Answer {
     private Integer id;   //  编号
     private String answer_num; // 
     private String answer_content;// 
     private Integer questionId;// 
     private Integer next_questionId;// 
     private Integer answer_score;// 
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
	public Integer getNext_questionId() {
		return next_questionId;
	}
	public void setNext_questionId(Integer next_questionId) {
		this.next_questionId = next_questionId;
	}
	public Integer getAnswer_score() {
		return answer_score;
	}
	public void setAnswer_score(Integer answer_score) {
		this.answer_score = answer_score;
	}
     
     
}
