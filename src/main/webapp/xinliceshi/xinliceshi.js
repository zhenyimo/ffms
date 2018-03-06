/**
 * 
 */
	$(function(){
		$("#ith").combobox({
			panelHeight:200,
			onChange:function(newVal, oldVal){
				var oldHref = $('.uiTheme').attr('href');
				var newHref = oldHref.substring(0,oldHref.indexOf('themes')) + 'themes/' + newVal + '/easyui.css';
				//console.log(newHref);
				$('.uiTheme').attr('href', newHref);
				//设置cookie值，并设置7天有效时间
				$.cookie('themeName', newVal, {
					expires : 7
				});
			}
		});
		$.post("${basePath}moneyAnalysis.do", {}, function(result) {
			$.messager.show({
                title:'金额提醒',
                msg:'您目前的消费金额情况如下：<br/>总收入金额：'+result.totalIncomeMoney+"元。<br/>总支出金额："+result.totalPayMoney+"元。<br/>您的余额为："+result.totalLostMoney+"元。",
                timeout:30000,
                showType:'show',
                height:'100%'
            });
		},"json");
		setMoneyTime();
		function setMoneyTime(){
			setTimeout(function(){
		        $.post("${basePath}moneyAnalysis.do", {}, function(result) {
		        	setMoneyTime();
		        	if(result.totalLostMoney<2000){
		        		$.messager.show({
		                     title:'金额提醒',
		                     msg:'您的余额已不足2000元。<br/>您目前的消费金额情况如下：<br/>总收入金额：'+result.totalIncomeMoney+"元。<br/>总支出金额："+result.totalPayMoney+"元。<br/>您的余额为："+result.totalLostMoney+"元。",
		                     timeout:20000,
		                     showType:'show',
		                     height:'100%'
		                });
		        	}
		    	},"json");
		    },60000);
		}
	});
	
	var url;

	function openTab(text, url, iconCls) {
		if ($("#tabs").tabs("exists", text)) {
			$("#tabs").tabs("select", text);
		} else {
			var content = "<iframe frameborder=0 scrolling='auto' style='width:100%;height:100%' src='${basePath}"
					+ url + "'></iframe>";
			$("#tabs").tabs("add", {
				title : text,
				iconCls : iconCls,
				closable : true,
				content : content
			});
		}
	}

	function openPasswordModifyDialog() {
		$("#dlg").dialog("open").dialog("setTitle", "修改密码");
		url = "${basePath}modifyPassword.do?id=${currentUser.id}";
	}

	function closePasswordModifyDialog() {
		$("#dlg").dialog("close");
		$("#oldPassword").val("");
		$("#newPassword").val("");
		$("#newPassword2").val("");
	}

	function modifyPassword() {
		$("#fm").form("submit", {
			url : url,
			onSubmit : function() {
				var oldPassword = $("#oldPassword").val();
				var newPassword = $("#newPassword").val();
				var newPassword2 = $("#newPassword2").val();
				if (!$(this).form("validate")) {
					return false;
				}
				if (oldPassword != '${currentUser.password}') {
					$.messager.alert("系统提示", "用户原密码输入错误！");
					return false;
				}
				if (newPassword != newPassword2) {
					$.messager.alert("系统提示", "确认密码输入错误！");
					return false;
				}
				return true;
			},
			success : function(result) {
				var result = eval('(' + result + ')');
				if (result.success) {
					$.messager.alert("系统提示", "密码修改成功，下一次登录生效！");
					closePasswordModifyDialog();
				} else {
					$.messager.alert("系统提示", "密码修改失败");
					return;
				}
			}
		});
	}
	
	function openMessageModifyDialog(){
		$("#mdlg").dialog("open").dialog("setTitle", "修改用户信息");
		url = "${basePath}usersave.do?id=${currentUser.id}";
	}
	
	function modifyMessage(){
		$("#mfm").form("submit",{
			url:url,
			onSubmit:function(){
				if($("#roleid").combobox("getValue")==""||$("#roleid").combobox("getValue")==null){
					$.messager.alert("系统提示","请选择用户角色！");
					return false;
				}
				if($("#sex").combobox("getValue")==""||$("#sex").combobox("getValue")==null){
					$.messager.alert("系统提示","请选择性别！");
					return false;
				}
				return $(this).form("validate");
			},
			success:function(result){
				var result=eval('('+result+')');
				if(result.errres){
					$.messager.alert("系统提示",result.errmsg);
					$("#mdlg").dialog("close");
				}else{
					$.messager.alert("系统提示",result.errmsg);
					return;
				}
			}
		});
	}
	
	function closeMessageModifyDialog(){
		$("#mdlg").dialog("close");
	}

	function logout() {
		$.messager.confirm("系统提示", "您确定要退出系统吗", function(r) {
			if (r) {
				window.location.href = "${basePath}logout.do";
			}
		});
	}