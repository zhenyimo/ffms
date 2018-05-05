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
<div class="weui-form-preview">
  <div class="weui-cells">
  <div class="weui-cell">
    <div class="weui-cell__hd"><img style="width:65px;margin-right:5px;display:block" src="${basePath}/pages/front/images/${good.pictureName}"></div>
    <div class="weui-cell__bd">
      <p style="margin: 0 0 5px;">${good.tittle}</p>
    </div>
  </div>
</div>
<input id="copyUrlInput" type="text" style="display:none" value="" />
<div class="weui-btn-area">
	<a href="#" id="copyUrl" class="copyBtn weui-btn weui-btn_primary" data-clipboard-target="#copyUrlInput" data-clipboard-action="copy">复制链接</a>
	<a href="#" onclick="javascript:giftShareApi.returnIndex();" class="weui-btn weui-btn_primary">返回主页</a>
</div>
</div>
</body>
</html>
