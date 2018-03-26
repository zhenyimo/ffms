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

	//private Integer goodId; // 创建人ID
	//多对一，1个商品多条题目
	private XlGood xlGood;
	private Integer question_num; // 创建人角色
	//private Blob questionContent; // 收入人
	private String questionContent; // 收入人
	//private String versionCode;
	//一对多，1条题目可能有多个答案。
	private List<XlAnswer> xlanswerList;  //一条题目对应的答案列表
	//private String type;
	private Integer answerid; // 答案ID
	private String answername; // 答案名称
	private List<Map<Object,Object>> answerIDsList=new ArrayList<Map<Object,Object>>(); // 对应的答案列表id
	private String answerIDs=""; // 对应的答案列表id
	private String answerNames=""; // 对应的答案列表名称
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	
public Integer getAnswerid() {
		return answerid;
	}
	public void setAnswerid(Integer answerid) {
		this.answerid = answerid;
	}
	public String getAnswername() {
		return answername;
	}
	public void setAnswername(String answername) {
		this.answername = answername;
	}
	public List<Map<Object, Object>> getAnswerIDsList() {
		return answerIDsList;
	}
	public void setAnswerIDsList(List<Map<Object, Object>> answerIDsList) {
		this.answerIDsList = answerIDsList;
		if(null!=answerIDsList && answerIDsList.size()>0){
			int size=answerIDsList.size();
			for(int i=0;i<size;i++){
				answerIDs+=answerIDsList.get(i).get("answerid");
				answerNames+=answerIDsList.get(i).get("answername");
				if(i!=(size-1)){
					answerIDs+=",";
					answerNames+=",";
				}
			}
		}
	}
	public String getAnswerIDs() {
		return answerIDs;
	}
	public void setAnswerIDs(String answerIDs) {
		this.answerIDs = answerIDs;
	}
	public String getAnswerNames() {
		return answerNames;
	}
	public void setAnswerNames(String answerNames) {
		this.answerNames = answerNames;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	/*	public Integer getGoodId() {
		return goodId;
	}
	public void setGoodId(Integer goodId) {
		this.goodId = goodId;
	}*/
	public Integer getQuestion_num() {
		return question_num;
	}
	public void setQuestion_num(Integer question_num) {
		this.question_num = question_num;
	}
/*	public Blob getQuestionContent() {
		return questionContent;
	}
	public void setQuestionContent(Blob questionContent) {
		this.questionContent = questionContent;
	}*/
	public String getQuestionContent() {
		return questionContent;
	}
	public void setQuestionContent(String questionContent) {
		this.questionContent = questionContent;
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
	public XlGood getXlGood() {
		return xlGood;
	}
	public void setXlGood(XlGood xlGood) {
		this.xlGood = xlGood;
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
/*	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}*/
	@Override
	public String toString() {
		return "XlQuestion [id=" + id + ", xlGood=" + xlGood
				+ ", question_num=" + question_num + ", questionContent="
				+ questionContent + ", xlanswerList=" + xlanswerList + "]";
	}
	
    
	
}
