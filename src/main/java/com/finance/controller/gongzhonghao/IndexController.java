package com.finance.controller.gongzhonghao;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
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
public class IndexController extends JsonSerialSupport{
	private Logger logger=LoggerFactory.getLogger(IndexController.class);
	@Resource
	XlGoodService xlGoodService;
	@RequestMapping("/goodList.do")
	@ResponseBody
	public AjaxResult getGoodList(@RequestParam("type")int type,@RequestParam(value="curPage",defaultValue="0")int curPage,@RequestParam("sortType")String sortType) {
		try{
			String actSort=StringUtil.getValue(sortType,SortEnum.TIME_SORT.getLevel());
			Map<String,Object> map=new HashMap<String,Object>();
			map.put(GoodDao.PARAM_TYPE_ID, type);
			map.put(SqlParmCon.LIMITSTART_PARAM,curPage*SqlParmCon.LIMIT_DEFAULT_SIZE);
			map.put(SqlParmCon.LIMIT_LENGTH,SqlParmCon.LIMIT_DEFAULT_SIZE);
			map.put(SqlParmCon.ORDER_BY_SORT_NAME, actSort);
			List<XlGood> list=xlGoodService.findByLimit(map);
			return new AjaxResult(AjaxResult.SUCCESS,AjaxResult.DEFAULT_SUCCESS_TIP,jsonSerial.serial(list));
		}catch (Exception ex){
			logger.error("---异常操作----",ex);
			throw new BusinessException(ErrorCode.UNKNOWN_ERROR, ex);
		}
		
		
	}
}
