package com.finance.entity;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

//import com.mysql.jdbc.Blob;

public class XlQuestion implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Integer id; // 编号

	private Integer goodId;
	private Integer quesNum; //第几题
	private String quesContent; // 题目内容
	private String type;//题目类型
	//一对多，1条题目可能有多个答案。
	private List<XlAnswer> xlanswerList;  //一条题目对应的答案列表

	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	public Integer getQuesNum() {
		return quesNum;
	}
	public void setQuesNum(Integer quesNum) {
		this.quesNum = quesNum;
	}

	public String getQuesContent() {
		return quesContent;
	}
	public void setQuesContent(String quesContent) {
		this.quesContent = quesContent;
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
	public Integer getGoodId() {
		return goodId;
	}
	public void setGoodId(Integer goodId) {
		this.goodId = goodId;
	}
	public void setAnswerList(List<XlAnswer> xlanswerList) {
		this.xlanswerList = xlanswerList;
	}
	
	public List<XlAnswer> getXlanswerList() {
		return xlanswerList;
	}
	public void setXlanswerList(List<XlAnswer> xlanswerList) {
		this.xlanswerList = xlanswerList;
	}
		public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	@Override
	public String toString() {
		return "XlQuestion [id=" + id + ", goodId=" + goodId
				+ ", quesNum=" + quesNum + ", quesContent="
				+ quesContent + ", xlanswerList=" + xlanswerList + "]";
	}
	
    
	
}
