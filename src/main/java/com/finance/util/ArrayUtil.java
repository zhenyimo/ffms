package com.finance.util;

import java.util.List;

public class ArrayUtil {
	/**
	 * 判断数组是否存在元素
	 * 
	 * @param list
	 * @return boolean 
	 */
	public static boolean isNotBlank(List list){
		if(list!=null&&list.size()>0)
			return true;
		else return false;
	}
}
