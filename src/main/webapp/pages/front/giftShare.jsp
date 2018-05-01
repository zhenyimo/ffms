<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/pages/front/common.jsp"%>
<script type="text/javascript">
    var pathContext = "<%=basePath%>";
</script>
<script src="${basePath}/require/js/require.js"
	data-main="${basePath}/resource/js/giftShare.js?v=1.5"></script>

<!--主体-->
<header class="wy-header">
	<div class="wy-header-icon-back">
		<span></span>
	</div>
	<div class="wy-header-title">赠送页面</div>
</header>
<input id="shareUrl" type="hidden" value="${shareUrl}" />
<div class="weui_msg">
	<div class="wy-media-box weui-media-box_text">
		<div class="weui-media-box__bd">
			<div class="weui-media-box_appmsg ord-pro-list">
				<div class="weui-media-box__hd">
					<a href="#"><img id="goodImage" class="weui-media-box__thumb"
						src="${basePath}/pages/front/images/${good.pictureName}" alt=""></a>
				</div>
				<div class="weui-media-box__bd">
					<h1 class="weui-media-box__desc">
						<a id="goodTitle" href="javascript:void(0)" class="ord-pro-link">${good.tittle }</a>
					</h1>
					<p class="weui-media-box__desc">
						类型：<span>${good.typeName}</span>
					</p>
				</div>
			</div>
		</div>
	</div>
	<div class="weui_opr_area">
		<p class="weui_btn_area">
			<!--<a href="#" onclick="javascript:giftShareApi.onMenuShareAppMessage();" class="weui_btn weui_btn_primary">发送给朋友</a>  -->
			<a href="#" onclick="javascript:giftShareApi.returnIndex();" class="weui_btn weui_btn_primary">返回心理测试主页</a>
		</p>
	</div>
</div>

</body>
</html>
