<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!--主体-->
<div class='weui-content'>
  <div class="wy-center-top">
    <div class="weui-media-box weui-media-box_appmsg">
      <div class="weui-media-box__hd"><img class="weui-media-box__thumb radius" src="upload/headimg.jpg" alt=""></div>
       <img class="img-circle " src="${basePath}/resource/images/test1.jpg" style="float:left;width:60px;hight:60px" alt="头像"/>
      <div class="weui-media-box__bd">
       <h5 class="weui-media-box__title user-name">飞翔的小土豆</h5>
       
        <p class="user-grade">欢迎回来！</p>
        <!-- <p class="user-integral">待返还金额：<em class="num">500.0</em>元</p> -->
      </div>
    </div>
  </div>
  <div class="weui-panel weui-panel_access">
    <div class="weui-panel__hd">
      <a href="../EntryController/gongzhonghaoIndex.do?tabName=gift" class="weui-cell weui-cell_access center-alloder">
        <div class="weui-cell__bd wy-cell">
          <div ><i class="fa fa-gift fa-2x" aria-hidden="true" style="color:#0ea9d8"></i><span class="weui-media-box__title">&nbsp;赠礼管理</span> </div>
        </div>
        <span class="weui-cell__ft"></span>
      </a>   
    </div>
  </div>
  
  
   <div class="weui-tab">
    <div class="weui-navbar" style="position:relative; top:5px; left:0; right:0; height:44px; background:#fff;">
      <a class="weui-navbar__item proinfo-tab-tit font-14 weui-bar__item--on" href="#tab1">未完成</a>
      <a class="weui-navbar__item proinfo-tab-tit font-14" href="#tab2">已完成</a>
      <a class="weui-navbar__item proinfo-tab-tit font-14" href="#tab3">全部测评</a>
    </div>

    <div class="weui-tab__bd proinfo-tab-con" style="padding-top:0%">
    <div id="tab1" class="weui-tab__bd-item weui-tab__bd-item--active">
    
    <div class="weui-panel weui-panel_access">
    <div class="weui-media-box__bd  pd-10">
    <div class="weui-media-box_appmsg ord-pro-list">
    <div class="weui-media-box__hd"><a href="pro_info.html"><img class="weui-media-box__thumb" src="${basePath}/resource/images/test1.jpg" alt=""></a></div>
    <div class="weui-media-box__bd">
    <h1 class="weui-media-box__desc"><a href="pro_info.html" class="ord-pro-link">蓝之蓝蓝色瓶装经典</a></h1>
    <p class="weui-media-box__desc">类型：<span>情感</span>，<span>23</span></p>
    </div>
    </div>
    </div>
    <div class="weui-panel__ft">
    <div class="weui-cell weui-cell_access weui-cell_link oder-opt-btnbox">
    <a href="../good/qustion.do?goodId=1" class="ords-btn-com">继续测试</a>
    </div>
    </div>
    </div>

      <div class="weui-panel weui-panel_access">
    <div class="weui-media-box__bd  pd-10">
    <div class="weui-media-box_appmsg ord-pro-list">
    <div class="weui-media-box__hd"><a href="pro_info.html"><img class="weui-media-box__thumb" src="${basePath}/resource/images/test1.jpg" alt=""></a></div>
    <div class="weui-media-box__bd">
    <h1 class="weui-media-box__desc"><a href="pro_info.html" class="ord-pro-link">蓝之蓝蓝色瓶装经典</a></h1>
    <p class="weui-media-box__desc">规格：<span>红色</span>，<span>23</span></p>
    </div>
    </div>
    </div>
    <div class="weui-panel__ft">
    <div class="weui-cell weui-cell_access weui-cell_link oder-opt-btnbox">
    <a href="../good/qustion.do?goodId=1" class="ords-btn-com">继续测试</a>
    </div>
    </div>
    </div>

      <div class="weui-panel weui-panel_access">
    <div class="weui-media-box__bd  pd-10">
    <div class="weui-media-box_appmsg ord-pro-list">
    <div class="weui-media-box__hd"><a href="pro_info.html"><img class="weui-media-box__thumb" src="${basePath}/resource/images/test1.jpg" alt=""></a></div>
    <div class="weui-media-box__bd">
    <h1 class="weui-media-box__desc"><a href="javascript:void(0)" class="ord-pro-link">蓝之蓝蓝色瓶装经典</a></h1>
    <p class="weui-media-box__desc">规格：<span>红色</span>，<span>23</span></p>
    </div>
    </div>
    </div>
    <div class="weui-panel__ft">
    <div class="weui-cell weui-cell_access weui-cell_link oder-opt-btnbox">
    <a href="../good/question.do?goodId=1" class="ords-btn-com">继续测试</a>
    </div>
    </div>
    </div>




    </div>
    <div id="tab2" class="weui-tab__bd-item">
    
    <div class="weui-panel weui-panel_access">
    <div class="weui-panel__hd"><span>单号：2132165457654545</span></div>
    <div class="weui-media-box__bd  pd-10">
    <div class="weui-media-box_appmsg ord-pro-list">
    <div class="weui-media-box__hd"><a href="pro_info.html"><img class="weui-media-box__thumb" src="${basePath}/resource/images/test1.jpg" alt=""></a></div>
    <div class="weui-media-box__bd">
    <h1 class="weui-media-box__desc"><a href="pro_info.html" class="ord-pro-link">蓝之蓝蓝色瓶装</a></h1>
    <p class="weui-media-box__desc">类型：<span>职场</span>，<span>23</span></p>
    <div class="clear mg-t-10">
   <!--  <div class="wy-pro-pri fl">¥<em class="num font-15">296.00</em></div>
    <div class="pro-amount fr"><span class="font-13">数量×<em class="name">1</em></span></div> 
    </div>-->
    </div>
    </div>
    </div>
    <div class="ord-statistics">
    <span class="wy-pro-pri">金额：¥<em class="num font-15">12.00</em></span> 
   </div>
    <div class="weui-panel__ft">
    <div class="weui-cell weui-cell_access weui-cell_link oder-opt-btnbox">
    <a href="javascript:;" class="ords-btn-dele">评价</a><a href="order_info2.html" class="ords-btn-com">查看报告</a>
    </div>
    </div>
    </div>
    </div>
    
    <div id="tab3" class="weui-tab__bd-item">
    <div class="weui-panel weui-panel_access">
    <div class="weui-panel__hd"><span>单号：2132165457654545</span><span class="ord-status-txt-ts fr">待发货</span></div>
    <div class="weui-media-box__bd  pd-10">
    <div class="weui-media-box_appmsg ord-pro-list">
    <div class="weui-media-box__hd"><a href="pro_info.html"><img class="weui-media-box__thumb" src="upload/pro3.jpg" alt=""></a></div>
    <div class="weui-media-box__bd">
    <h1 class="weui-media-box__desc"><a href="pro_info.html" class="ord-pro-link">蓝之蓝蓝色瓶装经典Q7浓香型白酒500ml52度高端纯粮食酒2瓶装包邮</a></h1>
    <p class="weui-media-box__desc">规格：<span>红色</span>，<span>23</span></p>
    <div class="clear mg-t-10">
    <div class="wy-pro-pri fl">¥<em class="num font-15">296.00</em></div>
    <div class="pro-amount fr"><span class="font-13">数量×<em class="name">1</em></span></div>
    </div>
    </div>
    </div>
    </div>
    <div class="ord-statistics">
    <span>共<em class="num">1</em>件商品，</span>
    <span class="wy-pro-pri">总金额：¥<em class="num font-15">296.00</em></span>
    <span>(含运费<b>￥0.00</b>)</span>
    </div>
    <div class="weui-panel__ft">
    <div class="weui-cell weui-cell_access weui-cell_link oder-opt-btnbox">
    商品正在打包中，请您耐心等待....
    </div>
    </div>
    </div>
    </div>


    </div>
  </div> 
 </div>
</div>    
