package com.finance.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

//import com.finance.entity.Datadic;
import com.finance.entity.PageBean;
import com.finance.entity.Title;
//import com.finance.service.DatadicService;
import com.finance.service.TitleService;
import com.finance.util.ResponseUtil;
import com.finance.util.StringUtil;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 * 题目Controller层
 * 
 * @author zhongzh
 *
 */
@Controller
@RequestMapping("/manage")

public class TitleController {
	
	@Resource
	private TitleService titleService;
	
	/**
	 * 题目信息页面
	 */
	@RequestMapping("/titleManage.do")
	public String titleManage(ModelMap map) {
		List<Title> list = titleService.getTitlename();
		map.addAttribute("titlenames", list);
		return "admin/titleManage";
	}
	
	/**
	 * 查询题目
	 * 
	 * @param page
	 * @param rows
	 * @param s_title
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/titlelist.do")
	public String list(@RequestParam(value = "page", required = false) String page,
			@RequestParam(value = "rows", required = false) String rows, Title s_title, HttpServletResponse response)
			throws Exception {
		PageBean pageBean = new PageBean(Integer.parseInt(page), Integer.parseInt(rows));
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("titlename", s_title.getTitlename());
		map.put("optionvalue", StringUtil.formatLike(s_title.getOptionvalue()));
		map.put("start", pageBean.getStart());
		map.put("size", pageBean.getPageSize());
		List<Title> titleList = titleService.findTitle(map);
		Long total = titleService.getTotalTitle(map);
		JSONObject result = new JSONObject();
		JSONArray jsonArray = JSONArray.fromObject(titleList);
		result.put("rows", jsonArray);
		result.put("total", total);
		ResponseUtil.write(response, result);
		return null;
	}
	
	/**
	 * 添加与修改题目
	 * 
	 * @param title
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/titlesave.do")
	public String save(Title title, HttpServletResponse response) throws Exception {
		int resultTotal = 0; // 操作的记录条数
		JSONObject result = new JSONObject();
		if (title.getId() == null) {
			resultTotal = titleService.addTitle(title);
		} else {
			resultTotal = titleService.updateTitle(title);
		}

		if (resultTotal > 0) { // 执行成功
			result.put("errres", true);
			result.put("errmsg", "数据保存成功！");
		} else {
			result.put("errres", false);
			result.put("errmsg", "数据保存失败");
		}
		ResponseUtil.write(response, result);
		return null;
	}

	/**
	 * 删除题目
	 * 
	 * @param ids
	 * @param response
	 * @return
	 * @throws Exception
	 */
	//@RequestMapping("/datadicdelete.do")
	@RequestMapping("/titledelete.do")
	public String delete(@RequestParam(value = "ids") String ids, HttpServletResponse response) throws Exception {
		JSONObject result = new JSONObject();
		String[] idsStr = ids.split(",");
		for (int i = 0; i < idsStr.length; i++) {
			titleService.deleteTitle(Integer.parseInt(idsStr[i]));
		}
		result.put("errres", true);
		result.put("errmsg", "数据删除成功！");
		ResponseUtil.write(response, result);
		return null;
	}
}
