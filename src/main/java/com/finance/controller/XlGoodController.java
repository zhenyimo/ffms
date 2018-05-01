package com.finance.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.finance.entity.XlGood;
import com.finance.service.XlGoodService;

/**
 * 商品Controller层
 * 
 * @author zhongzh
 *
 */
@Controller(value="xlGoodController")
/*
使用注解 @Controller 时候，如果不使用命名，而SpringMVC会默认把类名的头一个字母小写，然后放到一个map中。
*/
@RequestMapping("/manage")
public class XlGoodController {
	@Resource
	private XlGoodService xlGoodService;
	@RequestMapping(value="/xlGoodlist.do",method=RequestMethod.POST)
	public List<XlGood> getXlGoods(){
		return xlGoodService.getXlGoods();
	}
}
