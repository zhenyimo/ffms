require(['jquery','wx','constants'],function($,wx,constants){
	var debug=true;
	function resultHandler(data,successBack,failCallBack){
		if(data.code==constants.ajaxResult.success){
			callback(data);
		}else if(data.code>constants.ajaxResult.success){
			failCallBack(data);
		}else{
			console.log("UnKnown code : "+data);
		}
	}
	var jssdkConfig;
	
	
	function jssdkPlaceOrder(orderId){
		var timestamp=jssdkConfig.timestamp;
	    var noncestr=jssdkConfig.noncestr;
		$.ajax({
			url:pathContext+"/wx/jssdkPlaceOrder.do",
			dataType:"json",
			success:function(data){
				if(debug)
					console.log("jssdkPlaceOrder response : "+data);
				resultHandler(data,function(result){
					var orderMessage=JSON.parse(result.data);
					wx.chooseWXPay({
					    　　timestamp: orderMessage.timestamp, // 支付签名时间戳，注意微信jssdk中的所有使用timestamp字段均为小写。但最新版的支付后台生成签名使用的timeStamp字段名需大写其中的S字符
					    　　nonceStr: orderMessage.noncestr, // 支付签名随机串，不长于 32 位
					    　　package: orderMessage.package, // 统一支付接口返回的prepay_id参数值，提交格式如：prepay_id=***）
					    　　signType: orderMessage.signType, // 签名方式，默认为'SHA1'，使用新版支付需传入'MD5'
					    　　paySign: orderMessage.paySign, // 支付签名
					    　　success: function (res) {
					        　　// 支付成功后的回调函数
					    	
					    　　}
					});
				});
			}
		});
	}
	
	//init jssdk
	$.ajax({
		url:pathContext+"/wx/getJsSdkTicket.do",
		dataType:"json",
		success:function(data){
			if(debug)
				console.log("JsSdkTicket response : "+data);
			resultHandler(data,function(result){
				jssdkConfig=JSON.parse(result.data);
				//jssdk配置接口 
				wx.config({
				    debug: debug, // 开启调试模式,调用的所有api的返回值会在客户端alert出来，若要查看传入的参数，可以在pc端打开，参数信息会通过log打出，仅在pc端时才会打印。
				    appId: jssdkConfig.appId, // 必填，公众号的唯一标识
				    timestamp: jssdkConfig.timestamp, // 必填，生成签名的时间戳
				    nonceStr: jssdkConfig.noncestr, // 必填，生成签名的随机串
				    signature: jssdkConfig.sign,// 必填，签名
				    jsApiList: ['chooseWXPay','onMenuShareAppMessage'] // 必填，需要使用的JS接口列表，发起支付
				});
				
				
				//分享给朋友：
				wx.onMenuShareAppMessage({
					title: '测试分享', // 分享标题
					desc: '测试分享', // 分享描述
					link: pathContext+"/wx/hello.do", // 分享链接，该链接域名或路径必须与当前页面对应的公众号JS安全域名一致
					imgUrl: pathContext+"/pages/front/images/test.jpg", // 分享图标
					type: 'link', // 分享类型,music、video或link，不填默认为link
					dataUrl: '', // 如果type是music或video，则要提供数据链接，默认为空
					success: function () {
					// 用户确认分享后执行的回调函数
						alert("分享成功");
					},
					cancel: function () {
					// 用户取消分享后执行的回调函数
						alert("分享失败");
					}
					});
				
			})
		}
	});
});