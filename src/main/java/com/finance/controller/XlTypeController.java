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
import com.finance.entity.PageBean;
import com.finance.entity.XlType;
import com.finance.service.XlTypeService;
import com.finance.util.ResponseUtil;
import com.finance.util.StringUtil;
/**
 * 类型Controller层
 * 
 * @author zhongzh
 *
 */
@Controller
@RequestMapping("/manage")
public class XlTypeController {
	@Resource
	private XlTypeService xlTypeService;
	/**
	 * 类型管理页面
	 */
	@RequestMapping("/question/xlTypeManage.do")
	public String xlTypeManage(ModelMap map) {
		List<XlType> list = xlTypeService.getXlTypes();
		map.addAttribute("xlTypenames", list);
		return "admin/xlTypeManage";
	}
	/**
	 * 查询类型集合
	 * 
	 * @param page
	 * @param rows
	 * @param s_xlType
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/xlTypelist.do")
	public String list(@RequestParam(value = "page", required = false) String page,
			@RequestParam(value = "rows", required = false) String rows, XlType s_xlType, HttpServletResponse response)
			throws Exception {
		PageBean pageBean = new PageBean(Integer.parseInt(page), Integer.parseInt(rows));
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("name", StringUtil.formatLike(s_xlType.getName()));
		map.put("flag", StringUtil.formatLike(s_xlType.getFlag()));
		map.put("start", pageBean.getStart());
		map.put("size", pageBean.getPageSize());
		List<XlType> xlTypeList = xlTypeService.findXlType(map);
		Long total = xlTypeService.getTotalXlType(map);
		JSONObject result = new JSONObject();
		JSONArray jsonArray = JSONArray.fromObject(xlTypeList);
		result.put("rows", jsonArray);
		result.put("total", total);
		ResponseUtil.write(response, result);
		return null;
	}	
	/**
	 * 添加与修改类型
	 * 
	 * @param xlType
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/xlTypesave.do")
	public String save(XlType xlType, HttpServletResponse response) throws Exception {
		int resultTotal = 0; // 操作的记录条数
		JSONObject result = new JSONObject();
		if (xlType.getId() == null) {
			resultTotal = xlTypeService.addXlType(xlType);
		} else {
			resultTotal = xlTypeService.updateXlType(xlType);
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
	 * 删除类型
	 * 
	 * @param ids
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/xlTypedelete.do")
	public String delete(@RequestParam(value = "ids") String ids, HttpServletResponse response) throws Exception {
		JSONObject result = new JSONObject();
		String[] idsStr = ids.split(",");
		for (int i = 0; i < idsStr.length; i++) {
			xlTypeService.deleteXlType(Integer.parseInt(idsStr[i]));
		}
		result.put("errres", true);
		result.put("errmsg", "数据删除成功！");
		ResponseUtil.write(response, result);
		return null;
	}
}
