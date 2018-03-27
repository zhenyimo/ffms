<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<jsp:include page="/pages/front/head.jsp">
<jsp:param value="/resource/css/subIndex.css" name="cssPath"/>
</jsp:include>

<!--商品详情页-->
<%@ include file="/pages/front/good.jsp" %>


	
<%@ include file="/pages/front/tail.jsp" %>

<!-- <script>
  $(function() {
    FastClick.attach(document.body);
  });
</script> -->
