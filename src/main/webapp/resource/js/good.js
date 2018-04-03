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
        "tail":"resource/js/tail"
    },
    shim: {
    	'jquery.mloading':{
    		deps: ['jquery'],
    	    exports: 'mloading'
    	},
    }
});

var GoodApi={};
require(['jquery'],function($){
	require(['fastclick',
	         'jqueryWeui',
	         'swiper',
	         'bootstrap',
	         'txtwav',
	         'tail'],function(FastClick,jqueryWeui,swiper,bootstrap,txtwav,tail){
		//初始化定时器
		GoodApi.initTimer=function(){
			$(".suspend").animate({width: 30}, 400);
			GoodApi.timer1=setInterval( "GoodApi.giftOut() " , 3000 );
			GoodApi.timer2=setInterval( "GoodApi.giftIn() " , 6000 );
		};
		GoodApi.giftOut=function(){
		$(".suspend").stop();
		 $(".suspend").animate({width: 60}, 200);  
		};

		GoodApi.giftIn=function(){
		$(".suspend").stop();
		$(".suspend").animate({width: 30}, 400);
		};
		//隐藏礼物控件
		GoodApi.hideGift=function(){
			$(".suspend").stop();
			$(".suspend").animate({width: 0}, 400);
			window.clearInterval(GoodApi.timer1);
			window.clearInterval(GoodApi.timer2);
		};
		//跳转到支付页面
		GoodApi.payGood=function(){
			window.location.href=pathContext+"/front/wx/payGood.do";
		};
		
		
		//初始化
		$(function($){
			GoodApi.initTimer();
			$(".promotion-sku li").click(function(){
				$(this).addClass("active").siblings("li").removeClass("active");
			});
			FastClick.attach(document.body);
			//初始化下面的导航栏
			tail.initBottomNavBar();
		});	
		
		
		
	});
});