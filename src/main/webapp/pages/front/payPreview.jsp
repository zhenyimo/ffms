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
<script src="${basePath}/require/js/require.js" data-main="${basePath}/resource/js/pay.js?v=1.5"></script>

<!--主体-->
<header class="wy-header">
  <div class="wy-header-icon-back"><span></span></div>
  <div class="wy-header-title">订单预览</div>
</header>
<!-- 微信jssdk的权限初始化 -->
<input id="jsApiListInit" type="hidden" value="${jsApiListInit}"/> 
<!-- 支付完成的跳转url -->
<input id="redirectUrl" type="hidden" value="${redirectUrl}"/>
<!-- 付款预览 -->
<div class="weui-form-preview">
  <div class="weui-cells">
  <div class="weui-cell">
    <div class="weui-cell__hd"><img style="width:65px;margin-right:5px;display:block" src="${basePath}/pages/front/images/${good.pictureName}"></div>
    <div class="weui-cell__bd">
      <p style="margin: 0 0 5px;">${good.tittle}</p>
       <p style="margin: 0 0 5px;">¥${good.price}</p>
    </div>
    <div class="weui-cell__ft">x${goodNum}</div>
   
  </div>
  <div class="weui-cell">
    <div class="weui-cell__bd">总价：</div>
    <div class="weui-cell__ft" style="text-align:right">¥${payTotalMoney}</div>  
  </div>
</div>
  <div class="weui-btn-area">
  	<a href="javascript:wxpayApi.placeOrder('${orderNo}');" class="weui-btn weui-btn_primary">确认支付</a>
    <a href="javascript:wxpayApi.cancelPlaceOrder('${orderNo}');" class="weui-btn weui-btn_warn">取消订单</a>
  </div>
</div>


<%-- <div class="weui-content">
  <input id="afterPayRedirectUrl" type="hidden" value="${redirectUrl}"/>
  <div class="wy-media-box weui-media-box_text">
    <div class="weui-media-box__bd">
     <div class="weui-media-box_appmsg ord-pro-list">
        <div class="weui-media-box__hd"><a href="#"><img class="weui-media-box__thumb" src="${basePath}/pages/front/images/${good.pictureName}"  alt=""></a></div>
        <div class="weui-media-box__bd">
          <h1 class="weui-media-box__desc"><a href="javascript:void(0)" class="ord-pro-link">${good.tittle }</a></h1>
          <p class="weui-media-box__desc">类型：<span>${good.typeName}</span></p>
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
<div class="mg10-0"><a href="#" onclick="wxpayApi.placeOrder('${orderNo}')" class="weui-btn weui-btn_primary">微信付款</a></div>
  </div>
</div>
</div>
</div> --%>

</body>
</html>
