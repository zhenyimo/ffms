package com.finance.entity;

import java.io.Serializable;
import java.util.List;

public class XlEvaluation implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer id; // 编号

	private Integer goodId; // 
	private String goodname; // 
	private String reportDescribe; // 描述
	private Integer minScore; // 最低
	private Integer maxScore; // 最高分
	private String level; // 程度
	private String quesType;
	private List<XlEvaluationDetail> xlEvaluationDetailList;
	
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
	public String getGoodname() {
		return goodname;
	}
	public void setGoodname(String goodname) {
		this.goodname = goodname;
	}
	public String getReportDescribe() {
		return reportDescribe;
	}
	public void setReportDescribe(String reportDescribe) {
		this.reportDescribe = reportDescribe;
	}
	public Integer getMinScore() {
		return minScore;
	}
	public void setMinScore(Integer minScore) {
		this.minScore = minScore;
	}
	public Integer getMaxScore() {
		return maxScore;
	}
	public void setMaxScore(Integer maxScore) {
		this.maxScore = maxScore;
	}
	public String getLevel() {
		return level;
	}
	public void setLevel(String level) {
		this.level = level;
	}
	public String getQuesType() {
		return quesType;
	}
	public void setQuesType(String quesType) {
		this.quesType = quesType;
	}
	public List<XlEvaluationDetail> getXlEvaluationDetailList() {
		return xlEvaluationDetailList;
	}
	public void setXlEvaluationDetailList(
			List<XlEvaluationDetail> xlEvaluationDetailList) {
		this.xlEvaluationDetailList = xlEvaluationDetailList;
	}
}
