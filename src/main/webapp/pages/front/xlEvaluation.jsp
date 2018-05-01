<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="/pages/front/common.jsp" %>
<script src="${basePath}/require/js/require.js" data-main="${basePath}/resource/js/xlEvaluation.js"></script>

<div class="weui-content">
	<c:forEach var="eval" items="${evals}" begin="0" end ="${evals.size()}" varStatus="status">
        <div class="weui-panel__bd">
          <div class="wy-media-box weui-media-box_text">
            <div class="weui-cell nopd weui-cell_access">
              <div class="weui-cell__bd weui-cell_primary"><p>
              <c:if test="${eval.level==1}">A </c:if>
              <c:if test="${eval.level==2}">B </c:if>
              <c:if test="${eval.level==3}">C </c:if>
              :${eval.reportDescribe}</p></div>
            </div>
            <c:forEach var="detail" items="${eval.xlEvaluationDetailList}">
            <p class="weui-media-box__desc">"${detail.evalContent}"</p>
            <ul class="weui-uploader__files clear mg-com-img">
                <li class="weui-uploader__file" style="background-image:url(./upload/pro3.jpg)"></li>
                <li class="weui-uploader__file" style="background-image:url(./upload/pro3.jpg)"></li>
                <li class="weui-uploader__file" style="background-image:url(./upload/pro3.jpg)"></li>
            </ul>
            </c:forEach>
          </div>
        </div>
        </c:forEach>
      </div>
  <div class="weui-footer">
  <p class="weui-footer__links">
  <a href="javascript:void(0);" class="weui-footer__link">底部链接</a>
  </p>
  <p class="weui-footer__text">Copyright © 2008-2016 weui.io</p>
  </div>
