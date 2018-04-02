package com.finance.controller.gongzhonghao;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.finance.config.SortEnum;
import com.finance.dao.AdGoodDao;
import com.finance.dao.GoodDao;
import com.finance.dao.SqlParmCon;
import com.finance.entity.PageBean;
import com.finance.entity.Role;
import com.finance.entity.User;
import com.finance.entity.XlAds;
import com.finance.entity.XlGood;
import com.finance.entity.XlType;
import com.finance.exception.ErrorCode;
import com.finance.model.AjaxResult;
import com.finance.service.AdGoodService;
import com.finance.service.RoleService;
import com.finance.service.TypeService;
import com.finance.service.UserService;
import com.finance.service.XlGoodService;
import com.finance.util.Base64Util;
import com.finance.util.Constants;
import com.finance.util.ExceptionUtils;
import com.finance.util.ResponseUtil;
import com.finance.util.StringUtil;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 * 用户Controller层
 * 
 * @author jinbangchen
 *
 */
@Controller
//@RequestMapping("")

public class EntryController {
	private Logger logger=LoggerFactory.getLogger(EntryController.class);
	@Resource
	private UserService userService;
	@Resource
	XlGoodService xlGoodService;
	@Resource
	private RoleService roleService;
	@Resource
	TypeService typeService;
	@Resource
	private AdGoodService adGoodService;
	@Value("${ad.good.lunbo.times}")
	private String adLimitTimes;
	@Value("${index.hot.good.times}")
	private String hotGoodTimes;
	@Value("${index.handPicked.good.times}")
	private String handpickedGoodTimes;
	@Value("${index.new.good.times}")
	private String newGoodTimes;
	@Value("${ad.good.pic.parent.path}")
	private String adPicParentPath;
	
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		dateFormat.setLenient(false);
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));   //true:允许输入空值，false:不能为空值
	}

	/**
	 * 用户登录页面
	 */
	@RequestMapping("/front/index.do")
	public String index(Model model,@RequestParam(value="tabName",required=false)String tabName) {
		model.addAttribute("tabName",tabName);
		if(tabName==null){
			index(model);	
		}else if(tabName.equals("classify")){
			classify(model);
			model.addAttribute("tab","classify");
			
		}else if(tabName.equals("mine")){
			model.addAttribute("tab","mine");
			
		}else if(tabName.equals("gift")){
			model.addAttribute("tab","gift");
			
		}else if(tabName.equals("good")){
			model.addAttribute("tab","good");
		}else if(tabName.equals("question")){
			model.addAttribute("tab","question");
		}else{
			index(model);
		}
		return "front/index";
	}
	
	
	
	private void classify(Model model) {
		//查询数据字典的测试题所有类型
		List<XlType> typeList=typeService.findAll();
		model.addAttribute("typeList", typeList);
		
		//排序类型，时间，热度，价格
		model.addAttribute("sortEnums",SortEnum.values());
		//默认按时间排序,测试题类型为全部
		Map<String,Object> map=new HashMap<String,Object>();
		map.put(SqlParmCon.LIMITSTART_PARAM,0);
		map.put(SqlParmCon.LIMIT_LENGTH,SqlParmCon.LIMIT_DEFAULT_SIZE);
		map.put(SqlParmCon.ORDER_BY_SORT_NAME,SortEnum.TIME_SORT_DESC.getLevel());
		List<XlGood> goods=xlGoodService.findByLimit(map);
		model.addAttribute("classifyGoods", goods);
		model.addAttribute("currPage","0");
	}
	
	private void index(Model model){
		try{
		//主页商品广告轮播
		Map<String,Object> paramsMap=new HashMap<String,Object>();
		paramsMap.put(SqlParmCon.LIMITSTART_PARAM,0);
		paramsMap.put(SqlParmCon.LIMIT_LENGTH,Integer.parseInt(adLimitTimes));
		List<XlAds> ads=adGoodService.findByLimit(paramsMap);
		model.addAttribute("ads", ads);
		//广告商品的图片父路径
		model.addAttribute("adPicParentPath", adPicParentPath);
		//热卖，按商品购买数量排序，取前几个
		Map<String,Object> hotParams=new HashMap<String,Object>();
		hotParams.put(SqlParmCon.LIMITSTART_PARAM,0);
		hotParams.put(SqlParmCon.LIMIT_LENGTH,Integer.parseInt(hotGoodTimes));
		hotParams.put(SqlParmCon.ORDER_BY_SORT_NAME,SortEnum.HOT_SORT_DESC.getLevel());	
		List<XlGood> hotgoods=xlGoodService.findByLimit(hotParams);
		model.addAttribute("hotgoods", hotgoods);
		
		//精品，按对商品的评价得分来获取
		//List<XlGood> handpickedGoods=xlGoodService.findByLimit(map);
		model.addAttribute("handpickedGoods", null);
		//新品，按时间排序获取
		Map<String,Object> newParams=new HashMap<String,Object>();
		newParams.put(SqlParmCon.LIMITSTART_PARAM,0);
		newParams.put(SqlParmCon.LIMIT_LENGTH,Integer.parseInt(newGoodTimes));
		newParams.put(SqlParmCon.ORDER_BY_SORT_NAME,SortEnum.TIME_SORT_DESC.getLevel());
		List<XlGood> newGoods=xlGoodService.findByLimit(newParams);
		model.addAttribute("newGoods", newGoods);
		}catch(Exception e){
			logger.error("异常信息:", e.getCause());
		}
		
		
		
		
		
	}
	

	
	


	

}
