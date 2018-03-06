package com.finance.entity;

import java.io.Serializable;

public class XlEvaluationDetail implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer id; // 编号
	private Integer eid; // 评估表id
	private Integer eval_num; // 序号
	private String eval_type; // 评估测试内容类型（1：文字；2：图片）
	private String eval_content; //内容
	private String eval_url; // 金额
	
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
	public Integer getEval_num() {
		return eval_num;
	}
	public void setEval_num(Integer eval_num) {
		this.eval_num = eval_num;
	}
	public String getEval_type() {
		return eval_type;
	}
	public void setEval_type(String eval_type) {
		this.eval_type = eval_type;
	}
	public String getEval_content() {
		return eval_content;
	}
	public void setEval_content(String eval_content) {
		this.eval_content = eval_content;
	}
	public String getEval_url() {
		return eval_url;
	}
	public void setEval_url(String eval_url) {
		this.eval_url = eval_url;
	}
	
}
