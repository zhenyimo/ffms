require.config({
	baseUrl: '/ffms/',
    paths: {
        "jquery": "pages/front/lib/jquery-2.1.4",
        "wx":"wx/js/jweixin-1.2.0",
        "commonUtils":"resource/js/commonUtils",
        "fastclick":"pages/front/lib/fastclick",
        "jqueryWeui":"pages/front/js/jquery-weui",
        "swiper":"pages/front/js/swiper",
        "bootstrap":"bootstrap/js/bootstrap.min",
        "txtwav":"pages/front/js/txt.wav.min",
        "front":"pages/front/js/front",
        "jquery.mloading":"resource/js/jquery.mloading",
        "tail":"resource/js/tail",
    },
    shim: {
    	'jquery.mloading':{
    		deps: ['jquery'],
    	    exports: 'mloading'
    	},
    	'custWXApi':{
    		deps: ['jquery','commonUtils','wx']
    	}
    }
});


require(['jquery'],function($){
	require(['commonUtils',
	         'fastclick',
	         'jqueryWeui',
	         'swiper',
	         'bootstrap',
	         'txtwav',
	         'jquery.mloading',
	         'tail'],function(commonUtils,FastClick,jqueryWeui,swiper,bootstrap,txtwav,mloading,tail){				
		$(function($){		
			//初始化排序
			initSortWedgit();
			//初始化左边导航栏
			initLeftNavBar();
			//初始化下面的导航栏
			tail.initBottomNavBar();	
			//初始化滚动加载
		    initScollLoad();
		    FastClick.attach(document.body);
		});
		
		function initLeftNavBar(){
			//左边的导航初始化
			$('#sidebar ul li').click(function(){
				$(this).addClass('active').siblings('li').removeClass('active');
				var index = $(this).index();
				$('.j-content').eq(index).show().siblings('.j-content').hide();
				changeClassify(this);
			});
		}
		
		function initSortWedgit(){
			/** 排序下拉框*/
			 //点击P标签切换下拉框
		    $('.select > p').on('click', function(event) {
		        $('.select').toggleClass('open');
		        event.stopPropagation();
		    });
		    //点击li标签,赋值、切换下拉框、给选中的li标签添加选中样式同级元素移除选中样式、阻止事件冒泡
		    $('.select ul li').on('click',function(event){
		        var _this = $(this);
		        $('.select p').text(_this.attr('data-value'));
		        $('.select').toggleClass('open');
		        _this.addClass('selected').siblings().removeClass('selected');
		        event.stopPropagation();
		    });
		    //点击除下拉框的其它地方，收起下拉框
		    $(document).on('click',function(){
		        $('.select').removeClass('open');
		    });  
		    var sidebarWidth=$("#sidebar").width();
		    var mainWidth=$(".wy-content").width();
//		    alert(sidebarWidth+"-----"+mainWidth+"----");
			$(".select").width(Number(mainWidth-sidebarWidth));
		    $("#sort").css("top",Number($(".weui-header").height()));

		}
		
		function initScollLoad(){
			var loading = false;  //状态标记
			//下拉到100px时候自动请求加载
			$("#weui-ul-scroll-load").infinite(50).on("infinite", function() {
			  if(loading) return;
			  loading = true;
			  //隐藏暂无控件
			  $(".weui-loadmore_nodata").hide();
			  //显示正在加载控件
			  $(".weui-loadingmore").show();
			  
			  var typeVal=$("#sidebar ul li.active").attr("typeVal");
			  var nextPage=$("#currPage").val()+1;
			  var sortType=$("#sort .select ul li.selected").attr("level");
			  gotoPage(nextPage,typeVal,sortType,false);
			});
		}
		
		function gotoPage(nextPage,typeVal,sortType,needReInitScollLoad){
			  var data={
			      "type":typeVal,
			      "nextPage":nextPage,
			      "sortType":sortType
			  }
			  $.ajax({
				  url:pathContext+"/classify/goodListHtml.do",
				  data:data,
				  dataType:"html",
				  success:function(html){
					  setTimeout(function() {  
						    //隐藏加载控件
				    		$(".weui-loadingmore").hide();
						    //$(".weui-loadingmore").before(html);
				    		$(".classify_scroll_load").append(html);
						    if($("#classify_loadStatus")!=undefined){
						    	var loadStatus=$("#classify_loadStatus").val(); 	
					    		//1表示已经全部加载完毕了，2表示加载后台出错
						    	if(loadStatus>0){
						    		//删除滚动加载事件
						    		$(".classify_scroll_load").destroyInfinite();
						    		//暂无数据显示
						    		$(".weui-loadmore_nodata").show();
						    	}else{
						    		 $("#currPage").val(nextPage);
						    	}
						    }
						    loading = false;
						    //切换类型tab页的时候要重新初始化滚动加载，因为有可能已经销毁。
						    if(needReInitScollLoad){
						    	//先销毁原来的，再重新初始化
						    	$(".classify_scroll_load").destroyInfinite();
						    	initScollLoad();
						    }
						  }, 1500);   //模拟延迟
				  },
			  	  error:function(ex){
			  		console.log("滚动加载异常.... error:"+ex);
			  		$(".weui-loadingmore").hide();
			  		$(".weui-loadmore_nodata").show();
			  		loading = false;
			  	  }
			  });
		}

		function changeClassify(obj){
			var typeVal=$(obj).attr("typeVal");
			var nextPage=0;
			var sortType=$("#sort .select ul li.selected").attr("level");
			$(".classify_scroll_load .weui-panel__bd").remove();
			$("#classify_loadStatus").remove();
			gotoPage(0,typeVal,sortType,true);
		}
		
	});
});