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
         <div class="swiper-slide"><a href="#"><img style="width:100%; height:300px;"  src="${basePath}${adPicParentPath}${adGood.adPictureUrl}" /></a></div>
	 </c:forEach> 
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
 
 <!--热卖爆款-->
  <div class="wy-Module">
    <div class="wy-Module-tit"><span class="txtwav bounce" style="color:#d80909">热卖爆款</span></div>
    <div class="wy-Module-con">
      <div class="swiper-container swiper-jingxuan" style="padding-top:34px;">
        <div class="swiper-wrapper">
        	<c:forEach var="hotGood" items="${hotgoods}">
        		 <div class="swiper-slide">
        		 	<a href="${basePath}/good/detail.do?goodId=${hotGood.id}">
        		 			<img  src="${basePath}/pages/front/images/${hotGood.pictureName}" />
                            <h6 class="testNumber">${hotGood.paysuccessNumber}人已测</h6>
                            <h5 class="testName">${hotGood.typeName}类型测评</h5>
           			</a>
           		</div>
        	</c:forEach>
         
           
            <!-- <div class="swiper-slide"><a href="../EntryController/gongzhonghaoIndex.do?tabName=good"><img src="../pages/front/images/test1.jpg" />
                            <h6 class="testNumber">4.5w人已测</h6>
                            <h5 class="testName">焦虑类型测评</h5>
           </a></div>
           
            <div class="swiper-slide"><a href="../EntryController/gongzhonghaoIndex.do?tabName=good"><img src="../pages/front/images/test1.jpg" />
                            <h6 class="testNumber">4.5w人已测</h6>
                            <h5 class="testName">焦虑类型测评</h5>
           </a></div>
           
            <div class="swiper-slide"><a href="../EntryController/gongzhonghaoIndex.do?tabName=good"><img src="../pages/front/images/test1.jpg" />
                            <h6 class="testNumber">4.5w人已测</h6>
                            <h5 class="testName">焦虑类型测评</h5>
           </a></div>
           
            <div class="swiper-slide"><a href="../EntryController/gongzhonghaoIndex.do?tabName=good"><img src="../pages/front/images/test1.jpg" />
                            <h6 class="testNumber">4.5w人已测</h6>
                            <h5 class="testName">焦虑类型测评</h5>
           </a></div>
           
            <div class="swiper-slide"><a href="../EntryController/gongzhonghaoIndex.do?tabName=good"><img src="../pages/front/images/test1.jpg" />
                            <h6 class="testNumber">4.5w人已测</h6>
                            <h5 class="testName">焦虑类型测评</h5>
           </a></div> -->
           
       
        </div>
        <div class="swiper-pagination jingxuan-pagination"></div>
      </div>
    </div>
  </div>
  <!--新品发布-->
 <div class="wy-Module" style="margin-top:-0.5rem">
    <div class="wy-Module-tit"><span class="txtwav flip" style="color:#d80909">新品发布</span></div>
    <div class="wy-Module-con">
      <div class="swiper-container swiper-jingxuan" style="padding-top:34px;">
        <div class="swiper-wrapper">
          
           <c:forEach var="newGood" items="${newGoods}">
        		 <div class="swiper-slide">
        		 	<a href="${basePath}/good/detail/${newGood.id}.do">
        		 			<img src="${basePath}/pages/front/images/${newGood.pictureName}" />
                            <h6 class="testNumber">${newGood.paysuccessNumber}人已测</h6>
                            <h5 class="testName">${newGood.typeName}类型测评</h5>
           			</a>
           		</div>
        	</c:forEach>
           <!--
           <div class="swiper-slide"><a href="../EntryController/gongzhonghaoIndex.do?tabName=good"><img src="../pages/front/images/test1.jpg" />
                            <h6 class="testNumber">4.5w人已测</h6>
                            <h5 class="testName">焦虑类型测评</h5>
           </a></div>
           
             <div class="swiper-slide"><a href="../EntryController/gongzhonghaoIndex.do?tabName=good"><img src="../pages/front/images/test1.jpg" />
                            <h6 class="testNumber">4.5w人已测</h6>
                            <h5 class="testName">焦虑类型测评</h5>
           </a></div>
           
            <div class="swiper-slide"><a href="../EntryController/gongzhonghaoIndex.do?tabName=good"><img src="../pages/front/images/test1.jpg" />
                            <h6 class="testNumber">4.5w人已测</h6>
                            <h5 class="testName">焦虑类型测评</h5>
           </a></div>
           
            <div class="swiper-slide"><a href="../EntryController/gongzhonghaoIndex.do?tabName=good"><img src="../pages/front/images/test1.jpg" />
                            <h6 class="testNumber">4.5w人已测</h6>
                            <h5 class="testName">焦虑类型测评</h5>
           </a></div>
           
            <div class="swiper-slide"><a href="../EntryController/gongzhonghaoIndex.do?tabName=good"><img src="../pages/front/images/test1.jpg" />
                            <h6 class="testNumber">4.5w人已测</h6>
                            <h5 class="testName">焦虑类型测评</h5>
           </a></div>
           
            <div class="swiper-slide"><a href="../EntryController/gongzhonghaoIndex.do?tabName=good"><img src="../pages/front/images/test1.jpg" />
                            <h6 class="testNumber">4.5w人已测</h6>
                            <h5 class="testName">焦虑类型测评</h5>
           </a></div> -->
          
          
        </div>
        <div class="swiper-pagination jingxuan-pagination"></div>
      </div>
    </div>
  </div>
  <!--精选评测-->
  <div class="wy-Module">
    <div class="wy-Module-tit-line"><span style="color:#d80909">精选评测</span></div>
    <div class="wy-Module-con">
     <div class="weui-panel weui-panel_access">
    <div class="weui-panel__hd"><span>精彩评测</span></div>
    <c:forEach var="handpickedGood" items="${handpickedGoods}">
	    <div class="weui-panel__bd">
	      	<div class="weui-media-box_appmsg pd-10">
	        	<div class="weui-media-box__hd">
	        		<a href="${basePath}/good/detail/${handpickedGood.id}.do">
	        			<img class="weui-media-box__thumb" src="${basePath}/pages/front/images/${newGood.pictureName}" alt="">
	        		</a>
	        	</div>
	        	<div class="weui-media-box__bd">
	          		<h1 class="weui-media-box__desc">
	          			<a href="${basePath}/good/detail/${handpickedGood.id}.do" class="ord-pro-link">${handpickedGood.tittle}</a>
	          		</h1>
	          		<p class="weui-media-box__desc">
	          			<span>${handpickedGood.subtittle}</span>
	          		</p>
	        	</div>
	     </div>
	</c:forEach>   
    
    
    
    <!-- <div class="weui-panel__bd">
      <div class="weui-media-box_appmsg pd-10">

        <div class="weui-media-box__hd"><a href="../EntryController/gongzhonghaoIndex.do?tabName=good"><img class="weui-media-box__thumb" src="../pages/front/images/test1.jpg" alt=""></a></div>
        <div class="weui-media-box__bd">
          <h1 class="weui-media-box__desc"><a href="../EntryController/gongzhonghaoIndex.do?tabName=good" class="ord-pro-link">蓝之蓝蓝色瓶装经典Q7浓香型白酒500ml52度高端纯粮食酒2瓶装包邮</a></h1>
          <p class="weui-media-box__desc">规格：<span>红色</span>，<span>23</span></p>
         
        </div>
      </div>
    </div>
    
    <div class="weui-panel__bd">
      <div class="weui-media-box_appmsg pd-10">

        <div class="weui-media-box__hd"><a href="../EntryController/gongzhonghaoIndex.do?tabName=good"><img class="weui-media-box__thumb" src="../pages/front/images/test1.jpg" alt=""></a></div>
        <div class="weui-media-box__bd">
          <h1 class="weui-media-box__desc"><a href="../EntryController/gongzhonghaoIndex.do?tabName=good" class="ord-pro-link">蓝之蓝蓝色瓶装经典Q7浓香型白酒500ml52度高端纯粮食酒2瓶装包邮</a></h1>
          <p class="weui-media-box__desc">规格：<span>红色</span>，<span>23</span></p>
         
        </div>
      </div>
    </div>
    
       <div class="weui-panel__bd">
      <div class="weui-media-box_appmsg pd-10">

        <div class="weui-media-box__hd"><a href="../EntryController/gongzhonghaoIndex.do?tabName=good"><img class="weui-media-box__thumb" src="../pages/front/images/test1.jpg" alt=""></a></div>
        <div class="weui-media-box__bd">
          <h1 class="weui-media-box__desc"><a href="../EntryController/gongzhonghaoIndex.do?tabName=good" class="ord-pro-link">蓝之蓝蓝色瓶装经典Q7浓香型白酒500ml52度高端纯粮食酒2瓶装包邮</a></h1>
          <p class="weui-media-box__desc">规格：<span>红色</span>，<span>23</span></p>
         
        </div>
      </div>
    </div> -->
    
    
    
    
    
  </div>
  
  
      <div class="morelinks"><a href="${basePath}/EntryController/gongzhonghaoIndex.do?tabName=classify">查看更多 >></a></div>
    </div>
  </div>
</div>

 <!--底部导航-->
 <div class="weui-footer">
  <p class="weui-footer__links">
  <a href="javascript:void(0);" class="weui-footer__link">底部链接</a>
  </p>
  <p class="weui-footer__text">Copyright © 2008-2016 weui.io</p>
  </div>


<script>
$(function(){
	
})
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