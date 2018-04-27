package com.finance.controller;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.finance.entity.PageBean;
import com.finance.entity.XlGood;
import com.finance.entity.XlVoucher;
import com.finance.service.XlGoodService;
import com.finance.service.XlVoucherService;
import com.finance.util.ResponseUtil;
import com.finance.util.StringUtil;
/**
 * 抵用券Controller层
 * 
 * @author zhongzh
 *
 */
@Controller
@RequestMapping("/manage")
public class XlVoucherController {
	@Resource
	private XlVoucherService xlVoucherService;
	@Resource
	private XlGoodService xlGoodService;
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		dateFormat.setLenient(false);
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));   //true:允许输入空值，false:不能为空值
	}

	/**
	 * 抵用券管理页面
	 */
	@RequestMapping("/xlVoucherManage.do")
	public String xlVoucherManage(ModelMap map) {
		List<XlVoucher> list = xlVoucherService.getXlVouchers();
		map.addAttribute("xlVouchernames", list);
		List<XlGood> goodlist = xlGoodService.getXlGoods();
		//List<String> goodnameslist = new LinkedList<String>();
		JSONArray jsonArray = new JSONArray();
		for(int i = 0 ; i < goodlist.size();i++){
			//goodnameslist.add(goodlist.get(i).getTittle());
			JSONObject result = new JSONObject();//不放在循环里面会覆盖原来的数据造成数据污染
			result.put("text", goodlist.get(i).getTittle());
			result.put("value", goodlist.get(i).getId());
		    jsonArray.add(result);
		}
		//map.addAttribute("goodnames", goodnameslist);
	    //第二种写法：直接JSONArray.fromObject(goodlist)
		JSONArray jsonArray1 = JSONArray.fromObject(goodlist);
	    System.out.println(jsonArray.toString());
	    System.out.println(jsonArray1.toString());
	    map.addAttribute("goodnames", jsonArray);
	    //map.addAttribute("goods", goodlist);
	    map.addAttribute("goods",jsonArray1);
		return "admin/xlVoucherManage";
	}
	/**
	 * 查询抵用券集合
	 * 
	 * @param page
	 * @param rows
	 * @param s_xlVoucher
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/xlVoucherlist.do")
	public String list(@RequestParam(value = "page", required = false) String page,
			@RequestParam(value = "rows", required = false) String rows, XlVoucher s_xlVoucher, HttpServletResponse response)
			throws Exception {
		PageBean pageBean = new PageBean(Integer.parseInt(page), Integer.parseInt(rows));
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("name", StringUtil.formatLike(s_xlVoucher.getName()));
		map.put("price", s_xlVoucher.getPrice());
		map.put("flag", StringUtil.formatLike(s_xlVoucher.getFlag()));
		map.put("type", StringUtil.formatLike(s_xlVoucher.getType()));
		map.put("validate", s_xlVoucher.getValidate());
		map.put("vo_num", StringUtil.formatLike(s_xlVoucher.getVonum()));	
		map.put("goodId", s_xlVoucher.getGoodId());	
		map.put("stipulate_price", s_xlVoucher.getStipulatePrice());
		map.put("crateuser", s_xlVoucher.getCreateuser());
		map.put("updateuser", s_xlVoucher.getUpdateuser());
		map.put("start", pageBean.getStart());	
		map.put("size", pageBean.getPageSize());
		List<XlVoucher> xlVoucherList = xlVoucherService.findXlVoucher(map);
		Long total = xlVoucherService.getTotalXlVoucher(map);
		JSONObject result = new JSONObject();
		JSONArray jsonArray = JSONArray.fromObject(xlVoucherList);
		result.put("rows", jsonArray);
		result.put("total", total);
		ResponseUtil.write(response, result);
		return null;
	}	
	/**
	 * 添加与修改抵用券
	 * 
	 * @param xlVoucher
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/xlVouchersave.do")
	public String save(XlVoucher xlVoucher, HttpServletResponse response) throws Exception {
		int resultTotal = 0; // 操作的记录条数
		JSONObject result = new JSONObject();
		if (xlVoucher.getId() == null) {
			resultTotal = xlVoucherService.addXlVoucher(xlVoucher);
			xlVoucherService.addXlVoucherGood(xlVoucher);
		} else {
			resultTotal = xlVoucherService.updateVoucher(xlVoucher);
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
	 * 删除抵用券
	 * 
	 * @param ids
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/xlVoucherdelete.do")
	public String delete(@RequestParam(value = "ids") String ids, HttpServletResponse response) throws Exception {
		JSONObject result = new JSONObject();
		String[] idsStr = ids.split(",");
		for (int i = 0; i < idsStr.length; i++) {
			xlVoucherService.deleteXlVoucher(Integer.parseInt(idsStr[i]));
		}
		result.put("errres", true);
		result.put("errmsg", "数据删除成功！");
		ResponseUtil.write(response, result);
		return null;
	}
}
