<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/pages/admin/common/Head.jsp"%>
 <%@include file="/pages/admin/common/taglibs.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>问卷编辑</title>
<link href="${ctx }/js/plugs/jquery-ui-1.10.3.custom/css/mycss/jquery-ui-1.10.3.custom.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${ctx }/js/plugs/jquery-ui-1.10.3.custom/js/jquery-1.10.1.js"></script>
<script type="text/javascript" src="${ctx }/js/plugs/jquery-ui-1.10.3.custom/js/jquery-ui-1.10.3.custom.js"></script>
<!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
<!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
<script type="text/javascript" src="${ctx }/js/dw/dw-design-init.js"></script>
<script language="javascript" type="text/javascript" src="${ctx }/js/plugs/My97DatePickerBeta/My97DatePicker/WdatePicker.js"></script>
<link href="${ctx }/css/design-survey.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
</script>
</head>
<body>
<div id="wrap">
<input type="hidden" id="id" name="id" value="${survey.id }">
<input type="hidden" id="ctx" value="${ctx }">
<input type="hidden" id="surveyModel_hidden" value="${survey.surveyModel }">

<div id="header" >
<div id="header_left">
<%-- <img alt="调问网" src="${ctx }/images/logo/logo.jpg" > --%>
<!-- <div id="header_title">DIAOWEN-在线问卷编辑器</div> -->
<div class="header_Item header_logo">
		<a href="${ctx }/"><img alt="调问网" src="${ctx }/images/logo/LOGO.png" ></a>
		<!-- <div style="font-family: '微软雅黑';font-size:26px;padding-left:10px;">DIAOWEN&nbsp;&nbsp; </div>-->
		&nbsp;&nbsp;
		<span style="font-family: '微软雅黑';font-size: 16px;line-height: 46px;" id="pageHeaderSpan">在线问卷编辑器</span>
</div>
</div>
<div id="header_right">
<div style="line-height: 22px;"><a href="${ctx }/design/my-survey.action">问卷</a>&nbsp;&nbsp;<a href="${ctx }/ic/user!myaccount.action">账号</a></div>
</div>
</div>

<div id="tools_wrap">
<div id="tools">
<div class="tools_tabs">
	<div class="tools_tabs_left"><ul><li class="current" id="tools_tab1_li">基本</li><li id="tools_tab2_li">常用</li></ul></div>
	<div class="tools_tabs_right"><ul><li style="padding: 0px;font: 12px;line-height: 22px;"><a href="http://support.diaowen.net/" target="_black" style="text-decoration: none;color: gray;">帮助</a></li></ul></div>
</div>

