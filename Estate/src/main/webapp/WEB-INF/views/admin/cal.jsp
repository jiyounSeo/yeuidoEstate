<%@ page contentType="text/html; charset=utf-8" %>
<script type="text/javascript" src="./resources/js/cal/clndr.js?v20180205"></script>
<script type="text/javascript" src="./resources/js/cal/holiday.js?v20180205"></script>
<script type="text/javascript" src="./resources/js/cal/cal.js?v20180207"></script>
<script type="text/javascript" src="./resources/js/comm/jquery.lightbox_me.js"></script>

<%@ include file="/WEB-INF/views/admin/calStyle.jsp" %> 

<table width="1103px" cellpadding="0" cellspacing="0" border="0">
	<tr>
		<td>
			<div class="cal1"></div>        
		</td>
	</tr>
	<tr><td height="2px"></td></tr>
	<tr>
		<td>
			<div class="work" style="height:177px; overflow-x:hidden; overflow-y:scroll;border: 1px solid #b2b2b2;" id="workList">
				<table cellpadding="0" cellspacing="0">
				</table>
			</div>        
		</td>
	</tr>
</table>
<div id="divAddWorkPopup" style="display: none;">
	<form id="workForm" class="workForm">
		<table class="addMemoPopup" >
			<tr><td height="34px"><a href="#" onClick="f_closePopup()"><img src="./resources/images/alert_close2.jpg"></a></td></tr>
			<tr>
				<td align="center" valign="top">
					<fieldset style="width:90%;background-color:#f0efef;">
						<a href="#work" onclick="f_work_detail();return false;"><div id="workTitle" style="text-align:left;padding:10px 20px 10px 20px;"></div></a>
						<div id="workContent" style="text-align:left;padding:0 20px 10px 30px;"></div>
					</fieldset>
				</td>
			</tr>
			<tr>
				<td align="right" style="padding:5px 40px 5px 0;" id="todoItemList">
				</td>
			</tr>
			<c:if test="${sessionScope.user.mbrTp == 'MT003' || sessionScope.user.mbrTp == 'MT004'}"> <!-- 관리자 : 지시사항입력창 -->
			<tr>
				<td align="center" valign="top">
					<div id="todoCommentBox" style="width:90%;">
						<table class="todoBox">
							<tr>
								<td width="10%" valign="bottom" style="padding-bottom:5px;">
									<input type="checkbox" id="endDateYnAdmin" name="endDateYnAdmin" onClick="f_active_frm_admin();"/><label for="endDateYn">종료일 설정</label><br>
									<input type="text" id="endDtAdmin" name="endDtAdmin" class="datepicker" style="width:110px;" readonly="readonly" disabled="disabled">
								</td>
								<td width="65%"><textarea rows="5" cols="50" name="dirContent" id="dirContent" maxlength="3000" style="margin: 5px 0 5px 0;"></textarea></td>
								<td width="15%"><a href="#"><img src="./resources/images/btn_write_todo.png" onClick="f_todo_save()"></a></td>						
							</tr>
						</table>
					</div>
				</td>
			</tr>
			</c:if>
			<tr><td height="23px;"><img src="./resources/images/alert_bottom2.jpg"></td></tr>
		</table>
		<input type="hidden" name="workNo" id="workNo">
		<input type="hidden" name="custId" id="custId">
		<input type="hidden" name="objtNo" id="objtNo">
		<input type="hidden" name="saleTp" id="saleTp">
		<input type="hidden" name="objtTp" id="objtTp">
		<input type="hidden" name="pageNm" id="pageNm">
		<input type="hidden" name="viewUrl" id="viewUrl">
		
		<input type="hidden" name="curSelectedItemIdx" id="curSelectedItemIdx">
		<input type="hidden" name="memberType" id="memberType" value="${sessionScope.user.mbrTp}" />
	</form>
</div>