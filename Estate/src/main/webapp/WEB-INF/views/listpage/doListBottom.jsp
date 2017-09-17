<%@ page contentType="text/html; charset=utf-8" %>
<%@ include file="/WEB-INF/views/memo/memoStyle.jsp" %> 
<% request.setCharacterEncoding("utf-8");%>
<script type="text/javascript" src="./resources/js/comm/jquery.lightbox_me.js"></script>
<script type="text/javascript" src="./resources/js/list/doList.js"></script>
<script type="text/javascript" src="./resources/js/comm/common.js"></script>
	<table class="new_page_table">
		<tr>
			<td class="title3">작업 &nbsp;입력<br><p>
			<button type="button" style="align:right;" id="btnAddrPopup" class="btn_type1" onclick="f_addWork();return false;">추가</button>
			</td>
			<td style="height:200px"><!-- 작업내역 -->
				<div class="scrollDiv" cellpadding="0" cellspacing="0" >
					<table cellpadding="0" cellspacing="0" border="0" width="100%">
						<tbody id="workTbody">
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
	<tr>
		<td style="width:10%;align:center;"><a href="#dtl" onclick="f_modifyWork('{{html $index}}');return false;">{{html $value.frstRegDt}}</a></td>
		<td style="width:10%;"> [{{html $value.mbrNm}}]</td>
		<td style="width:70%;"> {{html $value.workTitle}}</td>
		<td style="width:10%;"><button type="button" style="align:right;" id="btnDel" class="btn_delType" onclick="f_delete_work({{html $index}});return false;">삭제</button></td>
	</tr>
{{/each}}	
</script>

<script id="workListEmptyTemplte" type="text/x-jquery-tmpl">	
	<tr>
		<td colspan="3">해당하는 작업내역이 존재하지 않습니다.</td>
	</tr>
</script>

	
	