<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/pages/front/common.jsp" %>
<html>
<head>
    <title>微信支付</title>
</head>
<body>
<script type="text/javascript">
    var pathContext = "<%=basePath%>";
</script>
<script src="${basePath}/require/js/require.js" data-main="${basePath}/resource/js/pay.js"></script>

<!--主体-->
<header class="wy-header">
  <div class="wy-header-icon-back"><span></span></div>
  <div class="wy-header-title">微信支付</div>
</header>

<div class="weui-content">

  <div class="wy-media-box weui-media-box_text">
    <div class="weui-media-box__bd">
     <div class="weui-media-box_appmsg ord-pro-list">
        <div class="weui-media-box__hd"><a href="pro_info.html"><img class="weui-media-box__thumb" src="${basePath}/pages/front/images/${good.pictureName}"  alt=""></a></div>
        <div class="weui-media-box__bd">
          <h1 class="weui-media-box__desc"><a href="javascript:void(0)" class="ord-pro-link">${good.tittle }</a></h1>
          <p class="weui-media-box__desc">类型：<span>${good.typeName}</span>
          <div class="clear mg-t-10">
            <div class="wy-pro-pri fl">¥<em class="num font-15">${good.price}</em></div>
            <div class="pro-amount fr"><div id="spinner-amount" class="Spinner"></div></div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="weui-panel">
    <div class="weui-panel__bd">
      
  <div class="wy-media-box weui-media-box_text">
<!--     <div class="mg10-0 t-c">总金额：<span class="wy-pro-pri mg-tb-5">¥<em class="num font-20">296.00</em></span></div>-->    
<div class="mg10-0"><a href="shopcart.html" onclick="wxpayApi.placeOrder('123')" class="weui-btn weui-btn_primary">微信付款</a></div>
  </div>
</div>
</div>
</div>

</body>
</html>
