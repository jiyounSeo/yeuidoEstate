<%@ include file="/WEB-INF/views/comm/adminHeader.jsp" %> 
<%@ page contentType="text/html; charset=utf-8" %>
<%@ include file="/WEB-INF/views/list/listStyle.jsp" %> 
<script type="text/javascript" src="./resources/js/list/addClient.js"></script>

<form id="viewClient">
<div class="new_page_title">
	<img src="./resources/images/title_view_cl_list.jpg">
</div>

<div class="new_page_container">
	<table class="new_page_table">
		<tr>
			<td class="title">고객명</td>
			<td colspan="2">${custNm}<!--  --></td>
			<td class="title">담당자</td>
			<td>${manager}<!--  --></td>
		</tr>
		<tr>
			<td class="title" rowspan="2">고객정보</td>
			<td class="title2">핸드폰</td>
			<td>${custTel1}-${custTel2}-${custTel3}</td>
			<td class="title2">자택 </td>
			<td>${homeTel1}-${homeTel2}-${homeTel3}</td>
		</tr>
		<tr>
			<td class="title2">회사 </td>
			<td>${companyTel1}-${compnayTel2}-${companyTel3}</td>
			<td class="title2">팩스</td>
			<td>${faxTel1}-${faxTel2}-${faxTel3}</td>
		</tr>
	
		<tr>
			<td class="title">등급</td>
			<td colspan="2">${grade}<!--  --></td>
			<td class="title">예산</td>
			<td><!--  --> ${budgetAmt}만원</td>
		</tr>
		<tr>
			<td class="title">의뢰내용</td>
			<td colspan="4"><!--  -->${requestMemo}</td>
		</tr>
		<tr>
			<td class="title">특징</td>
			<td colspan="4"><!--  -->${custPoint}</td>
		</tr>
		<tr>
			<td class="title">구입조건</td>
			<td colspan="4"><!--  -->${buyCondition}</td>
		</tr>
		<tr>
			<td class="title">상세내역</td>
			<td colspan="4"><!--  -->${memo}</td>
		</tr>
	</table>
	<div style="height:50px;"></div>
	<div style="width:1400px;margin:auto;text-align:center;">
		<a href="./modifyCustomerInfo.do?custNo=${custNo}"> <img src="./resources/images/btn_modify.jpg"></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="#"><img src="./resources/images/btn_del.jpg" onclick="f_customer_delete();return false;"></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="#"><img src="./resources/images/btn_cl_list.jpg"></a>
	</div>
</div>
<input type="hidden" name="custNo" id="custNo" value="${custNo}" />
</form>
<%@ include file="/WEB-INF/views/comm/footer.jsp" %> 