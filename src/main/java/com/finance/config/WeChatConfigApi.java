package com.finance.config;

import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import com.jfinal.weixin.sdk.api.ApiConfig;
import com.jfinal.weixin.sdk.api.ApiConfigKit;


@Component
public class WeChatConfigApi implements InitializingBean{
	@Value("${wxgz.token}")
	private String token;
	@Value("${wxgz.appID}")
	private String appID;
	@Value("${wxgz.appSecret}")
	private String appSecret;
	@Value("${wxgz.pay.mchId}")
	private String mchId;
	@Value("${wxgz.pay.paternerKey}")
	private String paternerKey;
	@Value("${wxgz.pay.noticeUrl}")
	private String noticeUrl;
	
	private static WeChatPayConfig weChatPayConfig;
	
	public static class WeChatPayConfig{
		private String appId;
		private String mchId;
		private String paternerKey;
		private String noticeUrl;
		
		public WeChatPayConfig(String appId, String mchId, String paternerKey,
				String noticeUrl) {
			super();
			this.appId = appId;
			this.mchId = mchId;
			this.paternerKey = paternerKey;
			this.noticeUrl = noticeUrl;
		}


		public String getAppId() {
			return appId;
		}


		public String getMchId() {
			return mchId;
		}


		public String getPaternerKey() {
			return paternerKey;
		}


		public String getNoticeUrl() {
			return noticeUrl;
		}
		
	}
	
	public ApiConfig getApiConfig() {      
        /** 
         *  是否对消息进行加密，对应于微信平台的消息加解密方式： 
         *  1：true进行加密且必须配置 encodingAesKey 
         *  2：false采用明文模式，同时也支持混合模式 
         */  
       /* ac.setEncryptMessage(PropKit.getBoolean("encryptMessage", false));  
        ac.setEncodingAesKey(PropKit.get("encodingAesKey", "setting it in config file"));  */
		try{
			ApiConfigKit.setThreadLocalAppId(appID);
	        return ApiConfigKit.getApiConfig(appID);  
		}catch(Exception ex){
			ApiConfig ac = new ApiConfig();         
		    // 配置微信 API 相关常量  
	        ac.setToken(token);  
	        ac.setAppId(appID);  
	        ac.setAppSecret(appSecret);  
	        ApiConfigKit.putApiConfig(ac);
	        return ac;
		}	
    }  
	
	public WeChatPayConfig getWeChatPayConfig(){
		return weChatPayConfig;
	}

	@Override
	public void afterPropertiesSet() throws Exception {
		// TODO Auto-generated method stub
		ApiConfig ac = new ApiConfig();         
	    // 配置微信 API 相关常量  
        ac.setToken(token);  
        ac.setAppId(appID);  
        ac.setAppSecret(appSecret);  
        ApiConfigKit.putApiConfig(ac);
        weChatPayConfig=new WeChatPayConfig(appID,mchId,paternerKey,noticeUrl);
	}
}
