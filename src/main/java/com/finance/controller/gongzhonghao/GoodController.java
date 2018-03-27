package com.finance.controller.gongzhonghao;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.finance.dao.GoodDao;
import com.finance.dao.SqlParmCon;
import com.finance.entity.XlGood;
import com.finance.service.XlGoodService;


@Controller
@RequestMapping("/good")
public class GoodController {
	
	@Resource
	XlGoodService xlGoodService;
	
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
		Map<String,Object> params=new HashMap<String,Object>();
		params.put(GoodDao.PARAM_GOOD_ID,goodId);
		XlGood good=xlGoodService.findByGoodId(params);
		
		model.addAttribute("good",good);
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
