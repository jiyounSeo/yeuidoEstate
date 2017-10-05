<%@ include file="/WEB-INF/views/comm/adminHeader.jsp" %> 
<%@ page contentType="text/html; charset=utf-8" %>
<%@ include file="/WEB-INF/views/list/listStyle.jsp" %> 
<%@ include file="/WEB-INF/views/comm/viewTitle.jsp" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 

<form id="viewObOffice" action="/">
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
			<td class="title">건물명</td>
			<td colspan="2">${buildNm}
			</td>
			<td class="title">유형</td>
			<td><!--  -->${saleTpNm}</td>
		</tr>
		<tr>
			<td class="title">면적</td>
			<td colspan="4">
				<!--  --> 분양 ${area} 평 | 실 ${realArea} 평 | ${floor} 층
			</td>
		</tr>
		<tr>
			<td class="title">매매가</td>
			<td colspan="2"><!--  -->  <fmt:formatNumber value="${bargainAmt}" pattern="#,###"/> 만원</td>
			<td class="title">보증금</td>
			<td><!--  --> <fmt:formatNumber value="${depositAmt}" pattern="#,###"/>만원 / 월세 XXX 만원 / 관리비 XXX 만원</td>
		</tr>
		<tr>
			<td class="title">인테리어 유무</td>
			<td colspan="2">${interiorYn}</td>
			<td class="title">만기일</td>
			<td>${dueDt}<!-- 만기일 --></td>
		</tr>
		<tr>
			<td class="title">명도</td>
			<td colspan="4">${conditionTpNm}&nbsp;</td>
		</tr>
		<tr>
			<td class="title">매물설명</td>
			<td colspan="4"><!--  -->${memo}</td>
		</tr>
		<tr>
			<td class="title">분류</td>
			<td colspan="4">${activeTpNm}
							<c:if test="${publicNm != '' && publicNm ne null}">,&nbsp;${publicNm}</c:if>
							<c:if test="${advertiseNm != '' && advertiseNm ne null}">,&nbsp;${advertiseNm}</c:if>
			</td>
		</tr>
	</table>
	<c:if test="${publicYn ne 'Y'}">
		<%@ include file="/WEB-INF/views/listpage/doListBottom.jsp" %> 	
	</c:if>
<%@ include file="/WEB-INF/views/comm/viewObBottom.jsp" %> 
</div>
</form>
<%@ include file="/WEB-INF/views/comm/footer.jsp" %> 