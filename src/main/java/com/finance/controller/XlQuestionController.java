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

import com.finance.entity.PageBean;
import com.finance.entity.Role;
import com.finance.entity.XlAnswer;
import com.finance.entity.XlQuestion;
import com.finance.service.RoleService;
import com.finance.service.UserService;
import com.finance.service.XlAnswerService;
import com.finance.service.XlQuestionService;
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
@RequestMapping("manage/question")
public class XlQuestionController {
	
	@Resource
	private XlQuestionService xlQuestionService;
	
	@Resource
	private XlAnswerService xlAnswerService;
	
	@Resource
	private UserService userService;
	@Resource
	private RoleService roleService;
	
	/**
	 * 题目信息页面
	 */
	@RequestMapping("/xlGoodsManage.do")
    public String xlGoodManage(ModelMap map) {
		
		List<Role> list = roleService.getRoles();
		map.addAttribute("roles", list);
		return "admin/xlGoodsManage";
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
	@RequestMapping("/xlquestionlist.do")
	public String list(@RequestParam(value = "page", required = false) String page,
			@RequestParam(value = "rows", required = false) String rows, XlQuestion xl_Question, HttpServletResponse response)
			throws Exception {
		PageBean pageBean = new PageBean(Integer.parseInt(page), Integer.parseInt(rows));
		Map<String, Object> map = new HashMap<String, Object>();
//		map.put("question_content", StringUtil.formatLike(xl_Question.getQuestionContent()));//格式化模糊查询
//		map.put("answer_content", StringUtil.formatLike(xl_Question.getAnswername()));
//		map.put("answer_num", xl_Question.getAnswerid());
		map.put("start", pageBean.getStart());
		map.put("size", pageBean.getPageSize());
		
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
	@RequestMapping("/xlquestionsave.do")
	public String save(XlQuestion xlQuestion, HttpServletResponse response) throws Exception {
		int resultTotal = 0; // 操作的记录条数
		JSONObject result = new JSONObject();
		if (xlQuestion.getId() == null) {
			resultTotal = xlQuestionService.addXlQuestion(xlQuestion);
		} else {
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
	@RequestMapping("/xlquestiondelete.do")
	public String delete(@RequestParam(value = "ids") String ids, HttpServletResponse response) throws Exception {
		JSONObject result = new JSONObject();
		String[] idsStr = ids.split(",");
		for (int i = 0; i < idsStr.length; i++) {
			xlQuestionService.deleteXlQuestion(Integer.parseInt(idsStr[i]));
		}
		result.put("errres", true);
		result.put("errmsg", "数据删除成功！");
		ResponseUtil.write(response, result);
		return null;
	}
}
