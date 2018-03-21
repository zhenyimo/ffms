package com.finance.config;

public enum SortEnum {
	TIME_SORT_DESC("0","按时间"),PRICE_SORT_DESC("1","按价格"),HOT_SORT_DESC("2","按热度");
	private final String level;
	private final String desc;
	SortEnum(String level,String desc){
		this.level=level;
		this.desc=desc;
	}
	public String getLevel() {
		return level;
	}
	public String getDesc() {
		return desc;
	}
	
	
	
}
