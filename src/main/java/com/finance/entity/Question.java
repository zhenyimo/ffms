package com.finance.entity;

public class Question {
	private Integer id; // 编号
	//private String datadicname; // 数据字典名称
	//private String datadicvalue; // 数据字典值
/*	private String datadicname; // 题目名称
	private String datadicvalue; // 选项值
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getDatadicname() {
		return datadicname;
	}
	public void setDatadicname(String datadicname) {
		this.datadicname = datadicname;
	}
	public String getDatadicvalue() {
		return datadicvalue;
	}
	public void setDatadicvalue(String datadicvalue) {
		this.datadicvalue = datadicvalue;
	}
*/
	private String question_content; // 题目名称
	//private String optionvalue; // 选项值
	private String answer; // 答案
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
/*	public String getTitlename() {
		return titlename;
	}
	public void setTitlename(String titlename) {
		this.titlename = titlename;
	}*/
	
/*	public String getOptionvalue() {
		return optionvalue;
	}
	public void setOptionvalue(String optionvalue) {
		this.optionvalue = optionvalue;
	}
	*/
	public String getAnswer() {
		return answer;
	}
	public String getQuestion_content() {
		return question_content;
	}
	public void setQuestion_content(String question_content) {
		this.question_content = question_content;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	
}
