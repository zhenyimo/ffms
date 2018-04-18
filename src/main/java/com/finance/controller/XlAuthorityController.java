package com.finance.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.finance.entity.XlAuthority;
import com.finance.entity.PageBean;
//import com.finance.entity.Role;
import com.finance.service.XlAuthorityService;
//import com.finance.service.RoleService;
import com.finance.util.ResponseUtil;
import com.finance.util.StringUtil;

/**
 * 权限Controller层
 * 
 * @author zhongzh
 *
 */
@Controller
@RequestMapping("/manage")
public class XlAuthorityController {
	@Resource
	private XlAuthorityService authorityService;
	
	/**
	 * 权限信息页面
	 */
	@RequestMapping("/authorityManage.do")
	public String authorityManage(ModelMap map) {
		return "admin/authorityManage";
	}
	
	/**
	 * 查询权限集合
	 * 
	 * @param page
	 * @param rows
	 * @param s_authority
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/authoritylist.do")
	public String list(@RequestParam(value = "page", required = false) String page,
			@RequestParam(value = "rows", required = false) String rows, XlAuthority s_authority, HttpServletResponse response)
			throws Exception {
		PageBean pageBean = new PageBean(Integer.parseInt(page), Integer.parseInt(rows));
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("authorityname", StringUtil.formatLike(s_authority.getAuthorityname()));
		map.put("start", pageBean.getStart());
		map.put("size", pageBean.getPageSize());
		List<XlAuthority> authorityList = authorityService.findXlAuthority(map);
		Long total = authorityService.getTotalXlAuthority(map);
		JSONObject result = new JSONObject();
		JSONArray jsonArray = JSONArray.fromObject(authorityList);
		result.put("rows", jsonArray);
		result.put("total", total);
		ResponseUtil.write(response, result);
		return null;
	}
	
	/**
	 * 添加与修改权限
	 * 
	 * @param xlauthority
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/authoritysave.do")
	public String save(XlAuthority xlauthority, HttpServletResponse response) throws Exception {
		int resultTotal = 0; // 操作的记录条数
		JSONObject result = new JSONObject();
		System.out.println(xlauthority.getAuthorityid());
		if (xlauthority.getAuthorityid() == null) {
			resultTotal = authorityService.addXlAuthority(xlauthority);
		} else {
			resultTotal = authorityService.updateXlAuthority(xlauthority);
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
	 * 删除权限
	 * 
	 * @param ids
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/authoritydelete.do")
	public String delete(@RequestParam(value = "ids") String ids, HttpServletResponse response) throws Exception {
		JSONObject result = new JSONObject();
		String[] idsStr = ids.split(",");
		for (int i = 0; i < idsStr.length; i++) {
			authorityService.deleteXlAuthority(Integer.parseInt(idsStr[i]));
		}
		result.put("errres", true);
		result.put("errmsg", "数据删除成功！");
		ResponseUtil.write(response, result);
		return null;
	}
}
