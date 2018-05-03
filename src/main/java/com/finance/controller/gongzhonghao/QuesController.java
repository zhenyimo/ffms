
package com.finance.controller.gongzhonghao;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.concurrent.ConcurrentHashMap;

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
import com.finance.entity.XlEvaluation;
import com.finance.entity.XlEvaluationRecord;
import com.finance.entity.XlGood;
import com.finance.entity.XlQuestion;
import com.finance.entity.XlVip;
import com.finance.entity.XlVipAnswer;
import com.finance.model.AjaxJsonResult;
import com.finance.model.AjaxResult;
import com.finance.model.QuesTypeNumMap;
import com.finance.service.XlGoodService;
import com.finance.service.XlQuestionService;
import com.finance.util.Constants;
import com.finance.util.EhcacheUtil;
import com.jfinal.plugin.ehcache.CacheKit;
import com.sun.tools.apt.Main;


@Controller
@RequestMapping("front/question")
public class QuesController extends SerialSupport{
	
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
		Map<String,Object> params=new ConcurrentHashMap<String,Object>();
		params.put(GoodDao.PARAM_GOOD_ID,goodId);
		//XlGood good=xlGoodService.findByGoodId(params);
		XlVip curUser=(XlVip) request.getSession().getAttribute(Constants.currentFrontUserSessionKey);
        String openId=curUser.getOpenId();
        XlVipAnswer vipAnswer=JSON.parseObject(answer, XlVipAnswer.class);
        vipAnswer.setOpenId(openId);
		  Map<String, List<XlVipAnswer>> goodMap= (Map<String, List<XlVipAnswer>>) EhcacheUtil.getInstance().get(XlVipAnswer.VIP_ANSWER_CACHE_NAME, openId);
//          EhcacheUtil.getInstance().remove(XlVipAnswer.VIP_ANSWER_CACHE_NAME, openId);
		  List<XlVipAnswer> indextList=null;
          if (goodMap== null) {  
              System.err.println("缓存不存在");  
              goodMap=new HashMap<String, List<XlVipAnswer>>();
             indextList=new ArrayList<XlVipAnswer>();
              synchronized(indextList){
            	  addAnswer(indextList,vipAnswer);
              }
        	  goodMap.put(goodId, indextList);
        	  EhcacheUtil.getInstance().put(XlVipAnswer.VIP_ANSWER_CACHE_NAME, openId, goodMap);
          }else{  
        	  if(null==goodMap.get(goodId)){
        		  indextList=new ArrayList<XlVipAnswer>();
        	  }else{
        	   indextList= goodMap.get(goodId);
        	  }
        	  synchronized(indextList){
        		  addAnswer(indextList,vipAnswer);
        	  }
        	  
        	  goodMap.put(goodId, indextList);
        	  EhcacheUtil.getInstance().put(XlVipAnswer.VIP_ANSWER_CACHE_NAME, openId, goodMap);
          }  
          result.setSuccess(true);
    	  result.setMessage("缓存成功");
		  return result;	
	}
	
	/**
	 * 将答案缓存到eacache
	 * @param model
	 * @param goodId
	 * @return
	 */
	@RequestMapping("/prevQuestion.do")
	@ResponseBody
	public AjaxJsonResult prevQuestion(Model model,HttpServletRequest request,@RequestParam("goodId")String goodId,String curQuestionId){
		AjaxJsonResult result = new AjaxJsonResult();
		//Map<String,Object> params=new HashMap<String,Object>();
		//params.put(GoodDao.PARAM_GOOD_ID,goodId);
		//XlGood good=xlGoodService.findByGoodId(params);
		XlVip curUser=(XlVip) request.getSession().getAttribute(Constants.currentFrontUserSessionKey);
        String openId=curUser.getOpenId();
       // XlVipAnswer vipAnswer=JSON.parseObject(answer, XlVipAnswer.class);
       // vipAnswer.setOpenId(openId);
		Map<String, List<XlVipAnswer>> goodMap= (Map<String, List<XlVipAnswer>>) EhcacheUtil.getInstance().get("thirtyMinute", openId);
//          EhcacheUtil.getInstance().remove(XlVipAnswer.VIP_ANSWER_CACHE_NAME, openId);
          if (goodMap== null) {  
              System.err.println("缓存不存在");  
              goodMap=new HashMap<String, List<XlVipAnswer>>();
              List<XlVipAnswer> indextList=new LinkedList<XlVipAnswer>();
            //  indextList.add(vipAnswer);
        	  goodMap.put(goodId, indextList);
        	  EhcacheUtil.getInstance().put(XlVipAnswer.VIP_ANSWER_CACHE_NAME, openId, goodMap);
        	  result.setSuccess(false);
			  result.setMessage("没有上一题");
          }else{  
        	  List<XlVipAnswer> indexList= goodMap.get(goodId);
        	  //indextList.add(vipAnswer);
        	  if(indexList!=null){
        		  synchronized (indexList) {
            		  if(indexList.size()>0){
            			  XlVipAnswer lastAnswer=lastAnswer(indexList,curQuestionId);
            			  if(lastAnswer!=null){
            				  result.setSuccess(true);
                    		  result.setMessage(jsonSerial.serial(lastAnswer));
            			  }else{
            				  result.setSuccess(false);
                			  result.setMessage("没有上一题");
            			  }
            		  }else{
            			  result.setSuccess(false);
            			  result.setMessage("没有上一题");
            		  }
            		 
                	//  goodMap.put(goodId, indextList);
                	//  EhcacheUtil.getInstance().put(XlVipAnswer.VIP_ANSWER_CACHE_NAME, openId, goodMap);
    			  } 
        	  }else{
        		  result.setSuccess(false);
    			  result.setMessage("没有上一题");
        	  }
        	  
          }  
		  return result;	
	}
	
	
	private void addAnswer(List<XlVipAnswer> list, XlVipAnswer vipAnswer){
		Iterator<XlVipAnswer> it=list.iterator();
		XlVipAnswer answer=null;
		while(it.hasNext()){
			answer=it.next();
			//移除答案有相同问题id的，以及后面的答案
			if(answer.getQuesId().toString().equals(vipAnswer.getQuesId().toString())){
				it.remove();
				while(it.hasNext()){
					it.next();
					it.remove();
				}
				break;
			}
		}
		list.add(vipAnswer);
	}
	
	public static void main(String[] args) {
		List<String> a=new ArrayList<String>();
		a.add("a");
		a.add("b");
		a.add("c");
		a.add("d");
		a.add("e");
		Iterator<String> it=a.iterator();
		while(it.hasNext()){
			String b=it.next();
			//移除答案有相同问题id的，以及后面的答案
			if(b.equals("d")){
				it.remove();
				while(it.hasNext()){
					it.next();
					it.remove();
				}
				break;
			}
		}
		System.out.println(a);
	}
	
	
	private XlVipAnswer lastAnswer(List<XlVipAnswer> list,String questionId){
		int length=list.size();
		for (int i = 0; i <length ; i++) {
			if(questionId.equals(list.get(i).getQuesId().toString())){
				if(i>0)
					return list.get(i-1);
				else return null;
			}	
		}
		//若不存在则返回最后一个
		if(length>0){
			return list.get(length-1);
		}else return null;	
	}
	
	
	/**
	 * 跳转到测评结果页面
	 * @param model
	 * @param goodId
	 * @return
	 */
	@RequestMapping("/evaluationResult.do")
	public String evaluationResult(HttpServletRequest req,Model model,@RequestParam("goodId")String goodId){
		XlVip curUser=(XlVip) req.getSession().getAttribute(Constants.currentFrontUserSessionKey);
		Map<String,Object> params=new HashMap<String,Object>();
		params.put(GoodDao.PARAM_GOOD_ID, goodId);
		params.put("openId", curUser.getOpenId());
		XlGood good=xlGoodService.findByGoodId(params);
	    Map<String, List<XlVipAnswer>> goodMap= (Map<String, List<XlVipAnswer>>) EhcacheUtil.getInstance().get("thirtyMinute", curUser.getOpenId());
	    List<XlVipAnswer> vipAnslist=goodMap.get(goodId);
	    //如果缓存中没有的话就从数据库里面查询出来
	    if(null==goodMap||goodMap.size()==0){
	    	 vipAnslist=xlQuestionService.findVipAnsByGoodIdAndOpenId(params);
	    }
        int quesTypeNum=good.getQuesTypeNum();//题目分几大类
        Map<String,Integer> scoreMap=QuesTypeNumMap.getEvaluation(curUser,quesTypeNum);//定义一个分数Map，将分数装入map
         for(int i=0;i<vipAnslist.size();i++){
        	 XlVipAnswer ans=vipAnslist.get(i);
         	XlQuestion ques=xlQuestionService.findQuestionById(ans.getQuesId());
         	String type=ques.getQuesType();
         	for(int j=1;j<=quesTypeNum;j++){
         		if(j==Integer.parseInt(type)){
         		scoreMap.put(curUser.getOpenId()+"_"+j, scoreMap.get(curUser.getOpenId()+"_"+j)+ans.getAnswerScore());//第几类分数相加
         		}
         	}
         	        	
        	}
         List<XlEvaluation> evals=getEvaluations(scoreMap,goodId,curUser);
         model.addAttribute("evals", evals);
		model.addAttribute("good",good);
		return "front/xlEvaluation";	
	}
	
	
	//根据分数和goodId获取评测结果
	public List<XlEvaluation> getEvaluations(Map<String,Integer> scoreMap,String goodId,XlVip curUser ){
		Map<String,Object> params=new HashMap<String,Object>();
		params.put(GoodDao.PARAM_GOOD_ID, goodId);
//		Map<String,XlEvaluation> evalMap=new HashMap<>();
		List<XlEvaluation> evals=new ArrayList<XlEvaluation> ();
        List<XlEvaluationRecord> evalRecordList=new ArrayList<XlEvaluationRecord>();

		for(Entry<String, Integer> entry : scoreMap.entrySet()){
			int score=entry.getValue();
			params.put("score", score);
			List<XlEvaluation> evalList=xlQuestionService.findEvaluationDetails(params);
			XlEvaluation evalEntity=evalList.get(0);
			 evals.add(evalEntity);
			 
			//得到long类型当前时间
			 long timestamp = System.currentTimeMillis();
			 Date date = new Date(timestamp);
			 SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			 
			 //将缓存的结果入库
			 XlEvaluationRecord record=new XlEvaluationRecord();
        	 record.setEid(evalEntity.getId());
        	 record.setGoodId(Integer.parseInt(goodId));
        	 record.setScore(score);
        	 record.setVipId(curUser.getId());
			 record.setVipname(curUser.getNickName());
			 record.setStartTime(dateFormat.format(date));
			 evalRecordList.add(record);
	         xlQuestionService.saveXlEvaluationRecord(evalRecordList);

		}
		
		return evals;
		
	}
	
}
