package com.finance.util;

import java.math.BigDecimal;
import java.math.RoundingMode;

public class NumberUtil {
	public static double decimal(double value,int num) {
		 
		 BigDecimal bd = new BigDecimal(value);
		 bd = bd.setScale(num, RoundingMode.HALF_UP);
		 return bd.doubleValue();
	}
	
	public static void main(String[] args) {
		System.out.println(decimal(1.111111,2));
	}
}
