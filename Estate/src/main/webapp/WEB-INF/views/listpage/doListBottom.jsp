<%@ page contentType="text/html; charset=utf-8" %>
<%@ include file="/WEB-INF/views/memo/memoStyle.jsp" %> 
<% request.setCharacterEncoding("utf-8");%>
<script type="text/javascript" src="./resources/js/comm/jquery.lightbox_me.js"></script>
<script type="text/javascript" src="./resources/js/list/doList.js"></script>
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
	<!-- 신규Memo -->
	<div id="divAddWorkPopup" style="display: none;">
	<form id="workForm">
		<table class="addMemoPopup" >
			<tr><td height="34px" colspan="2"><a href="#" onClick="f_closeAll()"><img src="./resources/images/alert_close2.jpg"></a></td></tr>
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
				<td height="60px;" style="text-align:right;vertical-align:middle;padding-right:30px;" colspan="2">
					<table width="100%" cellpadding="0" cellspacing="0" border="0">
						<tr>
							<td style="text-align:right;padding-right:10px;"><input type="checkbox" id="endDateYn" name="endDateYn" onClick="f_active_date();"/><label for="endDateYn">종료일 설정</label></td>
							<td width="140px;"><input type="text" id="endDt" name="endDt" class="datepicker" style="width:140px;" readonly="readonly" disabled="disabled"></td>
						</tr>
					</table>
					
					
				</td>
			</tr>
			<tr>	
				<td class="btn" colspan="2">
					<a href="#" onClick="f_closeAll()"><img src="./resources/images/btn_cancel2.jpg"></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<a href="#" id="popOkAdd" ><img src="./resources/images/btn_ok.jpg" onClick="f_work_save()"></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				</td>
			</tr>
			<tr><td height="23px;" colspan="2"><img src="./resources/images/alert_bottom2.jpg"></td></tr>
		</table>
		<input type="hidden" name="workNo" id="workNo">
		
	</form>
	</div>
	
<script id="workListTemplte" type="text/x-jquery-tmpl">	
{{each workList}}		
	<tr onclick="f_modifyWork('{{html $index}}');return false;" style="cursor:pointer;height:45px;">
		<td style="width:20%;align:center;">{{html $value.frstRegDt}}</td>
		<td style="width:10%;"> [{{html $value.mbrNm}}]</td>
		<td style="width:60%;"> {{html $value.workTitle}}</td>
		<td style="width:10%;"><img src="./resources/images/icon_del.png" style="align:right;width:32px;heigh:42px;" id="btnDel" onclick="f_delete_work({{html $index}});return false;"></td>
	</tr>
{{/each}}	
</script>

<script id="workListEmptyTemplte" type="text/x-jquery-tmpl">	
	<tr style="height:45px;">
		<td colspan="3">해당하는 작업내역이 존재하지 않습니다.</td>
	</tr>
</script>

	
	