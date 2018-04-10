package com.finance.entity;

import java.io.Serializable;
import java.util.Date;

public class XlOrderSend implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer id; // 编号
	private String orderNo; // 
	private Date time; // 
	private double money; // 
	private Integer fromUser; // 赠送者id
	private Integer toUser; // 
	private XlVip vip;
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
	public double getMoney() {
		return money;
	}
	public void setMoney(double money) {
		this.money = money;
	}
	
	public Integer getFromUser() {
		return fromUser;
	}
	public void setFromUser(Integer fromUser) {
		this.fromUser = fromUser;
	}
	public Integer getToUser() {
		return toUser;
	}
	public void setToUser(Integer toUser) {
		this.toUser = toUser;
	}
	public XlVip getVip() {
		return vip;
	}
	public void setVip(XlVip vip) {
		this.vip = vip;
	}

	
}
