<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!--顶部搜索-->
<header class='weui-header'>
  <div class="weui-search-bar" id="searchBar">
    <form class="weui-search-bar__form">
      <div class="weui-search-bar__box">
        <i class="weui-icon-search"></i>
        <input type="search" class="weui-search-bar__input" id="searchInput" placeholder="搜索您想要的心理测评" required>
        <a href="javascript:" class="weui-icon-clear" id="searchClear"></a>
      </div>
      <label class="weui-search-bar__label" id="searchText" style="transform-origin: 0px 0px 0px; opacity: 1; transform: scale(1, 1);">
        <i class="weui-icon-search"></i>
        <span>搜索您想要的心理测评</span>
      </label>
    </form>
    <a href="javascript:" class="weui-search-bar__cancel-btn" id="searchCancel">取消</a>
  </div>
</header>
<!--主体-->
<div class='weui-content'>
 <div class="weui-panel weui-panel_access">
  <div class="weui-panel__bd">
  <img src="${basePath}/pages/front/images/${good.pictureName}"  style="width:100%;height:250px"/>
  </div>
</div>
  </div>
  
  
  
  
  <div class="weui-panel weui-panel_access" style="text-align:center;">
  <div class="weui-panel__bd">      
      <div class="weui-media-box__bd" >
        <h4 class="weui-media-box__title" style="font-weight:bold;font-size:1.7em" >${good.tittle}</h4>
        <p class="weui-media-box__desc">${good.description}</p><br>
        <a href="../EntryController/gongzhonghaoIndex.do?tabName=question"  class="weui-btn weui-btn_primary" style="width:50%">开始测试</a>    
        <div class="weui-form-preview__bd">
    <div class="weui-form-preview__item" >
      <label class="weui-form-preview__label" style="float:left">●50个精选题目</label>
       <label class="weui-form-preview__label" style="position: absolute;left:35%">●6页专业报告</label>
     <label class="weui-form-preview__label" style="float:right">●${good.paysuccessNumber}人测试过</label>
    </div>
    </div>
    </div>
  </div>
</div>


<div class="weui-panel weui-panel_access" >
  <div class="weui-panel__bd">      
      <div class="weui-media-box__bd" >
        <h4 class="weui-media-box__title" style="font-weight:bold;font-size:1.4em;text-align:center;" >测评介绍</h4>
        <p style="text-indent:2em;">
绝对没有。每一种配对都有利有弊。比如，两个“探险者”结合。他们不会争论怎么炒鸡肉，却容易沉迷不拔、鲁莽轻率或玩弄感情。其实我们每个人都是这4种人格类型的混合体，往往是次人格决定我们是谁，我们怎么去爱。对于大多数“探险者”来说，道德是可以变通的，但“探险者-建设者”很可能有更固定的道德观，并且寻找跟他们有着相同责任感的人为伴侣。
       </p>  
    </div>
    
       <div class="weui-media-box__bd"  >
        <h4 class="weui-media-box__title" style="font-weight:bold;font-size:1.4em;text-align:center;" >测评须知</h4>
        <p style="text-indent:2em;">
        1:绝对没有。每一种配对都有利有弊。比如，两个“探险者”结合。他们不会争论怎么炒鸡肉，却容易沉迷不拔、鲁莽轻率或玩弄感
       </p>
       <p style="text-indent:2em;">
        2:绝对没有。每一种配对都有利有弊。比如，两个“探险者”结合。他们不会争论怎么炒鸡肉，却容易沉迷不拔、鲁莽轻率或玩弄感
       </p>  
       <p style="text-indent:2em;">
        3:绝对没有。每一种配对都有利有弊。比如，两个“探险者”结合。他们不会争论怎么炒鸡肉，却容易沉迷不拔、鲁莽轻率或玩弄感
       </p>
    </div>
    
  </div>
</div>
  
  
    <div class="weui-footer">
  <p class="weui-footer__links">
  <a href="javascript:void(0);" class="weui-footer__link">底部链接</a>
  </p>
  <p class="weui-footer__text">Copyright © 2008-2016 weui.io</p>
  </div>
  
  
  
  
  
  
 
  
  
 
