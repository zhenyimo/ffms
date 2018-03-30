define("commonUtils",function(){
	var debug=true;
	var ajaxResult={
		success:0,
		failAlert:1,
		failConfirm:2
	}
	return {
		debug:debug,
		ajaxResult:ajaxResult,
		jsonResultHandler:function(data,successBack,failCallBack){
			if(data.code==ajaxResult.success){
				successBack(data);
			}else if(data.code>ajaxResult.success){
				failCallBack(data);
			}else{
				if(debug)
					console.log("UnKnown code : "+data);
			}
		}
	}
});