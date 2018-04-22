package com.finance.exception;
 
import java.io.IOException;
import java.net.ConnectException;
import java.net.SocketTimeoutException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

import com.finance.controller.gongzhonghao.EntryController;

/**
 * 
 * @ClassName: ExceptionHandler
 * @Description: 统一异常处理 ， 注意这里可以处理Controller层抛出的异常，但不处理Controller捕获的异常(Controller捕获的异常，这里不再处理)
 * @author mickkong
 * 
 */
public class ExceptionHandler implements HandlerExceptionResolver {
	private Logger logger=LoggerFactory.getLogger(ExceptionHandler.class);
    
    public ModelAndView resolveException(HttpServletRequest request,
        HttpServletResponse response, Object handler, Exception ex) {    	
	    if (ex instanceof NumberFormatException) {
	        return new ModelAndView("exception/number");
	    }else if (ex instanceof NullPointerException) {
	    	ex.printStackTrace();
  	        return new ModelAndView("exception/null");
	    }else if (ex instanceof SocketTimeoutException || ex instanceof ConnectException) {
	        try {
	        	response.getWriter().write("网络异常");
	        } catch (IOException e) {
	        	e.printStackTrace();
	        }
	        return new ModelAndView("exception/net_error");
	    }     
    	//ModelAndView mv=new ModelAndView("redirect:/page-front/errors.jsp");
    	//request.getSession().setAttribute("errorTips", ex.getMessage());
    	//request.getSession().setAttribute("ex",ex.fillInStackTrace());
    	ModelAndView mv=new ModelAndView("redirect:/page-front/errors.html");
    	ex.printStackTrace();
   		return mv; 	
     }
 
}