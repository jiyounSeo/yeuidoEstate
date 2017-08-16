<%@ include file="/WEB-INF/views/comm/adminHeader.jsp" %> 
<%@ page contentType="text/html; charset=utf-8" %>
<%@ include file="/WEB-INF/views/list/listStyle.jsp" %> 

<div class="new_page_title">
	<img src="./resources/images/title_view_cl_list.jpg">
</div>

<div class="new_page_container">
	<table class="new_page_table">
		<tr>
			<td class="title">고객명</td>
			<td colspan="2"><!--  --></td>
			<td class="title">담당자</td>
			<td><!--  --></td>
		</tr>
		<tr>
			<td class="title" rowspan="2">고객정보</td>
			<td class="title2">자택 </td>
			<td width="365px"><!--  --> - <!--  --> - <!--  --></td>
			<td class="title">회사</td>
			<td><!--  --> - <!--  --> - <!--  --></td>
		</tr>
		<tr>
			<td class="title2">핸드폰 </td>
			<td width="365px"><!--  --> - <!--  --> - <!--  --></td>
			<td class="title">팩스</td>
			<td><!--  --> - <!--  --> - <!--  --></td>
		</tr>
		<tr>
			<td class="title">등급</td>
			<td colspan="2"><!--  --></td>
			<td class="title">예산</td>
			<td><!--  --> 만원</td>
		</tr>
		<tr>
			<td class="title">의뢰내용</td>
			<td colspan="4"><!--  --></td>
		</tr>
		<tr>
			<td class="title">특징</td>
			<td colspan="4"><!--  --></td>
		</tr>
		<tr>
			<td class="title">구입조건</td>
			<td colspan="4"><!--  --></td>
		</tr>
		<tr>
			<td class="title">상세내역</td>
			<td colspan="4"><!--  --></td>
		</tr>
	</table>
	<div style="height:50px;"></div>
	<div style="width:1400px;margin:auto;text-align:center;">
		<a href="#"><img src="./resources/images/btn_modify.jpg"></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="#"><img src="./resources/images/btn_del.jpg"></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="#"><img src="./resources/images/btn_cl_list.jpg"></a>
	</div>
</div>

<%@ include file="/WEB-INF/views/comm/footer.jsp" %> 