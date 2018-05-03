<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/pages/admin/common/Head.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link class="uiTheme" rel="stylesheet" type="text/css" href="${basePath}jquery-easyui-1.3.3/themes/<%=themeName %>/easyui.css">
<link rel="stylesheet" type="text/css" href="${basePath}jquery-easyui-1.3.3/themes/icon.css">
<script type="text/javascript" src="${basePath}jquery-easyui-1.3.3/jquery.min.js"></script>
<script type="text/javascript" src="${basePath}jquery-easyui-1.3.3/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${basePath}jquery-easyui-1.3.3/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="${basePath}jquery-easyui-1.3.3/jquery.cookie.js"></script>
<script type="text/javascript">

	var url;
	
	function searchAuthority(){
		$("#dg").datagrid('load',{
			"authorityame":$("#s_authorityname").val()
		});
	}
	
	function resetSearch(){
		$("#s_authorityname").val("");
	}
	
	function deleteAuthority(){
		var selectedRows=$("#dg").datagrid('getSelections');
		if(selectedRows.length==0){
			$.messager.alert("系统提示","请选择要删除的数据！");
			return;
		}
		var strIds=[];
		for(var i=0;i<selectedRows.length;i++){
			strIds.push(selectedRows[i].id);
		}
		var ids=strIds.join(",");
		$.messager.confirm("系统提示","您确认要删除这<font color=red>"+selectedRows.length+"</font>条数据吗？",function(r){
			if(r){
				$.post("${basePath}authoritydelete.do",{ids:ids},function(result){
					if(result.errres){
						$.messager.alert("系统提示",result.errmsg);
						$("#dg").datagrid("reload");
					}else{
						$.messager.alert("系统提示","数据删除失败！");
					}
				},"json");
			}
		});
	}
	
	
	function openAuthorityAddDialog(){
		$("#dlg").dialog("open").dialog("setTitle","添加权限信息");
		url="${basePath}manage/authoritysave.do";
	}
	
	function openAuthorityModifyDialog(){
		var selectedRows=$("#dg").datagrid('getSelections');
		if(selectedRows.length!=1){
			$.messager.alert("系统提示","请选择一条要编辑的数据！");
			return;
		}
		var row=selectedRows[0];
		alert(row);
		$("#dlg").dialog("open").dialog("setTitle","编辑权限信息");
		$('#fm').form('load',row);
		alert(row.id);
		url="${basePath}manage/authoritysave.do?id="+row.id;
	}
	
	function saveAuthority(){
		$("#fm").form("submit",{
			url:url,
			onSubmit:function(){
				return $(this).form("validate");
			},
			success:function(result){
				var result=eval('('+result+')');
				if(result.errres){
					$.messager.alert("系统提示",result.errmsg);
					resetValue();
					$("#dlg").dialog("close");
					$("#dg").datagrid("reload");
				}else{
					$.messager.alert("系统提示",result.errmsg);
					return;
				}
			}
		});
	}
	
	function resetValue(){
		$("#authorityname").val("");
	}
	
	function closeAuthorityDialog(){
		$("#dlg").dialog("close");
		resetValue();
	}
</script>
</head>
<body style="margin:1px;">
	<table id="dg" title="权限管理" class="easyui-datagrid"
	 fitColumns="true" pagination="true" rownumbers="true"
	 url="${basePath}manage/authoritylist.do" fit="true" toolbar="#tb" remoteSort="false" multiSort="true">
	 <thead>
	 	<tr>
	 		<th field="cb" checkbox="true" align="center"></th>
	 		<th field="authorityid" width="50" align="center" sortable="true">编号</th>
	 		<th field="authorityname" width="100" align="center" sortable="true">权限名称</th>
	 	</tr>
	 </thead>
	</table>
	<div id="tb">
		<div>
			<a href="javascript:openAuthorityAddDialog()" class="easyui-linkbutton" iconCls="icon-add" plain="true">添加</a>
			<a href="javascript:openAuthorityModifyDialog()" class="easyui-linkbutton" iconCls="icon-edit" plain="true">修改</a>
			<a href="javascript:deleteAuthority()" class="easyui-linkbutton" iconCls="icon-remove" plain="true">删除</a>
		</div>
		<div>
			&nbsp;权限名称：&nbsp;<input type="text" id="s_authorityname" size="15" onkeydown="if(event.keyCode==13) searchAuthority()"/>
			<a href="javascript:searchAuthority()" class="easyui-linkbutton" iconCls="icon-search" plain="true">搜索</a>
			<a href="javascript:resetSearch()" class="easyui-linkbutton" iconCls="icon-reset" plain="true">清空</a>
		</div>
	</div>
	
	<div id="dlg" class="easyui-dialog" style="width: 320px;height:150px;padding: 10px 20px" closed="true" buttons="#dlg-buttons">
	 	<form id="fm" method="post">
	 		<table cellspacing="8px">
	 			<tr>
	 				<td>权限名称：</td>
	 				<td><input type="text" id="authorityname" name="authorityname" class="easyui-validatebox easyui-textbox" required="true"/>&nbsp;<font color="red">*</font></td>
				</tr>
	 		</table>
	 	</form>
	</div>
	<div id="dlg-buttons">
		<a href="javascript:saveAuthority()" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
		<a href="javascript:closeAuthorityDialog()" class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
	</div>
</body>
</html>