define(['jquery','commonUtils','wx'],function($,commonUtils,wx){
	var jssdkConfig;
	var jssdkFunctionMap={
		onMenuShareAppMessage:function(Options){
			var shareConfig={
					title:'心理测试题',
					desc:'测试描述',
					link:pathContext+"/wx/test.do",
					imgUrl: pathContext+"/pages/front/images/test.jpg",
					type: 'link',
					success: function () {alert("分享成功");},
					ancel: function () {alert("分享失败");}
				}
				for(var key in Options){
					shareConfig[key]=Options[key];
				}
				//初始化分享给朋友：
			wx.onMenuShareAppMessage(shareConfig);
		},
		placeOrder:function(orderId,successCallBack,FailCallBack){
			var timestamp=jssdkConfig.timestamp;
		    var noncestr=jssdkConfig.noncestr;
			$.ajax({
				url:pathContext+"/front/wx/jssdkPlaceOrder.do",
				dataType:"json",
				data:{
					orderId:orderId,
					timestamp:timestamp,
					noncestr:noncestr
				},
				success:function(data){	
					if(commonUtils.debug){
						console.log("jssdkPlaceOrder response : "+data);
						alert("jssdkPlaceOrder response : "+data.data);
					}	
					commonUtils.jsonResultHandler(data,function(result){
						var orderMessage=JSON.parse(result.data);
						wx.chooseWXPay({
						    timestamp: orderMessage.timeStamp, // 支付签名时间戳，注意微信jssdk中的所有使用timestamp字段均为小写。但最新版的支付后台生成签名使用的timeStamp字段名需大写其中的S字符
						    nonceStr: orderMessage.nonceStr, // 支付签名随机串，不长于 32 位
						    package: orderMessage.package, // 统一支付接口返回的prepay_id参数值，提交格式如：prepay_id=***）
						    signType: orderMessage.signType, // 签名方式，默认为'SHA1'，使用新版支付需传入'MD5'
						    paySign: orderMessage.paySign, // 支付签名
						    success: function (res) {
						        // 支付成功后的回调函数
						    	successCallBack(res);
						    }
						});
					});
				}
			});
		}
	}
	//init jssdk
	$.ajax({
		url:pathContext+"/front/wx/jssdkConfig.do",
		data:{
			locationHref:location.href.split('#')[0]
		},
		dataType:"json",
		success:function(data){
			if(commonUtils.debug)
				console.log("JsSdkTicket response : "+JSON.stringify(data));
			commonUtils.jsonResultHandler(data,function(result){
				jssdkConfig=JSON.parse(result.data);
				var jsApiListStr=$("#jsApiListInit").val()||'';
				var jsApiList=jsApiListStr.split(",");
				//jssdk配置接口 
				wx.config({
				    debug: commonUtils.debug, // 开启调试模式,调用的所有api的返回值会在客户端alert出来，若要查看传入的参数，可以在pc端打开，参数信息会通过log打出，仅在pc端时才会打印。
				    appId: jssdkConfig.appId, // 必填，公众号的唯一标识
				    timestamp: jssdkConfig.timestamp, // 必填，生成签名的时间戳
				    nonceStr: jssdkConfig.noncestr, // 必填，生成签名的随机串
				    signature: jssdkConfig.sign,// 必填，签名
				    jsApiList:jsApiList // 必填，需要使用的JS接口列表，发起支付
				});
				wx.ready(function(res){
					if(jsApiListStr.indexOf('onMenuShareAppMessage')>=0){
						jssdkFunctionMap['onMenuShareAppMessage']();
					}
				});
				
				
				
			})
		}
	});
	
	return {
		placeOrder:jssdkFunctionMap['placeOrder'],
		onMenuShareAppMessage:jssdkFunctionMap['onMenuShareAppMessage']
	}
});