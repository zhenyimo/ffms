package com.finance.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import com.jfinal.weixin.sdk.api.ApiConfig;


@Component
public class WeChatConfig {
	@Value("${wxgz.token}")
	private String token;
	@Value("${wxgz.appID}")
	private String appID;
	@Value("${wxgz.appSecret}")
	private String appSecret;
	public ApiConfig getApiConfig() {  
        ApiConfig ac = new ApiConfig();         
        // 配置微信 API 相关常量  
        ac.setToken(token);  
        ac.setAppId(appID);  
        ac.setAppSecret(appSecret);  
          
        /** 
         *  是否对消息进行加密，对应于微信平台的消息加解密方式： 
         *  1：true进行加密且必须配置 encodingAesKey 
         *  2：false采用明文模式，同时也支持混合模式 
         */  
       /* ac.setEncryptMessage(PropKit.getBoolean("encryptMessage", false));  
        ac.setEncodingAesKey(PropKit.get("encodingAesKey", "setting it in config file"));  */
        return ac;  
    }  
}