<div class="tools_contents">

	
	<div id="tools_tab2" class="tools_tab_div">
		
		<div id="contactPersonQuestion" class="tools_item">
			<div class="toolbars">
				<ul class="dragQuUl">
				<li id="userNameQuModel">
				<%-- 您的姓名--%>
				<div class="dwToolbar_icon"></div>
				<div class="dwQuTypeModel">
						<div class="surveyQuItemBody quDragBody">
							<div class="initLine"></div>
							<div class="quInputCase" style="display: none;">
								<input type="hidden" name="quType" value="FILLBLANK" >
								<input type="hidden" name="quId" value="">
								<input type="hidden" name="orderById" value="0"/>
								<input type="hidden" name="saveTag" value="0">
								<input type="hidden" name="hoverTag" value="0">
								<input type="hidden" name="isRequired" value="1">
								<input type="hidden" name="hv" value="2">
								<input type="hidden" name="randOrder" value="0">
								<input type="hidden" name="cellCount" value="0">
								<input type="hidden" name="checkType" value="NO">
								
								<input type="hidden" name="answerInputWidth" value="300">
								<input type="hidden" name="answerInputRow" value="1">
								
								<input type="hidden" name="contactsAttr" value="1">
								<input type="hidden" name="contactsField" value="1">
								
								<div class="quLogicInputCase">
									<input type="hidden" name="quLogicItemNum" value="0">
								</div>
							</div>
							<div class="surveyQuItem">
								<div class="surveyQuItemLeftTools">
										<ul class="surveyQuItemLeftToolsUl">
											<li title="移动排序" class="dwQuMove"><div class="dwQuIcon"></div></li>
											<li title="设置" class="dwQuSet"><div class=dwQuIcon></div></li>
											<li title="逻辑" class="dwQuLogic"><div class="dwQuIcon"><div class="quLogicInfo"></div></div></li>
											<li title="删除" class="dwQuDelete"><div class="dwQuIcon"></div></li>
										</ul>
								</div>
								<div class="surveyQuItemRightTools">
										<ul class="surveyQuItemRightToolsUl">
											<li class="questionUp"><div class="dwQuIcon"></div></li>
											<li class="questionDown"><div class="dwQuIcon"></div></li>
										</ul>
								</div>
								<div class="surveyQuItemContent">
									<div class="quCoTitle">
										<div class="quCoNum">1、</div>
										<div class="editAble quCoTitleEdit" >您的姓名？</div>
										<input type="hidden" name="quTitleSaveTag" value="0">
									</div>
									<div class="quCoItem"><ul>
										<li class="quCoItemUlLi">
											<!-- <input type="text" style="width:200px;padding:5px;"> -->
											<div class="quFillblankItem">
												<input type="text" style="width:200px;padding:5px;" class="quFillblankAnswerInput" />
												<textarea rows="5" style="width:300px;display: none;"class="quFillblankAnswerTextarea" ></textarea>
												<div class="dwFbMenuBtn" ></div>
											</div>
										</li>
									</ul>
									</div>
								</div>
							</div>
						</div>
				</div>
			</li>
			    </ul>
			</div>
			<div class="tooltext">常用题型</div>
	</div>
	
	</div>
	
	<div id="toolsPubBtn" >
		<div class="toolbars" style="padding:10px  15px 10px 0px;">
			<ul>
			<li id="publishBtn" >
				<div class="dwToolbar_icon"></div>
			</li>
			<li id="saveＭodelBtn" style="display: none;" class="saveＭodelBtn_li">
				<div class="dwToolbar_icon"></div>
			</li>
			<li id="saveBtn" >
				<div class="dwToolbar_icon"></div>
			</li>
			<!-- <li id="previewBtn" >
				<div class="dwToolbar_icon"></div>
			</li> -->
		    </ul>
		</div>
	</div>

</div>
</div>

</div>

