package com.finance.entity;
/**
 * 权限实体
 * @author zhongzh
 *
 */
public class XlAuthority {
    private Integer authorityid;   //  编号
    private String authorityname; //   名字
	public Integer getAuthorityid() {
		return authorityid;
	}
	public void setAuthorityid(Integer authorityid) {
		this.authorityid = authorityid;
	}
	public String getAuthorityname() {
		return authorityname;
	}
	public void setAuthorityname(String authorityname) {
		this.authorityname = authorityname;
	}
    
}
