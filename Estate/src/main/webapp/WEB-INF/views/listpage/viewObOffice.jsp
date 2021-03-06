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
			<td><c:if test="${pageNm eq 'objtPublic'}">${estateInfo}</c:if><c:if test="${pageNm eq 'objtActiveY' || pageNm eq 'objtActiveN'}">${frstRegNm}</c:if></td>
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
			<td colspan="2"><c:if test="${buildNm eq '' }">--</c:if><c:if test="${buildNm ne '' }">${buildNm}</c:if>
			</td>
			<td class="title">유형</td>
			<td><!--  -->${saleTpNm}</td>
		</tr>
		<tr>
			<td class="title">면적</td>
			<td colspan="4">
				<!--분양 ${area} 평 | 실 ${realArea} 평 | ${floor} 층  --> 
				<!-- 분양 --> <c:if test="${area == 0.00 || area eq null }">--</c:if><c:if test="${area != 0.00 && area ne null}">분양 ${area} 평&nbsp;&nbsp;&nbsp;</c:if> / 
				<!-- 층 --> <c:if test="${realArea == 0.00 || realArea eq null}">--</c:if><c:if test="${realArea != 0.00 && realArea ne null}">실 ${realArea} 평&nbsp;&nbsp;&nbsp;</c:if> / 
				<!-- 향 --> <c:if test="${floor eq '0' || floor eq null}">--</c:if><c:if test="${floor ne '0' && floor ne null}">${floor} 층</c:if>
			</td>
		</tr>
		<tr>
			<td class="title">매매가</td>
			<td colspan="2"><c:if test="${bargainAmt eq '' }">--</c:if><c:if test="${bargainAmt ne '' }"><fmt:formatNumber value="${bargainAmt}" pattern="#,###"/><!-- 매매가 --> 만원</c:if></td>
			<td class="title">보증금</td>
			<td>
				<!--<fmt:formatNumber value="${depositAmt}" pattern="#,###"/>만원 / 월세 XXX 만원 / 관리비 XXX 만원  --> 
				<c:if test="${depositAmt eq '0' }">--</c:if><c:if test="${depositAmt ne '0' }"><fmt:formatNumber value="${depositAmt}" pattern="#,###"/>만원</c:if> / 
				<c:if test="${monthlyAmt eq '0' }">--</c:if><c:if test="${monthlyAmt ne '0' }">월세  <fmt:formatNumber value="${monthlyAmt}" pattern="#,###"/> <!-- 월세 --> 만원</c:if> / 
				<c:if test="${manageAmt eq '0' }">--</c:if><c:if test="${manageAmt ne '0' }">관리비  <fmt:formatNumber value="${manageAmt}" pattern="#,###"/> <!-- 관리비 --> 만원</c:if>
			</td>
		</tr>
		<tr>
			<td class="title">해당면적 세대수</td>
			<td colspan="2">
				<c:if test="${sameHouseholdNum eq '0' || sameHouseholdNum eq null || sameHouseholdNum eq ''}">--</c:if><c:if test="${sameHouseholdNum ne '0' && sameHouseholdNum ne null && sameHouseholdNum ne ''}">${sameHouseholdNum} 세대</c:if>
			</td>
			<td class="title">현관구조</td>
			<td>
				<c:if test="${frontDoorType eq '' || frontDoorType eq null}">--</c:if><c:if test="${frontDoorType ne '' && frontDoorType ne null}">${frontDoorType}</c:if>
			</td>
		</tr>
		<tr>
			<td class="title">인테리어 유무</td>
			<td colspan="2"><c:if test="${interiorYn eq null }">--</c:if><c:if test="${interiorYn ne null }">${interiorYn}</c:if><!-- 인테리어 --></td>
			<td class="title">만기일</td>
			<td><c:if test="${dueDt eq null }">--</c:if><c:if test="${dueDt ne null }">${dueDt}</c:if><!-- 만기일 --></td>
		</tr>
		<tr>
			<td class="title">명도</td>
			<td colspan="4">${conditionTpNm}&nbsp;</td>
		</tr>
		<tr>
			<td class="title">매물설명</td>
			<td colspan="4">
				<c:if test="${memo eq '<p>&nbsp;</p>' || memo eq null}">--</c:if><c:if test="${memo ne '<p>&nbsp;</p>' && memo ne null}"> ${memo}</c:if><!-- 매물설명 -->
			</td>
		</tr>
		<tr>
			<td class="title">분류</td>
			<td colspan="4">${activeTpNm}
							<c:if test="${publicNm != '' && publicNm ne null}">,&nbsp;${publicNm}</c:if>
							<c:if test="${advertiseNm != '' && advertiseNm ne null}">,&nbsp;${advertiseNm}</c:if>
			</td>
		</tr>
	</table>
	<c:if test="${workListYn eq 'Y'}">
		<%@ include file="/WEB-INF/views/listpage/doListBottom.jsp" %> 	
	</c:if>
<%@ include file="/WEB-INF/views/comm/viewObBottom.jsp" %> 
</div>
</form>
<%@ include file="/WEB-INF/views/comm/adminFooter.jsp" %> 