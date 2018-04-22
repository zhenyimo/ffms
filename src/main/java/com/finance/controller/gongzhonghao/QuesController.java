
package com.finance.controller.gongzhonghao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import net.sf.ehcache.Cache;
import net.sf.ehcache.CacheManager;

import org.springframework.cache.annotation.CachePut;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.finance.dao.GoodDao;
import com.finance.dao.SqlParmCon;
import com.finance.entity.XlAnswer;
import com.finance.entity.XlGood;
import com.finance.entity.XlQuestion;
import com.finance.entity.XlVip;
import com.finance.entity.XlVipAnswer;
import com.finance.model.AjaxJsonResult;
import com.finance.model.AjaxResult;
import com.finance.service.XlGoodService;
import com.finance.service.XlQuestionService;
import com.finance.util.Constants;
import com.finance.util.EhcacheUtil;
import com.jfinal.plugin.ehcache.CacheKit;


@Controller
@RequestMapping("front/question")
public class QuesController {
	
	@Resource
	XlGoodService xlGoodService;
	@Resource
	XlQuestionService xlQuestionService;


	/**
	 * 将答案缓存到eacache
	 * @param model
	 * @param goodId
	 * @return
	 */
	@RequestMapping("/saveAnswerCache.do")
	@ResponseBody
	public AjaxJsonResult saveAnswerCache(Model model,HttpServletRequest request,@RequestParam("goodId")String goodId,String answer){
		AjaxJsonResult result = new AjaxJsonResult();
		Map<String,Object> params=new HashMap<String,Object>();
		params.put(GoodDao.PARAM_GOOD_ID,goodId);
		XlGood good=xlGoodService.findByGoodId(params);
		XlVip curUser=(XlVip) request.getSession().getAttribute(Constants.currentFrontUserSessionKey);
        String openId=curUser.getOpenId();
        XlVipAnswer vipAnswer=JSON.parseObject(answer, XlVipAnswer.class);
        vipAnswer.setOpenId(openId);
		  Map<String, Map<String,XlVipAnswer>> goodMap= (Map<String, Map<String,XlVipAnswer>>) EhcacheUtil.getInstance().get("thirtyMinute", openId);
//          EhcacheUtil.getInstance().remove(XlVipAnswer.VIP_ANSWER_CACHE_NAME, openId);
          if (goodMap== null) {  
              System.err.println("缓存不存在");  
              goodMap=new HashMap<String, Map<String,XlVipAnswer>>();
              Map<String,XlVipAnswer> indexMap=new HashMap<String,XlVipAnswer>();
        	  indexMap.put(vipAnswer.getQuesId().toString(),vipAnswer );
        	  goodMap.put(goodId, indexMap);
        	  EhcacheUtil.getInstance().put(XlVipAnswer.VIP_ANSWER_CACHE_NAME, openId, goodMap);
          }else{  
        	  Map<String,XlVipAnswer> indexMap= goodMap.get(goodId);
        	  indexMap.put(vipAnswer.getQuesId().toString(),vipAnswer );
        	  goodMap.put(goodId, indexMap);
        	  EhcacheUtil.getInstance().put(XlVipAnswer.VIP_ANSWER_CACHE_NAME, openId, goodMap);
          }  
          result.setSuccess(true);
    	  result.setMessage("缓存成功");
		  return result;	
	}
	
	/**
	 * 跳转到做题页面
	 * @param model
	 * @param goodId
	 * @return
	 */
	@RequestMapping("/answer.do")
	public String answer(Model model,@RequestParam("goodId")String goodId){
		Map<String,Object> params=new HashMap<String,Object>();
		params.put(GoodDao.PARAM_GOOD_ID,goodId);
		XlGood good=xlGoodService.findByGoodId(params);
		
		model.addAttribute("good",good);
		return "front/questionIndex";	
	}
}
