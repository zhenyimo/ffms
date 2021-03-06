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
import com.finance.entity.XlQuestion;
import com.finance.service.XlQuestionService;
//import com.finance.entity.Title;
//import com.finance.service.DatadicService;
//import com.finance.service.TitleService;
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
//@RequestMapping("DatadicController")

public class XlQuestionController {
	
	@Resource
	//private TitleService titleService;
	private XlQuestionService xlQuestionService;
	/**
	 * 题目信息页面
	 */
	//@RequestMapping("/titleManage.do")
	@RequestMapping("/xlQuestionManage.do")
	//public String titleManage(ModelMap map) {
    public String xlQuestionManage(ModelMap map) {
		//List<Title> list = titleService.getTitlename();
		//List<XlQuestion> list = titleService.getTitlename();
		List<XlQuestion> list = xlQuestionService.getXlQuestion();
		//map.addAttribute("titlenames", list);
		map.addAttribute("question_contents", list);
		//return "admin/titleManage";
		return "admin/xlQuestionManage";
	}
	
	/**
	 * 查询题目
	 * 
	 * @param page
	 * @param rows
	 * @param xl_Question
	 * @param response
	 * @return
	 * @throws Exception
	 */
	//@RequestMapping("/titlelist.do")
	@RequestMapping("/xlquestionlist.do")
/*	public String list(@RequestParam(value = "page", required = false) String page,
			@RequestParam(value = "rows", required = false) String rows, Title s_title, HttpServletResponse response)*/
	public String list(@RequestParam(value = "page", required = false) String page,
			@RequestParam(value = "rows", required = false) String rows, XlQuestion xl_Question, HttpServletResponse response)
			throws Exception {
		PageBean pageBean = new PageBean(Integer.parseInt(page), Integer.parseInt(rows));
		Map<String, Object> map = new HashMap<String, Object>();
		//map.put("titlename", s_title.getTitlename());
		map.put("question_content", xl_Question.getQuestionContent());
		//map.put("optionvalue", StringUtil.formatLike(s_title.getOptionvalue()));
		//map.put("optionvalue", StringUtil.formatLike(s_title.getAnswer()));
		
		map.put("start", pageBean.getStart());
		map.put("size", pageBean.getPageSize());
		//List<Title> titleList = titleService.findTitle(map);
		//Long total = titleService.getTotalTitle(map);
		//List<Title> titleList = titleService.findTitle(map);
		//Long total = titleService.getTotalTitle(map);
		List<XlQuestion> xlQuestionList = xlQuestionService.findXlQuestion(map);
		Long total = xlQuestionService.getTotalXlQuestion(map);
		JSONObject result = new JSONObject();
		//JSONArray jsonArray = JSONArray.fromObject(titleList);
		JSONArray jsonArray = JSONArray.fromObject(xlQuestionList);
		result.put("rows", jsonArray);
		result.put("total", total);
		ResponseUtil.write(response, result);
		return null;
	}
	
	/**
	 * 添加与修改题目
	 * 
	 * @param xlQuestion
	 * @param response
	 * @return
	 * @throws Exception
	 */
	//@RequestMapping("/titlesave.do")
	@RequestMapping("/xlquestionsave.do")
	//public String save(Title title, HttpServletResponse response) throws Exception {
	public String save(XlQuestion xlQuestion, HttpServletResponse response) throws Exception {
		int resultTotal = 0; // 操作的记录条数
		JSONObject result = new JSONObject();
		//if (title.getId() == null) {
		if (xlQuestion.getId() == null) {
			//resultTotal = titleService.addTitle(title);
			resultTotal = xlQuestionService.addXlQuestion(xlQuestion);
		} else {
			//resultTotal = titleService.updateTitle(title);
			resultTotal = xlQuestionService.updateXlQuestion(xlQuestion);
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
	//@RequestMapping("/titledelete.do")
	@RequestMapping("/xlquestiondelete.do")
	public String delete(@RequestParam(value = "ids") String ids, HttpServletResponse response) throws Exception {
		JSONObject result = new JSONObject();
		String[] idsStr = ids.split(",");
		for (int i = 0; i < idsStr.length; i++) {
			//titleService.deleteTitle(Integer.parseInt(idsStr[i]));
			xlQuestionService.deleteXlQuestion(Integer.parseInt(idsStr[i]));
		}
		result.put("errres", true);
		result.put("errmsg", "数据删除成功！");
		ResponseUtil.write(response, result);
		return null;
	}
}
