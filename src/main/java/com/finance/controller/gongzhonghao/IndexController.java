package com.finance.controller.gongzhonghao;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.finance.config.SortEnum;
import com.finance.dao.GoodDao;
import com.finance.dao.SqlParmCon;
import com.finance.entity.XlGood;
import com.finance.exception.BusinessException;
import com.finance.exception.ErrorCode;
import com.finance.model.AjaxResult;
import com.finance.service.XlGoodService;
import com.finance.util.ArrayUtil;
import com.finance.util.Assert;
import com.finance.util.StringUtil;
import com.jfinal.json.Jackson;

@Controller
@RequestMapping("/classify")
public class IndexController extends SerialSupport{
	private Logger logger=LoggerFactory.getLogger(IndexController.class);
	@Resource
	XlGoodService xlGoodService;
	//全部加载完毕
	private static final int LOAD_END=1;
	//加载出错
	private static final int LOAD_ERROR=2;
	/**
	 * 
	 * 
	 * @param type 商品类型
	 * @param curPage 当前页
	 * @param sortType 根据哪个类型排序
	 * @return
	 */
	@RequestMapping("/goodListJson.do")
	@ResponseBody
	public AjaxResult getGoodListReturnJson(@RequestParam(value="type",required=false)String type,@RequestParam(value="nextPage",defaultValue="0")int nextPage,@RequestParam("sortType")String sortType) {
		try{
			String actSort=StringUtil.getValue(sortType,SortEnum.TIME_SORT_DESC.getLevel());
			Map<String,Object> map=new HashMap<String,Object>();
			if(StringUtil.isNotEmpty(type))
				map.put(GoodDao.PARAM_TYPE_ID, type);
			map.put(SqlParmCon.LIMITSTART_PARAM,nextPage*SqlParmCon.LIMIT_DEFAULT_SIZE);
			map.put(SqlParmCon.LIMIT_LENGTH,SqlParmCon.LIMIT_DEFAULT_SIZE);
			map.put(SqlParmCon.ORDER_BY_SORT_NAME, actSort);
			List<XlGood> list=xlGoodService.findByLimit(map);
			return new AjaxResult(AjaxResult.SUCCESS,AjaxResult.DEFAULT_SUCCESS_TIP,jsonSerial.serial(list));
		}catch (Exception ex){
			logger.error("---异常操作----",ex);
			return new AjaxResult(AjaxResult.FAIL_ALERT,AjaxResult.DEFAULT_FAIL_TIP,jsonSerial.serial(ErrorCode.UNKNOWN_ERROR));
		}
		
		
	}
	
	
	/**
	 * 
	 * 
	 * @param type 商品类型
	 * @param curPage 当前页
	 * @param sortType 根据哪个类型排序
	 * @return
	 */
	@SuppressWarnings("finally")
	@RequestMapping("/goodListHtml.do")
	public String getGoodListReturnHtml(Model model,@RequestParam(value="type",required=false)String type,@RequestParam(value="nextPage",defaultValue="0")int nextPage,@RequestParam("sortType")String sortType) {
		try{
			String actSort=StringUtil.getValue(sortType,SortEnum.TIME_SORT_DESC.getLevel());
			Map<String,Object> map=new HashMap<String,Object>();
			//-1表示商品类型为全部
			if(StringUtil.isNotEmpty(type)&&!type.equals("-1"))
				map.put(GoodDao.PARAM_TYPE_ID, type);
			map.put(SqlParmCon.LIMITSTART_PARAM,nextPage*SqlParmCon.LIMIT_DEFAULT_SIZE);
			map.put(SqlParmCon.LIMIT_LENGTH,SqlParmCon.LIMIT_DEFAULT_SIZE);
			map.put(SqlParmCon.ORDER_BY_SORT_NAME, actSort);
			List<XlGood> list=xlGoodService.findByLimit(map);
			if(list==null||list.size()<SqlParmCon.LIMIT_DEFAULT_SIZE)
				model.addAttribute("loadStatus",LOAD_END);
			model.addAttribute("classifyGoods", list);
		}catch (Exception ex){
			model.addAttribute("loadStatus",LOAD_ERROR);
			logger.error("---异常操作----",ex);
		}finally{
			return "front/classifyGoodModel";
		}
		
		
	}
	
	
	
}
