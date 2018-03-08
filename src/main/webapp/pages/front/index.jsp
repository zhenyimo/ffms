<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>心理测试首页</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
<meta name="description" content="Write an awesome description for your new site here. You can edit this line in _config.yml. It will appear in your document head meta (for Google search results) and in your feed.xml site description.
">
<link rel="stylesheet" href="../pages/front/lib/weui.min.css">
<link rel="stylesheet" href="../pages/front/css/jquery-weui.css">
<link rel="stylesheet" href="../pages/front/css/style.css">
</head>
<body ontouchstart>
<!--顶部搜索-->
<header class='weui-header'>
  <div class="weui-search-bar" id="searchBar">
    <form class="weui-search-bar__form">
      <div class="weui-search-bar__box">
        <i class="weui-icon-search"></i>
        <input type="search" class="weui-search-bar__input" id="searchInput" placeholder="搜索您想要的商品" required>
        <a href="javascript:" class="weui-icon-clear" id="searchClear"></a>
      </div>
      <label class="weui-search-bar__label" id="searchText" style="transform-origin: 0px 0px 0px; opacity: 1; transform: scale(1, 1);">
        <i class="weui-icon-search"></i>
        <span>搜索您想要的心理测试题</span>
      </label>
    </form>
    <a href="javascript:" class="weui-search-bar__cancel-btn" id="searchCancel">取消</a>
  </div>
</header>
<!--主体-->
<div class='weui-content'>
  <!--顶部轮播-->
  <div class="swiper-container swiper-banner">
    <div class="swiper-wrapper">
      <div class="swiper-slide"><a href="pro_info.html"><img src="../pages/front/upload/ban1.jpg" /></a></div>
      <div class="swiper-slide"><a href="pro_list.html"><img src="../pages/front/upload/ban2.jpg" /></a></div>
      <div class="swiper-slide"><a href="pro_info.html"><img src="../pages/front/upload/ban3.jpg" /></a></div>
      <div class="swiper-slide"><a href="pro_list.html"><img src="../pages/front/upload/ban4.jpg" /></a></div>
    </div>
    <div class="swiper-pagination"></div>
  </div>
  <!--图标分类-->
  <!-- <div class="weui-flex wy-iconlist-box">
    <div class="weui-flex__item"><a href="pro_list.html" class="wy-links-iconlist"><div class="img"><img src="../pages/front/images/icon-link1.png"></div><p>精选推荐</p></a></div>
    <div class="weui-flex__item"><a href="pro_list.html" class="wy-links-iconlist"><div class="img"><img src="../pages/front/images/icon-link2.png"></div><p>酒水专场</p></a></div>
    <div class="weui-flex__item"><a href="all_orders.html" class="wy-links-iconlist"><div class="img"><img src="../pages/front/images/icon-link3.png"></div><p>订单管理</p></a></div>
    <div class="weui-flex__item"><a href="Settled_in.html" class="wy-links-iconlist"><div class="img"><img src="../pages/front/images/icon-link4.png"></div><p>商家入驻</p></a></div>
  </div> -->
  <!--新闻切换-->
  <div class="wy-ind-news">
    <i class="news-icon-laba"></i>
    <div class="swiper-container swiper-news">
      <div class="swiper-wrapper">
        <div class="swiper-slide"><a href="news_info.html">热烈祝贺伟义商城成功热烈祝贺伟义商城成功上线热烈祝贺伟义商城成功上线上线</a></div>
        <div class="swiper-slide"><a href="news_info.html">蓝之蓝股份成公司上市</a></div>
      </div>
      <div class="swiper-pagination"></div>
    </div>
    <a href="news_list.html" class="newsmore"><i class="news-icon-more"></i></a>
  </div>
  <!--精选推荐-->
  <div class="wy-Module">
    <div class="wy-Module-tit"><span>爆款推荐</span></div>
    <div class="wy-Module-con">
      <div class="swiper-container swiper-jingxuan" style="padding-top:34px;">
        <div class="swiper-wrapper">
          <div class="swiper-slide"><a href="pro_info.html"><img src="../pages/front/upload/jingxuan1.jpg" /></a></div>
          <div class="swiper-slide"><a href="pro_info.html"><img src="../pages/front/upload/jingxuan2.jpg" /></a></div>
          <div class="swiper-slide"><a href="pro_info.html"><img src="../pages/front/upload/jingxuan3.jpg" /></a></div>
          <div class="swiper-slide"><a href="pro_info.html"><img src="../pages/front/upload/jingxuan4.jpg" /></a></div>
          <div class="swiper-slide"><a href="pro_info.html"><img src="../pages/front/upload/jingxuan5.jpg" /></a></div>
          <div class="swiper-slide"><a href="pro_info.html"><img src="../pages/front/upload/jingxuan1.jpg" /></a></div>
        </div>
        <div class="swiper-pagination jingxuan-pagination"></div>
      </div>
    </div>
  </div>
  <!--酒水专场-->
 <div class="wy-Module">
    <div class="wy-Module-tit"><span>新品发布</span></div>
    <div class="wy-Module-con">
      <div class="swiper-container swiper-jingxuan" style="padding-top:34px;">
        <div class="swiper-wrapper">
          <div class="swiper-slide"><a href="pro_info.html"><img src="../pages/front/upload/jingxuan1.jpg" /></a></div>
          <div class="swiper-slide"><a href="pro_info.html"><img src="../pages/front/upload/jingxuan2.jpg" /></a></div>
          <div class="swiper-slide"><a href="pro_info.html"><img src="../pages/front/upload/jingxuan3.jpg" /></a></div>
          <div class="swiper-slide"><a href="pro_info.html"><img src="../pages/front/upload/jingxuan4.jpg" /></a></div>
          <div class="swiper-slide"><a href="pro_info.html"><img src="../pages/front/upload/jingxuan5.jpg" /></a></div>
          <div class="swiper-slide"><a href="pro_info.html"><img src="../pages/front/upload/jingxuan1.jpg" /></a></div>
        </div>
        <div class="swiper-pagination jingxuan-pagination"></div>
      </div>
    </div>
  </div>
  <!--猜你喜欢-->
  <div class="wy-Module">
    <div class="wy-Module-tit-line"><span>精选评测</span></div>
    <div class="wy-Module-con">
     <div class="weui-panel weui-panel_access">
    <div class="weui-panel__hd"><span>精彩评测</span></div>
    
    <div class="weui-panel__bd">
      <div class="weui-media-box_appmsg pd-10">

        <div class="weui-media-box__hd"><a href="pro_info.html"><img class="weui-media-box__thumb" src="../pages/front/upload/pro3.jpg" alt=""></a></div>
        <div class="weui-media-box__bd">
          <h1 class="weui-media-box__desc"><a href="pro_info.html" class="ord-pro-link">蓝之蓝蓝色瓶装经典Q7浓香型白酒500ml52度高端纯粮食酒2瓶装包邮</a></h1>
          <p class="weui-media-box__desc">规格：<span>红色</span>，<span>23</span></p>
         
        </div>
      </div>
    </div>
    
    <div class="weui-panel__bd">
      <div class="weui-media-box_appmsg pd-10">

        <div class="weui-media-box__hd"><a href="pro_info.html"><img class="weui-media-box__thumb" src="../pages/front/upload/pro3.jpg" alt=""></a></div>
        <div class="weui-media-box__bd">
          <h1 class="weui-media-box__desc"><a href="pro_info.html" class="ord-pro-link">蓝之蓝蓝色瓶装经典Q7浓香型白酒500ml52度高端纯粮食酒2瓶装包邮</a></h1>
          <p class="weui-media-box__desc">规格：<span>红色</span>，<span>23</span></p>
         
        </div>
      </div>
    </div>
  </div>
  
  
      <div class="morelinks"><a href="pro_list.html">查看更多 >></a></div>
    </div>
  </div>
