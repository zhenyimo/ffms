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

<c:choose>
    <c:when test="${tab!=null&&tab.equals('index')}">
      	<!--用户个人管理-->
    </c:when>
    <c:when test="${tab!=null&&tab.equals('index')}">
    		<!--分类-->
    </c:when>
    <c:otherwise>
    		<!--默认是主页的子页面-->
      		<%@ include file="/pages/front/subIndex.jsp" %>
    </c:otherwise>
</c:choose>


	
<%@ include file="/pages/front/tail.jsp" %>