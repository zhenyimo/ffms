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
        "txtwav":"pages/front/js/txt.wav.min"
    }
});

require(['jquery'],function($){
	require(['constants','fastclick','jqueryWeui','swiper','bootstrap','txtwav'],function(constants,FastClick,jqueryWeui,swiper,bootstrap,txtwav){
		
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
		 //底部导航初始化
		 $(function() {
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