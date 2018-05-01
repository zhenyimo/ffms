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
        "wxpay":"resource/js/wxpay"
    },
    shim: {
    	'jquery.mloading':{
    		deps: ['jquery'],
    	    exports: 'mloading'
    	},
    	'wxpay':{
    		deps: ['jquery','commonUtils','wx']
    	}
    }
});

var giftShareApi={};
require(['jquery','wxpay','jquery.mloading'],function($,wx,mloading){
	
	$(function($){
		//初始化分享朋友功能
		wx.onMenuShareAppMessage({
			title:$("goodTitle").text(),
			desc:'心理测试',
			link:pathContext+$("#shareUrl").val(),
			imgUrl: $("#goodImage").attr("src"),
			type: 'link',
			success: function () {alert("赠送成功");},
			ancel: function () {alert("赠送失败");}
		});
	});
	giftShareApi.returnIndex=function(){
		window.location.href=pathContext+"/front/index.do";
	}
	
});