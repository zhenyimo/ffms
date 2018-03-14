package com.finance.config;

public enum SortEnum {
	TIME_SORT("0"),PRICE_SORT("1"),HOT_SORT("2");
	private String level;
	SortEnum(String level){
		this.level=level;
	}
	public String getLevel() {
		return level;
	}
	
}
