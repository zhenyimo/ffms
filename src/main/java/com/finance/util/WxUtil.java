package com.finance.util;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import org.apache.commons.codec.binary.Hex;








import com.finance.config.WeChatConfigApi;
import com.finance.config.WeChatConfigApi.WeChatPayConfig;
import com.jfinal.kit.StrKit;
import com.jfinal.weixin.sdk.api.ApiConfig;
import com.jfinal.weixin.sdk.api.JsTicket;
import com.jfinal.weixin.sdk.api.PaymentApi.TradeType;
import com.jfinal.weixin.sdk.kit.PaymentKit;

public class WxUtil {
	private static ThreadLocal<String> currentRequestUrl=new ThreadLocal<String>();
	public static Map<String,String> jssdkSignMap(JsTicket ticket,String appId,String url) throws NoSuchAlgorithmException{
		   String timeStamp= createTimestamp();
		   String nonceStr=createNonceStr();
		   Map<String,String> parms=new HashMap<String, String>();
		   parms.put("appId", appId);
		   //parms.put("jsapi_ticket",ticket.getTicket());
		   parms.put("noncestr",nonceStr );
		   parms.put("timestamp",timeStamp);
		   parms.put("url",url);
		   StringBuilder sb=new StringBuilder();
		   sb.append("jsapi_ticket="+ticket.getTicket());
		   sb.append("&noncestr="+nonceStr);
		   sb.append("&timestamp="+timeStamp);
		   sb.append("&url="+url);
		   String sign = new String(    
	                Hex.encodeHex(MessageDigest.getInstance("SHA-1").digest((sb.toString()).getBytes())));  
		   parms.put("sign", sign);
		   return parms;
	}
	
	public static Map<String,String> createBaseOrderParams(WeChatConfigApi weChatConfig){
		Map<String, String> params = new HashMap<String,String>();
		WeChatPayConfig payConfig=weChatConfig.getWeChatPayConfig();
	   	params.put("appid", payConfig.getAppId());
        params.put("mch_id", payConfig.getMchId());
        params.put("out_trade_no", new SimpleDateFormat("yyyyMMddHHmmss").format(new Date())+(int)(Math.random()*90000+10000)); //订单编号
        params.put("nonce_str",createNonceStr()); //随机字符串
        params.put("notify_url", payConfig.getNoticeUrl()); //支付后通知回调地址
        params.put("paternerKey", payConfig.getPaternerKey());
		return params;
	}
	
	public static Map<String,String> createBaseOrderParams(WeChatConfigApi weChatConfig,String nonceStr){
		Map<String, String> params = new HashMap<String,String>();
		WeChatPayConfig payConfig=weChatConfig.getWeChatPayConfig();
	   	params.put("appid", payConfig.getAppId());
        params.put("mch_id", payConfig.getMchId());
        params.put("out_trade_no", new SimpleDateFormat("yyyyMMddHHmmss").format(new Date())+(int)(Math.random()*90000+10000)); //订单编号
        params.put("nonce_str",nonceStr); //随机字符串
        params.put("notify_url", payConfig.getNoticeUrl()); //支付后通知回调地址
        params.put("paternerKey", payConfig.getPaternerKey());
		return params;
	}
	
	public static Map<String,String> wapperPayOrderParam(Map<String,String> baseParams,String openId,String totalMoney,String tradeType,String userIp,String body,String attach){
		baseParams.put("total_fee", totalMoney);
		baseParams.put("trade_type", tradeType);
		 if(StrKit.isBlank(userIp)){
			 userIp = "127.0.0.1";
	        }
		baseParams.put("spbill_create_ip", userIp);
		baseParams.put("openid", openId);
		baseParams.put("body",body);
		baseParams.put("attach", attach);
		String paternerKey=baseParams.remove("paternerKey");
		String sign = PaymentKit.createSign(baseParams, paternerKey);  
		baseParams.put("sign", sign);
		return baseParams;
	}
	
	public static Map<String,String> createJSPayParams(WeChatConfigApi weChatConfigApi,String timestamp,String noncestr,String prepayId){
		WeChatPayConfig payConfig=weChatConfigApi.getWeChatPayConfig();
        Map<String,String> paySignParameters=new HashMap<String,String>();
        paySignParameters.put("appId", payConfig.getAppId());  
        paySignParameters.put("nonceStr",noncestr);  
        paySignParameters.put("package", "prepay_id=" + prepayId);  
        paySignParameters.put("signType", "MD5");  
        paySignParameters.put("timeStamp",timestamp);  
        String paySign = PaymentKit.createSign(paySignParameters,payConfig.getPaternerKey());
        paySignParameters.put("paySign", paySign);
        return paySignParameters;
	}
	
	public static boolean setCurrentUrl(String url){
		int cn=url.lastIndexOf("#");
		if(cn<=0)
			return false;
		currentRequestUrl.set(url.substring(0,cn));
		return true;
	}
	
	//生成随机字符串
	private static String createNonceStr() {
	    return UUID.randomUUID().toString();
	}
	//生成时间戳
	private static String createTimestamp() {
	    return Long.toString(System.currentTimeMillis() / 1000);
	}
	
	/**
	 * sha1加密算法
	 * @param key需要加密的字符串
	 * @return 加密后的结果
	 */
	public static String sha1(String key) {
		try {
			MessageDigest md = MessageDigest.getInstance("SHA1");
			md.update(key.getBytes());
			String pwd = new BigInteger(1, md.digest()).toString(16);
			return pwd;
		} catch (Exception e) {
			e.printStackTrace();
			return key;
		}
		
	}
		
}
