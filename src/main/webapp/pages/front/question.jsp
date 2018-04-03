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
	 <c:forEach var="question" items="${questions}" begin="0" end ="${questions.size()-1}" varStatus="status">
		<li data-target="#myCarousel" data-slide-to="${status.count-1}"></li>
		</c:forEach>
	</ol>    
	<!-- 轮播（Carousel）项目 -->
	<div class="carousel-inner" >
	<c:forEach var="question" items="${questions}" begin="1" end ="${questions.size()}" varStatus="status">
	
	<div class="item " itemIndex="${status.count}">
			               <p style="padding-left:3%;font-size:1.3em;"><em><c:out value="${status.count}"/>.</em>${question.quesContent}</p>
	                    <c:forEach var="answer" items="${question.getAnswerList()}" begin="0" end ="${question.getAnswerList().size()}" varStatus="anstatus">
		                     <div class="panel-body">
		                    <span style="font-size:1.2em;color:#333"> <em><c:out value="${anstatus.count}"/>.</em>${answer.ansContent}</span>
		                        <input type="radio" id="singleRadio1" style="float:right;" value="option1" name="radioSingle1" aria-label="Single radio One">
		                        <hr style="margin:5px;height:1px;color:#D5D5D5;"/>
		                    </div>
		                 </c:forEach>
		</div>
	</c:forEach>
		
		
		
		
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
<link rel="stylesheet" href="${basePath}/pages/front/css/question.css">
