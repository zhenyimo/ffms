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
<html>
<head>
    <title>微信支付</title>
</head>
<body>
<script type="text/javascript">
    var pathContext = "<%=basePath%>";
</script>
<script src="${basePath}/require/js/require.js" data-main="${basePath}/resource/js/pay.js?v=1.2"></script>
<button onclick="wxpayApi.placeOrder('123')">微信支付</button>

</body>
</html>