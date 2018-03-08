package com.finance.controller.gongzhonghao;



import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Arrays;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.codec.binary.Hex;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.finance.config.WeChatConfig;
import com.jfinal.weixin.sdk.api.ApiConfig;
import com.jfinal.weixin.sdk.api.ApiResult;
import com.jfinal.weixin.sdk.api.SnsAccessToken;
import com.jfinal.weixin.sdk.api.SnsAccessTokenApi;
import com.jfinal.weixin.sdk.api.SnsApi;

@Controller
@RequestMapping("/wx")
public class WeiXinController{
	public final Logger logger=LoggerFactory.getLogger(WeiXinController.class);
	@Autowired
	private WeChatConfig weChatConfig;
	
	@RequestMapping("/authPageBind.do")
    public void authPageBind(String signature,String timestamp,String nonce,String echostr,HttpServletResponse response) throws NoSuchAlgorithmException, IOException{  
        // 将token、timestamp、nonce三个参数进行字典序排序   
        String[] params = new String[] { weChatConfig.getApiConfig().getToken(), timestamp, nonce };  
        Arrays.sort(params);  
        // 将三个参数字符串拼接成一个字符串进行sha1加密  
        String clearText = params[0] + params[1] + params[2];  
        String algorithm = "SHA-1";  
        String sign = new String(    
                Hex.encodeHex(MessageDigest.getInstance(algorithm).digest((clearText).getBytes())));    
        // 开发者获得加密后的字符串可与signature对比，标识该请求来源于微信    
        if (signature.equals(sign)) {    
            response.getWriter().print(echostr);    
        }    
    }  
	
	
	
	@RequestMapping("/getCode.do")
	public String getCode(ModelMap map,HttpServletRequest request){
		ApiConfig config=weChatConfig.getApiConfig();
		String curUrl=request.getRequestURL().toString();
		int lastIndex=curUrl.lastIndexOf("/");
		String callBackUrl=curUrl.substring(0,lastIndex)+"/getUserInfo.do";
		String url = SnsAccessTokenApi.getAuthorizeURL(config.getAppId(),callBackUrl,  
                false);  
		return "redirect:"+url;
		
	}
	
	@RequestMapping("/getUserInfo.do")
	public String getUserInfo(ModelMap map,@RequestParam("code")String code,@RequestParam("state")String state){
		logger.info("the wx return code is "+code+","+state);
		SnsAccessToken sn = SnsAccessTokenApi  
                .getSnsAccessToken(weChatConfig.getApiConfig().getAppId(),weChatConfig.getApiConfig().getAppSecret(), code); 
		logger.info("sn openId is "+sn.getOpenid());
		ApiResult apiResult=SnsApi.getUserInfo(sn.getAccessToken(),sn.getOpenid());
	    System.out.println(apiResult.getJson());
		return "redirect:/EntryController/gongzhonghaoIndex.do";		
	}
}
