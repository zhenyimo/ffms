package com.finance.controller.gongzhonghao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.finance.dao.GoodDao;
import com.finance.dao.SqlParmCon;
import com.finance.dao.XlQuestionDao;
import com.finance.entity.XlGood;
import com.finance.entity.XlQuestion;
import com.finance.service.XlGoodService;
import com.finance.service.XlQuestionService;


@Controller
@RequestMapping("front/good")
public class GoodController {
	private Logger logger=LoggerFactory.getLogger(GoodController.class);

	@Resource
	XlGoodService xlGoodService;
	@Resource
	XlQuestionService xlQuestionService;
	
	/**
	 * 跳转到商品详情页（也就是测评的详情页）
	 * @param model
	 * @param goodId
	 * @return
	 */
	@RequestMapping("/detail.do")
	public String goodDetail(Model model,@RequestParam("goodId")String goodId){
		Map<String,Object> params=new HashMap<String,Object>();
		params.put(GoodDao.PARAM_GOOD_ID,goodId);
		XlGood good=xlGoodService.findByGoodId(params);
		
		model.addAttribute("good",good);
		return "front/goodIndex";	
	}
	
	/**
	 * 跳转到做题页面
	 * @param model
	 * @param goodId
	 * @return
	 */
	@RequestMapping("/question.do")
	public String question(Model model,@RequestParam("goodId")String goodId){
		try{
		Map<String,Object> params=new HashMap<String,Object>();
		params.put(GoodDao.PARAM_GOOD_ID,goodId);
		XlGood good=xlGoodService.findByGoodId(params);
		model.addAttribute("good",good);
//		params.put("goodId", Integer.parseInt(goodId));
		List<XlQuestion> questions=xlQuestionService.findQuestionByGoodId(params);
		model.addAttribute("questions",questions);
		}catch(Exception e){
			logger.error("异常信息:", e.getCause());
		}
		return "front/questionIndex";	
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
