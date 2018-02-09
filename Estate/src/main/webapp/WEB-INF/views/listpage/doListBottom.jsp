<%@ page contentType="text/html; charset=utf-8" %>
<%@ include file="/WEB-INF/views/memo/memoStyle.jsp" %> 
<% request.setCharacterEncoding("utf-8");%>
<script type="text/javascript" src="./resources/js/comm/jquery.lightbox_me.js"></script>
<script type="text/javascript" src="./resources/js/list/doList.js?v20180207"></script>
<script type="text/javascript" src="./resources/js/comm/common.js"></script>
<style>
input:disabled {background:#ebebe4;}
</style>
	<table class="new_page_table">
		<tr>
			<td class="title3">작업 &nbsp;입력<br><p>
			<button type="button" style="align:right;cursor:pointer;" id="btnAddrPopup" class="btn_type1" onclick="f_addWork();return false;">추가</button>
			</td>
			<td style="height:200px"><!-- 작업내역 -->
				<div class="scrollDiv" style="border:0;">
					<table cellpadding="0" cellspacing="0" width="100%" style="border:0;">
						<tbody id="workTbody" style="border:0;">
						</tbody>
					</table>
				</div>
			</td>
		</tr>
	</table>
	<!-- 작업내역 View -->
	<div id="divViewWorkPopup" style="display: none;">
	<form id="workForm">
		<table class="addMemoPopup">
			<tr><td height="34px" colspan="2"><a href="#" onClick="f_closeAll()"><img src="./resources/images/alert_close2.jpg"></a></td></tr>			
			<tr>
				<td colspan="2">			
					<div id="editForm" name="editForm" style="display:none">
					<table class="addMemoPopup">
						<tr>
							<td width="15%" style="text-align:right;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;작업내역 제목</td>
							<td width="85%" class="content">
								<input type="text" id="workTitle" name="workTitle" maxlength="50" style="width:80%;"></td>
							
						</tr>
						<tr>
							<td style="text-align:right;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;작업내역 입력</td>
							<td class="content">
								<textarea rows="13" cols="50" name="workContent" id="workContent" maxlength="3000"></textarea>
							</td>
						</tr>
						<tr>
							<td height="60px;" style="text-align:right;vertical-align:middle;padding-right:30px;" colspan="2">
								<table width="100%" cellpadding="0" cellspacing="0" border="0">
									<tr>
										<td style="text-align:right;padding-right:10px;"><input type="checkbox" id="endDateYn" name="endDateYn" onClick="f_active_date();"/><label for="endDateYn">종료일 설정</label></td>
										<td width="140px;"><input type="text" id="endDt" name="endDt" class="datepicker" style="width:140px;" readonly="readonly" disabled="disabled"></td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
					</div>			
				
					<div id="viewForm" name="viewForm" style="display:none">
					<table class="addMemoPopup">
						<tr>
							<td align="center" valign="top">
								<fieldset style="width:90%;background-color:#f0efef;">
									<div id="workTitleView" name="workTitleView" style="text-align:left;padding:10px 20px 10px 20px;"></div>
									<div id="workContentView" name="workTitleView" style="text-align:left;padding:0 20px 10px 30px;"></div>
								</fieldset>
							</td>
						</tr>
					</table>
					</div>
				</td>
			</tr>
			<tr><td align="right" style="padding:5px 40px 5px 0;" id="todoItemList"></td></tr>			
			<tr>	
				<td class="btn" colspan="2"><div id="editBtnDiv" name="editBtnDiv"></div></td>
			</tr>
			<c:if test="${sessionScope.user.mbrTp == 'MT003' || sessionScope.user.mbrTp == 'MT004'}"> <!-- 관리자 : 지시사항입력창 -->
			<tr><td colspan="2" height="10px;"></td></tr>
			<tr>
				<td style="text-align:center;" colspan="2">
					<div id="todoCommentBox" style="width:90%;padding-left:30px;">
					<fieldset style="width:100%;background-color:#f4f2f2;border:1px solid #e2dede">
						<table class="todoBox">
							<tr>
								<td width="10%" valign="bottom" style="padding-bottom:5px;">
									<input type="checkbox" id="endDateYnAdmin" name="endDateYnAdmin" onClick="f_active_frm_admin();"/><label for="endDateYnAdmin">종료일 설정</label><br>
									<input type="text" id="endDtAdmin" name="endDtAdmin" class="datepicker" style="width:110px;" readonly="readonly" disabled="disabled">
								</td>
								<td width="65%"><textarea rows="5" cols="50" name="dirContent" id="dirContent" maxlength="3000" style="margin: 5px 0 5px 0;"></textarea></td>
								<td width="15%">&nbsp;&nbsp;<a href="#"><img src="./resources/images/btn_write_todo.png" onClick="f_todo_save()"></a></td>						
							</tr>
						</table>
					</fieldset>
					</div>
				</td>
			</tr>
			<tr><td colspan="2" height="10px;"></td></tr>
			</c:if>
			<tr><td height="23px;" colspan="2"><img src="./resources/images/alert_bottom2.jpg"></td></tr>
		</table>
		<input type="hidden" name="workNo" id="workNo">
		<input type="hidden" name="memberType" id="memberType" value="${sessionScope.user.mbrTp}" />		
	</form>
	</div>
	
	<!-- 신규 작업내역 -->
	<div id="divAddWorkPopup" style="display: none;">
	<form id="workFormNew">
		<table class="addMemoPopup">
			<tr><td height="34px" colspan="2"><a href="#" onClick="f_closeAll()"><img src="./resources/images/alert_close2.jpg"></a></td></tr>			
			<tr>
				<td width="15%" style="text-align:right;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;작업내역 제목</td>
				<td width="85%" class="content">
					<input type="text" id="workTitleNew" name="workTitleNew" maxlength="50" style="width:80%;"></td>
				
			</tr>
			<tr>
				<td style="text-align:right;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;작업내역 입력</td>
				<td class="content">
					<textarea rows="13" cols="50" name="workContentNew" id="workContentNew" maxlength="3000"></textarea>
				</td>
			</tr>
			<tr>
				<td height="60px;" style="text-align:right;vertical-align:middle;padding-right:30px;" colspan="2">
					<table width="100%" cellpadding="0" cellspacing="0" border="0">
						<tr>
							<td style="text-align:right;padding-right:10px;"><input type="checkbox" id="endDateYnNew" name="endDateYnNew" onClick="f_active_date_new();"/><label for="endDateYnNew">종료일 설정</label></td>
							<td width="140px;"><input type="text" id="endDtNew" name="endDtNew" class="datepicker" style="width:140px;" readonly="readonly" disabled="disabled"></td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td class="btn" colspan="2">
					<a href="#" onClick="f_closeAll()"><img src="./resources/images/btn_cancel2.jpg"></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<a href="#" id="popOkAdd" ><img src="./resources/images/btn_ok.jpg" onClick="f_work_save_new()"></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;				
				</td>
			</tr>
			<tr><td height="23px;" colspan="2"><img src="./resources/images/alert_bottom2.jpg"></td></tr>
		</table>
	</form>
	</div>
	
<script id="workListTemplte" type="text/x-jquery-tmpl">	
{{each workList}}		
	<tr>
		<td onclick="f_modifyWork('{{html $index}}');return false;" style="cursor:pointer;height:45px;width:20%;align:center;">{{html $value.frstRegDt}}</td>
		<td onclick="f_modifyWork('{{html $index}}');return false;" style="cursor:pointer;height:45px;width:10%;"> [{{html $value.mbrNm}}]</td>
		<td onclick="f_modifyWork('{{html $index}}');return false;" style="cursor:pointer;height:45px;width:65%;"> {{html $value.workTitle}}</td>
		<td style="width:5%;"><img src="./resources/images/icon_del.png" style="cursor:pointer;align:right;width:32px;heigh:42px;" id="btnDel" onclick="f_delete_work({{html $index}});return false;"></td>
	</tr>
{{/each}}	
</script>

<script id="workListEmptyTemplte" type="text/x-jquery-tmpl">	
	<tr style="height:45px;">
		<td colspan="3">해당하는 작업내역이 존재하지 않습니다.</td>
	</tr>
</script>

	
	