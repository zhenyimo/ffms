<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!--底部导航-->
<div class="foot-black"></div>
<div class="weui-tabbar wy-foot-menu">
  <a href="${basePath}/EntryController/gongzhonghaoIndex.do?tabName=index" class="weui-tabbar__item weui-bar__item--on">
    <div class="weui-tabbar__icon foot-menu-home"></div>
    <p class="weui-tabbar__label">首页</p>
  </a>
  <a href="${basePath}/EntryController/gongzhonghaoIndex.do?tabName=classifyIndex" class="weui-tabbar__item">
    <div class="weui-tabbar__icon foot-menu-list"></div>
    <p class="weui-tabbar__label">分类</p>
  </a>
  <a href="${basePath}/EntryController/gongzhonghaoIndex.do?tabName=giftIndex" class="weui-tabbar__item">
    <span class="weui-badge" style="position: absolute;top: -.4em;right: 1em;">8</span>
    <div class="weui-tabbar__icon foot-menu-cart"></div>
    <p class="weui-tabbar__label">赠送管理</p>
  </a>
  <a href="${basePath}/EntryController/gongzhonghaoIndex.do?tabName=userMngIndex" class="weui-tabbar__item">
    <div class="weui-tabbar__icon foot-menu-member"></div>
    <p class="weui-tabbar__label">我的</p>
  </a>
</div>
<script>
  $(function() {
    FastClick.attach(document.body);
  });
</script> 
</body>
</html>