<%@ include file="/WEB-INF/views/comm/adminHeader.jsp" %> 
<%@ page contentType="text/html; charset=utf-8" %>
<%@ include file="/WEB-INF/views/list/listStyle.jsp" %> 
<%@ include file="/WEB-INF/views/comm/viewTitle.jsp" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 

<form id="viewObApt" action="/">
<div class="new_page_container">
	<table class="new_page_table">
		<tr>
			<td class="title">물건명</td>
			<td colspan="2">${objtNm}<!-- 물건명 --></td>
			<td class="title">등록인</td>
			<td><c:if test="${pageNm eq 'objtPublic'}">${estateInfo}</c:if><c:if test="${pageNm eq 'objtActiveY' || pageNm eq 'objtActiveN' || pageNm eq 'total'}">${frstRegNm}</c:if></td>
		</tr>
		<tr>
			<td class="title">고객정보</td>
			<td class="title2">성명 </td>
			<td width="365px">${custNm}<!-- 성명 --></td>
			<td class="title2">연락처</td>
			<td>${custTel1}<!-- 연락처1 --> - ${custTel2}<!-- 연락처2 --> - ${custTel3}<!-- 연락처3 --></td>
		</tr>
		<tr>
			<td class="title">단지명/면적</td>
			<td colspan="2">${buildNm} &nbsp;&nbsp;<c:if test="${area != 0.00 }">${area}평형</c:if></td>
			<td class="title">유형</td>
			<td> ${saleTpNm}
				<!-- 유형 -->
			</td>
		</tr>
		<tr>
			<td class="title">매매가</td>
			<td colspan="2"><c:if test="${bargainAmt eq '' }">--</c:if><c:if test="${bargainAmt ne '' }"><fmt:formatNumber value="${bargainAmt}" pattern="#,###"/><!-- 매매가 --> 만원</c:if></td>
			<td class="title">보증금</td>
			<td>
				<c:if test="${depositAmt eq '0' }">--</c:if><c:if test="${depositAmt ne '0' }"><fmt:formatNumber value="${depositAmt}" pattern="#,###"/>만원</c:if> / 
				<c:if test="${monthlyAmt eq '0' }">--</c:if><c:if test="${monthlyAmt ne '0' }">월세  <fmt:formatNumber value="${monthlyAmt}" pattern="#,###"/> <!-- 월세 --> 만원</c:if>
			</td>
		</tr>
		<tr>
			<td class="title">동 / 층 / 향</td>
			<td colspan="2">
				<!-- 동 --> <c:if test="${dong eq '' || dong eq null }">--</c:if><c:if test="${dong ne '' && dong ne null}">${dong}동&nbsp;&nbsp;&nbsp;</c:if> / 
				<!-- 층 --> <c:if test="${floor eq '' || floor eq null}">--</c:if><c:if test="${floor ne '' && floor ne null}">${floor}층&nbsp;&nbsp;&nbsp;</c:if> / 
				<!-- 향 --> <c:if test="${directionTpNm eq '' || directionTpNm eq null}">--</c:if><c:if test="${directionTpNm ne '' && directionTpNm ne null}">${directionTpNm}향</c:if>
			</td>
			<td class="title">만기일</td>
			<td><c:if test="${dueDt eq null }">--</c:if><c:if test="${dueDt ne null }">${dueDt}</c:if><!-- 만기일 --></td>
		</tr>
		<tr>
			<td class="title">방 수 / 욕실 수</td>
			<td colspan="2">
				<!-- 방 --><c:if test="${roomCnt eq '0' || roomCnt eq null}">--</c:if><c:if test="${roomCnt ne '0' && roomCnt ne null}">${roomCnt} 개 </c:if> / 
				<!-- 욕실 --><c:if test="${bathCnt eq '0' || bathCnt eq null}">--</c:if><c:if test="${bathCnt ne '0' && bathCnt ne null}">${bathCnt} 개</c:if>
			</td>
			<td class="title">온돌</td>
			<td><!-- 온돌유무 --><c:if test="${ondolYn eq null }">--</c:if><c:if test="${ondolYn ne null }">${ondolYn}</c:if> </td>
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
			<td class="title">명도</td>
			<td colspan="4">${availableTpNm}&nbsp;&nbsp;<!--  -->${availableDt}</td>
		</tr>
		<tr>
			<td class="title">상태</td>
			<td colspan="4"><!-- 상태 -->${conditionTpNm}</td>
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
	<div id="viewBottomDiv">
		<%@ include file="/WEB-INF/views/comm/viewObBottom.jsp" %> 
	</div>
</div>
</form>
<%@ include file="/WEB-INF/views/comm/adminFooter.jsp" %> 