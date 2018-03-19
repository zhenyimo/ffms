package com.finance.config;

public enum SortEnum {
	TIME_SORT_DESC("0"),PRICE_SORT_DESC("1"),HOT_SORT_DESC("2");
	private String level;
	SortEnum(String level){
		this.level=level;
	}
	public String getLevel() {
		return level;
	}
	
}
