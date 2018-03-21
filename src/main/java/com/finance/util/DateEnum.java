package com.finance.util;


/**
 * 时间枚举
 * 
 * @author Naomi Peng
 * @version 1.0
 * @Create Date 2017年8月2日
 */
public enum DateEnum {
  HOURS("小时"), MINUTE("分钟"), SECOND("秒");

  private String value;

  private DateEnum(String value) {
    this.value = value;
  }

  public String getValue() {
    return value;
  }



}
