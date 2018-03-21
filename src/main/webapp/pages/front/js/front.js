/**
 * version:1.0
 * creater:jinbangchen
 */

$(function() {

    //点击P标签切换下拉框
    $('.select > p').on('click', function(event) {
        $('.select').toggleClass('open');
        event.stopPropagation();
    });
    //点击li标签,赋值、切换下拉框、给选中的li标签添加选中样式同级元素移除选中样式、阻止事件冒泡
    $('.select ul li').on('click',function(event){
        var _this = $(this);
        $('.select p').text(_this.attr('data-value'));
        $('.select').toggleClass('open');
        _this.addClass('selected').siblings().removeClass('selected');
        event.stopPropagation();
    });
    //点击除下拉框的其它地方，收起下拉框
    $(document).on('click',function(){
        $('.select').removeClass('open');
    });
    
    
    
    var sidebarWidth=$("#sidebar").width();
    var mainWidth=$(".wy-content").width();
//    alert(sidebarWidth+"-----"+mainWidth+"----");
	$(".select").width(Number(mainWidth-sidebarWidth));
    $("#sort").css("top",Number($(".weui-header").height()));
    //initScollLoad();
});

function initScollLoad(){
	var loading = false;  //状态标记
	//下拉到100px时候自动请求加载
	$(".classify_scroll_load").infinite().on("infinite", function() {
	  if(loading) return;
	  loading = true;
	  setTimeout(function() {
	    $("#list").append("<p> 我是新加载的内容 </p>");
	    loading = false;
	  }, 1500);   //模拟延迟
	});
}


