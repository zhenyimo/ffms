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
   <div id="timer" style="color:red">
   <input type="hidden" name="downtime" id="downtime" value="${good.answerTime}"/>
   </div>
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
	<c:forEach var="question" items="${questions}" begin="0" end ="${questions.size()}" varStatus="status">
	
	<div class="item " questionId="${question.id}" itemIndex="${status.count}">
			               <p style="padding-left:3%;font-size:1.3em;"><em><c:out value="${status.count}"/>.</em>${question.quesContent}</p>
	                    <c:forEach var="answer" items="${question.getAnswerList()}" begin="0" end ="${question.getAnswerList().size()}" varStatus="anstatus">
		                     <div class="panel-body">
		                    <span style="font-size:1.2em;color:#333"> <em><c:out value="${anstatus.count}"/>.</em>${answer.ansContent}</span>
		                        <input type="radio" id="singleRadio_${anstatus.count}" style="float:right;" onclick="QuestionApi.nextQuestion(${good.id},this,'${answer.nextQuestionId}','${answer.nextQuesNum}')"  value="option_${status.count}_${anstatus.count}" name="radioSingle_${status.count}_${anstatus.count}" aria-label="Single radio One">
		                        <div>
		                        <input type="hidden" name="id" value="${answer.id}">
		                        <input type="hidden" name="ansNum" value="${answer.ansNum}">
		                      <%--   <input type="hidden" name="ansContent" value="${answer.ansContent}"> --%>
		                        <input type="hidden" name="quesId" value="${answer.quesId}">
		                        <input type="hidden" name="nextQuestionId" value="${answer.nextQuestionId}">
		                        <input type="hidden" name="answerScore" value="${answer.answerScore}">		                        
		                        </div>
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

<div>
<!-- <a  href="#myCarousel" id="nextBtn"  onclick="QuestionApi.nextQuestion()" class="weui-btn weui-btn_primary">下一题</a> -->
<a  href="#myCarousel" id="prevBtn"  onclick="QuestionApi.prevQuestion(${good.id})" class="weui-btn weui-btn_primary" >上一题</a>
</div>

 </div>
 