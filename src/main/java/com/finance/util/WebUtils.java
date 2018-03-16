package com.finance.util;


import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.finance.entity.XlVip;
import com.jfinal.core.Controller;
import com.jfinal.kit.HashKit;
import com.jfinal.kit.PropKit;
import com.jfinal.kit.StrKit;


/**
 * Web相关工具类
 * @author Javen
 * 2016年4月2日
 */
public final class WebUtils {

	private WebUtils() {}

	/**
	 * 密码:md5hex
	 * @param pwd
	 * @return
	 */
	public static String pwdEncode(String password) {
		return HashKit.md5(password);
	}

	private final static String USER_COOKIE_KEY    = "vipId";

	/**
	 * 返回当前用户信息
	 * 
	 * @param c
	 * @return UserModel
	 */
	public static XlVip currentUser(Controller c) {
		HttpServletRequest  request  = c.getRequest();
		HttpServletResponse response = c.getResponse();
		return currentUser(request, response);
	}

	/**
	 * 返回当前用户
	 * @param request
	 * @param response
	 * @return UserModel
	 */
	public static XlVip currentUser(HttpServletRequest request, HttpServletResponse response) {
		String cookieKey = USER_COOKIE_KEY;
		// 获取cookie信息
		String userCookie = getCookie(request, cookieKey);
		// 1.cookie为空，直接清除
		if (StrKit.isBlank(userCookie)) {
			removeCookie(response, cookieKey);
			return null;
		}
        String vipId=userCookie;
		
		
		return XlVip.dao.loadInSession(vipId);
	}

	/**
	 * 用户登陆状态维持
	 * 
	 * cookie设计为: des(私钥).encode(userId~time~maxAge~ip)
	 * 
	 * @param Controller 控制器
	 * @param UserModel  用户model
	 * @param remember   是否记住密码、此参数控制cookie的 maxAge，默认为-1（只在当前会话）<br>
	 *                   记住密码默认为一周
	 * @return void
	 */
//	public static void loginUser(Controller c, XlVip vip, boolean... remember) {
//		// 获取用户的id、nickName
//		String uid     = user.getInt("id") + "";
//		// 当前毫秒数
//		long   now      = System.currentTimeMillis();
//		// 超时时间
//		int    maxAge   = -1;
//		if (remember.length > 0 && remember[0]) {
//			maxAge      = 60 * 60 * 24 * 7;
//		}
//		// 用户id地址
//		String ip		= getIP(c);
//		// 构造cookie
//		StringBuilder cookieBuilder = new StringBuilder()
//			.append(uid).append("~")
//			.append(now).append("~")
//			.append(maxAge).append("~")
//			.append(ip);
//
//		// cookie 私钥
//		String secret = USER_COOKIE_SECRET;
//		// 加密cookie
//		String userCookie = new DESUtils(secret).encryptString(cookieBuilder.toString());
//		HttpServletResponse response = c.getResponse();
//
//		String cookieKey = USER_COOKIE_KEY;
//		// 设置用户的cookie、 -1 维持成session的状态
//		setCookie(response, cookieKey, userCookie, maxAge);
//	}

	/**
	 * 退出即删除用户信息
	 * @param Controller
	 * @return void
	 */
	public static void logoutUser(Controller c) {
		HttpServletResponse response = c.getResponse();
		removeCookie(response, USER_COOKIE_KEY);
	}

	/**
	 * 读取cookie
	 * @param request
	 * @param key
	 * @return
	 */
	public static String getCookie(HttpServletRequest request, String key) {
		Cookie[] cookies = request.getCookies();
		if(null != cookies){
			for (Cookie cookie : cookies) {
				if (key.equals(cookie.getName())) {
					return cookie.getValue();
				}
			}
		}
		return null;
	}

	/**
	 * 清除 某个指定的cookie 
	 * @param response
	 * @param key
	 */
	public static void removeCookie(HttpServletResponse response, String key) {
		setCookie(response, key, null, 0);
	}

	/**
	 * 设置cookie
	 * @param response
	 * @param name
	 * @param value
	 * @param maxAgeInSeconds
	 */
	public static void setCookie(HttpServletResponse response, String name, String value, int maxAgeInSeconds) {
		Cookie cookie = new Cookie(name, value);
		cookie.setPath("/");
		cookie.setMaxAge(maxAgeInSeconds);
		// 指定为httpOnly保证安全性
		cookie.setHttpOnly(true);
		response.addCookie(cookie);
	}

	/**
	 * 获取浏览器信息
	 * @param Controller
	 * @return String
	 */
	public static String getUserAgent(Controller c) {
		return getUserAgent(c.getRequest());
	}

	/**
	 * 获取浏览器信息
	 * @param HttpServletRequest
	 * @return String
	 */
	public static String getUserAgent(HttpServletRequest request) {
		return request.getHeader("User-Agent");
	}

	/**
	 * 获取ip
	 * @param request
	 * @return
	 */
	public static String getIP(Controller c) {
		HttpServletRequest request = c.getRequest();
		return getIP(request);
	}

	/**
	 * 获取ip
	 * @param request
	 * @return
	 */
	public static String getIP(HttpServletRequest request) {
		String ip = request.getHeader("X-Requested-For");
		if (StrKit.isBlank(ip) || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("X-Forwarded-For");
		}
		if (StrKit.isBlank(ip) || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("Proxy-Client-IP");
		}
		if (StrKit.isBlank(ip) || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("WL-Proxy-Client-IP");
		}
		if (StrKit.isBlank(ip) || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("HTTP_CLIENT_IP");
		}
		if (StrKit.isBlank(ip) || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("HTTP_X_FORWARDED_FOR");
		}
		if (StrKit.isBlank(ip) || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getRemoteAddr();
		}
		return ip;
	}
	
	
	public enum SendEmialType {
		REGISTER,FORGET
	}
	
		
	

}
