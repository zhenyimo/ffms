package com.finance.entity;
import java.io.Serializable;
import java.util.Date;
public class XlVoucher implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Integer id; // 编号

	private String name; // 创建人ID
	private double price; // 创建人角色
	private String flag; // 收入人
	private String type; // 来源
	private Date validate; // 金额
	private Integer voNum; // 类型
	private Integer goodId; // 备注
	private String goodname;
	public String getGoodname() {
		return goodname;
	}
	public void setGoodname(String goodname) {
		this.goodname = goodname;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	//private Integer gvid; // 收入时间
	private double stipulatePrice; // 创建时间
	private String createuser; //创建者
	private String updateuser; //修改者
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public String getFlag() {
		return flag;
	}
	public void setFlag(String flag) {
		this.flag = flag;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public Date getValidate() {
		return validate;
	}
	public void setValidate(Date validate) {
		this.validate = validate;
	}
	public Integer getVoNum() {
		return voNum;
	}
	public void setVoNum(Integer voNum) {
		this.voNum = voNum;
	}
	public Integer getGoodId() {
		return goodId;
	}
	public void setGoodId(Integer goodId) {
		this.goodId = goodId;
	}
/*	public Integer getGvid() {
		return gvid;
	}
	public void setGvid(Integer gvid) {
		this.gvid = gvid;
	}*/
	public double getStipulatePrice() {
		return stipulatePrice;
	}
	public void setStipulatePrice(double stipulatePrice) {
		this.stipulatePrice = stipulatePrice;
	}
	public String getVonum() {
		// TODO Auto-generated method stub
		return null;
	}
	public String getCreateuser() {
		return createuser;
	}
	public void setCreateuser(String createuser) {
		this.createuser = createuser;
	}
	public String getUpdateuser() {
		return updateuser;
	}
	public void setUpdateuser(String updateuser) {
		this.updateuser = updateuser;
	}
	
}
