package com.finance.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
/**
 * 添加测评的Controller层
 * @author zhongzh
 *
 */
@Controller
public class TestController {

    //@Resource
    //private 
    
    /*添加测评
     * 
     * 
     * 
     * */
    //@RequestMapping("/addTest.do") 
    @RequestMapping("/addXlQuestion.do")
	//public String addTitle() {
    public String addXlQuestion() {
		//return "admin/addTest";
    	return "admin/addXlQuestion";
	}
	
}
