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
        "tail":"resource/js/tail"
    }
});

require(['jquery'],function($){
	require(['fastclick','jqueryWeui','swiper','bootstrap','txtwav','tail'],function(FastClick,jqueryWeui,swiper,bootstrap,txtwav,tail){
		 //底部导航初始化
		 $(function() {
			 FastClick.attach(document.body);
				//初始化下面的导航栏
			 tail.initBottomNavBar();
		});
		 
		//初始化轮播
		 $(".swiper-banner").swiper({
	        loop: true,
	        autoplay: 3000
	      });
		 $(".swiper-jingxuan").swiper({
			pagination: '.swiper-pagination',
			loop: true,
			paginationType:'fraction',
	        slidesPerView:3,
	        paginationClickable: true,
	        spaceBetween: 2
	      });
		 $(".swiper-jiushui").swiper({
			pagination: '.swiper-pagination',
			paginationType:'fraction',
			loop: true,
	        slidesPerView:3,
			slidesPerColumn: 2,
	        paginationClickable: true,
	        spaceBetween:2
	      });
		 
	});
	
});