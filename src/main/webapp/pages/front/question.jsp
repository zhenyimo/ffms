<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<script src="${basePath}/require/js/require.js" data-main="${basePath}/resource/js/question.js"></script>
<div class="weui-progress"  >
<span id="progress"></span>&nbsp;
  <div class="weui-progress__bar" >
    <div id="speed" class="weui-progress__inner-bar js_progress" style="width: 60%;"></div>
  </div><br><br>
  <a href="javascript:;" class="weui-progress__opr">
  </a>
  <i class="fa fa-clock-o" aria-hidden="true"></i>
   <div id="timer" style="color:red"></div>
 <div id="warring" style="color:red"></div>
</div>


<div class="weui-panel weui-panel_access" style="padding-left:5%;padding-right:5%;width:100%">
<div class="weui-panel__bd">
<div id="myCarousel" class="carousel slide" style="height:90%;width:100%">
	<!-- 轮播（Carousel）指标 -->
	 <ol class="carousel-indicators">
		<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
		<li data-target="#myCarousel" data-slide-to="1"></li>
		<li data-target="#myCarousel" data-slide-to="2"></li>
		<li data-target="#myCarousel" data-slide-to="3"></li>
	</ol>    
	<!-- 轮播（Carousel）项目 -->

	<div class="carousel-inner" >
		<div class="item active" >
			               <p style="padding-left:3%;font-size:1.3em;">1.你有怎样的恋爱态度</p>
		                     <div class="panel-body">
		                    <span style="font-size:1.2em;color:#333"> A.每次失恋了也恢复得很快。</span>
		                        <input type="radio" id="singleRadio1" style="float:right;" value="option1" name="radioSingle1" aria-label="Single radio One">
		                        <hr style="margin:5px;height:1px;color:#D5D5D5;"/>
		                    </div>
		                <div class="panel-body">
		                       <span style="font-size:1.2em;color:#333">B.到现在为止交往过的男(女)朋友不超过3个人</span>
		                       <input type="radio" id="singleRadio2" style="float:right" value="option2" name="radioSingle1" checked aria-label="Single radio Two">	
		                       <hr style="margin:5px;height:1px;color:#D5D5D5;"/>	                       
		                    </div>
		                       <div class="panel-body">
		                      <span  style="font-size:1.2em;color:#333">C. 到现在为止交往过的男(女)朋友不超过3个人。</span>
		                        <input type="radio" id="singleRadio3" style="float:right" value="option3" name="radioSingle1" checked aria-label="Single radio Three">
		                        <hr style="margin:5px;height:1px;color:#D5D5D5;"/>
		                    </div>
		</div>
		<div class="item">
			               <p style="padding-left:3%;font-size:1.3em;">2.假如给你一个自由的花园，你会在里面种上怎样的植物？</p>
		                     <div class="panel-body">
		                    <span style="font-size:1.2em;color:#333">A、茂盛的树木。</span>
		                        <input type="radio" id="singleRadio1" style="float:right;" value="option1" name="radioSingle1" aria-label="Single radio One">
		                        <hr style="margin:5px;height:1px;color:#D5D5D5;"/>
		                    </div>
		                <div class="panel-body">
		                       <span style="font-size:1.2em;color:#333">B、拥有累累果实的植物</span>
		                       <input type="radio" id="singleRadio2" style="float:right" value="option2" name="radioSingle1" checked aria-label="Single radio Two">	
		                       <hr style="margin:5px;height:1px;color:#D5D5D5;"/>	                       
		                    </div>
		                       <div class="panel-body">
		                      <span  style="font-size:1.2em;color:#333">C、青嫩的小草。</span>
		                        <input type="radio" id="singleRadio3" style="float:right" value="option3" name="radioSingle1" checked aria-label="Single radio Three">
		                        <hr style="margin:5px;height:1px;color:#D5D5D5;"/>
		                    </div>
		                    <div class="panel-body">
		                      <span  style="font-size:1.2em;color:#333">D、芳香的花朵</span>
		                        <input type="radio" id="singleRadio3" style="float:right" value="option3" name="radioSingle1" checked aria-label="Single radio Three">
		                        <hr style="margin:5px;height:1px;color:#D5D5D5;"/>
		                    </div>
		</div>
		<div class="item" >
			               <p style="padding-left:3%;font-size:1.3em;">3.你有怎样的恋爱态度</p>
		                     <div class="panel-body">
		                    <span style="font-size:1.2em;color:#333"> A.每次失恋了也恢复得很快。</span>
		                        <input type="radio" id="singleRadio1" style="float:right;" value="option1" name="radioSingle1" aria-label="Single radio One">
		                        <hr style="margin:5px;height:1px;color:#D5D5D5;"/>
		                    </div>
		                <div class="panel-body">
		                       <span style="font-size:1.2em;color:#333">B.到现在为止交往过的男(女)朋友不超过3个人</span>
		                       <input type="radio" id="singleRadio2" style="float:right" value="option2" name="radioSingle1" checked aria-label="Single radio Two">	
		                       <hr style="margin:5px;height:1px;color:#D5D5D5;"/>	                       
		                    </div>
		                       <div class="panel-body">
		                      <span  style="font-size:1.2em;color:#333">C. 到现在为止交往过的男(女)朋友不超过3个人。</span>
		                        <input type="radio" id="singleRadio3" style="float:right" value="option3" name="radioSingle1" checked aria-label="Single radio Three">
		                        <hr style="margin:5px;height:1px;color:#D5D5D5;"/>
		                </div>			
		</div>
		
		
		<div class="item" >
			               <p style="padding-left:5%;font-size:1.3em;">4.假如给你一个自由的花园，你会在里面种上怎样的植物？</p>
		                     <div class="panel-body">
		                    <span style="font-size:1.2em;color:#333">A、茂盛的树木。</span>
		                        <input type="radio" id="singleRadio1" style="float:right;" value="option1" name="radioSingle1" aria-label="Single radio One">
		                        <hr style="margin:5px;height:1px;color:#D5D5D5;"/>
		                    </div>
		                <div class="panel-body">
		                       <span style="font-size:1.2em;color:#333">B、拥有累累果实的植物</span>
		                       <input type="radio" id="singleRadio2" style="float:right" value="option2" name="radioSingle1" checked aria-label="Single radio Two">	
		                       <hr style="margin:5px;height:1px;color:#D5D5D5;"/>	                       
		                    </div>
		                       <div class="panel-body">
		                      <span  style="font-size:1.2em;color:#333">C、青嫩的小草。</span>
		                        <input type="radio" id="singleRadio3" style="float:right" value="option3" name="radioSingle1" checked aria-label="Single radio Three">
		                        <hr style="margin:5px;height:1px;color:#D5D5D5;"/>
		                    </div>
		                    <div class="panel-body">
		                      <span  style="font-size:1.2em;color:#333">D、芳香的花朵</span>
		                        <input type="radio" id="singleRadio3" style="float:right" value="option3" name="radioSingle1" checked aria-label="Single radio Three">
		                        <hr style="margin:5px;height:1px;color:#D5D5D5;"/>
		                    </div>
		</div>
		
		
		
	<!-- 轮播（Carousel）导航 -->
	<!--  <a class="carousel-control left" href="#myCarousel" 
	   data-slide="prev">&lsaquo;</a>
	<a class="carousel-control right" href="#myCarousel" 
	   data-slide="next">&rsaquo;</a>  -->
</div> 
</div>
</div>


<!-- <div class="weui-flex">
  <div class="weui-flex__item"><a  href="#myCarousel" data-slide="prev" class="weui-btn weui-btn_primary" >上一题</a></div>
  <div class="weui-flex__item"><a  href="#myCarousel" data-slide="next" class="weui-btn weui-btn_primary">下一题</a></div>
</div> -->
<div>
<a  href="#myCarousel" id="nextBtn"  onclick="QuestionApi.nextQuestion()" class="weui-btn weui-btn_primary">下一题</a>
<a  href="#myCarousel" id="prevBtn"  onclick="QuestionApi.prevQuestion()" class="weui-btn weui-btn_primary" >上一题</a>
</div>


 </div>
 
<!-- <script src="../pages/front/js/question.js"></script> -->
<link rel="stylesheet" href="../pages/front/css/question.css">
