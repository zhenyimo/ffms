package com.finance.weixin.test;

import com.jfinal.kit.JsonKit;
import com.jfinal.weixin.sdk.api.ApiConfig;
import com.jfinal.weixin.sdk.api.ApiConfigKit;
import com.jfinal.weixin.sdk.api.ApiResult;
import com.jfinal.weixin.sdk.api.MenuApi;

public class WeChatTestUtils {
	/*
	 * 菜单管理器类
	 * 
	 * @author Javen 2016年5月30日
	 * 
	 * 
	 * 
	 * 
	 */
	
	
	public static void main(String[] args) {

		// 将菜单对象转换成json字符串
		// 有问题：主菜单项多了一个type
		String jsonMenu = JsonKit.toJson(getTestMenu()).toString();
		System.out.println(jsonMenu);
		ApiConfig ac = new ApiConfig();

		// 配置微信 API 相关常量
		String appId = "wx3b0a568d7a54ac29";
		ac.setAppId(appId);
		ac.setAppSecret("ce3249ee898d6028c5344c367a76eefc");
		// ac.setAppId(PropKit.get("appId"));
		// ac.setAppSecret(PropKit.get("appSecret"));
		ApiConfigKit.putApiConfig(ac);
		ApiConfigKit.setThreadLocalAppId(appId);
		MenuApi.deleteMenu();
		// 创建菜单
		ApiResult apiResult = MenuApi.createMenu(jsonMenu);
		System.out.println(apiResult.getJson());
	}

	private static Menu getTestMenu() {
		
		// TODO Auto-generated method stub
		ViewButton xinliButton = new ViewButton();  
		xinliButton.setName("心理测试");  
		xinliButton.setType("view");  
		xinliButton.setUrl("http://9744639e.ngrok.io/ffms/wx/getCode.do");
		ComButton mainBtn = new ComButton(); 
		mainBtn.setName("测试中心"); 
		mainBtn.setSub_button(new Button[]{xinliButton});
		Menu menu = new Menu();  
	    menu.setButton(new Button[] { mainBtn});  
		return menu;
	}
}
