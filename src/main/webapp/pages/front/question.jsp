<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<div>

<div class="weui-progress" >
<span>16/22</span>&nbsp;
  <div class="weui-progress__bar" >
    <div class="weui-progress__inner-bar js_progress" style="width: 60%;"></div>
  </div><br><br>
  <a href="javascript:;" class="weui-progress__opr">
  </a>
  <i class="fa fa-clock-o" aria-hidden="true"></i>
   <div id="timer" style="color:red"></div>
 <div id="warring" style="color:red"></div>
</div>



<div id="myCarousel" class="carousel slide" style="height:90%;width:100%">
	<!-- 轮播（Carousel）指标 -->
	 <ol class="carousel-indicators">
		<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
		<li data-target="#myCarousel" data-slide-to="1"></li>
		<li data-target="#myCarousel" data-slide-to="2"></li>
	</ol>    
	<!-- 轮播（Carousel）项目 -->
	<div class="carousel-inner" >
		<div class="item active">
			               <p style="font-size:1.5em;font-weight:bold">1.你有怎样的恋爱态度</p>
		                    <div class="radio">
		                    <label> A.每次失恋了也恢复得很快。</label>
		                        <input type="radio" id="singleRadio1" style="float:right" value="option1" name="radioSingle1" aria-label="Single radio One">
		                    </div>
		                    <div class="radio radio-success">
		                    <label>B.到现在为止交往过的男(女)朋友不超过3个人。</label>
		                        <input type="radio" id="singleRadio2" style="float:right" value="option2" name="radioSingle1" checked aria-label="Single radio Two">
		                    </div>
		                      <div class="radio radio-success">
		                      <label>C. 到现在为止交往过的男(女)朋友不超过3个人。</label>
		                        <input type="radio" id="singleRadio3" style="float:right" value="option3" name="radioSingle1" checked aria-label="Single radio Three">
		                    </div>
			
			
		</div>
		<div class="item">
			<img src="../pages/front/images/test1.jpg" alt="Second slide">
		</div>
		<div class="item">
			<img src="../pages/front/images/test1.jpg" alt="Third slide">
		</div>
	</div>
	<!-- 轮播（Carousel）导航 -->
	<!-- <a class="carousel-control left" href="#myCarousel" 
	   data-slide="prev">&lsaquo;</a>
	<a class="carousel-control right" href="#myCarousel" 
	   data-slide="next">&rsaquo;</a> -->
</div> 



<div class="weui-panel weui-panel_access">
  <div class="weui-panel__hd">图文组合列表</div>
  <div class="weui-panel__bd">
    <a href="javascript:void(0);" class="weui-media-box weui-media-box_appmsg">
      <div class="weui-media-box__hd">
        <img class="weui-media-box__thumb" src="">
      </div>
      <div class="weui-media-box__bd">
        <h4 class="weui-media-box__title">标题一</h4>
        <p class="weui-media-box__desc">由各种物质组成的巨型球状天体，叫做星球。星球有一定的形状，有自己的运行轨道。</p>
      </div>
    </a>
    <a href="javascript:void(0);" class="weui-media-box weui-media-box_appmsg">
      <div class="weui-media-box__hd">
        <img class="weui-media-box__thumb" src="">
      </div>
      <div class="weui-media-box__bd">
        <h4 class="weui-media-box__title">标题二</h4>
        <p class="weui-media-box__desc">由各种物质组成的巨型球状天体，叫做星球。星球有一定的形状，有自己的运行轨道。</p>
      </div>
    </a>
  </div>
  <div class="weui-panel__ft">
    <a href="javascript:void(0);" class="weui-cell weui-cell_access weui-cell_link">
      <div class="weui-cell__bd">查看更多</div>
      <span class="weui-cell__ft"></span>
    </a>    
  </div>
</div>




  
 </div>
 
  
  
 
