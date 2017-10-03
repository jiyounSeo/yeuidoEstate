<%@ include file="/WEB-INF/views/comm/adminHeader.jsp" %> 
<%@ page contentType="text/html; charset=utf-8" %>
<%@ include file="/WEB-INF/views/list/listStyle.jsp" %> 
<%@ include file="/WEB-INF/views/comm/viewTitle.jsp" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 

<form id="viewObStore" action="/">
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
			<td class="title">건물명 </td>
			<td colspan="2"><!--  -->${buildNm}</td>
			<td class="title">면적</td>
			<td><!--  --> 분양 
				<!--  --> ${area}평형 /   
				실 <!--  -->${realArea}평 
				<!--  -->${floor}층
			</td>
		</tr>
		<tr>
			<td class="title">유형</td>
			<td colspan="2"><!--  -->${saleTpNm}</td>
			<td class="title">업종</td>
			<td>${businessNm}</td>
		</tr>
		<tr>
			<td class="title">매매가</td>
			<td colspan="2"><fmt:formatNumber value="${bargainAmt}" pattern="#,###"/> <!-- 매매가 --> 만원</td>
			<td class="title">보증금</td>
			<td><!-- 보증금 --><fmt:formatNumber value="${depositAmt}" pattern="#,###"/>  만원 / 월세  <fmt:formatNumber value="${monthlyAmt}" pattern="#,###"/>  <!-- 월세 --> 만원</td>
		</tr>
		<tr>
			<td class="title">권리금</td>
			<td colspan="2">
				권리금 <!--  --><fmt:formatNumber value="${rightAmt}" pattern="#,###"/> 만원 / 관리비 <!--  --><fmt:formatNumber value="${manageAmt}" pattern="#,###"/>  만원	
			</td>
			<td class="title">만기일</td>
			<td><!--  -->${dueDt}</td>
		</tr>
		<tr>
			<td class="title">입주가능일</td>
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
	<div id="viewBottomDiv">
		<%@ include file="/WEB-INF/views/comm/viewObBottom.jsp" %> 
	</div>
</div>
</form>
<%@ include file="/WEB-INF/views/comm/footer.jsp" %> 