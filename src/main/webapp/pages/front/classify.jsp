<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!--顶部搜索-->
<!--主体-->
<script src="${basePath}/require/js/require.js" data-main="${basePath}/resource/js/classify.js"></script>
<div class="wy-content">
	<div class="category-top">
		<header class='weui-header'>
			<div class="weui-search-bar" id="searchBar">
				<form class="weui-search-bar__form">
					<div class="weui-search-bar__box">
						<i class="weui-icon-search"></i> <input type="search"
							class="weui-search-bar__input" id="searchInput"
							placeholder="搜索您想要的心理测评" required> <a href="javascript:"
							class="weui-icon-clear" id="searchClear"></a>
					</div>
					<label class="weui-search-bar__label" id="searchText"
						style="transform-origin: 0px 0px 0px; opacity: 1; transform: scale(1, 1);">
						<i class="weui-icon-search"></i> <span>搜索您想要的心理测评</span>
					</label>
				</form>
				<a href="javascript:" class="weui-search-bar__cancel-btn"
					id="searchCancel">取消</a>
			</div>
		</header>

	</div>
	<aside>
		<div class="menu-left scrollbar-none" id="sidebar">
			<ul>
				<li class="active" typeVal="-1">全部</li>
				<c:forEach var="type" items="${typeList}">
					<li typeVal="${type.id}">${type.name}</li>
				</c:forEach>
			</ul>
	</aside>
	<div>
		<section style="overflow:hidden" class="menu-right padding-all j-content">
			<input id="currPage" type="hidden" value="${currPage}" />
			<ul id="weui-ul-scroll-load" style="height: 500px;overflow-y:auto;">		
				<div class="weui-panel weui-panel_access classify_scroll_load">
					<jsp:include page="/pages/front/classifyGoodModel.jsp">
						<jsp:param value="${classifyGoods}" name="classifyGoods"/>
					</jsp:include>
					
				</div>
				 <!-- 滚动加载 -->
					<div class="weui-loadmore weui-loadingmore" style="display:None">
				  		<i class="weui-loading"></i>
				  		<span class="weui-loadmore__tips">正在加载</span>
					</div>
					<div class="weui-loadmore weui-loadmore_line weui-loadmore_nodata" style="display:None">
	  					<span class="weui-loadmore__tips">暂无数据</span>
					</div>
					<div class="weui-loadmore weui-loadmore_line weui-loadmore_dot" style="display:None">
	  					<span class="weui-loadmore__tips"></span>
					</div> 
			</ul>
		</section>
	</div>
</div>




<div class="content" id="sort">
    <div class="select">
        <p>排序</p>
        <ul>
        	<c:forEach var="sortEnum" items="${sortEnums}" varStatus="status" >
            	<li data-value="${sortEnum.getDesc()}" level="${sortEnum.getLevel()}" <c:if test="${status.first}">class="selected"</c:if>>${sortEnum.getDesc()}</li>
        	</c:forEach>
        </ul>
    </div>
</div>


<%-- <script type="text/javascript">
	$(function($){
		$('#sidebar ul li').click(function(){
			$(this).addClass('active').siblings('li').removeClass('active');
			var index = $(this).index();
			$('.j-content').eq(index).show().siblings('.j-content').hide();
			changeClassify(this);
		});
		
	});
</script>

<script src="${basePath}/pages/front/js/front.js"></script> --%>