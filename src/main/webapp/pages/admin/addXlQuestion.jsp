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
	
	function searchXlQuestion(){
		$("#dg").datagrid('load',{
			//"datadicname":$("#s_datadicname").combobox("getValue"),
			//"titlename":$("#s_titlename").combobox("getValue"),
			"question_content":$("#question_content").combobox("getValue"),
			//"datadicvalue":$("#s_datadicvalue").val()
			"answer":$("#s_answer").val()
		});
	}
	
	function resetSearch(){
		//$("#s_datadicname").combobox("setValue","");
		$("#question_content").combobox("setValue","");
		//$("#s_datadicvalue").val("");
		$("#s_answer").val("");
	}
	
	function deleteXlQuestion(){
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
				$.post("${basePath}xlQuestiondelete.do",{ids:ids},function(result){
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
	
	
	function openXlQuestionAddDialog(){
		$("#dlg").dialog("open").dialog("setXlQuestion","添加题目");
		url="${basePath}xlQuestionsave.do";
	}
	
	function openXlQuestionModifyDialog(){
		var selectedRows=$("#dg").datagrid('getSelections');
		if(selectedRows.length!=1){
			$.messager.alert("系统提示","请选择一条要编辑的数据！");
			return;
		}
		var row=selectedRows[0];
		$("#dlg").dialog("open").dialog("setXlQuestion","编辑题目");
		$('#fm').form('load',row);
		url="${basePath}xlQuestionsave.do?id="+row.id;
	}
	
	function saveXlQuestion(){
		$("#fm").form("submit",{
			url:url,
			onSubmit:function(){
				if($("#question_content").combobox("getValue")==""||$("#question_content").combobox("getValue")==null){
					$.messager.alert("系统提示","请选择题目名称！");
					return false;
				}
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
		//$("#datadicname").combobox("setValue","");
		//$("#titlename").combobox("setValue","");
		$("#question_content").combobox("setValue","");
		//$("#datadicvalue").val("");
		$("#answer").val("");
	}
	
	function closeXlQuestionDialog(){
		$("#dlg").dialog("close");
		resetValue();
	}
</script>
</head>
<body style="margin:1px;">
	<table id="dg" title="添加测评" class="easyui-datagrid"
	 fitColumns="true" pagination="true" rownumbers="true"
	 url="${basePath}xlquestionlist.do" fit="true" toolbar="#tb" remoteSort="false" multiSort="true">
 
	 <thead>
	    <tr>
	       <th field="cb" checkbox="true" align="center"></th>
	 	   <th field="id" width="50" align="center" sortable="true">编号</th>
	 	   <th field="question_content" width="100" align="center" sortable="true">题目名称</th>
	 	   <th field="answer_content" width="100" align="center" sortable="true">答案</th>	    
	    </tr>
	 	<!--  
	 	<tr>
	 	    <td>1</td>
	 	    <td>Q1</td>
	 	    <td>你最喜欢的颜色系是</td>
	 	    <td><div><checkbox></checkbox>紫色/粉色系</div><div><checkbox></checkbox>红色/黄色系</div><div><checkbox></checkbox>绿色/青色系</div></td>
	 	</tr>
	 	<tr>
	 	    <td>2</td>
	 	    <td>Q2</td>
	 	    <td><div><chenckbox></chenckbox>挑选朋友的时候，你会</div></td>
	 	    <td><div><chenckbox></chenckbox>很认真的挑选同性的朋友</div><div>很认真的挑选异性的朋友</div><div>并不仔细挑选朋友</div></td>
	 	</tr>
	 	<tr>
	 	    <td>3</td>
	 	    <td>Q3</td>
	 	    <td>你是一个在自己的性别中显得比较</td>
	 	    <td><div>比较刚强</div><div>比较柔弱</div><div>非常平凡</div></td>
	 	</tr>
	    <tr>
	 	    <td>4</td>
	 	    <td>Q4</td>
	 	    <td>你对自己的同性朋友经常有什么样的想法</td>
	 	    <td><div>想亲他/她一下</div><div>想掐他/她脸玩</div><div>想照顾他/她</div></td>
	 	</tr>
	 	--> 
	 </thead>

	</table>
	<div id="tb">
	    <div>
			&nbsp;<input type="text" id="s_headline" size="70" value="心理性取向的测试">
		</div>
	    <div>
			&nbsp;<input type="text" id="s_headline" size="35" value="不测测，你怎么知道你是喜欢他还是她？">&nbsp;题目类型：&nbsp;<select class="easyui-combobox" id="type_name"  editable="false" style="width:175px;">
				<option value="">请选择类型...</option>
	 				<c:forEach items="${type_names }" var="type_name">
						<option value="${type_name.type_name }">${type_name.type_name }</option>
					</c:forEach>
			</select>&nbsp;
		</div>
		<div>
			<a href="javascript:openQuestionAddDialog()" class="easyui-linkbutton" iconCls="icon-add" plain="true">添加</a>
			<a href="javascript:openQuestionModifyDialog()" class="easyui-linkbutton" iconCls="icon-edit" plain="true">修改</a>
			<a href="javascript:deleteQuestion()" class="easyui-linkbutton" iconCls="icon-remove" plain="true">删除</a>
		</div>
		<div>
			&nbsp;题目名称：&nbsp;<select class="easyui-combobox" id="s_question_content"  editable="false" style="width:175px;">
					<option value="">请选择名称...</option>
	 				<c:forEach items="${question_contents }" var="question_content">
						<option value="${question_content.question_content }">${question_content.question_content }</option>
					</c:forEach>
				</select>&nbsp;
			&nbsp;答案：&nbsp;<input type="text" id="s_answer" size="20" onkeydown="if(event.keyCode==13) searchQuestion()"/>
			<a href="javascript:searchQuestion()" class="easyui-linkbutton" iconCls="icon-search" plain="true">搜索</a>
			<a href="javascript:resetSearch()" class="easyui-linkbutton" iconCls="icon-reset" plain="true">清空</a>
		</div>
	</div>
	
	<div id="dlg" class="easyui-dialog" style="width: 400px;height:200px;padding: 10px 20px" closed="true" buttons="#dlg-buttons">
	 	<form id="fm" method="post">   
	 		<table cellspacing="15px">
	 			<tr>
	 				<td>题目名称：</td>
	 				<td>
	 					<select class="easyui-combobox" id="question_content" name="question_content" editable="false" style="width:140px;">
	 						<option value="">请选择名称...</option>
	 						<c:forEach items="${question_contents }" var="question_content">
								<option value="${question_content.question_content }">${question_content.question_content }</option>
							</c:forEach>
	 					</select>&nbsp;<font color="red">*</font>
	 				</td>
	 			</tr>
	 			<tr>
	 				<td>答案：</td>
	 				<td><input type="text" id="answer" name="answer" class="easyui-validatebox easyui-textbox" size="20" required="true"/>&nbsp;<font color="red">*</font></td>
	 			</tr>
  
	 		</table>	
	 	</form>
	</div>
	<div id="dlg-buttons">
		<a href="javascript:saveQuestion()" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
		<a href="javascript:closeQuestionDialog()" class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
	</div>
</body>
</html>