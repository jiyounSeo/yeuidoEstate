<%@ include file="/WEB-INF/views/comm/adminHeader.jsp" %> 
<%@ page contentType="text/html; charset=utf-8" %>
<%@ include file="/WEB-INF/views/list/listStyle.jsp" %> 
<script type="text/javascript" src="./resources/js/list/addClient.js"></script>
<script type="text/javascript" src="./resources/js/comm/common.js"></script>

<form id="viewClient" action="/">
<input type="hidden" name="custId" id="custId" value="${custId}" />
<input type="hidden" name="modifyYn" id="modifyYn" value="${modifyYn}" />
<input type="hidden" name="publicYn" id="publicYn" value="Y" />

<div class="new_page_title">
	<img src="./resources/images/title_view_cl_list.jpg">
</div>

<div class="new_page_container">
	<table class="new_page_table">
		<tr>
			<td class="title">고객명</td>
			<td colspan="2">${custNm}<!--  --></td>
			<td class="title">담당자</td>
			<td>${mbrNm}<!--  --></td>
		</tr>
		<tr>
			<td class="title">분류</td>
			<td colspan="4"><!--  -->${activeTpNm} | ${publicYnNm}</td>
		</tr>
		<tr>
			<td class="title" rowspan="2">고객정보</td>
			<td class="title2">핸드폰</td>
			<td>${custTel1}-${custTel2}-${custTel3}</td>
			<td class="title2">팩스 </td>
			<td>${faxTel1}-${faxTel2}-${faxTel3}</td>
		</tr>
		<tr>
			<td class="title2">이메일 </td>
			<td colspan="3">${email}</td>
		</tr>
	
		<tr>
			<td class="title">예산</td>
			<td colspan="4">${budAmt}만원</td>
		</tr>
		<tr>
			<td class="title">의뢰내용</td>
			<td colspan="4"><!--  -->${reqContent}</td>
		</tr>		
	</table>
	<div style="height:50px;"></div>
	<div style="width:1400px;margin:auto;text-align:center;" id="modfDiv">
		<a href="./modifyCustomerInfo.do?custId=${custId}"> <img src="./resources/images/btn_modify.jpg"></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="#"><img src="./resources/images/btn_del.jpg" onclick="f_customer_delete();return false;"></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="#"><img src="./resources/images/btn_cl_list.jpg"></a>
	</div>
</div>
</form>
<%@ include file="/WEB-INF/views/comm/footer.jsp" %> 