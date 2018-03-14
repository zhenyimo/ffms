<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath ="";
	if(request.getServerPort()==80){
		basePath=request.getScheme()+"://"+request.getServerName()+path;
	}else{
		basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
	}
	pageContext.setAttribute("basePath", basePath);
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html style="font-size: 48.7px">
<head>
<title>心理测试首页</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
<meta name="description" content="Write an awesome description for your new site here. You can edit this line in _config.yml. It will appear in your document head meta (for Google search results) and in your feed.xml site description.
">
<!--定义全局变量path-->
<script type="text/javascript">
    var pathContext = "<%=basePath%>";
</script>
<link rel="stylesheet" href="${basePath}/pages/front/lib/weui.min.css">
<link rel="stylesheet" href="${basePath}/pages/front/css/jquery-weui.css">
<link rel="stylesheet" href="${basePath}/pages/front/css/style.css">
<link rel="stylesheet" href="${basePath}/pages/front/css/front.css">
<link rel="stylesheet" href="${basePath}/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="${basePath}/bootstrap/css/font-awesome.css">

<script src="${basePath}/pages/front/lib/jquery-2.1.4.js"></script> 
<script src="${basePath}/pages/front/lib/fastclick.js"></script> 
<script src="${basePath}/pages/front/js/jquery-weui.js"></script>
<script src="${basePath}/pages/front/js/swiper.js"></script>
<script src="${basePath}/bootstrap/js/bootstrap.min.js"></script>


<%
	String[] scripts=request.getParameterValues("jsPath");
	if(scripts!=null&&scripts.length>0){
		for(int i=0;i<scripts.length;i++){
			out.println("<script src='"+basePath+scripts[i]+"'></script>");
		}
	}
	String[] csss=request.getParameterValues("cssPath");
	if(csss!=null&&csss.length>0){
		for(int i=0;i<csss.length;i++){
			out.println("<link rel='stylesheet' href='"+basePath+csss[i]+"'>");
		}
	}
	
	
%>

</head>
