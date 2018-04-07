
require.config({
	baseUrl: '/ffms/',
    paths: {
        "jquery": "pages/front/lib/jquery-2.1.4",
        "wx":"wx/js/jweixin-1.2.0",
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

var QuestionApi={};
require(['jquery'],function($){
	require(['fastclick',
	         'jqueryWeui',
	         'swiper',
	         'bootstrap',
	         'txtwav',
	         'jquery.mloading',
	         'tail'],function(FastClick,jqueryWeui,swiper,bootstrap,txtwav,mloading,tail){
		var carouselData;
		var currentIndex;
		var items;
		$(function($){		
			//初始化下面的导航栏
			tail.initBottomNavBar();	
		    FastClick.attach(document.body);
		    //初始化回答问题
		    $("#prevBtn").attr("style","display:none");
			var denominator=$("#myCarousel").find("ol").find("li").length;
			$("#progress").append(1+"/"+denominator);
	        $("#myCarousel").carousel('pause');
		    $('#myCarousel').on('slide.bs.carousel', function () {
			  carouselData = $(this).data('bs.carousel');
			  currentIndex = carouselData.getActiveIndex();//当前图片的索引，注意：这并不是下一张图的索引号
			  items = carouselData.$items;//所有图片的包裹div的数组
			});
			 $("#speed").attr("style","width:"+Number(1/denominator*100)+"%");
		    $("#myCarousel").find("ol").find("li:eq(0)").addClass("active");
		    $("#myCarousel").find(".carousel-inner").find("div:eq(0)").addClass("active");

		      
		});	
		/**
		 * 统计进度函数
		 */
		QuestionApi.speedOfProgress=function(operate,goodId){			
			 var denominator=$("#myCarousel").find("ol").find("li").length;
			 var molecule=Number(currentIndex+1);
			 var a=Number(denominator/molecule);
			
				 $("#progress").html("");
				 if(operate=="next"){
					 $("#progress").append(Number(molecule+1)+"/"+denominator);	 	 
					 $("#speed").attr("style","width:"+(Number(molecule+1)/denominator)*100+"%");
					 $("#prevBtn").attr("style","display:block");
					 var lastAns=$("#myCarousel").find(".item:last()");
//					 console.log($(lastAns).html());
					 if(Number(molecule+1)==denominator&&denominator!=1){
						 $.each($(lastAns).find(".panel-body"),function(){
							 $(this).find("input[type='radio']").attr("onclick","QuestionApi.payConfirm("+goodId+")");
						 });
					 }
				 }else if(operate=="prev"){
					  if(molecule==2){
						 $("#prevBtn").attr("style","display:none");
						 $("#progress").append(Number(molecule-1)+"/"+denominator); 
					 }else if(molecule>2){
					 $("#progress").append(Number(molecule-1)+"/"+denominator); 
					 }
//					 $("#nextBtn").attr("style","display:block");
					 $("#speed").attr("style","width:"+(Number(molecule-1)/denominator)*100+"%");
				 }else{
					 $("#progress").append(1+"/"+denominator);
				 }
			 
		};
		/**
		 * 上一题
		 */
		QuestionApi.prevQuestion=function(goodId){
			$("#myCarousel").carousel('prev');
			QuestionApi.speedOfProgress("prev",goodId);
		};

		/**
		 * 下一题
		 */
		QuestionApi.nextQuestion=function(goodId){
			$("#myCarousel").carousel('next');
//			alert(currentIndex);
//			alert($(carouselData.$active).html());
			QuestionApi.speedOfProgress("next",goodId);
		};
		//倒计时函数(该函数只能放在这里)
		var downtime=$("#downtime").val();
		QuestionApi.maxtime = downtime * 60; //一个小时，按秒计算，自己调整! 
		QuestionApi.CountDown=function() {
		    if (QuestionApi.maxtime >= 0) {
		        minutes = Math.floor(QuestionApi.maxtime / 60);
		       seconds = Math.floor(QuestionApi.maxtime % 60);
		       msg =  minutes + "分" + seconds + "秒";
		       document.all["timer"].innerHTML = msg;
		       if (QuestionApi.maxtime == 5 * 60)alert("还剩5分钟");
		           --QuestionApi.maxtime;
		   } else{
		       clearInterval(QuestionApi.timer);
		       alert("评测时间已到!");
		   }
		};
		//启动定时器
		QuestionApi.timer = setInterval("QuestionApi.CountDown()", 1000); 
	
		
		QuestionApi.payConfirm=function(goodId){
			//确定支付的dialog
	        $.confirm("为了感谢我们的心理老师和程序员为测评的撰写和编辑，请您付上一点小小的爱心吧?",  function() {
//	          $.toast("文件已经删除!");
	        	QuestionApi.payGood(goodId);
	        }, function() {
	          //取消操作
	        });
	    
		};
		
		//跳转到支付页面
		QuestionApi.payGood=function(goodId){
			window.location.href=pathContext+"/front/wx/payGood.do?goodId="+goodId;
		};
		
	});	
	
});
