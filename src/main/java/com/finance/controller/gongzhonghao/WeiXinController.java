package com.finance.controller.gongzhonghao;



import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.finance.config.WeChatConfigApi;
import com.finance.config.WeChatConfigApi.WeChatPayConfig;
import com.finance.dao.GoodDao;
import com.finance.entity.XlGood;
import com.finance.exception.BusinessException;
import com.finance.exception.ErrorCode;
import com.finance.lock.ObjectLockMap;
import com.finance.model.AjaxResult;
import com.finance.service.XlGoodService;
import com.finance.util.Constants;
import com.finance.util.StringUtil;
import com.finance.util.WeXinConstants;
import com.finance.util.WxUtil;
import com.jfinal.kit.HttpKit;
import com.jfinal.kit.Ret;
import com.jfinal.kit.StrKit;
import com.jfinal.weixin.sdk.api.AccessToken;
import com.jfinal.weixin.sdk.api.AccessTokenApi;
import com.jfinal.weixin.sdk.api.ApiConfig;
import com.jfinal.weixin.sdk.api.ApiConfigKit;
import com.jfinal.weixin.sdk.api.ApiResult;
import com.jfinal.weixin.sdk.api.JsTicket;
import com.jfinal.weixin.sdk.api.JsTicketApi;
import com.jfinal.weixin.sdk.api.JsTicketApi.JsApiType;
import com.jfinal.weixin.sdk.api.PaymentApi;
import com.jfinal.weixin.sdk.api.PaymentApi.TradeType;
import com.jfinal.weixin.sdk.api.SnsAccessToken;
import com.jfinal.weixin.sdk.api.SnsAccessTokenApi;
import com.jfinal.weixin.sdk.api.SnsApi;
import com.jfinal.weixin.sdk.kit.PaymentKit;

@Controller
@RequestMapping("/wx")
public class WeiXinController extends SerialSupport{
	public final Logger logger=LoggerFactory.getLogger(WeiXinController.class);
	@Autowired
	private WeChatConfigApi weChatConfigApi;
	
	@Resource
	XlGoodService xlGoodService;
	@Value("${wxgz.token}")
	public static  String token="xinliceshi";
	
	@RequestMapping("/authPageBind.do")
    public void authPageBind(String signature,String timestamp,String nonce,String echostr,HttpServletResponse response) throws NoSuchAlgorithmException, IOException{  
        // 将token、timestamp、nonce三个参数进行字典序排序   
        String[] params = new String[] { weChatConfigApi.getApiConfig().getToken(), timestamp, nonce };  
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
		ApiConfig config=weChatConfigApi.getApiConfig();
		String curUrl=request.getRequestURL().toString();
		int lastIndex=curUrl.lastIndexOf("/");
		String callBackUrl=curUrl.substring(0,lastIndex)+"/getUserInfo.do";
		String url = SnsAccessTokenApi.getAuthorizeURL(config.getAppId(),callBackUrl,  
                false);  
		return "redirect:"+url;
		
	}
	
