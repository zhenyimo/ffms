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
import com.finance.service.XlVipService;


@Controller
@RequestMapping("/vip")
public class VipController {
	
	@Resource
	XlVipService xlVipService;
	@RequestMapping("/mine/{vipId}")
	public String goodDetail(Model model,@PathParam("vipId")String goodId){
		
		return "front/mine";	
	}
}
