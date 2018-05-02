package com.finance.util;

import java.net.URL;

import net.sf.ehcache.Cache;
import net.sf.ehcache.CacheManager;
import net.sf.ehcache.Element;


public class EhcacheUtil {

private static final String path = "/ehcache.xml"; 

private URL url; 

private CacheManager cacheManager; 

private static EhcacheUtil ehCache; 
private static Object INIT_LOCK=new Object();
public EhcacheUtil(String path) { 
url = getClass().getResource(path); 
cacheManager = CacheManager.create(url);
}
public static EhcacheUtil getInstance() { 
if (ehCache== null) { 
  synchronized (INIT_LOCK) {
	if(ehCache==null){
		ehCache= new EhcacheUtil(path); 
	}
  }
}
return ehCache; 
}

public void put(String cacheName, String key, Object value) { 
Cache cache = cacheManager.getCache(cacheName); 
Element element = new Element(key, value); 
cache.put(element);
} 

public Object get(String cacheName, String key) { 
Cache cache = cacheManager.getCache(cacheName); 
Element element = cache.get(key); 
return element == null ? null : element.getObjectValue(); 
} 

public Cache get(String cacheName) { 
return cacheManager.getCache(cacheName); 
} 

public void remove(String cacheName, String key) { 
Cache cache = cacheManager.getCache(cacheName); 
cache.remove(key); 
 } 

}