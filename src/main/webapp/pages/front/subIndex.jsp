<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
     <c:forEach var="adGood" items="${ads}">
         <div class="swiper-slide"><a href="#"><img src="${basePath}/${adPicParentPath}${adGood.adPictureUrl}" /></a></div>
	 </c:forEach> 
    </div>
    <div class="swiper-pagination"></div>
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


<script>
	$(".swiper-banner").swiper({
        loop: true,
        autoplay: 3000
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