	@RequestMapping("/getJsSdkTicket.do")
	@ResponseBody
	public AjaxResult getJsSdkTicket(HttpServletRequest request){
		logger.info("request the wxPay info.");
		ApiConfig config=weChatConfigApi.getApiConfig();
		JsTicket ticket=JsTicketApi.getTicket(JsApiType.jsapi);
		if(!ticket.isSucceed()){
			logger.error("request of jssdk does not success....");
			throw new BusinessException(ErrorCode.UNKNOWN_ERROR);
		}
		String curUrl=request.getRequestURL().toString();
		Map<String,String> result=null;
		try {
			result=WxUtil.jssdkSignMap(ticket,config.getAppId(),curUrl);
			return new AjaxResult(AjaxResult.SUCCESS,AjaxResult.DEFAULT_SUCCESS_TIP,jsonSerial.serial(result));
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			logger.error("no such algom ",e);
			return new AjaxResult(AjaxResult.FAIL_ALERT,AjaxResult.DEFAULT_FAIL_TIP,jsonSerial.serial(ErrorCode.UNKNOWN_ERROR));
		}
	}
	
	
	@RequestMapping("/jssdkPlaceOrder.do")
	@ResponseBody
	public AjaxResult jssdkPlaceOrder(HttpServletRequest request,@RequestParam("orderId")String orderId,@RequestParam(value="timestamp")String timestamp,@RequestParam(value="noncestr")String noncestr){
		
		Map<String,Object> params=new HashMap<String,Object>();
		//test
		String goodId="1";
		String number="3";
		
		
		params.put(GoodDao.PARAM_GOOD_ID, goodId);
		XlGood good=xlGoodService.findByGoodId(params);
		if(good==null){
			logger.error("no such good and good id is :"+goodId );
			return new AjaxResult(AjaxResult.FAIL_ALERT,AjaxResult.DEFAULT_FAIL_TIP,jsonSerial.serial(ErrorCode.UNKNOWN_GOOD_ERROR));
		}
		
		//生成微信基本的预订单参数
		Map<String,String> payBaseParms=WxUtil.createBaseOrderParams(weChatConfigApi,noncestr);
		
		//现在还没有把用户信息放入session中
		String openId=(String) request.getSession().getAttribute(Constants.currentUserSessionKey);
		
		//自定义字段的参数填充，其中交易类型为jsapi，即微信h5发起的交易
		payBaseParms=WxUtil.wapperPayOrderParam(payBaseParms,openId,String.valueOf(good.getPrice()*Integer.parseInt(number)),TradeType.JSAPI.name(),request.getRemoteAddr(),good.getTittle(),"心理测试");
		//向微信发起预订单
		String xmlResult=PaymentApi.pushOrder(payBaseParms);
		logger.info("push order result :" +xmlResult);
		Map<String,String> result = PaymentKit.xmlToMap(xmlResult);
		String return_code = result.get(WeXinConstants.WX_RETURN_CODE);
		//统一预订单失败
        if(StrKit.isBlank(return_code) || !WeXinConstants.WX_SUCCESS_VALUE.equals(return_code)){
        	return new AjaxResult(AjaxResult.FAIL_ALERT,AjaxResult.DEFAULT_FAIL_TIP,jsonSerial.serial(ErrorCode.PLACE_ORDER_ERROR));
        }
        String result_code = result.get(WeXinConstants.WX_RESULT_CODE);
        if(StrKit.isBlank(result_code) || !WeXinConstants.WX_SUCCESS_VALUE.equals(result_code)){
        	return new AjaxResult(AjaxResult.FAIL_ALERT,AjaxResult.DEFAULT_FAIL_TIP,jsonSerial.serial(ErrorCode.PLACE_ORDER_ERROR));
        }
        
        //返回前端微信发起支付所需要的参数
        Map<String,String> jsPayParams=WxUtil.createJSPayParams(weChatConfigApi, timestamp,noncestr,result.get("prepay_id"));
        return new AjaxResult(AjaxResult.SUCCESS,AjaxResult.DEFAULT_SUCCESS_TIP,jsonSerial.serial(jsPayParams));		
	}
	
	
	@RequestMapping("/orderNotify.do")
	@ResponseBody
	public String orderNotify(HttpServletRequest request,HttpServletResponse response){
		
		String xmlRequest=HttpKit.readData(request);
		logger.info("receive weixin order notify request :"+xmlRequest);
		Map<String,String> result=PaymentKit.xmlToMap(xmlRequest);
		String mchtTraceNo=result.get(WeXinConstants.WX_MCHT_TRACE_NO_CODE);
		Map<String,String> returnMap=new HashMap<String,String>();
		if(StringUtil.isNotEmpty(mchtTraceNo)){
			Object mchtTraceNolock=ObjectLockMap.getLockObject(mchtTraceNo);
			synchronized (mchtTraceNolock) {
				WeChatPayConfig config=weChatConfigApi.getWeChatPayConfig();
				 if(PaymentKit.verifyNotify(result, config.getPaternerKey())){
					String result_code = result.get(WeXinConstants.WX_RESULT_CODE);
					 
		            if("SUCCESS".equals(result_code)){	
		            	returnMap.put(WeXinConstants.WX_RETURN_CODE,WeXinConstants.WX_SUCCESS_VALUE);
		            	returnMap.put(WeXinConstants.WX_RETURN_MSG,WeXinConstants.WX_OK_VALUE);
		            	return PaymentKit.toXml(returnMap);
		            }else {
		            	logger.info("the resultCode of order Notify result is not success ");
		            	returnMap.put(WeXinConstants.WX_RETURN_CODE,WeXinConstants.WX_SUCCESS_VALUE);
		            	returnMap.put(WeXinConstants.WX_RETURN_MSG,WeXinConstants.WX_OK_VALUE);
		            	return PaymentKit.toXml(returnMap);
		            }
			     }else {
			    	 logger.info("the sign of order notify result verifies error ");
			    	 returnMap.put(WeXinConstants.WX_RETURN_CODE,WeXinConstants.WX_FAIL_VALUE);
			    	 returnMap.put(WeXinConstants.WX_RETURN_MSG,"签名失败");
			    	 return PaymentKit.toXml(returnMap);
			     }
			}
		}else{
			logger.info("the traceNo can not find in order notify result");
			returnMap.put(WeXinConstants.WX_RETURN_CODE,WeXinConstants.WX_FAIL_VALUE);
        	returnMap.put(WeXinConstants.WX_RETURN_MSG,"商户系统没有此交易订单");
        	return PaymentKit.toXml(returnMap);
		}
		
	}
	
	
	
	
	@RequestMapping("/getUserInfo.do")
	public String getUserInfo(HttpServletRequest request, ModelMap map,@RequestParam("code")String code,@RequestParam("state")String state){
		logger.info("the wx return code is "+code+","+state);
		SnsAccessToken sn = SnsAccessTokenApi  
                .getSnsAccessToken(weChatConfigApi.getApiConfig().getAppId(),weChatConfigApi.getApiConfig().getAppSecret(), code); 
		logger.info("sn openId is "+sn.getOpenid());
		ApiResult apiResult=SnsApi.getUserInfo(sn.getAccessToken(),sn.getOpenid());
		
		request.getSession().setAttribute(sn.getOpenid(),apiResult);//以openid为key将用户信息保存到session中
	    System.out.println(apiResult.getJson());
		return "redirect:/EntryController/gongzhonghaoIndex.do";		
	}
	
	
	
	//微信公众平台验证url是否有效使用的接口
	@RequestMapping(value="/validWx.do",method=RequestMethod.GET,produces="text/html;charset=UTF-8")
	@ResponseBody
	public String initWeixinURL(HttpServletRequest request){
		String echostr = request.getParameter("echostr");
		if (checkWeixinReques(request) && echostr != null) {
			return echostr;
		}else{
			return "error";
		}
	}
	
	/**
	 * 根据token计算signature验证是否为weixin服务端发送的消息
	 */
	private static boolean checkWeixinReques(HttpServletRequest request){
		String signature = request.getParameter("signature");
		String timestamp = request.getParameter("timestamp");
		String nonce = request.getParameter("nonce");
		if (signature != null && timestamp != null && nonce != null ) {
			String[] strSet = new String[] { token, timestamp, nonce };
			java.util.Arrays.sort(strSet);
			String key = "";
			for (String string : strSet) {
				key = key + string;
			}
			String pwd = WxUtil.sha1(key);
			return pwd.equals(signature);
		}else {
			return false;
		}
	}
}
