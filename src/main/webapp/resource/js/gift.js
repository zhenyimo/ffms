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
        "tail":"resource/js/tail",
    }
});

var gitfApi={}
require(['jquery'],function($){
	require(['commonUtils',
	         'fastclick',
	         'jqueryWeui',
	         'swiper',
	         'bootstrap',
	         'txtwav',
	         'tail'],function(commonUtils,FastClick,jqueryWeui,swiper,bootstrap,txtwav,tail){				
		$(function($){		
		//初始化下面的导航栏
		tail.initBottomNavBar();	
		FastClick.attach(document.body);
		});
	
		
	});
});