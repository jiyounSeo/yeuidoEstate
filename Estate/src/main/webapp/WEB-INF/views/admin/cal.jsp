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
			<tr><td height="34px" colspan="2"><a href="#" onClick="f_closePopup()"><img src="./resources/images/alert_close2.jpg"></a></td></tr>
			<tr>
				<td width="20%" class="contentTitle" style="text-align:center;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;작업내역 제목</td>
				<td class="content">
					<input type="text" id="workTitle" name="workTitle" maxlength="50" style="width:80%;"></td>				
			</tr>
			<tr>
				<td class="contentTitle" style="text-align:center;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;작업내역 입력</td>
				<td class="content">
					<textarea rows="20" cols="50" name="workContent" id="workContent" maxlength="3000"></textarea>
				</td>
			</tr>
			<tr>
				<td class="btn" colspan="2">
					<a href="#" onClick="f_closePopup()"><img src="./resources/images/btn_cancel2.jpg"></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<a href="#" id="popOkAdd" ><img src="./resources/images/btn_ok.jpg" onClick="f_work_save()"></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				</td>
			</tr>
			<tr><td height="23px;" colspan="2"><img src="./resources/images/alert_bottom2.jpg"></td></tr>
		</table>
		<input type="hidden" name="workNo" id="workNo">
		
	</form>
</div>