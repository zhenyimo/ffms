package com.finance.util;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.commons.lang3.StringUtils;

public class SequenceUtil {
	public static SimpleDateFormat DF=new SimpleDateFormat("yyyyMMddHHmmssSSS");
	public static Random RANDOM=new Random();
	public static int RANDOM_SECTION=5000;
	public static Pattern PATTERN=Pattern.compile("[a-z|A-Z|0-9]{4}");
	public static String getOrderSequence(String mchCode,String userName){
		StringBuilder sq=new StringBuilder();
		sq.append(DF.format(System.currentTimeMillis()));
		Matcher mc=PATTERN.matcher(mchCode);
		if(mc.find())
			sq.append(mc.group());
		else sq.append("0000");
		mc=PATTERN.matcher(userName);
		if(mc.find())
			sq.append(mc.group());
		else sq.append("0000");
		sq.append(StringUtils.leftPad(String.valueOf(RANDOM.nextInt(RANDOM_SECTION)),4,"0"));
		return sq.toString();	
	}
	
	
	public static void main(String[] args) {
		String str=null;
		str=getOrderSequence("wzfz","zhen");
		System.out.println(str.length());
		
	}
}
