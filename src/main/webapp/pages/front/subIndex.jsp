<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
  <!--广告连播-->
  <div class="swiper-container swiper-banner">
    <div class="swiper-wrapper">
     <c:forEach var="adGood" items="${ads}">
         <div class="swiper-slide"><a href="#"><img src="${basePath}/${adPicParentPath}${adGood.adPictureUrl}" /></a></div>
	 </c:forEach> 
    </div>
    <div class="swiper-pagination"></div>
  </div>
   
   <!-- 热评测试 -->
   <div class="indexList hot">
   		<div class="container">
   			<div class="weui-panel weui-panel_access">
	   			<div class="weui-panel__hd">
					   <div class="saleTitle hot"></div>
					   <div class="sceTitle hot">不容错过的精彩测评</div>
				</div>
   			</div>
   			<div class="weui-panel__bd">
   				<div class="swiper-container swiper-container-horizontal">
	    			<div class="swiper-wrapper">
	        			<div class="swiper-slide">
	        					<div class="swiperCont">
	        						<div class="imgCnt">
	        							<img src="${basePath}/resource/images/test1.jpg">
	        							<div class="imgMask"></div>
	        							<p class="imgDesc">4w人已测评</p>
	        						</div>
	        						<div class="itmDesc">气质类型测评</div>
	        						<div class="itmInfo">
	        							<span class="prices">￥ 9.9</span>
	        						</div>
	        					</div>	
	        			</div>
	        			<div class="swiper-slide">
	        					<div class="swiperCont">
	        						<div class="imgCnt">
	        							<img src="${basePath}/resource/images/test1.jpg">
	        							<div class="imgMask"></div>
	        							<p class="imgDesc">4w人已测评</p>
	        						</div>
	        						<div class="itmDesc">气质类型测评</div>
	        						<div class="itmInfo">
	        							<span class="prices">￥ 9.9</span>
	        						</div>
	        					</div>	
	        			</div>
	        			<div class="swiper-slide">
	        					<div class="swiperCont">
	        						<div class="imgCnt">
	        							<img src="${basePath}/resource/images/test1.jpg">
	        							<div class="imgMask"></div>
	        							<p class="imgDesc">4w人已测评</p>
	        						</div>
	        						<div class="itmDesc">气质类型测评</div>
	        						<div class="itmInfo">
	        							<span class="prices">￥ 9.9</span>
	        						</div>
	        					</div>	
	        			</div>
	    			</div>	
   			</div>
   		</div>
   		
   </div>  
   
  <!--猜你喜欢-->
  <div class="wy-Module">
    <div class="wy-Module-tit-line">
    	<span>精选评测</span>
    </div>
    <div class="wy-Module-con">
     	<div class="weui-panel weui-panel_access">
    	<div class="weui-panel__hd">
    		<span>精彩评测</span>
    	</div>
    
    	<div class="weui-panel__bd">
      		<div class="weui-media-box_appmsg pd-10 chosenItemBox">
				<div class="weui-media-box__hd">
					<a href="pro_info.html">
						<span class="weui-media-box__itms_testType">健康</span>
						<img class="weui-media-box__thumb" src="../pages/front/upload/pro3.jpg" alt="">
					</a>
				</div>
	        	<div class="weui-media-box__bd">
	         		<h1 class="weui-media-box__desc">
	         			<a href="pro_info.html" class="ord-pro-link">为什么你总是闷闷不乐？</a>
	         		</h1>
	          		<p class="weui-media-box__desc chosenDesc">
	          			抑郁思维模式评估
	          		</p>
	          		<p class="weui-media-box__desc chosenDesc">
	          			1.7w人已测试
	          		</p>
	        	</div>
     	 	</div>
    	</div>
  </div>
      <div class="morelinks"><a href="../EntryController/gongzhonghaoIndex.do?tabName=classify">查看更多 >></a></div>
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