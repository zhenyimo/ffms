define(function(){
	var initBottomNavBar=function(){
		//底部导航
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
	};
	
	function homeStyleChange(){
	     $("#index").find("div").removeClass("foot-menu-home").addClass("foot-menu-home2");
	     $("#index").find("p").css("color","#666");
	}
	return {
		initBottomNavBar:initBottomNavBar
	};
});