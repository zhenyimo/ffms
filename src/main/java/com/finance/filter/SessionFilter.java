package com.finance.filter;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.UUID;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.filter.OncePerRequestFilter;

import com.finance.entity.User;
import com.finance.entity.XlVip;
import com.finance.util.Constants;
import com.jfinal.weixin.sdk.api.ApiResult;

public class SessionFilter extends OncePerRequestFilter {
	public static final String FRONT_BASE_URL="/front";
	public static final String MANAGE_BASE_URL="/manage";
    public static final String FRONT_LOGIN_URL=FRONT_BASE_URL+"/wx/getCode.do";
    public static final String MANAGE_LOGIN_URL=MANAGE_BASE_URL+"/index.do";
    public static final String ERROR_PAGE_URL="/page-front/errors.html";
    public static String[] FRONT_NOT_FILTER=new String[]{
    		"/getCode.do","/orderNotify.do","/getUserInfo.do","/authPageBind.do"
    };
    public static String[] MANAGE_NOT_FILTER=new String[]{
    		 "/sign.do","/gosign.do","/index.do","/login.do"
    };
    
    public static boolean FRONT_TEST_MODE=true;
    public static boolean MANAGE_TEST_MODE=false;
    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain)
            throws ServletException, IOException {
        // 不过滤的uri
       /* String[] notFilter1 = new String[] { "/sign.do","/index.do","/gosign.do","/login.do",
        		"/classify","/EntryController","/wx/","/good","/wc"};*/

        // 请求的uri
        String uri = request.getRequestURI();
        
        //图片或者是js则放行
        if(!uri.endsWith(".do")&& !uri.endsWith(".jsp")){
        	//如果请求的资源不是.do和.jsp则直接放行，不验证是否登录
        	filterChain.doFilter(request, response);
        	return;
        }  
        
        //组装redirect的url
        StringBuilder loginPage =new StringBuilder();
        if(request.getServerPort()==80){
     		loginPage.append(request.getScheme()+"://"+request.getServerName()+request.getContextPath());
     	 }else{
     		loginPage.append(request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath());
     	 }
        
        String[] notFilter=null;
        String contextPath=request.getContextPath();
        String frontBaseUrl=contextPath+FRONT_BASE_URL;
        String manageBaseUrl=contextPath+MANAGE_BASE_URL;
        //do jsp等要判断登录
        if(uri.startsWith(frontBaseUrl)){
        	//心理测试
        	notFilter=FRONT_NOT_FILTER;
        }else if(uri.startsWith(manageBaseUrl)){
        	//后台管理
        	notFilter=MANAGE_NOT_FILTER;
        }else{
        	loginPage.append(ERROR_PAGE_URL);
        	renderPage(request,response,loginPage.toString());
        	return;
        }
        boolean doFilter = true;
        for (String s : notFilter) { 
            if (uri.indexOf(s) != -1) {
                doFilter = false;
                break;
            }
        }
        if(!doFilter){
        	//针对特殊资源直接放行，不验证是否登录
        	filterChain.doFilter(request, response);
        	return;
        }

        Object user=null; 
        //公众号测试模式
        if(uri.startsWith(frontBaseUrl)&&FRONT_TEST_MODE){
        	 Object frontTestUser=request.getSession().getAttribute(Constants.currentFrontUserSessionKey);
        	 if(frontTestUser==null){
        		 request.getSession().setAttribute(Constants.currentFrontUserSessionKey,newTestXlVip());
        	 }
        }
        //后台管理测试模式
        if(uri.startsWith(manageBaseUrl)&&MANAGE_TEST_MODE){
	       	 Object manageTestUser=request.getSession().getAttribute(Constants.currentFrontUserSessionKey);
	       	 if(manageTestUser==null){
	       		 request.getSession().setAttribute(Constants.currentAdminUserSessionKey,newTestUser());
	       	 }
        }
        if(uri.startsWith(frontBaseUrl)){
        	//心理测试
        	  user=request.getSession().getAttribute(Constants.currentFrontUserSessionKey);
        	  if(user!=null){
        		  filterChain.doFilter(request, response);
        		  return;
        	  }
        	  loginPage.append(FRONT_LOGIN_URL);
        }else if(uri.startsWith(manageBaseUrl)){
        	//后台管理
        	 user=request.getSession().getAttribute(Constants.currentAdminUserSessionKey);
        	 if(user!=null){
	       		 filterChain.doFilter(request, response);
	       		 return;
       	  	 }
        	 loginPage.append(MANAGE_LOGIN_URL);
        }else{
        	 user=null;
        	 loginPage.append(ERROR_PAGE_URL);
        }
        //如果不存在则表示用户还没有登录。
        if (null == user) {
        	//loginPage = "http://"+request.getServerName()+request.getContextPath()+"/login.jsp"; 
            // 如果session中不存在登录者实体，则弹出框提示重新登录
            // 设置request和response的字符集，防止乱码
        	renderPage(request,response,loginPage.toString());
	    }else{
	    	filterChain.doFilter(request, response);
	    }
 }
    private void renderPage(HttpServletRequest request, HttpServletResponse response,String loginPage) throws IOException{
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        StringBuilder builder = new StringBuilder();  
        builder.append("<!doctype html><html><head><meta charset=\"UTF-8\"><meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\" /><meta http-equiv=\"X-UA-Compatible\" content=\"chrome=1\"/>"); 
        builder.append("<script type=\"text/javascript\">");  
       // builder.append("alert('未登录，请登录后操作！');");  
        builder.append("window.top.location.href='");  
        builder.append(loginPage);  
        builder.append("';");  
        builder.append("</script>");  
        builder.append("</html>");
        out.print(builder.toString());
    }
	private XlVip newTestXlVip(){
		XlVip vip=new XlVip();
		vip.setCity("广州");
		vip.setOpenId(UUID.randomUUID().toString().replace("-",""));
		vip.setProvince("广东");
		vip.setCountry("中国");
		vip.setHeadimgurl("");
		vip.setPrivilege("");
		vip.setUnionid(UUID.randomUUID().toString().replace("-",""));
		vip.setSex(0);
		vip.setNickName("天才小熊猫");
		return vip;
	}
	private User newTestUser(){
		User user=new User();
		user.setUsername("test001");
		user.setPassword("test001");
		return user;
	}
}