<div id="dw_body">
	<div id="dw_body_left">
		<div class="dw_body_title" style="text-align: center;">设计目录</div>
	</div>
	<div id="dw_body_right" style="display: none;"><div class="dw_body_title">题目推荐</div></div>
	<div id="dw_body_content">
		<%-- <div id="dwSurveyTitle" contenteditable="true">${survey.surveyName }</div> --%>
		<div id="dwSurveyTitle">
			<div id="dwSurveyName" class="editAble dwSvyName">${survey.surveyName }</div>
		</div>
		<input type="hidden" name="svyNmSaveTag" value="1">
		<div id="dwSurveyNote">
			<div id="dwSurveyNoteTools">参考样例</div>
			<%-- <div id="dwSurveyNoteEdit" contenteditable="true"  >${survey.surveyDetail.surveyNote }</div> --%>
			<div id="dwSurveyNoteEdit" class="editAble dwSvyNoteEdit"  >${survey.surveyDetail.surveyNote }</div>
			<input type="hidden" name="svyNoteSaveTag" value="1">
		</div>
		
		<div id="dwSurveyQuContent" style="min-height: 500px;">
			<ul id="dwSurveyQuContentAppUl">
				<!-- 题目内容 -->
					<c:forEach items="${survey.questions }" var="en" varStatus="i">
					<li class="li_surveyQuItemBody">
						<div class="surveyQuItemBody">
							<div class="initLine"></div>
							<div class="quInputCase" style="display: none;">
								<input type="hidden" name="quType" value="RADIO">
								<input type="hidden" name="quId" value="${en.id }">
								<input type="hidden" name="orderById" value="${en.orderById }"/>
								<input type="hidden" name="saveTag" value="1">
								<input type="hidden" name="hoverTag" value="0">
								<input type="hidden" name="isRequired" value="${en.isRequired }">
								<input type="hidden" name="hv" value="${en.hv }">
								<input type="hidden" name="randOrder" value="${en.randOrder }">
								<input type="hidden" name="cellCount" value="${en.cellCount }">
								
								<input type="hidden" name="contactsAttr" value="${en.contactsAttr }">
								<input type="hidden" name="contactsField" value="${en.contactsField }">
								
								<div class="quLogicInputCase">
								<input type="hidden" name="quLogicItemNum" value="${fn:length(en.questionLogics) }">
								<c:forEach items="${en.questionLogics }" var="quLogicEn" varStatus="logicSts">
									<div class="quLogicItem quLogicItem_${logicSts.count }">
										<input type="hidden" name="quLogicId" value="${quLogicEn.id }"/>
										<input type="hidden" name="cgQuItemId" value="${quLogicEn.cgQuItemId }"/>
										<input type="hidden" name="skQuId" value="${quLogicEn.skQuId }"/>
										<input type="hidden" name="visibility" value="1">
										<input type="hidden" name="logicSaveTag" value="1">
										
										<input type="hidden" name="geLe" value="${quLogicEn.geLe }">
										<input type="hidden" name="scoreNum" value="${quLogicEn.scoreNum }">
										<input type="hidden" name="logicType" value="${quLogicEn.logicType }">
									</div>
								</c:forEach>
								</div>
							</div>
							<div class="surveyQuItem">
								<div class="surveyQuItemLeftTools">
										<ul class="surveyQuItemLeftToolsUl">
											<li title="移动排序" class="dwQuMove"><div class="dwQuIcon"></div></li>
											<li title="设置" class="dwQuSet"><div class="dwQuIcon"></div></li>
											<li title="逻辑" class="dwQuLogic"><div class="dwQuIcon"><div class="quLogicInfo">${fn:length(en.questionLogics) > 0?fn:length(en.questionLogics) :'' }</div></div></li>
											<li title="删除" class="dwQuDelete"><div class="dwQuIcon"></div></li>
										</ul>
								</div>
								
								<div class="surveyQuItemRightTools">
										<ul class="surveyQuItemRightToolsUl">
											<li class="questionUp"><div class="dwQuIcon"></div></li><li class="questionDown"><div class="dwQuIcon"></div></li>
										</ul>
								</div>
								<div class="surveyQuItemContent">
									<div class="quCoTitle">
										<div class="quCoNum">${i.count }、</div>
										<div class="editAble quCoTitleEdit" >${en.quTitle}</div>
										<input type="hidden" name="quTitleSaveTag" value="1">
									</div>
									<div class="quCoItem">
									<c:choose>
										<c:when test="${en.hv eq 3 }">
											<table class='tableQuColItem'>
												<c:forEach begin="0" end="${fn:length(en.quRadios)-1 }" var="j" step="${en.cellCount }">
												<tr>
												<c:forEach begin="1" end="${en.cellCount }" var="k">
												<td width="${600/en.cellCount }">
													<!-- 判断不为空，访止数组越界 -->
													<c:set var="quOptionIndex" value="${(j+k-1) }" ></c:set>
													<c:choose>
														<c:when test="${quOptionIndex < fn:length(en.quRadios) }">
																<input type="radio"><label style="width:${600/en.cellCount-10 }px;" class="editAble quCoOptionEdit">${en.quRadios[quOptionIndex].optionName }</label>
																<input type='text' class='optionInpText'  style="${item.isNote eq 1 ? '':'display: none;'}"/>
																<div class="quItemInputCase">
																	<input type="hidden" name="quItemId" value="${en.quRadios[quOptionIndex].id }"><input type="hidden" name="quItemSaveTag" value="1">
																	<input type="hidden" name="isNote" value="${item.isNote }">
																	<input type="hidden" name="checkType" value="${item.checkType }">
																	<input type="hidden" name="isRequiredFill" value="${item.isRequiredFill }">
																</div>
														</c:when>
														<c:otherwise><div class="emptyTd"></div></c:otherwise>
													</c:choose>
												</td>
												</c:forEach>
												</tr>
												</c:forEach>
											</table>
										</c:when>
										<c:when test="${en.hv eq 1 }">
											<ul class="transverse">
												<c:forEach items="${en.quRadios }" var="item">
												<li class="quCoItemUlLi">
													<input type="radio"><label class="editAble quCoOptionEdit">${item.optionName }</label>
													<input type='text' class='optionInpText'  style="${item.isNote eq 1 ? '':'display: none;'}"/>
													<div class="quItemInputCase">
														<input type="hidden" name="quItemId" value="${item.id }"><input type="hidden" name="quItemSaveTag" value="1">
														<input type="hidden" name="isNote" value="${item.isNote }">
														<input type="hidden" name="checkType" value="${item.checkType }">
														<input type="hidden" name="isRequiredFill" value="${item.isRequiredFill }">
													</div>
												</li>
												<!-- <li><select> <option>可想而知</option> </select> </li> -->
												</c:forEach>
											</ul>
										</c:when>
										<c:otherwise>
											<ul>
												<c:forEach items="${en.quRadios }" var="item">
												<li class="quCoItemUlLi">
													<input type="radio"><label class="editAble quCoOptionEdit">${item.optionName }</label>
													<input type='text' class='optionInpText'  style="${item.isNote eq 1 ? '':'display: none;'}"/>
													<div class="quItemInputCase">
														<input type="hidden" name="quItemId" value="${item.id }"><input type="hidden" name="quItemSaveTag" value="1">
														<input type="hidden" name="isNote" value="${item.isNote }">
														<input type="hidden" name="checkType" value="${item.checkType }">
														<input type="hidden" name="isRequiredFill" value="${item.isRequiredFill }">
													</div>
												</li>
												<!-- <li><select> <option>可想而知</option> </select> </li> -->
												</c:forEach>
											</ul>
										</c:otherwise>
									</c:choose>
									</div>
									<div class="quCoBottomTools" >
										<ul class="quCoBottomToolsUl" >
											<li class="addOption" title="添加"><div class="dwQuIcon"></div></li>
											<li class="addMoreOption" title="批量添加"><div class="dwQuIcon" ></div></li>
										</ul>
									</div>
								</div>
								
							</div>
					</div>
				</li>
	</c:forEach>					
			</ul>
		</div>
	</div>
