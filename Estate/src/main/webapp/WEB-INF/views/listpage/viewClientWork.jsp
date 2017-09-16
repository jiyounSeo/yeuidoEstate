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
			<td>${mbrId}<!--  --></td>
		</tr>
		<tr>
			<td class="title">고객상태</td>
			<td colspan="4">
			  ${custState}
			<!--   
			  <input type="checkbox" name="contactYn" id="contactYn" value="Y" /><label for="contactYn">계약상황</label>
			  <input type="checkbox" name="explorYn" id="explorYn" value="Y" /><label for="explorYn">답사추진</label>
			  <input type="checkbox" name="talkYn" id="talkYn" value="Y" /><label for="talkYn">상담중</label>
			  <input type="checkbox" name="searchYn" id="searchYn" value="Y" /><label for="searchYn">물건검색</label>
			  <input type="checkbox" name="visitYn" id="visitYn" value="Y" /><label for="visitYn">방문예정</label>
			  <input type="checkbox" name="meetYn" id="meetYn" value="Y" /><label for="meetYn">미팅예정</label>
			 -->
			</td>
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
			<td>${orgnTel1}-${orgnTel2}-${orgnTel3}</td>
			<td class="title2">팩스</td>
			<td>${faxTel1}-${faxTel2}-${faxTel3}</td>
		</tr>
	
		<tr>
			<td class="title">등급</td>
			<td colspan="2">${gradeTp}<!--  --></td>
			<td class="title">예산</td>
			<td><!--  --> ${budAmt}만원</td>
		</tr>
		<tr>
			<td class="title">의뢰내용</td>
			<td colspan="4"><!--  -->${reqContent}</td>
		</tr>
		<tr>
			<td class="title">특징</td>
			<td colspan="4"><!--  -->${feature}</td>
		</tr>
		<tr>
			<td class="title">접수</td>
			<td colspan="4"><!--  -->${jeobsu}</td>
		</tr>
		<tr>
			<td class="title">구입조건</td>
			<td colspan="4"><!--  -->${buyCond}</td>
		</tr>
		<tr>
			<td class="title">상세내역</td>
			<td colspan="4"><!--  -->${dtlContent}</td>
		</tr>
		<tr>
			<td class="title">담당자메모</td>
			<td colspan="4"><!--  -->${mbrMemo}</td>
		</tr>
	</table>
	<%@ include file="/WEB-INF/views/listpage/doListBottom.jsp" %> 	
	<%@ include file="/WEB-INF/views/listpage/interListBottom.jsp" %> 	
	
	<div style="height:50px;"></div>
	<div style="width:1400px;margin:auto;text-align:center;">
		<a href="./modifyCustomerInfo.do?custId=${custId}"> <img src="./resources/images/btn_modify.jpg"></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="#"><img src="./resources/images/btn_del.jpg" onclick="f_customer_delete();return false;"></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="#"><img src="./resources/images/btn_cl_list.jpg"></a>
	</div>
</div>
<input type="hidden" name="custId" id="custId" value="${custId}" />
</form>
<%@ include file="/WEB-INF/views/comm/footer.jsp" %> 