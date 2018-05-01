package com.finance.entity;

import java.io.Serializable;
import java.util.Date;

public class XlOrderSend implements Serializable{
	public static final int NOT_CLAIM=0;
	public static final int CLAIMED=1;
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer id; // 编号
	private String orderNo; // 
	private Date time; // 
	private double money; // 
	private Integer goodId;
	private Integer fromUser; // 赠送者id
	private Integer toUser; // 
	private XlVip vip;
	private Integer isClaim;
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
	public Integer getIsClaim() {
		return isClaim;
	}
	public void setIsClaim(Integer isClaim) {
		this.isClaim = isClaim;
	}
	public Integer getGoodId() {
		return goodId;
	}
	public void setGoodId(Integer goodId) {
		this.goodId = goodId;
	}

	
}
