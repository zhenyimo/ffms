<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!--底部导航-->
<div class="foot-black"></div>
<div class="weui-tabbar wy-foot-menu" style="margin-bottom:-2%;">
  <a href="../EntryController/gongzhonghaoIndex.do"  id="index" class="weui-tabbar__item weui-bar__item--on" >
    <div class="weui-tabbar__icon foot-menu-home"></div>
    <p class="weui-tabbar__label">首页</p>
  </a>
  <a href="../EntryController/gongzhonghaoIndex.do?tabName=classify" id="classify" class="weui-tabbar__item" >
    <div class="weui-tabbar__icon foot-menu-list"></div>
    <p class="weui-tabbar__label">分类</p>
  </a>
  <a href="../EntryController/gongzhonghaoIndex.do?tabName=gift" class="weui-tabbar__item" id="gift" >
    <span class="weui-badge" style="position: absolute;top: -.4em;right: 1em;">8</span>
    <div class="weui-tabbar__icon foot-menu-cart"></div>
    <p class="weui-tabbar__label">赠礼管理</p>
  </a>
  <a href="../EntryController/gongzhonghaoIndex.do?tabName=mine" class="weui-tabbar__item" id="mine" >
    <div class="weui-tabbar__icon foot-menu-member" style="color:green"></div>
    <p class="weui-tabbar__label">我的测评</p>
  </a>
</div>

<input type="hidden" id="tabName" value="${tab}">
<script>
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
  


</script> 
</body>
</html>