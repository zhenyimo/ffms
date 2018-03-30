<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath ="";
	if(request.getServerPort()==80){
		basePath=request.getScheme()+"://"+request.getServerName()+path;
	}else{
		basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
	}
	pageContext.setAttribute("basePath", basePath);
%>
<c:if test="${not empty loadStatus}">
	<input id="classify_loadStatus" type="hidden" value="${loadStatus}" />
</c:if>
<c:forEach var="classifyGood" items="${classifyGoods}">
	<div class="weui-panel__bd">
		<div class="weui-media-box_appmsg pd-10">
			<div class="weui-media-box__hd">
				<a href="${basePath}/front/good/detail.do?goodId=${classifyGood.id}"><img
					class="weui-media-box__thumb"
					src="${basePath}/pages/front/images/${classifyGood.pictureName}"
					alt=""></a>
			</div>
			<div class="weui-media-box__bd">
				<h1 class="weui-media-box__desc">
					<a href="${basePath}/front/good/detail.do?goodId=${classifyGood.id}"
						class="ord-pro-link">${classifyGood.tittle}</a>
				</h1>
				<p class="weui-media-box__desc">${classifyGood.subtittle}</p>
			</div>
		</div>
	</div>
</c:forEach>