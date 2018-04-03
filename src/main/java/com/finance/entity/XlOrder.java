package com.finance.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

public class XlOrder implements Serializable{
	private Integer id; // 编号
	
	private String orderNo; // 订单编号
	private Date time; // 创建人角色
	private String flag; //是否已支付（1：支付，2：未支付）
	private double money; // 来源
	private Integer vipId; // 备注
	private String goodId; // 收入时间
	private Integer commentId; // 创建时间
	private XlGood good;
	private List<XlOrderSend> orderSend;
	private List<XlOrderSend> orderReceive;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}
	public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
		this.time = time;
	}
	public String getFlag() {
		return flag;
	}
	public void setFlag(String flag) {
		this.flag = flag;
	}
	public double getMoney() {
		return money;
	}
	public void setMoney(double money) {
		this.money = money;
	}

	public Integer getVipId() {
		return vipId;
	}
	public void setVipId(Integer vipId) {
		this.vipId = vipId;
	}
	public String getGoodId() {
		return goodId;
	}
	public void setGoodId(String goodId) {
		this.goodId = goodId;
	}
	public Integer getCommentId() {
		return commentId;
	}
	public void setCommentId(Integer commentId) {
		this.commentId = commentId;
	}

	public List<XlOrderSend> getOrderSend() {
		return orderSend;
	}
	public void setOrderSend(List<XlOrderSend> orderSend) {
		this.orderSend = orderSend;
	}
	public List<XlOrderSend> getOrderReceive() {
		return orderReceive;
	}
	public void setOrderReceive(List<XlOrderSend> orderReceive) {
		this.orderReceive = orderReceive;
	}
	public XlGood getGood() {
		return good;
	}
	public void setGood(XlGood good) {
		this.good = good;
	}

	
	
}
