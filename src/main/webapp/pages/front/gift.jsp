<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<script src="${basePath}/require/js/require.js" data-main="${basePath}/resource/js/gift.js"></script>

<header class="wy-header" style="position:fixed; top:0; left:0; right:0; z-index:200;">
  <div class="wy-header-icon-back"><span></span></div>
  <div class="wy-header-title">赠礼管理</div>
</header>
<div class='weui-content'>
  <div class="weui-tab">
    <div class="weui-navbar" style="position:fixed; top:44px; left:0; right:0; height:44px; background:#fff;">
      <a class="weui-navbar__item proinfo-tab-tit font-14 weui-bar__item--on" href="#tab1">我送出的</a>
      <a class="weui-navbar__item proinfo-tab-tit font-14" href="#tab2">我收到的</a>
    </div>
    <div class="weui-tab__bd proinfo-tab-con" style="padding-top:87px;">
      <div id="tab1" class="weui-tab__bd-item weui-tab__bd-item--active">

        <div class="weui-panel jyjl">
          <div class="weui-panel__hd">购买商品总金额：￥<em class="num">${orderSendTotalMoney}</em></div>
          <c:forEach var="orderSend" items="${orderSendList}">
      		<div class="weui-panel__bd">
            <div class="weui-media-box weui-media-box_text">
            <div class="swiper-slide"><a href="pro_info.html"><img class="pictureStyle" src="../pages/front/upload/jingxuan1.jpg" /></a><span class="titlefontsize">${orderSend.good.tittle}</span></div>
              <h4 class="weui-media-box__title">-￥<em class="num">${orderSend.money}</em></h4>
              <p class="weui-media-box__desc">订单号：${orderSend.orderNo}</p>
              <ul class="weui-media-box__info ">
                <li class="weui-media-box__info__meta">交易时间：<em class="num">${orderSend.time}</em></li>
              </ul>
             
              <table style="border:0;" class="weui-media-box__desc" >
            		<tr>
            			<td style="width:50%">领取编号</td>
            			<td style="width:32%">领取人</td>
            			<td>赠送状态</td>
            		</tr>
            		<c:forEach var="orderSendDetail" items="${orderSend.getOrderSend()}"  varStatus="status">
	             		<tr>
	             			<td>${status.count}</td>
	             			<td>${!(empty orderSendDetail.getVip().nickName)? orderSendDetail.getVip().nickName:"匿名"}</td>
	             			<td>已赠送</td>
	             		</tr>
             		</c:forEach>
             </table>
            </div>
          </div>
      	</c:forEach>    
        </div>        
      </div>
      <div id="tab2" class="weui-tab__bd-item">
        <div class="weui-panel jyjl">
          <div class="weui-panel__hd">收到总金额：+￥<em class="num">${orderReceiveTotalMoney}</em></div>
          <c:forEach var="orderReceive" items="${orderReceiveList}">
	          	<div class="weui-panel__bd">
		            <div class="weui-media-box weui-media-box_text">
			            <div class="swiper-slide"><a href="pro_info.html"><img class="pictureStyle" src="../pages/front/upload/jingxuan1.jpg" /></a><span class="titlefontsize">人格分裂测试</span></div>
		              	<h4 class="weui-media-box__title">-￥<em class="num">${orderReceive.money}</em></h4>
		              	<p class="weui-media-box__desc">订单号：${orderReceive.orderNo}</p>
		              	<p class="weui-media-box__desc">赠送人：${!(empty orderReceive.getVip().nickName)? orderReceive.getVip().nickName:"匿名"}</p>
		              	<ul class="weui-media-box__info ">
		                	<li class="weui-media-box__info__meta">交易时间：<em class="num">${orderReceive.time}</em></li>
		              	</ul>
		            </div>
	            </div>
          </c:forEach>

      </div>
    </div>
  </div>
</div>
</div>