</div>

<!--底部导航-->
<div class="foot-black"></div>
<div class="weui-tabbar wy-foot-menu">
  <a href="index.html" class="weui-tabbar__item weui-bar__item--on">
    <div class="weui-tabbar__icon foot-menu-home"></div>
    <p class="weui-tabbar__label">首页</p>
  </a>
  <a href="classify.html" class="weui-tabbar__item">
    <div class="weui-tabbar__icon foot-menu-list"></div>
    <p class="weui-tabbar__label">分类</p>
  </a>
  <a href="shopcart.html" class="weui-tabbar__item">
    <span class="weui-badge" style="position: absolute;top: -.4em;right: 1em;">8</span>
    <div class="weui-tabbar__icon foot-menu-cart"></div>
    <p class="weui-tabbar__label">赠送管理</p>
  </a>
  <a href="mine.html" class="weui-tabbar__item">
    <div class="weui-tabbar__icon foot-menu-member"></div>
    <p class="weui-tabbar__label">我的</p>
  </a>
</div>

<script src="../pages/front/lib/jquery-2.1.4.js"></script> 
<script src="../pages/front/lib/fastclick.js"></script> 
<script>
  $(function() {
    FastClick.attach(document.body);
  });
</script> 
<script src="../pages/front/js/jquery-weui.js"></script>
<script src="../pages/front/js/swiper.js"></script>
<script>
	$(".swiper-banner").swiper({
        loop: true,
        autoplay: 3000
      });
	$(".swiper-news").swiper({
		loop: true,
		direction: 'vertical',
		paginationHide :true,
        autoplay: 30000
      });
	 $(".swiper-jingxuan").swiper({
		pagination: '.swiper-pagination',
		loop: true,
		paginationType:'fraction',
        slidesPerView:3,
        paginationClickable: true,
        spaceBetween: 2
      });
	 $(".swiper-jiushui").swiper({
		pagination: '.swiper-pagination',
		paginationType:'fraction',
		loop: true,
        slidesPerView:3,
		slidesPerColumn: 2,
        paginationClickable: true,
        spaceBetween:2
      });
</script>
</body>
</html>
