package com.finance.filter;

import java.io.IOException;

import java.io.PrintWriter;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.filter.OncePerRequestFilter;

import com.finance.entity.User;
import com.finance.util.Constants;

public class SessionFilter extends OncePerRequestFilter {
   
    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain)
            throws ServletException, IOException {
        // 不过滤的uri
        String[] notFilter = new String[] { "/sign.do","/index.do","/gosign.do","/login.do","/gongzhonghaoIndex.do","/wx/","goodList.do"};
        // 请求的uri
        String uri = request.getRequestURI();
        
        if(uri.indexOf(".do") == -1 && uri.indexOf(".jsp") == -1 ){
        	//如果请求的资源不是.htm和.jsp则直接放行，不验证是否登录
        	filterChain.doFilter(request, response);
        	return;
        }     
        boolean doFilter = true;
        for (String s : notFilter) { 
            if (uri.indexOf(s) != -1) {
                 doFilter = false;
                break;
            }
        }
        if(doFilter==false){
        	//针对特殊资源直接放行，不验证是否登录
        	filterChain.doFilter(request, response);
        	return;
        }
        User user=(User)request.getSession().getAttribute(Constants.currentUserSessionKey);
        String loginPage ="";
        if (null == user) {
        	if(request.getServerPort()==80){
        		loginPage=request.getScheme()+"://"+request.getServerName()+request.getContextPath()+"/index.do";
        	}else{
        		loginPage=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/index.do";
        	}
        	//loginPage = "http://"+request.getServerName()+request.getContextPath()+"/login.jsp"; 
            // 如果session中不存在登录者实体，则弹出框提示重新登录
            // 设置request和response的字符集，防止乱码
            request.setCharacterEncoding("UTF-8");
            response.setCharacterEncoding("UTF-8");
            PrintWriter out = response.getWriter();
            StringBuilder builder = new StringBuilder();  
            builder.append("<!doctype html><html><head><meta charset=\"UTF-8\"><meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\" /><meta http-equiv=\"X-UA-Compatible\" content=\"chrome=1\"/>"); 
            builder.append("<script type=\"text/javascript\">");  
            builder.append("alert('未登录，请登录后操作！');");  
            builder.append("window.top.location.href='");  
            builder.append(loginPage);  
            builder.append("';");  
            builder.append("</script>");  
            builder.append("</html>");
            out.print(builder.toString());
    }else{
    	filterChain.doFilter(request, response);
    }
 }
}