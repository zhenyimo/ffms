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
<script type="text/javascript" src="${basePath}resource/js/manage/xlGoodsManage.js"></script>
<script type="text/javascript">
var pathContext = "<%=basePath%>";
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
	<table id="dg" title="用户管理" class="easyui-datagrid"
	 fitColumns="true" pagination="true" rownumbers="true" singleSelect="true"
	 url="${basePath}manage/userlist.do" fit="true" toolbar="#tb" remoteSort="false" multiSort="true">
	 <thead>
	 	<tr>
	 		<!-- <th field="cb" checkbox="true" align="center"></th> -->
	 		<th field="id" width="50" align="center" sortable="true">编号</th>
	 		<th field="username" width="100" align="center" sortable="true">用户名</th>
	 		<th field="password" width="100" align="center" sortable="true">密码</th>
	 		<th field="sex" width="100" align="center" formatter="formatSex" sortable="true">性别</th>
	 		<th field="age" width="100" align="center" sortable="true">年龄</th>
	 		<th field="truename" width="100" align="center" sortable="true">真实姓名</th>
	 		<!-- <th field="email" width="100" align="center" sortable="true">邮箱</th>
	 		<th field="phone" width="100" align="center" sortable="true">联系电话</th>
	 		<th field="address" width="100" align="center" sortable="true">住址</th> -->
	 		<th field="appellation" width="100" align="center" sortable="true">家庭称谓</th>
	 		<th field="salary" width="100" align="center" sortable="true">工资</th>
	 		<th field="card" width="100" align="center" sortable="true">银行卡号</th>
	 		<th field="rolename" width="100" align="center" sortable="true">角色</th>
	 		<!-- <th field="createtime" width="100" align="center" sortable="true">创建时间</th>
	 		<th field="updatetime" width="100" align="center" sortable="true">修改时间</th> -->
	 	</tr>
	 </thead>
	</table>
	<div id="tb">
		<div>
			<a href="javascript:openUserAddDialog()" class="easyui-linkbutton" iconCls="icon-add" plain="true">添加</a>
			<a href="javascript:openUserModifyDialog()" class="easyui-linkbutton" iconCls="icon-edit" plain="true">修改</a>
			<a href="javascript:deleteUser()" class="easyui-linkbutton" iconCls="icon-remove" plain="true">删除</a>
			<a href="javascript:openUserFindDialog()" class="easyui-linkbutton" iconCls="icon-lsdd" plain="true">查看详细</a>
		</div>
		<div>
			&nbsp;用户名：&nbsp;<input type="text" id="s_username" size="15" onkeydown="if(event.keyCode==13) searchUser()"/>
			&nbsp;真实姓名：&nbsp;<input type="text" id="s_truename" size="15" onkeydown="if(event.keyCode==13) searchUser()"/>
			&nbsp;家庭称谓：&nbsp;<input type="text" id="s_appellation" size="15" onkeydown="if(event.keyCode==13) searchUser()"/>
			&nbsp;性别：&nbsp;<select class="easyui-combobox" id="s_sex"  editable="false" style="width:140px;">
					<option value="">请选择...</option>
					<option value="1">男</option>
					<option value="2">女</option>
				</select>&nbsp;
			&nbsp;角色：&nbsp;<select class="easyui-combobox" id="s_roleid"  editable="false" style="width:140px;">
					<option value="">请选择角色...</option>
	 				<c:forEach items="${roles }" var="role">
						<option value="${role.id }">${role.rolename }</option>
					</c:forEach>
				</select>&nbsp;
			<a href="javascript:searchUser()" class="easyui-linkbutton" iconCls="icon-search" plain="true">搜索</a>
			<a href="javascript:resetSearch()" class="easyui-linkbutton" iconCls="icon-reset" plain="true">清空</a>
		</div>
	</div>
	
	<div id="dlg" class="easyui-dialog" style="width:1000px;height:300px;padding: 10px 20px" closed="true" buttons="#dlg-buttons">
	 	<form id="fm" method="post">
	 		<table cellspacing="8px">
	 			<tr>
	 				<td>用户名：</td>
	 				<td><input type="text" id="username" name="username" class="easyui-validatebox easyui-textbox" required="true"/>&nbsp;<font color="red">*</font></td>
	 				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
	 				<td>密码：</td>
	 				<td><input type="text" id="password" name="password" class="easyui-validatebox easyui-textbox" required="true"/>&nbsp;<font color="red">*</font></td>
	 			</tr>
	 			<tr>
	 				<td>性别：</td>
	 				<td>
	 					<select class="easyui-combobox" id="sex" name="sex" editable="false" style="width:175px;">
	 						<option value="" selected>请选择...</option>
	 						<option value="1">男</option>
	 						<option value="2">女</option>
	 					</select>&nbsp;<font color="red">*</font></td>
	 				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
	 				<td>年龄：</td>
	 				<td><input type="text" id="age" name="age" class="easyui-validatebox easyui-numberbox" required="true"/>&nbsp;<font color="red">*</font></td>
	 			</tr>
	 			<tr>
	 				<td>真实姓名：</td>
	 				<td><input type="text" id="truename" name="truename" class="easyui-validatebox easyui-textbox" required="true"/>&nbsp;<font color="red">*</font></td>
	 				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
	 				<td>邮箱：</td>
	 				<td><input type="text" id="email" name="email" class="easyui-validatebox easyui-textbox" validType="email" required="true"/>&nbsp;<font color="red">*</font></td>
	 			</tr>
	 			<tr>
	 				<td>联系电话：</td>
	 				<td><input type="text" id="phone" name="phone" class="easyui-validatebox easyui-textbox" required="true"/>&nbsp;<font color="red">*</font></td>
	 				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
	 				<td>住址：</td>
	 				<td><input type="text" id="address" name="address" class="easyui-validatebox easyui-textbox" required="true"/>&nbsp;<font color="red">*</font></td>
	 			</tr>
	 			<tr>
	 				<td>家庭称谓：</td>
	 				<td><input type="text" id="appellation" name="appellation" class="easyui-validatebox easyui-textbox" required="true"/>&nbsp;<font color="red">*</font></td>
	 				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
	 				<td>工资：</td>
	 				<td><input type="text" id="salary" name="salary" class="easyui-validatebox easyui-numberbox" required="true"/>&nbsp;<font color="red">*</font></td>
	 			</tr>
	 			<tr>
	 				<td>银行卡号：</td>
	 				<td><input type="text" id="card" name="card" class="easyui-validatebox easyui-textbox" required="true"/>&nbsp;<font color="red">*</font></td>
	 				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
	 				<td>用户角色：</td>
	 				<td>
	 					<select class="easyui-combobox" id="roleid" name="roleid" editable="false" style="width:175px;">
	 						<option value="">请选择角色...</option>
	 						<c:forEach items="${roles }" var="role">
								<option value="${role.id }">${role.rolename }</option>
							</c:forEach>
	 					</select>&nbsp;<font color="red">*</font>
	 				</td>
	 			</tr>
	 		</table>
	 	</form>
	</div>
	<div id="dlg-buttons">
		<a href="javascript:saveUser()" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
		<a href="javascript:closeUserDialog()" class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
	</div>
	
	<div id="finddlg" class="easyui-dialog" style="width: 670px;height:300px;padding: 10px 20px" closed="true" buttons="#finddlg-buttons">
	 	<table cellspacing="8px" class="findtable" width="100%">
	 		<tr>
	 			<td>用户名：</td>
	 			<td><span id="fusername"></span></td>
	 			<td>密码：</td>
	 			<td><span id="fpassword"></span></td>
	 		</tr>
	 		<tr>
	 			<td>性别：</td>
	 			<td><span id="fsex"></span></td>
	 			<td>年龄：</td>
	 			<td><span id="fage"></span></td>
	 		</tr>
	 		<tr>
	 			<td>真实姓名：</td>
	 			<td><span id="ftruename"></span></td>
	 			<td>邮箱：</td>
	 			<td><span id="femail"></span></td>
	 		</tr>
	 		<tr>
	 			<td>联系电话：</td>
	 			<td><span id="fphone"></span></td>
	 			<td>住址：</td>
	 			<td><span id="faddress"></span></td>
	 		</tr>
	 		<tr>
	 			<td>家庭称谓：</td>
	 			<td><span id="fappellation"></span></td>
	 			<td>工资：</td>
	 			<td><span id="fsalary"></span></td>
	 		</tr>
	 		<tr>
	 			<td>银行卡号：</td>
	 			<td><span id="fcard"></span></td>
	 			<td>用户角色：</td>
	 			<td><span id="frolename"></span></td>
	 		</tr>
	 		<tr>
	 			<td>创建时间：</td>
	 			<td><span id="fcreatetime"></span></td>
	 			<td>修改时间：</td>
	 			<td><span id="fupdatetime"></span></td>
	 		</tr>
	 	</table>
	</div>
	<div id="finddlg-buttons">
		<a href="javascript:closeFindDialog()" class="easyui-linkbutton" iconCls="icon-ok">确定</a>
	</div>
</body>
</html>