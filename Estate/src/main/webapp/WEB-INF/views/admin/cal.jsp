<%@ page contentType="text/html; charset=utf-8" %>
<script type="text/javascript" src="./resources/js/cal/clndr.js"></script>
<script type="text/javascript" src="./resources/js/cal/cal.js"></script>
<%@ include file="/WEB-INF/views/admin/calStyle.jsp" %> 
<script type="text/javascript" src="./resources/js/comm/jquery.lightbox_me.js"></script>

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
	<form id="workForm">
		<table class="addMemoPopup" >
			<tr><td height="34px"><a href="#" onClick="f_closePopup()"><img src="./resources/images/alert_close2.jpg"></a></td></tr>
			<tr>
				<td align="center" valign="top">
					<c:if test="${sessionScope.user.mbrTp == 'MT002'}"> <!-- 일반회원 : 작업내역 수정가능 -->
					<fieldset style="width:90%;">
						<legend align="left" style="margin-bottom:10px;"><b>[ 작업내역 ]</b></legend>
						<table class="workItem">
							<tr>
								<td class="workTitle">제목</td>
								<td class="workContent"><input type="text" id="workTitle" name="workTitle" maxlength="150" style="width:100%;"></td>
							</tr>
							<tr>
								<td class="workTitle">내용</td>
								<td class="workContent">
									<textarea rows="5" cols="50" name="workContent" id="workContent" maxlength="3000" style="margin: 5px 0 5px 0;"></textarea>
								</td>
							</tr>
						</table>
					</fieldset>
					</c:if>
					<c:if test="${sessionScope.user.mbrTp == 'MT003' || sessionScope.user.mbrTp == 'MT004'}"> <!-- 관리자 : 작업내역view -->
					<fieldset style="width:90%;background-color:#f0efef;">
						<div id="workTitleForAdmin" style="text-align:left;padding:10px 20px 10px 20px;"></div>
						<div id="workContentForAdmin" style="text-align:left;padding:0 20px 10px 30px;"></div>
					</fieldset>
					</c:if>
				</td>
			</tr>
			<tr>
				<td align="right" style="padding:5px 40px 5px 0;" id="todoItemList">
				</td>
			</tr>
			<tr>
				<c:if test="${sessionScope.user.mbrTp == 'MT003' || sessionScope.user.mbrTp == 'MT004'}"> <!-- 관리자 : 지시사항입력창 -->
				<td align="center" valign="top">
					<div id="todoCommentBox" style="width:90%;">
						<table class="todoBox">
							<tr>
								<td width="85%"><textarea rows="5" cols="50" name="dirContent" id="dirContent" maxlength="3000" style="margin: 5px 0 5px 0;"></textarea></td>
								<td width="15%"><a href="#"><img src="./resources/images/btn_write_todo.png" onClick="f_todo_save()"></a></td>						
							</tr>
						</table>
					</div>
				</c:if>
				<c:if test="${sessionScope.user.mbrTp == 'MT002'}"> <!-- 일반회원 : 수정버튼 -->
				<td class="btn">
							<a href="#" onClick="f_closePopup()"><img src="./resources/images/btn_cancel2.jpg"></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<a href="#" id="popOkAdd" ><img src="./resources/images/btn_ok.jpg" onClick="f_work_save()"></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				</c:if>
				</td>
			</tr>
			<tr><td height="23px;"><img src="./resources/images/alert_bottom2.jpg"></td></tr>
		</table>
		<input type="hidden" name="workNo" id="workNo">
		<input type="hidden" name="curSelectedItemIdx" id="curSelectedItemIdx">
		<input type="hidden" name="memberType" id="memberType" value="${sessionScope.user.mbrTp}" />
	</form>
</div>