</div>

</div>

<!-- 单选选项模板 -->
<div id="quRadioItem" class="modelHtml">
	<input type="radio"><label class="editAble quCoOptionEdit"></label>
	<div class="quItemInputCase">
		<input type="hidden" name="quItemId" value="">
		<input type="hidden" name="quItemSaveTag" value="0">
		<input type="hidden" name="isNote" value="0">
		<input type="hidden" name="checkType" value="NO">
		<input type="hidden" name="isRequiredFill" value="0">
	</div>
</div>

<table class="modelHtml" >
<tr id="quChenColumnModel">
	<td class="quChenColumnTd">
	<label class="editAble quCoOptionEdit">新项</label>
	<div class="quItemInputCase"><input type="hidden" name="quItemId" value=""><input type="hidden" name="quItemSaveTag" value="0"></div>
	</td>
</tr>
<tr id="quChenRowModel">
	<td class="quChenRowTd">
	<label class="editAble quCoOptionEdit">新项</label>
	<div class="quItemInputCase"><input type="hidden" name="quItemId" value=""><input type="hidden" name="quItemSaveTag" value="0"></div>
	</td>
</tr>
</table>

<!-- 逻辑值保存模板 -->
<div id="quLogicItemModel" class="modelHtml">
<div class="quLogicItem">
	<input type="hidden" name="quLogicId" value=""/>
	<input type="hidden" name="cgQuItemId" value="0"/>
	<input type="hidden" name="skQuId" value="0"/>
	<input type="hidden" name="visibility" value="0">
	<input type="hidden" name="logicSaveTag" value="0">
	
	<input type="hidden" name="geLe" value="le">
	<input type="hidden" name="scoreNum" value="2">
	<input type="hidden" name="logicType" value="1">
