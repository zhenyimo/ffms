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
        "wxpay":"resource/js/wxpay",
        "clipbord":"resource/js/clipboard.min"
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
require(['jquery','wxpay','jquery.mloading','clipbord'],function($,wx,mloading,Clipboard){
	$(function($){
		var copyUrl=pathContext+$("#shareUrl").val();
		$("#copyUrlInput").val(copyUrl);
		var clipboard1 = new Clipboard('.copyBtn');
		
        clipboard1.on('success', function(e){
            console.log(e);
            
            //覆盖微信发送给朋友按钮
            wx.onMenuShareAppMessage({
    			title:"您的好友赠送了一份心理测试给您",
    			desc:$("#goodTitle").text(),
    			link:pathContext+$("#shareUrl").val(),
    			imgUrl: $("#goodImage").attr("src"),
    			type: 'link',
    			success: function () {alert("赠送成功");},
    			cancel: function () {alert("赠送失败");}
    		});
            document.getElementById('copyUrl').innerHTML = '复制成功';
        });
        clipboard1.on('error', function(e){
            document.getElementById('copyUrl').innerHTML = '复制失败，请长按复制';
        });
	});
	giftShareApi.returnIndex=function(){
		window.location.href=pathContext+"/front/index.do";
	}
	
});