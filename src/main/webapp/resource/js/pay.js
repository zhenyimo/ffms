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

var wxpayApi={};
require(['jquery','wxpay','jquery.mloading'],function($,wxpay,mloading){
	
	$(function($){
	 var MAX = 99, MIN = 1;
     $('.weui-count__decrease').click(function (e) {
       var $input = $(e.currentTarget).parent().find('.weui-count__number');
       var number = parseInt($input.val() || "0") - 1;
       if (number < MIN) number = MIN;
       $input.val(number);
     });
     $('.weui-count__increase').click(function (e) {
       var $input = $(e.currentTarget).parent().find('.weui-count__number');
       var number = parseInt($input.val() || "0") + 1;
       if (number > MAX) number = MAX;
       $input.val(number);
     });
	});
	

	wxpayApi.placeOrder=function(orderId){
		return wxpay.jssdkPlaceOrder(orderId,successPay,failPay);
	//支付成功回调
	function successPay(wxRes){
		
	}
	//支付失败回调
	function failPay(wxRes){
		
	}
});