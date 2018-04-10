<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="${basePath}/pages/front/css/common.css">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style type="text/css">
*{margin:0;padding:0;list-style-type:none;}
a,img{border:0;}
body{font:12px/180% Arial, Helvetica, sans-serif, "宋体";}
/* suspend */
.suspend{width:60px;height:60px;position:fixed;top:65%;right:0;overflow:hidden;z-index:9999;}
.suspend dl{width:60px;height:35px;border-radius:15px 0px 0px 15px;background:#e2d212;position:absolute;top:0;left:0;cursor:pointer;}
</style>
<script src="${basePath}/require/js/require.js" data-main="${basePath}/resource/js/good.js"></script>
<!--顶部搜索-->
<header class='weui-header'>
  <div class="weui-search-bar" id="searchBar">
    <form class="weui-search-bar__form">
      <div class="weui-search-bar__box">
        <i class="weui-icon-search"></i>
        <input type="search" class="weui-search-bar__input" id="searchInput" placeholder="搜索您想要的心理测评" required>
        <a href="javascript:" class="weui-icon-clear" id="searchClear"></a>
      </div>
      <label class="weui-search-bar__label" id="searchText" style="transform-origin: 0px 0px 0px; opacity: 1; transform: scale(1, 1);">
        <i class="weui-icon-search"></i>
        <span>搜索您想要的心理测评</span>
      </label>
    </form>
    <a href="javascript:" class="weui-search-bar__cancel-btn" id="searchCancel">取消</a>
  </div>
</header>
<!--主体-->
<div class='weui-content'>
 <div class="weui-panel weui-panel_access">
  <div class="weui-panel__bd">
  <img style="height:250px;width:100%" src="${basePath}/pages/front/images/${good.pictureName}"  style="width:100%;height:250px"/>
  </div>
</div>
  </div>
  
  
  
  
  <div class="weui-panel weui-panel_access" style="text-align:center;">
  <div class="weui-panel__bd">      
      <div class="weui-media-box__bd" >
        <h4 class="weui-media-box__title" style="font-weight:bold;font-size:1.7em" >${good.tittle}</h4>
        <p class="weui-media-box__desc">${good.description}</p><br>
        <a href="${basePath}/front/good/question.do?goodId=${good.id}"  class="weui-btn weui-btn_primary" style="width:50%">开始测试</a>    
        <div class="weui-form-preview__bd">
    <div class="weui-form-preview__item" >
      <label class="weui-form-preview__label" style="float:left">●50个精选题目</label>
       <label class="weui-form-preview__label" style="position: absolute;left:35%">●6页专业报告</label>
     <label class="weui-form-preview__label" style="float:right">●${good.paysuccessNumber}人测试过</label>
    </div>
    </div>
    </div>
  </div>
</div>


<div class="weui-panel weui-panel_access" >
  <div class="weui-panel__bd">      
      <div class="weui-media-box__bd" >
        <h4 class="weui-media-box__title" style="font-weight:bold;font-size:1.4em;text-align:center;" >测评介绍</h4>
        <p style="text-indent:2em;">
绝对没有。每一种配对都有利有弊。比如，两个“探险者”结合。他们不会争论怎么炒鸡肉，却容易沉迷不拔、鲁莽轻率或玩弄感情。其实我们每个人都是这4种人格类型的混合体，往往是次人格决定我们是谁，我们怎么去爱。对于大多数“探险者”来说，道德是可以变通的，但“探险者-建设者”很可能有更固定的道德观，并且寻找跟他们有着相同责任感的人为伴侣。
       </p>  
    </div>
    
       <div class="weui-media-box__bd"  >
        <h4 class="weui-media-box__title" style="font-weight:bold;font-size:1.4em;text-align:center;" >测评须知</h4>
        <p style="text-indent:2em;">
        1:绝对没有。每一种配对都有利有弊。比如，两个“探险者”结合。他们不会争论怎么炒鸡肉，却容易沉迷不拔、鲁莽轻率或玩弄感
       </p>
       <p style="text-indent:2em;">
        2:绝对没有。每一种配对都有利有弊。比如，两个“探险者”结合。他们不会争论怎么炒鸡肉，却容易沉迷不拔、鲁莽轻率或玩弄感
       </p>  
       <p style="text-indent:2em;">
        3:绝对没有。每一种配对都有利有弊。比如，两个“探险者”结合。他们不会争论怎么炒鸡肉，却容易沉迷不拔、鲁莽轻率或玩弄感
       </p>
    </div>
    
  </div>
</div>
  
  
 <div class="suspend">
	<dl>
		<dt class="IE6PNG" style="color:red;padding-top:16%;padding-left:10%">赠送他人</dt>
		<dd class="suspendTel"><a href="javascript:void(0);" onclick="GoodApi.hideGift()" class="weui-tabbar__item  open-popup" data-target="#selcet_sku" ></a></dd>
	</dl>
<!-- 	<a href="javascript:void(0);"  class="weui-tabbar__item  open-popup" >赠送他人</a>
 -->	
       </div>

<div id="selcet_sku" class='weui-popup__container popup-bottom' style="z-index:600;">
  <div class="weui-popup__overlay" style="opacity:1;"></div>
  <div class="weui-popup__modal" >
    <div class="toolbar">
      <div class="toolbar-inner" >
<!--         <a href="javascript:;" class=" close-popup">关闭</a>-->   
    <h4 >赠送数量</h4> 
      </div>
    </div>
    <div class="modal-content">
      <div class="weui-msg" style="padding-top:0;">
        <div class="wy-media-box2 weui-media-box_text" style="margin:0;">
          <div class="weui-media-box_appmsg">
            <div class="weui-media-box__hd proinfo-txt-l"><span class="promotion-label-tit"></span></div>
            <div class="weui-media-box__bd">
              <div class="promotion-sku clear">
                <ul class="gift_box_ul">
                   <c:forEach var="num" items="${linarizeGiftNumArray}">
         			  <li><a href="javascript:;">${num}</a></li>
                   </c:forEach>
                  <!-- <li><a href="javascript:;">1</a></li>
                  <li><a href="javascript:;">2</a></li>
                  <li><a href="javascript:;">3</a></li>
                  <li><a href="javascript:;">5</a></li>
                  <li><a href="javascript:;">10</a></li>
                  <li><a href="javascript:;">15</a></li>
                  <li><a href="javascript:;">20</a></li> -->
                </ul>
              </div>
            </div>
          </div>
         
        </div>
        
          
            <div class="weui-cell__ft">
              <div class="weui-count">
                <a class="weui-count__btn weui-count__decrease"></a>
                <input id="count__number" class="weui-count__number" type="number" value="1" />
                <a class="weui-count__btn weui-count__increase"></a>
              </div>
            </div><hr>
        
        <div class="weui-msg__opr-area">
          <p class="weui-btn-area">
            <a href="javascript:;" onclick="GoodApi.payGood(${good.id})" class="weui-btn weui-btn_primary">立即购买</a>
            <a href="javascript:;" onclick="GoodApi.initTimer()" class="weui-btn weui-btn_default close-popup">不，我再看看</a>
          </p>
        </div>
      </div>
    </div>
  </div>
</div>



  
    <div class="weui-footer">
  <p class="weui-footer__links">
  <a href="javascript:void(0);" class="weui-footer__link">底部链接</a>
  </p>
  <p class="weui-footer__text">Copyright © 2008-2016 weui.io</p>
  </div>
  
  
  





<!--   <script type="text/javascript">       

$(document).ready(function(){
	initTimer();	 
	
});

//初始化定时器
function initTimer(){
	$(".suspend").animate({width: 30}, 400);
	   timer1=setInterval( " giftOut() " , 3000 );
	   timer2=setInterval( " giftIn() " , 6000 );
}
function giftOut(){
$(".suspend").stop();
 $(".suspend").animate({width: 60}, 200);  
}

function giftIn(){
$(".suspend").stop();
$(".suspend").animate({width: 30}, 400);
}
//隐藏礼物控件
function hideGift(){
	$(".suspend").stop();
	$(".suspend").animate({width: 0}, 400);
	window.clearInterval(timer1);
	window.clearInterval(timer2);
}
</script>
  
  



<script>
$(function(){
	$(".promotion-sku li").click(function(){
		$(this).addClass("active").siblings("li").removeClass("active");
		});
	});
</script>
 -->


  
  
 
