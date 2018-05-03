package com.finance.model;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import com.finance.entity.XlEvaluation;
import com.finance.entity.XlGood;
import com.finance.entity.XlVip;

public class QuesTypeNumMap {
	public static Map<String,Integer> map=new ConcurrentHashMap<String,Integer>();
	public static Map<String, Integer> getEvaluation(XlVip vip,int quesTypeNum){
		for(int i=1;i<=quesTypeNum;i++){
		map.put(vip.getOpenId()+"_"+i, 0);
		}
		return map;
		
	}
	
}
