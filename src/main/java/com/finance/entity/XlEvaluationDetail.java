package com.finance.entity;

import java.io.Serializable;

public class XlEvaluationDetail implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer id; // 编号
	private Integer eid; // 评估表id
	private Integer evalNum; // 序号
	private String evalType; // 评估测试内容类型（1：文字；2：图片）
	private String evalContent; //内容
	private String evalUrl; // 金额
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getEid() {
		return eid;
	}
	public void setEid(Integer eid) {
		this.eid = eid;
	}
	public Integer getEvalNum() {
		return evalNum;
	}
	public void setEvalNum(Integer evalNum) {
		this.evalNum = evalNum;
	}
	public String getEvalType() {
		return evalType;
	}
	public void setEvalType(String evalType) {
		this.evalType = evalType;
	}
	public String getEvalContent() {
		return evalContent;
	}
	public void setEvalContent(String evalContent) {
		this.evalContent = evalContent;
	}
	public String getEvalUrl() {
		return evalUrl;
	}
	public void setEvalUrl(String evalUrl) {
		this.evalUrl = evalUrl;
	}
}
