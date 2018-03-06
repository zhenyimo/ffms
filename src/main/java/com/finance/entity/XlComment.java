package com.finance.entity;

import java.io.Serializable;

public class XlComment implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Integer id; // 编号

	private Integer vipId; //vipid
	private Integer goodId; //商品id
	private String good_understandability; // 
	private String good_accuracy; // 
	private Integer good_practical; // 
	private String content; //内容
	private String comment_time; // 
	private String anonymous; // (0：匿名评论；1：不匿名)默认是0
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getVipId() {
		return vipId;
	}
	public void setVipId(Integer vipId) {
		this.vipId = vipId;
	}
	public Integer getGoodId() {
		return goodId;
	}
	public void setGoodId(Integer goodId) {
		this.goodId = goodId;
	}
	public String getGood_understandability() {
		return good_understandability;
	}
	public void setGood_understandability(String good_understandability) {
		this.good_understandability = good_understandability;
	}
	public String getGood_accuracy() {
		return good_accuracy;
	}
	public void setGood_accuracy(String good_accuracy) {
		this.good_accuracy = good_accuracy;
	}
	public Integer getGood_practical() {
		return good_practical;
	}
	public void setGood_practical(Integer good_practical) {
		this.good_practical = good_practical;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getComment_time() {
		return comment_time;
	}
	public void setComment_time(String comment_time) {
		this.comment_time = comment_time;
	}
	public String getAnonymous() {
		return anonymous;
	}
	public void setAnonymous(String anonymous) {
		this.anonymous = anonymous;
	}
}
