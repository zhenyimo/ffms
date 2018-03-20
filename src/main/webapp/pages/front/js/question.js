/**
 * version:1.0
 * creater:jinbangchen
 */

$(function() {
	var denominator=$("#myCarousel").find("ol").find("li").length;
	$("#progress").append(1+"/"+denominator);
       $("#myCarousel").carousel('pause');
	   $('#myCarousel').on('slide.bs.carousel', function () {
		 carouselData = $(this).data('bs.carousel');
		 currentIndex = carouselData.getActiveIndex();//当前图片的索引，注意：这并不是下一张图的索引号
		 items = carouselData.$items;//所有图片的包裹div的数组
		});
});

/**
 * 统计进度函数
 */
function speedOfProgress(operate){
	
	 var denominator=$("#myCarousel").find("ol").find("li").length;
	 var molecule=Number(currentIndex+1);
	 var a=Number(denominator/molecule);
	
		 $("#progress").html("");
		 if(operate=="next"){
			 if(Number(denominator-molecule)>1){
				 $("#progress").append(Number(molecule+1)+"/"+denominator);	 	 
			 }else {
				 $("#progress").append(Number(molecule+1)+"/"+denominator);	 	 
				 $("#nextBtn").attr("style","display:none");
			 }
			 $("#prevBtn").attr("style","display:block");
		 }else if(operate=="prev"){
			  if(molecule==2){
				 $("#prevBtn").attr("style","display:none");
				 $("#progress").append(Number(molecule-1)+"/"+denominator); 
			 }else if(molecule>2){
			 $("#progress").append(Number(molecule-1)+"/"+denominator); 
			 }
			 $("#nextBtn").attr("style","display:block");
		 }else{
			 $("#progress").append(1+"/"+denominator);
		 }
	 
}
/**
 * 上一题
 */
function prevQuestion(){
	$("#myCarousel").carousel('prev');
	speedOfProgress("prev");
}

/**
 * 下一题
 */
function nextQuestion(){
	$("#myCarousel").carousel('next');
//	alert(currentIndex);
//	alert($(carouselData.$active).html());
	speedOfProgress("next");
}
//倒计时函数(该函数只能放在这里)
var maxtime = 30 * 60; //一个小时，按秒计算，自己调整! 
function CountDown() {
	
    if (maxtime >= 0) {
        minutes = Math.floor(maxtime / 60);
       seconds = Math.floor(maxtime % 60);
       msg =  minutes + "分" + seconds + "秒";
       document.all["timer"].innerHTML = msg;
       if (maxtime == 5 * 60)alert("还剩5分钟");
           --maxtime;
   } else{
       clearInterval(timer);
       alert("时间到，结束!");
   }
}
timer = setInterval("CountDown()", 1000); 

