package com.finance.controller.gongzhonghao;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.websocket.server.PathParam;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.finance.dao.GoodDao;
import com.finance.dao.SqlParmCon;
import com.finance.entity.XlGood;
import com.finance.service.XlGoodService;


@Controller
@RequestMapping("/good")
public class GoodController {
	
	@Resource
	XlGoodService xlGoodService;
	@RequestMapping("/detail.do")
	public String goodDetail(Model model,@PathParam("goodId")String goodId){
		Map<String,Object> params=new HashMap<String,Object>();
		params.put(GoodDao.PARAM_GOOD_ID,goodId);
		XlGood good=xlGoodService.findByGoodId(params);
		
		model.addAttribute("good",good);
		return "front/goodIndex";	
	}
	
	@RequestMapping("/question.do")
	public String question(Model model,@PathParam("goodId")String goodId){
		Map<String,Object> params=new HashMap<String,Object>();
		params.put(GoodDao.PARAM_GOOD_ID,goodId);
		XlGood good=xlGoodService.findByGoodId(params);
		
		model.addAttribute("good",good);
		return "front/questionIndex";	
	}
}