</div>
</div>
<table id="setQuLogicItem" style="display: none;">
	<tr id="setQuLogicItemTrModel">
		<td class="ifSpanText1">如果本题回答</td>
		<td><select name="option_id" class="logicQuOptionSel" ></select></td>
		<td>则&nbsp;<select name="option_id" class="logicType"  style="width: 60px;"><option value="2">显示</option><option value="1">跳到</option></select> </td>
		<td><select name="jump_to_qid" class="logicQuSel" ></select></td>
		<td><div class="dialogRemoveLogic"></div></td>
	</tr>
	<tr id="setQuLogicItemTrModel_score"><td class="ifSpanText1">如果选项</td>
			<td><select name="option_id" class="logicQuOptionSel" style="width: 120px;"></select>
				评分&nbsp;<select name="logicScoreGtLt" class="logicScoreGtLt"  style="width: 80px;"><option value="le">小等于</option><option value="ge">大等于</option></select>
			<select name="logicScoreNum" class="logicScoreNum"  style="width: 40px;"><option>2</option><option>3</option></select>&nbsp;分,</td>
			<td>则&nbsp;<select name="logicEvent" class="logicType"  style="width: 60px;"><option value="2">显示</option><option value="1">跳到</option></select> </td>
			<td><select name="jump_to_qid" class="logicQuSel" ></select></td>
			<td><div class="dialogRemoveLogic"></div></td>
		</tr>
</table>



<div id="dialog" title="Basic dialog">
 <div id="editDialogCenter" class="editDialogCenter">
	<div id="dialogUeditor" ></div>
</div>
<div id="dialogUeBottom">
	<div class="dwQuDialogBtnCon" ><input type="button" value="保存" class="quDialogBtn" id="dwDialogUeOk"/></div>
	</div>
</div>

