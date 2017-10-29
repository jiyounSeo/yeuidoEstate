<%@ include file="/WEB-INF/views/comm/adminHeader.jsp" %> 
<%@ page contentType="text/html; charset=utf-8" %>
<%@ include file="/WEB-INF/views/logbook/listStyle.jsp" %> 
<%@ include file="/WEB-INF/views/logbook/delPopup.jsp" %> 
<script type="text/javascript" src="./resources/editor/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript" src="./resources/js/logbook/addLogbook.js"></script>

<form id="newLogbook">
<div class="new_page_title">
<c:choose>
	<c:when test="${taskDocId == null}">
		<img src="./resources/images/title_lb_new.jpg">
	</c:when>
	<c:otherwise>
		<img src="./resources/images/title_lb_edit.jpg">		
	</c:otherwise>
</c:choose>
</div>

<div class="new_page_container">
	<table class="new_page_table">
		<tr>
			<td class="title">금일</td>
			<td colspan="2" class="content_edit"><textarea rows="20" cols="150" name="taskCont" id="taskCont"></textarea></td>
		</tr>
		<tr>
			<td class="title" rowspan="4">익일</td>
			<td class="title2">광고 </td>
			<td ><input type="text" name="tomoAdver" id="tomoAdver"></td>
		</tr>
		<tr>
			<td class="title2">물건체크</td>
			<td ><input type="text" name="tomoSaleObj" id="tomoSaleObj"></td>
		</tr>
		<tr>
			<td class="title2">구입자추진</td>
			<td ><input type="text" name="tomoBuyer" id="tomoBuyer"></td>
		</tr>
		<tr>
			<td class="title2">기타</td>
			<td ><input type="text" name="tomoEtc" id="tomoEtc"></td>
		</tr>
		<tr>
			<td class="title">문제점</td>
			<td colspan="2" class="content_edit"><textarea rows="10" cols="150" name="prob" id="prob"></textarea></td>
		</tr>
		<tr>
			<td class="title">건의사항</td>
			<td colspan="2" class="content_edit"><textarea rows="10" cols="150" name="sugg" id="sugg"></textarea></td>
		</tr>
	</table>
	<div style="height:50px;"></div>
	<div style="width:1400px;margin:auto;text-align:center;">	
		<c:choose>
			<c:when test="${taskDocId == null}">
				<a href="#"><img src="./resources/images/btn_add.jpg" onclick="f_customer_save();return false;"></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="./logbookListView.do"><img src="./resources/images/btn_cancel.jpg"></a>
			</c:when>
			<c:otherwise>
				<a href="#"><img src="./resources/images/btn_save.jpg" onclick="f_customer_save();return false;"></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="#" onClick="f_del_logbook()"><img src="./resources/images/btn_del2.jpg"></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="./viewLogbook.do?taskDocId=${taskDocId}"><img src="./resources/images/btn_cancel.jpg"></a>			
			</c:otherwise>
		</c:choose>		
	</div>
</div>
<input type="hidden" name="taskDocId" id="taskDocId" value="${taskDocId}" />
</form>
<%@ include file="/WEB-INF/views/comm/adminFooter.jsp" %> 