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
@RequestMapping("EntryController")

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
	@RequestMapping("/gongzhonghaoIndex.do")
	public String router(Model model,@RequestParam(value="tabName",required=false)String tabName) {
		/*List<Role> list = roleService.getRoles();
		map.addAttribute("roles", list);
		return "front/index";*/
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
			
		}else{
			index(model);
		}
		return "front/index";
	}
	
	
	
	private void classify(Model model) {
		//查询数据字典的测试题所有类型
		/*List<XlType> typeList=typeService.findAll();
		model.addAttribute("typeList", typeList);*/
		
		//排序类型，时间，热度，价格
		model.addAttribute("sortEnum", SortEnum.class);
		
		//默认按时间排序,测试题类型为全部
		Map<String,Object> map=new HashMap<String,Object>();
		map.put(SqlParmCon.LIMITSTART_PARAM,0);
		map.put(SqlParmCon.LIMIT_LENGTH,SqlParmCon.LIMIT_DEFAULT_SIZE);
		map.put(SqlParmCon.ORDER_BY_SORT_NAME,SortEnum.TIME_SORT_DESC.getLevel());
		List<XlGood> goods=xlGoodService.findByLimit(map);
		model.addAttribute("classifyGoods", goods);
	}
	
	private void index(Model model){
		
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
		
		
		
		
		
	}
	

	
	

	/**
	 * 用户登录
	 * 
	 * @param user
	 * @param request
	 * @return
	 */
	@RequestMapping("/login.do")
	public String login(User user, HttpServletRequest request, HttpServletResponse response) {
		JSONObject result = new JSONObject();
		User resultUsername = userService.loginUsername(user);
		if (resultUsername == null) {
			result.put("errres", 101);
			result.put("errmsg", "用户名不存在！");
			result.put("inputfocus", "inputUsername");
		} else {
			User resultPassword = userService.loginPassword(user);
			if (resultPassword == null){
				result.put("errres", 102);
				result.put("errmsg", "密码不正确！");
				result.put("inputfocus", "inputPassword");
			} else {
				User resultRolename = userService.loginRolename(user);
				if (resultRolename == null) {
					result.put("errres", 103);
					result.put("errmsg", "用户角色不匹配！");
					result.put("inputfocus", "rolename");
				} else {
					resultRolename.setPassword(Base64Util.decodeStr(resultRolename.getPassword(),"UTF-8"));
					HttpSession session = request.getSession();
					session.setAttribute(Constants.currentUserSessionKey, resultRolename);
					result.put("errres", 200);
				}
			}
		}
		ResponseUtil.write(response, result);
		return null;
	}
	
	/**
	 * 用户注册页面
	 */
	@RequestMapping("/sign.do")
	public String sign() {
		return "sign";
	}
	
	/**
	 * 注册用户操作
	 */
	@RequestMapping("/gosign.do")
	public String gosign(User user, HttpServletResponse response) throws Exception {
		int resultTotal = 0; // 操作的记录条数
		int resultTotalother = 0; // 操作的记录条数
		JSONObject result = new JSONObject();
		if (isUserExists(user)) {
			result.put("errres", false);
			result.put("errmsg", "用户名已经被使用！");
			result.put("inputfocus", "inputUsername");
			ResponseUtil.write(response, result);
			return null;
		}
		resultTotal = userService.addSign(user);
		resultTotalother = userService.addUserRole(user);

		if ((resultTotal > 0)&&(resultTotalother>0)) { // 执行成功
			result.put("errres", true);
			result.put("errmsg", "注册成功，请返回登录！");
		} else {
			result.put("errres", false);
			result.put("errmsg", "注册失败");
			result.put("inputfocus", "inputUsername");
		}
		ResponseUtil.write(response, result);
		return null;
	}

	/**
	 * 进入主页面
	 */
	@RequestMapping("/main.do")
	public String main(ModelMap map, HttpServletRequest request) {
		HttpSession session = request.getSession();
		User usersession = (User)session.getAttribute(Constants.currentUserSessionKey);
		List<Role> list = roleService.getRoles();
		map.addAttribute("roles", list);
		User usermessage = userService.getUserById(usersession.getId());
		usermessage.setPassword(Base64Util.decodeStr(usermessage.getPassword(),"UTF-8"));
		map.addAttribute("usermessage", usermessage);
		return "main";
	}

	/**
	 * 用户信息管理页面
	 */
	@RequestMapping("/userManage.do")
	public String userManage(ModelMap map) {
		List<Role> list = roleService.getRoles();
		map.addAttribute("roles", list);
		return "userManage";
	}

	/**
	 * 修改用户密码
	 * 
	 * @param user
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/modifyPassword.do")
	public String modifyPassword(User user, HttpServletResponse response) throws Exception {
		int resultTotal = userService.updateUser(user);
		JSONObject result = new JSONObject();
		if (resultTotal > 0) { // 执行成功
			result.put("success", true);
		} else {
			result.put("success", false);
		}
		ResponseUtil.write(response, result);
		return null;
	}

	/**
	 * 用户注销
	 * 
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/logout.do")
	public String logout(HttpSession session) throws Exception {
		session.removeAttribute(Constants.currentUserSessionKey);
		return "redirect:/index.do";
	}

	/**
	 * 查询用户集合
	 * 
	 * @param page
	 * @param rows
	 * @param s_user
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/userlist.do")
	public String list(@RequestParam(value = "page", required = false) String page,
			@RequestParam(value = "rows", required = false) String rows, User s_user, HttpServletResponse response)
			throws Exception {
		PageBean pageBean = new PageBean(Integer.parseInt(page), Integer.parseInt(rows));
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("username", StringUtil.formatLike(s_user.getUsername()));
		map.put("truename", StringUtil.formatLike(s_user.getTruename()));
		map.put("appellation", StringUtil.formatLike(s_user.getAppellation()));
		map.put("sex", s_user.getSex());
		map.put("roleid", s_user.getRoleid());
		map.put("start", pageBean.getStart());
		map.put("size", pageBean.getPageSize());
		List<User> userList = userService.findUser(map);
		for(int i = 0; i < userList.size(); i++) {
			userList.get(i).setPassword(Base64Util.decodeStr(userList.get(i).getPassword(),"UTF-8"));
        }
		Long total = userService.getTotalUser(map);
		JSONObject result = new JSONObject();
		JSONArray jsonArray = JSONArray.fromObject(userList);
		result.put("rows", jsonArray);
		result.put("total", total);
		ResponseUtil.write(response, result);
		return null;
	}

	/**
	 * 判断指定的用户是否已经存在
	 * 
	 * @param User
	 *            user
	 * @param response
	 * @return
	 * @throws Exception
	 */

	private boolean isUserExists(User user) throws Exception {
		long resultTotal = 0; // 操作的记录条数
		resultTotal = userService.getUserIsExists(user);
		boolean rs = false;
		if (resultTotal > 0) { // 执行成功
			rs = true;
		}
		return rs;
	}

	/**
	 * 添加与修改用户
	 * 
	 * @param customer
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/usersave.do")
	public String save(User user, HttpServletResponse response) throws Exception {
		int resultTotal = 0; // 操作的记录条数
		JSONObject result = new JSONObject();
		if (isUserExists(user)) {
			result.put("errres", false);
			result.put("errmsg", "用户名已经被使用！");
			ResponseUtil.write(response, result);
			return null;
		}
		if (user.getId() == null) {
			resultTotal = userService.addUser(user);
			userService.addUserRole(user);
		} else {
			resultTotal = userService.updateUser(user);
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
	 * 删除用户
	 * 
	 * @param ids
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/userdelete.do")
	public String delete(@RequestParam(value = "ids") String ids, HttpServletResponse response) throws Exception {
		JSONObject result = new JSONObject();
		String[] idsStr = ids.split(",");
		for (int i = 0; i < idsStr.length; i++) {
			userService.deleteUser(Integer.parseInt(idsStr[i]));
		}
		result.put("errres", true);
		result.put("errmsg", "数据删除成功！");
		ResponseUtil.write(response, result);
		return null;
	}
	
	/**
	 * 更改主题
	 * @param currentTheme
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/changeTheme.do")
	public String changeTheme(
			@RequestParam(value = "currentTheme") String currentTheme,
			HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		JSONObject result = new JSONObject();
		HttpSession session = request.getSession();
		session.setAttribute("currentTheme", currentTheme);
		result.put("errres", true);
		result.put("errmsg", "主题切换成功！");
		ResponseUtil.write(response, result);
		return null;
	}
}
