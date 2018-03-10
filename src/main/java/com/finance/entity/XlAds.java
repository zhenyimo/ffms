package com.finance.entity;

import java.io.Serializable;

public class XlAds implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer id; // 编号
	private Integer goodId; // 
	private String adPictureUrl;
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
	public String getAdPictureUrl() {
		return adPictureUrl;
	}
	public void setAdPictureUrl(String adPictureUrl) {
		this.adPictureUrl = adPictureUrl;
	}
	
	
}
