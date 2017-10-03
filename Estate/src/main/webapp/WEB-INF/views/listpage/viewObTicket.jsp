<%@ include file="/WEB-INF/views/comm/adminHeader.jsp" %> 
<%@ page contentType="text/html; charset=utf-8" %>
<%@ include file="/WEB-INF/views/list/listStyle.jsp" %> 
<%@ include file="/WEB-INF/views/comm/viewTitle.jsp" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 

<form id="viewObTicket" action="/">
<div class="new_page_container">
	<table class="new_page_table">
		<tr>
			<td class="title">물건명</td>
			<td colspan="2">${objtNm}<!--  --></td>
			<td class="title">등록인</td>
			<td>${frstRegNm}<!-- 분류 --></td>
		</tr>
		<tr>
			<td class="title">고객정보</td>
			<td class="title2">성명 </td>
			<td width="365px">${custNm}<!-- 성명 --></td>
			<td class="title2">연락처</td>
			<td>${custTel1}<!-- 연락처1 --> - ${custTel2}<!-- 연락처2 --> - ${custTel3}<!-- 연락처3 --></td>
		</tr>
		<tr>
			<td class="title">건물명/면적</td>
			<td colspan="4">${buildNm} &nbsp;&nbsp;${area}평형</td>

		</tr>
		<tr>
			<td class="title">분양가</td>
			<td colspan="2"><!--  --><fmt:formatNumber value="${parcelAmt}" pattern="#,###"/>만원</td>
			<td class="title">프리미엄</td>
			<td><!--  --><fmt:formatNumber value="${premiumAmt}" pattern="#,###"/>만원</td>
		</tr>
		<tr>
			<td class="title">동 / 층 / 향</td>
			<td colspan="4">
				<!-- 동 --> ${dong}동&nbsp;&nbsp;&nbsp;
				<!-- 층 --> ${floor}층&nbsp;&nbsp;&nbsp;
				<!-- 향 --> ${directionTpNm}향</td>
			</td>
		</tr>
		<tr>
			<td class="title">유형</td>
			<td colspan="2"><!--  -->${saleTpNm}</td>
			<td class="title">만기일</td>
			<td><!--  -->${dueDt}</td>
		</tr>
		<tr>
			<td class="title">입주일</td>
			<td colspan="4">${availableTpNm}&nbsp;&nbsp;<!--  -->${availableDt}</td>
		</tr>
		<tr>
			<td class="title">매물설명</td>
			<td colspan="4"><!--  -->${memo}</td>
		</tr>
		<tr>
			<td class="title">분류</td>
			<td colspan="4">${activeTpNm}, ${etc}<!-- 분류 --></td>
		</tr>
		
	</table>
	<c:if test="${publicYn ne 'Y'}">
		<%@ include file="/WEB-INF/views/listpage/doListBottom.jsp" %> 	
	</c:if>	
<%@ include file="/WEB-INF/views/comm/viewObBottom.jsp" %> 
</div>
</form>
<%@ include file="/WEB-INF/views/comm/footer.jsp" %> 