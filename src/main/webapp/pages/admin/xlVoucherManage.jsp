<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/pages/admin/common/Head.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	
	function searchXlVoucher(){
		$("#dg").datagrid('load',{
			"name":$("#s_name").val(),
			"price":$("#s_price").val(),
			"flag":$("#s_flag").combobox("getValue"),
			"type":$("#s_type").combobox("getValue"),
			"validate":$("#s_validate").val(),
			"vo_num":$("#s_vo_num").val(),
			"goodId":$("s_goodId").val(),
			"stipulate_price":$("s_stipulate_price").val(),
			"create_user":$("s_create_user").val(),
			"update_user":$("s_update_user").val()
		});
	}
	
	function resetSearch(){
			$("#s_name").val("");
			$("#s_price").val("");
			$("#s_flag").combobox("setValue","");
			$("#s_type").combobox("setValue","");
			$("#s_validate").val("");
			$("#s_vo_num").val("");
			$("#s_goodId").val("");
			$("#s_stipulate_price").val("");
			$("#s_create_user").val("");
			$("#s_update_user").val("");
	}
	
	function deleteXlVoucher(){
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
		//alert(ids);
		$.messager.confirm("系统提示","您确认要删除这<font color=red>"+selectedRows.length+"</font>条数据吗？",function(r){
			//alert(r);
			if(r){
				$.post("${basePath}xlVoucherdelete.do",{ids:ids},function(result){
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
	
	
	function openXlVoucherAddDialog(){
		$("#dlg").dialog("open").dialog("setTitle","添加抵用券信息");
		url="${basePath}manage/xlVouchersave.do";
	}
	
	function valueChange(){
        var objS = document.getElementById("s_type");
        var value = objS.options[objS.selectedIndex].value;
        alert(value);
       }
	
	function openXlVoucherModifyDialog(){
		var selectedRows=$("#dg").datagrid('getSelections');
		if(selectedRows.length!=1){
			$.messager.alert("系统提示","请选择一条要编辑的数据！");
			return;
		}
		var row=selectedRows[0];
		$("#dlg").dialog("open").dialog("setTitle","编辑抵用券信息");
		$('#fm').form('load',row);
		url="${basePath}manage/xlVouchersave.do?id="+row.id;
	}
	
	function saveXlVoucher(){
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
		$("#name").val("");
	}
	
	function formatValidate(val){
		if(val==1){
			return "有效";
		}else if(val==2){
			return "无效";
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
		$("#finddlg").dialog("open").dialog("setTitle","查看抵用券信息");
		$("#fname").text(row.name);
		$("#fprice").text(row.price);
		$("#fflag").text(formatSex(row.flag));
		$("#ftype").text(row.type);
		$("#fvalidate").text(row.validate);
		$("#fvo_num").text(row.vo_num);
		$("#fgoodId").text(row.goodId);
		$("#fstipulate_price").text(row.stipulate_price);
		$("#fcreateuser").text(row.createuser);
		$("#fupdateuser").text(row.updateuser);
	}
    
    function closeFindDialog(){
		$('#finddlg').dialog('close');
	}
	
	function closeXlVoucherDialog(){
		$("#dlg").dialog("close");
		resetValue();
	}
</script>
</head>
<body style="margin:1px;">
	<table id="dg" title="抵用券管理" class="easyui-datagrid"
	 fitColumns="true" pagination="true" rownumbers="true"
	 url="${basePath}manage/xlVoucherlist.do" fit="true" toolbar="#tb" remoteSort="false" multiSort="true">
	 <thead>
	 	<tr>
	 		<th field="cb" checkbox="true" align="center"></th>
	 		<th field="id" width="50" align="center" sortable="true">编号</th>
	 		<th field="name" width="100" align="center" sortable="true">抵用券名称</th>
	 		<th field="price" width="100" align="center" sortable="true">抵用券价格</th>
	 		<th field="flag" width="100" align="center" formatter="formatValidate" sortable="true">抵用券是否有效</th>
	 		<th field="type" width="100" align="center" sortable="true">抵用券类型</th>
	 		<th field="validate" width="100" align="center" sortable="true">抵用券有效期</th>
	 		<th field="vo_num" width="100" align="center" sortable="true">抵用券数量</th>
	 		<th field="goodId" width="100" align="center" sortable="true">抵用券指定商品</th>
	 		<th field="stipulate_price" width="100" align="center" sortable="true">抵用券到达金额</th>
	 		<th field="create_user" width="100" align="center" sortable="true">抵用券创建者</th>
	 		<th field="update_user" width="100" align="center" sortable="true">抵用券修改者</th>
	 	</tr>
	 </thead>
	</table>
	<div id="tb">
		<div>
			<a href="javascript:openXlVoucherAddDialog()" class="easyui-linkbutton" iconCls="icon-add" plain="true">添加</a>
			<a href="javascript:openXlVoucherModifyDialog()" class="easyui-linkbutton" iconCls="icon-edit" plain="true">修改</a>
			<a href="javascript:deleteXlVoucher()" class="easyui-linkbutton" iconCls="icon-remove" plain="true">删除</a>
		</div>
		<div>
			&nbsp;抵用券名称：&nbsp;<input type="text" id="s_name" size="15" onkeydown="if(event.keyCode==13) searchXlVoucher()"/>
		    &nbsp;抵用券价格：&nbsp;<input type="text" id="s_price" size="15" onkeydown="if(event.keyCode==13) searchXlVoucher()"/>
			&nbsp;抵用券是否有效：&nbsp;<select class="easyui-combobox" id="s_flag"  editable="false" style="width:140px;">
					<option value="" selected="selected">请选择是否有效...</option>
					<option value="1">有效</option>
					<option value="2">无效</option>
				</select>&nbsp;
			&nbsp;抵用券类型：&nbsp;<select class="easyui-combobox" id="s_type" editable="false" style="width:140px;" onchange="typeChange()">
					<option value="" selected="selected">请选择类型...</option>
					<option value="1">不指定某题的</option>
					<option value="2">指定某题的</option>
				</select>&nbsp;
			&nbsp;抵用券有效期：&nbsp;<input type="text" class="easyui-datebox" id="s_validate" size="15" onkeydown="if(event.keyCode==13) searchXlVoucher()"/>
		    &nbsp;抵用券数量：&nbsp;<input type="text" id="s_vo_num" size="15" onkeydown="if(event.keyCode==13) searchXlVoucher()"/>
		    &nbsp;抵用券指定商品：&nbsp;<select class="easyui-combobox" id="s_goodid"  editable="false" style="width:140px;" >					
					<option value="" selected="selected">请选择商品...</option>
	 				<c:forEach items="${goods }" var="good">
						<option value="${good.id }">${good.tittle }</option>
					</c:forEach>
					<option value="">无</option>
				</select>
		    &nbsp;抵用券创建者：&nbsp;<input type="text" id="s_create_user" size="15" onkeydown="if(event.keyCode==13) searchXlVoucher()"/>
		    &nbsp;抵用券修改者：&nbsp;<input type="text" id="s_update_user" size="15" onkeydown="if(event.keyCode==13) searchXlVoucher()"/>
			<a href="javascript:searchXlVoucher()" class="easyui-linkbutton" iconCls="icon-search" plain="true">搜索</a>
			<a href="javascript:resetSearch()" class="easyui-linkbutton" iconCls="icon-reset" plain="true">清空</a>
		</div>
	</div>
	
	<div id="dlg" class="easyui-dialog" style="width: 670px;height:300px;padding: 10px 20px" closed="true" buttons="#dlg-buttons">
	 	<form id="fm" method="post">
	 		<table cellspacing="8px">
	 			<tr>
	 				<td>抵用券名称：</td>
	 				<td><input type="text" id="name" name="name" class="easyui-validatebox easyui-textbox" required="true"/>&nbsp;<font color="red">*</font></td>
				</tr>
				<tr>
	 				<td>抵用券价格：</td>
	 				<td><input type="text" id="price" name="price" class="easyui-validatebox easyui-textbox" required="true"/>&nbsp;<font color="red">*</font></td>
				</tr>
				<tr>
	 				<td>抵用券是否有效：</td>
	 				<td>
                    <select class="easyui-combobox" id="flag" name="flag" editable="false" style="width:175px;">
	 						<option value="" selected>请选择...</option>
	 						<option value="1">有效</option>
	 						<option value="2">无效</option>
	 					</select>&nbsp;<font color="red">*</font></td>
				</tr>
			    <tr>
	 				<td>抵用券类型：</td>
	 				<td><select class="easyui-combobox" id="type" name="type" editable="false" style="width:175px;">
	 						<option value="" selected>请选择...</option>
	 						<option value="1">不指定某题的</option>
	 						<option value="2">指定某题的</option>
	 					</select>&nbsp;<font color="red">*</font></td>
				</tr>
				<tr>
	 				<td>抵用券有效期：</td>
	 				<td><input type="text" id="validate" name="validate" class="easyui-validatebox easyui-datebox" required="true"/>&nbsp;<font color="red">*</font></td>
				</tr>
				<tr>
	 				<td>抵用券数量：</td>
	 				<td><input type="text" id="vo_num" name="vo_num" class="easyui-validatebox easyui-textbox" required="true"/>&nbsp;<font color="red">*</font></td>
	 			</tr>
				<tr>
	 			    <td>抵用券指定商品：</td>
	 			    <td>
				<select class="easyui-combobox" id="goodid" name="goodid" editable="false" style="width:175px;">
					<option value="">请选择商品...</option>
	 				<c:forEach items="${goods }" var="good">
						<option value="${good.id }">${good.tittle }</option>
					</c:forEach>
				</select>&nbsp;<font color="red">*</font>
				</td>
				</tr>
				
	 		</table>
	 	</form>
	</div>
	<div id="dlg-buttons">
		<a href="javascript:saveXlVoucher()" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
		<a href="javascript:closeXlVoucherDialog()" class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
	</div>
		<div id="finddlg" class="easyui-dialog" style="width: 670px;height:300px;padding: 10px 20px" closed="true" buttons="#finddlg-buttons">
	 	<table cellspacing="8px" class="findtable" width="100%">
	 		<tr>
	 			<td>抵用券名：</td>
	 			<td><span id="fname"></span></td>
	 			<td>抵用券价格：</td>
	 			<td><span id="fprice"></span></td>
	 		</tr>
	 		<tr>
	 			<td>抵用券是否有效：</td>
	 			<td><span id="fflag"></span></td>
	 			<td>抵用券类型：</td>
	 			<td><span id="ftype"></span></td>
	 		</tr>
	 		<tr>
	 			<td>抵用券有效期：</td>
	 			<td><span id="fvalidate"></span></td>
	 			<td>抵用券数量：</td>
	 			<td><span id="f_vo_num"></span></td>
	 		</tr>
	 		<tr>
	 			<td>抵用券指定商品：</td>
	 			<td><span id="fgoodid"></span></td>
	 		</tr>
	 		<tr>
	 			<td>创建用户：</td>
	 			<td><span id="fcreateuser"></span></td>
	 			<td>修改用户：</td>
	 			<td><span id="fupdateuser"></span></td>
	 		</tr>
	 	</table>
	</div>
		<div id="finddlg-buttons">
		<a href="javascript:closeFindDialog()" class="easyui-linkbutton" iconCls="icon-ok">确定</a>
	</div>
</body>
</html>