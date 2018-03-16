package com.finance.entity;

import java.util.Date;

import com.jfinal.kit.StrKit;
import com.jfinal.log.Log;
import com.jfinal.plugin.ehcache.CacheKit;
import com.jfinal.plugin.ehcache.IDataLoader;
import com.jfinal.plugin.activerecord.Model;


public class XlVip extends Model<XlVip>{
	private Integer id; // 编号

	private String openId; // 
	private String vipFlag; // 1:vip 2:不是vip
	private String nickName; // 呢称
	private String privilege; //权限
	private String headimgurl; // 头像
	private Integer sex; //性别
	private Date updateTime; //更新时间
	private String remark; // 备注
     static Log log = Log.getLog(XlVip.class);
	
	public static final XlVip dao = new XlVip();
	private static final String USER_CACHE_NAME = "session";

	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getOpenId() {
		return openId;
	}
	public void setOpenId(String openId) {
		this.openId = openId;
	}
	public String getVipFlag() {
		return vipFlag;
	}
	public void setVipFlag(String vipFlag) {
		this.vipFlag = vipFlag;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public String getPrivilege() {
		return privilege;
	}
	public void setPrivilege(String privilege) {
		this.privilege = privilege;
	}
	public String getHeadimgurl() {
		return headimgurl;
	}
	public void setHeadimgurl(String headimgurl) {
		this.headimgurl = headimgurl;
	}
	public Integer getSex() {
		return sex;
	}
	public void setSex(Integer sex) {
		this.sex = sex;
	}
	public Date getUpdateTime() {
		return updateTime;
	}
	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	
	
	/**
	 * 从缓存中加载用户信息
	 * @param userId
	 * @return
	 */
	public XlVip loadInSession(String userId) {
		// 传入的userId为空直接返回null
		if (StrKit.isBlank(userId)) {
			return null;
		}
		return loadInSession(Long.parseLong(userId));
	}
	
	/**
	 * 从缓存中加载用户信息
	 * @param userId
	 * @return
	 */
	public XlVip loadInSession(final long vipId) {
		return CacheKit.get(USER_CACHE_NAME, vipId, new IDataLoader() {

			@Override
			public Object load() {
				return findById(vipId);
			}
		});
	}
}
