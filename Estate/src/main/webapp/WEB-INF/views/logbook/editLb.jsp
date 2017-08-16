<%@ include file="/WEB-INF/views/comm/adminHeader.jsp" %> 
<%@ page contentType="text/html; charset=utf-8" %>
<%@ include file="/WEB-INF/views/logbook/listStyle.jsp" %> 
<%@ include file="/WEB-INF/views/logbook/delPopup.jsp" %> 

<div class="new_page_title">
	<img src="./resources/images/title_lb_edit.jpg">
</div>

<div class="new_page_container">
	<table class="new_page_table">
		<tr>
			<td class="title">작성일</td>
			<td><!--  --></td>
			<td class="title">작성자</td>
			<td><!--  --></td>
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
			<td colspan="2"><textarea rows="20" cols="150"></textarea></td>
		</tr>
		<tr>
			<td class="title" rowspan="4">익일</td>
			<td class="title2">광고 </td>
			<td ><input type="text"></td>
		</tr>
		<tr>
			<td class="title2">물건체크</td>
			<td ><input type="text"></td>
		</tr>
		<tr>
			<td class="title2">구입자추진</td>
			<td ><input type="text"></td>
		</tr>
		<tr>
			<td class="title2">기타</td>
			<td ><input type="text"></td>
		</tr>
		<tr>
			<td class="title">문제점</td>
			<td colspan="2"><textarea rows="10" cols="150"></textarea></td>
		</tr>
		<tr>
			<td class="title">건의사항</td>
			<td colspan="2"><textarea rows="10" cols="150"></textarea></td>
		</tr>
	</table>
	<div style="height:50px;"></div>
	<div style="width:1400px;margin:auto;text-align:center;">
		<a href="#"><img src="./resources/images/btn_save.jpg"></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="#" id="delBtn"><img src="./resources/images/btn_del2.jpg"></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="#"><img src="./resources/images/btn_cancel.jpg"></a>
	</div>	
</div>

<%@ include file="/WEB-INF/views/comm/footer.jsp" %> 