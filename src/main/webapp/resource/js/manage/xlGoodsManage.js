/**
 * 
 */

	var url;
	
	function searchUser(){
		$("#dg").datagrid('load',{
			"username":$("#s_username").val(),
			"truename":$("#s_truename").val(),
			"appellation":$("#s_appellation").val(),
			"sex":$("#s_sex").combobox("getValue"),
			"roleid":$("#s_roleid").combobox("getValue")
		});
	}
	
	function resetSearch(){
		$("#s_username").val("");
		$("#s_truename").val("");
		$("#s_appellation").val("");
		$("#s_sex").combobox("setValue","");
		$("#s_roleid").combobox("setValue","");
	}
	
	function deleteUser(){
		var selectedRows=$("#dg").datagrid('getSelections');
		if(selectedRows.length==0){
			$.messager.alert("系统提示","请选择要删除的数据！","info");
			return;
		}
		var strIds=[];
		for(var i=0;i<selectedRows.length;i++){
			strIds.push(selectedRows[i].id);
		}
		var ids=strIds.join(",");
		$.messager.confirm("系统提示","您确认要删除这<font color=red>"+selectedRows.length+"</font>条数据吗？",function(r){
			if(r){
				$.post(pathContext+"userdelete.do",{ids:ids},function(result){
					if(result.errres){
						$.messager.alert("系统提示",result.errmsg,"info");
						$("#dg").datagrid("reload");
					}else{
						$.messager.alert("系统提示","数据删除失败！","error");
					}
				},"json");
			}
		});
	}
	
	
	function openUserAddDialog(){
		$("#dlg").dialog("open").dialog("setTitle","添加用户信息");
		url=pathContext+"manage/usersave.do";
	}
	
	function openUserModifyDialog(){
		var selectedRows=$("#dg").datagrid('getSelections');
		if(selectedRows.length!=1){
			$.messager.alert("系统提示","请选择一条要编辑的数据！","info");
			return;
		}
		var row=selectedRows[0];
		$("#dlg").dialog("open").dialog("setTitle","编辑用户信息");
		$('#fm').form('load',row);
		url=pathContext+"manage/usersave.do?id="+row.id;
	}
	
	function saveUser(){
		$("#fm").form("submit",{
			url:url,
			onSubmit:function(){
				if($("#roleid").combobox("getValue")==""||$("#roleid").combobox("getValue")==null){
					$.messager.alert("系统提示","请选择用户角色！","error");
					return false;
				}
				if($("#sex").combobox("getValue")==""||$("#sex").combobox("getValue")==null){
					$.messager.alert("系统提示","请选择性别！","error");
					return false;
				}
				var PhoneFont = /^1(3|4|5|7|8)\d{9}$/;
		        if($("#phone").val()!=''&&!PhoneFont.test($("#phone").val())){
		        	$.messager.alert("系统提示","手机号格式错误，请重新输入！","error");
		            return false;
		        }
				return $(this).form("validate");
			},
			success:function(result){
				var result=eval('('+result+')');
				if(result.errres){
					$.messager.alert("系统提示",result.errmsg,"info");
					resetValue();
					$("#dlg").dialog("close");
					$("#dg").datagrid("reload");
				}else{
					$.messager.alert("系统提示",result.errmsg,"error");
					return;
				}
			}
		});
	}
	
	function resetValue(){
		$("#username").val("");
		$("#password").val("");
		$("#truename").val("");
		$("#email").val("");
		$("#phone").val("");
		$("#address").val("");
		$("#age").val("");
		$("#appellation").val("");
		$("#salary").val("");
		$("#card").val("");
		$("#sex").combobox("setValue","");
		$("#roleid").combobox("setValue","");
	}
	
	function closeUserDialog(){
		$("#dlg").dialog("close");
		resetValue();
	}
	
	function formatSex(val){
		if(val==1){
			return "男";
		}else if(val==2){
			return "女";
		}else{
			return "未定义";
		}
	}
	
	function openUserFindDialog(){
		var selectedRows=$("#dg").datagrid('getSelections');
		if(selectedRows.length!=1){
			$.messager.alert("系统提示","请选择一条要查看的数据！","info");
			return;
		}
		var row=selectedRows[0];
		$("#finddlg").dialog("open").dialog("setTitle","查看用户信息");
		$("#fusername").text(row.username);
		$("#fpassword").text(row.password);
		$("#fsex").text(formatSex(row.sex));
		$("#fage").text(row.age);
		$("#ftruename").text(row.truename);
		$("#femail").text(row.email);
		$("#fphone").text(row.phone);
		$("#faddress").text(row.address);
		$("#fappellation").text(row.appellation);
		$("#fsalary").text(row.salary);
		$("#fcard").text(row.card);
		$("#frolename").text(row.rolename);
		$("#fcreatetime").text(row.createtime);
		$("#fupdatetime").text(row.updatetime);
	}
	
	function closeFindDialog(){
		$('#finddlg').dialog('close');
	}
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