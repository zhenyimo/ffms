<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/10/26
  Time: 11:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/pages/front/common.jsp" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
	<script>
		function jump(){
			window.location.href=pathContext+"/front/index.do?tabName=mine"
		}
		setInterval(jump(),5000);
	</script>
    <div class="weui_msg">
	    <div class="weui_icon_area"><i class="weui_icon_success weui_icon_msg"></i></div>
	    <div class="weui_text_area">
	        <h2 class="weui_msg_title">支付成功！</h2>
	        <p class="weui_msg_desc">5秒后自动跳转到我的测评，若不能跳转请手动点击下面按钮</p>
	    </div>
	    <div class="weui_opr_area">
	        <p class="weui_btn_area">
	            <a href="javascript:jump();" class="weui_btn weui_btn_primary">我的测评</a>
	        </p>
	    </div>
	    <div class="weui_extra_area">
	        <a href="">查看详情</a>
	    </div>
	</div>	
</body>
</html>
