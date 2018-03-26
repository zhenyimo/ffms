require.config({
	baseUrl: '/ffms/',
    paths: {
        "jquery": "pages/front/lib/jquery-2.1.4",
        "wx":"wx/js/jweixin-1.2.0",
        "constants":"resource/js/constants",
        "fastclick":"pages/front/lib/fastclick",
        "jqueryWeui":"pages/front/js/jquery-weui",
        "swiper":"pages/front/js/swiper",
        "bootstrap":"bootstrap/js/bootstrap.min",
        "txtwav":"pages/front/js/txt.wav.min",
        "front":"pages/front/js/front"
    },
    shim: {
    	'front':{
    		deps: ['jquery','jqueryWeui'],
    	    exports: 'front'
    	}
    }
});


require(['jquery'],function($){
	require(['constants','fastclick','jqueryWeui','swiper','bootstrap','txtwav','front'],function(constants,FastClick,jqueryWeui,swiper,bootstrap,txtwav,front){		
		
		//左边的导航初始化
		$(function($){
			$('#sidebar ul li').click(function(){
				$(this).addClass('active').siblings('li').removeClass('active');
				var index = $(this).index();
				$('.j-content').eq(index).show().siblings('.j-content').hide();
				changeClassify(this);
			});
		});	
		
		//底部导航
		$(function($){
			FastClick.attach(document.body);
		    var tab=$("#tabName").val();
		    if(tab==''){
		     $("#index").find("div").addClass("foot-menu-home");
		     $("#index").find("p").css("color","#e21323");
		    }else if(tab=='classify'){
		     $("#classify").find("div").toggleClass("foot-menu-list1");
		     $("#classify").find("p").css("color","#e21323");
		     homeStyleChange();
		    }else if(tab=='gift'){
		     $("#gift").find("div").toggleClass("foot-menu-cart1");
		     $("#gift").find("p").css("color","#e21323");
		     homeStyleChange();
		    }else if(tab=='mine'){
		        $("#mine").find("div").toggleClass("foot-menu-member1");
		        $("#mine").find("p").css("color","#e21323");
		        homeStyleChange();
		    }else{
		    	homeStyleChange();  
		    }
		});
		function homeStyleChange(){
		     $("#index").find("div").removeClass("foot-menu-home").addClass("foot-menu-home2");
		     $("#index").find("p").css("color","#666");
		}
	});
});