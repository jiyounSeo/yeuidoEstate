<%@ include file="/WEB-INF/views/comm/adminHeader.jsp" %> 
<%@ page contentType="text/html; charset=utf-8" %>
<%@ include file="/WEB-INF/views/list/listStyle.jsp" %> 
<script type="text/javascript" src="./resources/js/list/addClient.js?v20180204"></script>
<script type="text/javascript" src="./resources/js/comm/common.js"></script>

<form id="viewClient" action="/">
<input type="hidden" name="custId" id="custId" value="${custId}" />
<input type="hidden" name="activeTp" id="activeTp" value="${activeTp}" />
<input type="hidden" name="pageNm" id="pageNm" value="${pageNm}" />

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
			<td colspan="4"><div id="budAmtView" name="budAmtView">${budAmt}만원</div></td>
		</tr>
		<tr>
			<td class="title">의뢰내용</td>
			<td colspan="4"><!--  --><div style="padding:15px 5px 15px 5px;" id="reqContentView" name="reqContentView"></div></td>
		</tr>
	</table>
	<%@ include file="/WEB-INF/views/listpage/doListBottom.jsp" %> 	
	<%@ include file="/WEB-INF/views/listpage/interListBottom.jsp" %> 	
	

<div class="new_page_container">
	<table class="bottom_btn_table">
			<tbody><tr>
				<td align="left" width="50%">
				<c:if test="${modifyYn eq 'Y'}">
					<div id="viewObjBot">
						<a href="./modifyCustomerInfo.do?custId=${custId}&pageNm=${pageNm}"> <img src="./resources/images/btn_modify.jpg"></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<a href="#"><img src="./resources/images/btn_del.jpg" onclick="f_customer_delete();return false;"></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					</div>
				</c:if>	
				</td>
				<td align="right">
					<a href="#"><img src="./resources/images/btn_cl_list.jpg" onclick="f_list_view_change2();return false;"></a>
				</td>
			</tr>
			</tbody>
		</table>
	</div>
</div>

</form>
<%@ include file="/WEB-INF/views/comm/adminFooter.jsp" %> 