<div id="dwCommonDialog">
	<div class="dwCommonRefIcon"><div class="dwCommonRefIcon1"></div><div class="dwCommonRefIcon2"></div></div>
	<div class="dwCommonDialogBody">
		<div  class="dwCommonDialogTitle"><span id="dwComDialogTitleText">标题文本</span><span id="dwCommonDialogClose" class="closeDialog"></span></div>
		<div class="dwCommonDialogContent">
			<!-- 默认显示的LOAD -->
			<div class="dwQuDialogLoad dwQuDialogCon"><img alt="" src="${ctx }/images/load.gif"></div>
			<!-- 题目设置 -->
			
			<div class="dwQuSetCon dwQuFormSetDialog dwQuDialogCon" >
				<ul>
					<!-- <li><input type="checkbox" name="quChage"><label>切换为多选</label> </li> -->
					<li><label><input type="checkbox" name="setIsRequired"  >此题必答</label> </li>
					<li class="optionAutoOrder"><label><input type="checkbox" name="setRandOrder" >选择随机排列</label> </li>
					<li class="contactsAttrLi"><label><input type="checkbox" name="setAutoContacts" >关联到联系人属性</label> </li>
					<li class="contactsFieldLi"><label>用户填写的内容，会成为联系人的</label>
					<select class="contacts_range" name="setContactsField"  style="width:120px;">
					<option value="1">姓名</option>
					<option value="2">手机</option>
					<option value="3">地址</option>
					<option value="4">生日</option>
					<option value="5">Email</option>
					<option value="6">性别</option>
					<option value="7">公司</option>
					<option value="8">城市</option>
					<option value="9">婚姻</option>
					<option value="10">收入</option>
					</select>
					</li>
					<li class="optionRangeHv"><label>选项排放：</label>
					<select class="option_range" name="setHv"  style="width:120px;">
					<option value="2">竖排</option>
					<option value="1">横排</option>
					<option value="3">按列</option>
					<!-- <option value="4">下拉显示</option> -->
					</select>
					<span class="option_range_3" style="display:none;"><input type="text" name="setCellCount"  size="2" value="2">&nbsp;列</span>
					</li>
					<!-- <li class="minNumLi">最少选&nbsp;<input type="text" size="3" name="minNum">&nbsp;项 </li>
					<li class="maxNumLi">最多选&nbsp;<input type="text" size="3" name="maxNum">&nbsp;项 </li> -->
					<li class="minMaxLi">
					<span class="minSpan"><label class="lgleftLabel">&nbsp;最低分</label>&nbsp;<input class="minNum" value="1"  type="text" size="2" >&nbsp; <label class="lgRightLabel">分</label></span>&nbsp;&nbsp;
					<span class="maxSpan"><label class="lgLeftLabel">最高分</label>&nbsp;<input class="maxNum"  value="5"  type="text" size="2" >&nbsp;<label class="lgRightLabel">分</label> </span>
					</li>
					<li class="scoreMinMax">&nbsp;&nbsp;<label>最高分</label>&nbsp;<select class="maxScore"  ><option value="5">5分</option><option value="10">10分</option></select>&nbsp; </li>
				</ul>
				<div class="dwQuDialogBtnCon" ><input type="button" value="保存" class="quDialogBtn" id="dwDialogQuSetSave"/></div>
			</div>
			
			<!-- 逻辑设置 -->
			<div class="dwQuDialogLogic dwQuDialogCon">
				<div class="dwQuDialogLogicTitle">逻辑设置</div>
				<table id="dwQuLogicTable">
				</table>
				<div class="dwQuDialogBotEvent"><div class="dwQuDialogAddLogic"><div class="dwQuIcon"></div></div></div>
				<div class="dwQuDialogBtnCon" ><input type="button" value="保存" class="quDialogBtn" id="dwDialogSaveLogic"/></div>
			</div>
			
			<!-- 批量添加，单选 -->
			<div class="dwQuAddMore dwQuDialogCon"  >
				<div class="dwQuTextSpan">每行一个选项</div>
				<textarea id="dwQuMoreTextarea"></textarea>
				<div class="dwQuDialogBtnCon" ><input type="button" value="保存" class="quDialogBtn" id="dwDialogSaveMoreItem"/></div>
			</div>
			
			
		</div>
	</div>
</div>




<script type="text/javascript">
	
	$("input[name='rule'][value='${survey.surveyDetail.rule}']").attr("checked",true);
	$("input[name='ruleCode']").val("${survey.surveyDetail.ruleCode}");
	$("input[name='refresh'][value='${survey.surveyDetail.refresh}']").attr("checked",true);
	$("input[name='mailOnly'][value='${survey.surveyDetail.mailOnly}']").attr("checked",true);
	$("input[name='ynEndNum'][value='${survey.surveyDetail.ynEndNum}']").attr("checked",true);
	$("input[name='endNum']").val("${survey.surveyDetail.endNum}");
	$("input[name='ynEndTime'][value='${survey.surveyDetail.ynEndTime}']").attr("checked",true);
	$("input[name='endTime']").val("${survey.surveyDetail.endTime}");
	$("input[name='showShareSurvey'][value='${survey.surveyDetail.showShareSurvey}']").attr("checked",true);
	$("input[name='showAnswerDa'][value='${survey.surveyDetail.showAnswerDa}']").attr("checked",true);
</script>

<div style="text-align: center;">
<div class="dw_foot" style="padding-bottom: 30px;">
	<div class="footer-copyright" style="color: gray;padding-top: 0px;font-size: 16px;">
		Powered by <a href="http://www.dwsurvey.net" target="_blank" style="text-decoration: none;color: gray;">DWSurvey</a>&nbsp;&nbsp;&nbsp;
		Copyright © 2012-2017
		<a href="http://www.diaowen.net" target="_blank" style="text-decoration: none;color: rgb(53, 117, 136);">爱靓网</a>
	</div>
</div>
</div>

</body>
</html>