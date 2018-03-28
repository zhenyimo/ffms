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
        "front":"pages/front/js/front",
        "jquery.mloading":"resource/js/jquery.mloading",
        "tail":"resource/js/tail"
    },
    shim: {
    	'jquery.mloading':{
    		deps: ['jquery'],
    	    exports: 'mloading'
    	}
    }
});


require(['jquery'],function($){
	require(['constants',
	         'fastclick',
	         'jqueryWeui',
	         'swiper',
	         'bootstrap',
	         'txtwav',
	         'jquery.mloading',
	         'tail'],function(constants,FastClick,jqueryWeui,swiper,bootstrap,txtwav,mloading,tail){				
		$(function($){		
		FastClick.attach(document.body);
		});
	
		
	});
});