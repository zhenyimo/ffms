package com.finance.lock;

import java.util.Map;

import net.sf.ehcache.util.concurrent.ConcurrentHashMap;

public class ObjectLockMap {
	public static final ConcurrentHashMap<String,Object> lockMap=new ConcurrentHashMap<String, Object>();
	public static Object getLockObject(String key){
		Object lock=new Object();
		Object returnLock=lockMap.putIfAbsent(key, lock);
		if(returnLock!=null)
			return returnLock;
		else return lock;
	}
	
	
	public static void removeLockObject(String key){
		lockMap.remove(key);
	}
}
