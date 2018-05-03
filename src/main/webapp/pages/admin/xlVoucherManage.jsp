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

    $(function(){
	var typeData = [{text:"不指定某题的",value:"1"},{text:"指定某题的",value:"2"}];

	//调用后台xlGoodController的xlGoodlist方法
	$.ajax({
	   url:'xlGoodController/xlGoodlist.do',
	   type:'post',
	   dataType:'json',
	   success:function(result){
	     //成功回调
	    //alert(result);
	   },
	   error : function(result) {
	      //alert(result);
	   }
	
	});
	//var goodoptions02 = document.getElementById("goodnames").value;
	//var goodoptions02 = ${goodnames};
    var goodData = ${goods};
    //JSONArray jsonArray = JSONArray.fromObject(goodData);//将goodlist转化为JSON数组
    var goodoptions02object = {};//JSON对象
    var goodoptions02 = [];//JSON数组
    
 	for(var i=0;i<goodData.length;i++){
 	  //goodoptions02object.push({text:'goodData[i].tittle',id:'goodData[i].id'});
 	   	goodoptions02object["text"]=goodData[i].tittle;
 	   	goodoptions02object["value"]=goodData[i].id;
 	    goodoptions02.push(goodoptions02object);
 	  //goodoptions02.push({text:goodData[i].tittle,id:goodData[i].id});
	}
	var goodoptions01 = [{text : "无", value : "1"}];
 	/*for(int i=0;i<goodData.length;i++){
	   if(i!=goodData.length-1){
	   goodoptions02+="{text:"+goodData[i].tittle+",value:"+goodData[i].id+"},";
	   }else{
	   goodoptions02+="{text:"+goodData[i].tittle+",value:"+goodData[i].id+"}]";
	   } 
	   
	}*/
	//初始化查询抵用券类型的下拉列表
	$("#s_type").combobox({
	  valueField: 'value',
	  textField: 'text',
	  data : typeData,
	  panelHeight:170,
	  onSelect: function(){
	  var myOptValue = $("#s_type").combobox("getValue");
	   //1.清空原来的s_type这个combobox中的选项
	   $("#s_goodid").combobox("clear");  
	   //2.动态添加"抵用券指定商品"的下拉列表框的option
	  if(myOptValue != null && (myOptValue == "1")){	  
	  console.info("myOptValue = "+myOptValue);
	  $("#s_goodid").combobox({

	     panelHeight:50,
         data :	goodoptions01  
	  }); 	  
    }else if (myOptValue != null && myOptValue == "2"){
    
      $("#s_goodid").combobox({
         panelHeight:140,
         data : goodoptions02       
      });
    }
   }
   });
	
	//初始化goods的下拉列表
	$("#s_goodid").combobox({
	  valueField: 'value',
	  textField : 'text',
	  data : goodoptions01,
	  panelHeight:140,	
	});
	});
	
	
	
    var url;
	function searchXlVoucher(){
	    	    if($("#s_flag").combobox("getValue")==""||$("#s_flag").combobox("getValue")==null){
					$.messager.alert("系统提示","请选择抵用券是否有效！","error");
					return false;
				}
	    	    if($("#s_type").combobox("getValue")==""||$("#s_type").combobox("getValue")==null){
					$.messager.alert("系统提示","请选择抵用券类型！","error");
					return false;
				}
				if($("#s_goodid").combobox("getValue")==""||$("#s_goodid").combobox("getValue")==null){
					$.messager.alert("系统提示","请选择抵用券指定商品！","error");
					return false;
				}
				var price = /^[1-9][0-9]$/;
		        if($("#s_price").val()!=''&&!price.test($("#s_price").val())){
		        	$.messager.alert("系统提示","抵用券价格格式错误，请重新输入！","error");
		            return false;
		        }
		        var vo_num = /^[1-2][0-9]$/;
		        if($("#s_vo_num").val()!=''&&!vo_num.test($("#s_vo_num").val())){
		        	$.messager.alert("系统提示","抵用券数量格式错误，请重新输入！","error");
		            return false;
		        }
		        var stipulate_price = /^[1-3][0-9][0-9]$/;
		        if($("#s_stipulate_price").val()!=''&&!stipulate_price.test($("#s_stipulate_price").val())){
		        	$.messager.alert("系统提示","抵用券到达金额格式错误，请重新输入！","error");
		            return false;
		        }
		$("#dg").datagrid('load',{
			"name":$("#s_name").val(),
			"price":$("#s_price").val(),
			"flag":$("#s_flag").combobox("getValue"),
			"type":$("#s_type").combobox("getValue"),
			//"validate":$("#s_validate").val(),
			"validate":$("#s_validate").datebox("getValue"),
			//"vo_num":$("#s_vo_num").val(),
			"voNum":$("#s_vo_num").val(),
			//"goodId":$("s_goodId").val(),
			//"stipulate_price":$("s_stipulate_price").val(),
			//"create_user":$("s_create_user").val(),
			//"update_user":$("s_update_user").val()
			"goodname":$("#s_goodid").combobox("getValue"),
			//"goodId":$("s_goodid").combobox("getValue"),
			"stipulatePrice":$("#s_stipulate_price").val(),
			"createuser":$("#s_create_user").val(),
			"updateuser":$("#s_update_user").val()
		});
	}
	
	function resetSearch(){
			$("#s_name").val("");
			$("#s_price").val("");
			$("#s_flag").combobox("setValue","");
			$("#s_type").combobox("setValue","");
			//$("#s_type").val("");
			//$("#s_validate").val("");
			$("#s_validate").datebox("setValue", "");
			$("#s_vo_num").val("");
			$("#s_goodid").combobox("setValue","");
			//$("#s_goodid").val("");
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
		//resetValue();
		//$("#createuser").val(${usermessage.username});
	var typeData = [{text:"不指定某题的",value:"1"},{text:"指定某题的",value:"2"}];

	//调用后台xlGoodController的xlGoodlist方法
	$.ajax({
	   url:'xlGoodController/xlGoodlist.do',
	   type:'post',
	   dataType:'json',
	   success:function(result){
	     //成功回调
	    //alert(result);
	   },
	   error : function(result) {
	     //alert(result);
	   }
	
	});
	//var goodoptions02 = document.getElementById("goodnames").value;
	//var goodoptions02 = ${goodnames};
    var goodData = ${goods};
    //JSONArray jsonArray = JSONArray.fromObject(goodData);//将goodlist转化为JSON数组
    var goodoptions02object = {};//JSON对象
    var goodoptions02 = [];//JSON数组
    
 	for(var i=0;i<goodData.length;i++){
 	  //goodoptions02object.push({text:'goodData[i].tittle',id:'goodData[i].id'});
 	   	goodoptions02object["text"]=goodData[i].tittle;
 	   	goodoptions02object["value"]=goodData[i].id;
 	    goodoptions02.push(goodoptions02object);
 	  //goodoptions02.push({text:goodData[i].tittle,id:goodData[i].id});
	}
	var goodoptions01 = [{text : "无", value : "1"}];
 	/*for(int i=0;i<goodData.length;i++){
	   if(i!=goodData.length-1){
	   goodoptions02+="{text:"+goodData[i].tittle+",value:"+goodData[i].id+"},";
	   }else{
	   goodoptions02+="{text:"+goodData[i].tittle+",value:"+goodData[i].id+"}]";
	   } 
	   
	}*/
	//初始化查询抵用券类型的下拉列表
	$("#type").combobox({
	  valueField: 'value',
	  textField: 'text',
	  data : typeData,
	  panelHeight:170,
	  onSelect: function(){
	  var myOptValue = $("#type").combobox("getValue");
	   //1.清空原来的s_type这个combobox中的选项
	   //$("#goodid").combobox("clear");
	   //$("#goodname").combobox("clear");
	   $("#goodId").combobox("clear");
	   //2.动态添加"抵用券指定商品"的下拉列表框的option
	  if(myOptValue != null && (myOptValue == "1")){	  
	  console.info("myOptValue = "+myOptValue);
	  //$("#goodid").combobox({
      //$("#goodname").combobox({
      $("#goodId").combobox({
	     panelHeight:50,
         data :	goodoptions01  
	  }); 	  
    }else if (myOptValue != null && myOptValue == "2"){
   
      //$("#goodid").combobox({
      //$("#goodname").combobox({
      $("#goodId").combobox({
         panelHeight:140,
         data : goodoptions02       
      });
    }
   }
   });
	
	//初始化goods的下拉列表
	//$("#goodid").combobox({
	//$("#goodname").combobox({
	$("#goodId").combobox({
	  valueField: 'value',
	  textField : 'text',
	  data : goodoptions01,
	  panelHeight:140,	
	});
	//alert(${usernamemessage});
	//$("#createuser").val(${usernamemessage});
	//$("#createuser").val(${currentUser.username});
	//$("#createuser").val(${usermessage.username});
	//$("#createuser").val(${usersession.username});
	url="${basePath}manage/xlVouchersave.do";
	}
	
	function openXlVoucherModifyDialog(){
		var selectedRows=$("#dg").datagrid('getSelections');
		if(selectedRows.length!=1){
			$.messager.alert("系统提示","请选择一条要编辑的数据！");
			return;
		}
		var row=selectedRows[0];
	    resetValue();
		$("#dlg").dialog("open").dialog("setTitle","编辑抵用券信息");
		//row.type=formatType(row.type);
		//row.goodId=row.goodname;
		$('#fm').form('load',row);
		url="${basePath}manage/xlVouchersave.do?id="+row.id;
	}
	
	function saveXlVoucher(){
		$("#fm").form("submit",{
			url:url,
			onSubmit:function(){
				if($("#flag").combobox("getValue")==""||$("#flag").combobox("getValue")==null){
					$.messager.alert("系统提示","请选择抵用券类型是否有效！","error");
					return false;
				}
/* 				if($("#flag").combobox("getValue")=="2"&&$("#dlg").dialog("open").dialog("getTitle")=="添加抵用券信息"){
				    $.messager.alert("系统提示","添加抵用券信息不能指定抵用券为无效！","error");
					return false;
				} */
			    if($("#type").combobox("getValue")==""||$("#type").combobox("getValue")==null){
					$.messager.alert("系统提示","请选择抵用券类型！","error");
					return false;
				}
				//if($("#goodid").combobox("getValue")==""||$("#goodid").combobox("getValue")==null){
				//if($("#goodname").combobox("getValue")==""||$("#goodname").combobox("getValue")==null){
			    if($("#goodId").combobox("getValue")==""||$("#goodId").combobox("getValue")==null){
					$.messager.alert("系统提示","请选择抵用券指定商品！","error");
					return false;
				}
				var price = /^[1-9][0-9]$/;
		        if($("#price").val()!=''&&!price.test($("#price").val())){
		        	$.messager.alert("系统提示","抵用券价格格式错误，请重新输入！","error");
		            return false;
		        }
		        var vo_num = /^[1-2][0-9]$/;
		        //if($("#vo_num").val()!=''&&!vo_num.test($("#vo_num").val())){
		        if($("#voNum").val()!=''&&!vo_num.test($("#voNum").val())){
		        	$.messager.alert("系统提示","抵用券数量格式错误，请重新输入！","error");
		            return false;
		        }
		        var stipulate_price = /^[1-3][0-9][0-9]$/;
		        //if($("#stipulate_price").val()!=''&&!stipulate_price.test($("#stipulate_price").val())){
		        if($("#stipulatePrice").val()!=''&&!stipulate_price.test($("#stipulatePrice").val())){
		        	$.messager.alert("系统提示","抵用券到达金额格式错误，请重新输入！","error");
		            return false;
		        }
				return $(this).form("validate");
			},
			success:function(result){
				var result=eval('('+result+')');
				alert(result);
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
		$("#price").val("");
		//$("#flag").val("");
		$("#flag").combobox("setValue","");
		$("#type").combobox("setValue","");
		//$("#validate").val("");
		$("#validate").datebox("setValue","");
		$("#voNum").val("");
		$("#goodId").combobox("setValue","");
		//$("#goodname").combobox("setValue","");
		//$("#goodid").combobox("setValue","");
		$("#stipulatePrice").val("");
		$("#createuser").val("");
		$("#updateuser").val("");
	}
	
	function formatFlag(val){
		if(val==1){
			return "有效";
		}else if(val==2){
			return "无效";
		}else{
			return "未定义";
		}
	}
	function formatType(val){
		if(val==1){
			return "不指定某题的";
		}else if(val==2){
			return "指定某题的";
		}else{
			return "未定义";
		}
	}
	function openXlVoucherFindDialog(){
		var selectedRows=$("#dg").datagrid('getSelections');
		if(selectedRows.length!=1){
			$.messager.alert("系统提示","请选择一条要查看的数据！","info");
			return;
		}
		var row=selectedRows[0];
		$("#finddlg").dialog("open").dialog("setTitle","查看抵用券信息");
		$("#fname").text(row.name);
		$("#fprice").text(row.price);
		$("#fflag").text(formatFlag(row.flag));
		$("#ftype").text(formatType(row.type));
		$("#fvalidate").text(row.validate);
		$("#fvo_num").text(row.voNum);
		$("#fgoodname").text(row.goodname);
		$("#fstipulate_price").text(row.stipulatePrice);
		$("#fcreateuser").text(row.createuser);
		$("#fupdateuser").text(row.updateuser);
	}
    
    function closeFindDialog(){
		$('#finddlg').dialog('close');
	}
	
	function closeXlVoucherDialog(){
		resetValue();
		$("#dlg").dialog("close");
		resetValue();
	}
</script>
<style>
	.findtable{
		border-width: 1px;
		border-color: #666666;
		border-collapse: collapse;
	}
	.findtable td{
		border-width: 1px;
		padding: 8px;
		border-style: solid;
		border-color: #666666;
		background-color: #ffffff;
	}
</style>
</head>
<body style="margin:1px;">
	<table id="dg" title="抵用券管理" class="easyui-datagrid"
	 fitColumns="true" pagination="true" rownumbers="true"
	 url="${basePath}manage/xlVoucherlist.do?createuser=${usermessage.username}" fit="true" toolbar="#tb" remoteSort="false" multiSort="true">
	 <thead>
	 	<tr>
	 		<th field="cb" checkbox="true" align="center"></th>
	 		<th field="id" width="50" align="center" sortable="true">编号</th>
	 		<th field="name" width="100" align="center" sortable="true">抵用券名称</th>
	 		<th field="price" width="100" align="center" sortable="true">抵用券价格</th>
	 		<th field="flag" width="100" align="center" formatter="formatFlag" sortable="true">抵用券是否有效</th>
	 		<th field="type" width="100" align="center" formatter="formatType" sortable="true">抵用券类型</th>
	 		<th field="validate" width="100" align="center" sortable="true">抵用券有效期</th>
	 		<th field="voNum" width="100" align="center" sortable="true">抵用券数量</th>
	 		<th field="goodname" width="100" align="center" sortable="true">抵用券指定商品</th>
	 		<th field="stipulatePrice" width="100" align="center" sortable="true">抵用券到达金额</th>
	 		<th field="createuser" width="100" align="center" sortable="true">抵用券创建者</th>
	 		<th field="updateuser" width="100" align="center" sortable="true">抵用券修改者</th>
	 	</tr>
	 </thead>
	</table>
	<div id="tb">
		<div>
			<a href="javascript:openXlVoucherAddDialog()" class="easyui-linkbutton" iconCls="icon-add" plain="true">添加</a>
			<a href="javascript:openXlVoucherModifyDialog()" class="easyui-linkbutton" iconCls="icon-edit" plain="true">修改</a>
			<a href="javascript:deleteXlVoucher()" class="easyui-linkbutton" iconCls="icon-remove" plain="true">删除</a>
		    <a href="javascript:openXlVoucherFindDialog()" class="easyui-linkbutton" iconCls="icon-lsdd" plain="true">查看详细</a>
		</div>
		<div>
			&nbsp;抵用券名称：&nbsp;<input type="text" id="s_name" size="15" onkeydown="if(event.keyCode==13) searchXlVoucher()"/>
		    &nbsp;抵用券价格：&nbsp;<input type="text" id="s_price" size="15" onkeydown="if(event.keyCode==13) searchXlVoucher()"/>
			&nbsp;抵用券是否有效：&nbsp;<select class="easyui-combobox" id="s_flag"  editable="false" style="width:140px;">
					<option value="" selected="selected">请选择是否有效...</option>
					<option value="1">有效</option>
					<option value="2">无效</option>
				</select>&nbsp;
			&nbsp;抵用券类型：&nbsp;<!--<select class="easyui-combobox" id="s_type" name="s_type" editable="false" style="width:140px;">
					<option value="" selected="selected">请选择类型...</option>
					<option value="1">不指定某题的</option>
					<option value="2">指定某题的</option>
				</select>--><input class="easyui-combobox" id="s_type" name="s_type" editable="false" style="width:140px;">&nbsp;
			&nbsp;抵用券有效期：&nbsp;<input type="text" class="easyui-datebox" id="s_validate" size="15" onkeydown="if(event.keyCode==13) searchXlVoucher()"/>
		    &nbsp;抵用券数量：&nbsp;<input type="text" id="s_vo_num" size="15" onkeydown="if(event.keyCode==13) searchXlVoucher()"/>
		    <input type="hidden" id="goodnames" name="goodnames" value="${goodnames}"/>
		    &nbsp;抵用券指定商品：&nbsp;<!--<select class="easyui-combobox" id="s_goodid" name="s_goodid" editable="false" style="width:140px;" >					
					<option value="" selected="selected">请选择商品...</option>
	 				<c:forEach items="${goods }" var="good">
						<option value="${good.id }">${good.tittle }</option>
					</c:forEach>
					<option value="">无</option>
				</select>-->
				<input class="easyui-combobox" id="s_goodid" name="s_goodid" editable="false" style="width:140px;" >		
		    &nbsp;抵用券到达金额：&nbsp;<input type="text" id="s_stipulate_price" size="15" onkeydown="if(event.keyCode==13) searchXlVoucher()"/>
		    &nbsp;抵用券创建者：&nbsp;<input type="text" id="s_create_user" size="15" onkeydown="if(event.keyCode==13) searchXlVoucher()"/>
		    &nbsp;抵用券修改者：&nbsp;<input type="text" id="s_update_user" size="15" onkeydown="if(event.keyCode==13) searchXlVoucher()"/>
			<a href="javascript:searchXlVoucher()" class="easyui-linkbutton" iconCls="icon-search" plain="true">搜索</a>
			<a href="javascript:resetSearch()" class="easyui-linkbutton" iconCls="icon-reset" plain="true">清空</a>
		</div>
	</div>
	
	<div id="dlg" class="easyui-dialog" style="width: 670px;height:300px;padding: 10px 20px" closed="true" buttons="#dlg-buttons" >
	 	<form id="fm" method="post">
	 		<table cellspacing="8px">
	 			<tr>
	 				<td>抵用券名称：</td>
	 				<td><input type="text" id="name" name="name" class="easyui-validatebox easyui-textbox" required="true"/>&nbsp;<font color="red">*</font></td>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
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
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
	 				<td>抵用券类型：</td>
	 				<td><!--<select class="easyui-combobox" id="type" name="type" editable="false" style="width:175px;">
	 						<option value="" selected>请选择...</option>
	 						<option value="1">不指定某题的</option>
	 						<option value="2">指定某题的</option>
	 					</select>--><input class="easyui-combobox" id="type" name="type" editable="false" style="width:140px;" >&nbsp;<font color="red">*</font></td>
				</tr>
				<tr>
	 				<td>抵用券有效期：</td>
	 				<td><input type="text" id="validate" name="validate" class="easyui-validatebox easyui-datebox" required="true"/>&nbsp;<font color="red">*</font></td>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
	 				<td>抵用券数量：</td>
	 				<td><input type="text" id="voNum" name="voNum" class="easyui-validatebox easyui-textbox" required="true"/>&nbsp;<font color="red">*</font></td>
	 			</tr>
				<tr>
	 			    <td>抵用券指定商品：</td>
	 			    <td>
				<!--<select class="easyui-combobox" id="goodid" name="goodid" editable="false" style="width:175px;">
					<option value="">请选择商品...</option>
	 				<c:forEach items="${goods }" var="good">
						<option value="${good.id }">${good.tittle }</option>
					</c:forEach>
				</select>-->
				<!--  
				<input class="easyui-combobox" id="goodname" name="goodname" editable="false" style="width:140px;" >&nbsp;<font color="red">*</font>
				-->
				<!--  
				<input class="easyui-combobox" id="goodid" name="goodid" editable="false" style="width:140px;" >&nbsp;<font color="red">*</font>				
				-->
				<input class="easyui-combobox" id="goodId" name="goodId" editable="false" style="width:140px;" >&nbsp;<font color="red">*</font>				
				</td>
                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
	 				<td>抵用券到达金额：</td>
	 				<td><input type="text" id="stipulatePrice" name="stipulatePrice" class="easyui-validatebox easyui-textbox" required="true" />&nbsp;<font color="red">*</font></td>
	 			</tr>
			    <tr>
	 				<td>抵用券创建者：</td>
	 				<!--  
	 				<td><input type="text" id="createuser" name="createuser" class="easyui-validatebox easyui-textbox" required="true" value="${usernamemessage}"/>&nbsp;<font color="red">*</font></td>
	 				-->
	 				<td><input type="text" id="createuser" name="createuser" class="easyui-validatebox easyui-textbox" required="true" value="${usermessage.username}"/>&nbsp;<font color="red">*</font></td>
	             <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
	 				<td>抵用券修改者：</td>
	 				<td><input type="text" id="updateuser" name="updateuser" class="easyui-validatebox easyui-textbox" required="true" />&nbsp;<font color="red">*</font></td>
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
	 			<td><span id="fvo_num"></span></td>
	 		</tr>
	 		<tr>
	 			<td>抵用券指定商品：</td>
	 			<td><span id="fgoodname"></span></td>
	 			<td>抵用券到达金额：</td>
	 			<td><span id="fstipulate_price"></span></td>
	 		</tr>
	 		<tr>
	 			<td>抵用券创建者：</td>
	 			<td><span id="fcreateuser"></span></td>
	 			<td>抵用券修改者：</td>
	 			<td><span id="fupdateuser"></span></td>
	 		</tr>
	 	</table>
	</div>
		<div id="finddlg-buttons">
		<a href="javascript:closeFindDialog()" class="easyui-linkbutton" iconCls="icon-ok">确定</a>
	</div>
</body>
</html>