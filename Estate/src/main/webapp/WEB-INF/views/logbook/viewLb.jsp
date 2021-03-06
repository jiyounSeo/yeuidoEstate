<%@ include file="/WEB-INF/views/comm/adminHeader.jsp" %> 
<%@ page contentType="text/html; charset=utf-8" %>
<%@ include file="/WEB-INF/views/logbook/listStyle.jsp" %> 
<%@ include file="/WEB-INF/views/logbook/delPopup.jsp" %> 
<script type="text/javascript" src="./resources/js/logbook/addLogbook.js"></script>

<form id="viewLogbook">
<div class="new_page_title">
	<img src="./resources/images/title_logbook.jpg">
</div>

<div class="new_page_container">
	<table class="new_page_table">
		<tr>
			<td class="title">작성일</td>
			<td>${frstRegDt}</td>
			<td class="title">작성자</td>
			<td>${mbrNm}</td>
		</tr>
		<tr>
			<td class="title">로그인</td>
			<td><!--  --></td>
			<td class="title">로그아웃</td>
			<td><!--  --></td>
		</tr>
	</table>
	<div style="height:10px;"></div>
	<table class="new_page_table">
		<tr>
			<td class="title">금일</td>
			<td colspan="2" class="content">${taskCont}</td>
		</tr>
		<tr>
			<td class="title" rowspan="4">익일</td>
			<td class="title2">광고 </td>
			<td >${tomoAdver}</td>
		</tr>
		<tr>
			<td class="title2">물건체크</td>
			<td >${tomoSaleObj}</td>
		</tr>
		<tr>
			<td class="title2">구입자추진</td>
			<td >${tomoBuyer}</td>
		</tr>
		<tr>
			<td class="title2">기타</td>
			<td>${tomoEtc}</td>
		</tr>
		<tr>
			<td class="title">문제점</td>
			<td colspan="2" class="content">${prob}</td>
		</tr>
		<tr>
			<td class="title">건의사항</td>
			<td colspan="2" class="content">${sugg}</td>
		</tr>
	</table>
	<div style="height:50px;"></div>
	<div style="width:1400px;margin:auto;text-align:center;">
		<a href="./logbookListView.do"><img src="./resources/images/btn_list.jpg"></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a  href="./modifyLogbookInfo.do?taskDocId=${taskDocId}"><img src="./resources/images/btn_edit.jpg"></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="#" onClick="f_del_logbook()"><img src="./resources/images/btn_del2.jpg"></a>
	</div>	
</div>
<input type="hidden" name="taskDocId" id="taskDocId" value="${taskDocId}" />
</form>
<%@ include file="/WEB-INF/views/comm/adminFooter.jsp" %> 