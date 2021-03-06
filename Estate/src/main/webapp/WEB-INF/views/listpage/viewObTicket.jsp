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
			<td class="title">건물명/면적</td>
			<td colspan="4">${buildNm} &nbsp;&nbsp;<c:if test="${area != 0.00 }">${area}평형</c:if></td>

		</tr>
		<tr>
			<td class="title">분양가</td>
			<td colspan="2"><c:if test="${parcelAmt == 0.00 }">--</c:if><c:if test="${parcelAmt != 0.00 }"><fmt:formatNumber value="${parcelAmt}" pattern="#,###"/>만원</c:if></td>
			<td class="title">프리미엄</td>
			<td><c:if test="${premiumAmt == 0.00 }">--</c:if><c:if test="${premiumAmt != 0.00 }"><fmt:formatNumber value="${premiumAmt}" pattern="#,###"/>만원</c:if></td>
		</tr>
		<tr>
			<td class="title">동 / 층 / 향</td>
			<td colspan="4">
				<!-- 동 --> <c:if test="${dong eq '' || dong eq null }">--</c:if><c:if test="${dong ne '' && dong ne null}">${dong}동&nbsp;&nbsp;&nbsp;</c:if> / 
				<!-- 층 --> <c:if test="${floor eq '' || floor eq null}">--</c:if><c:if test="${floor ne '' && floor ne null}">${floor}층&nbsp;&nbsp;&nbsp;</c:if> / 
				<!-- 향 --> <c:if test="${directionTpNm eq '' || directionTpNm eq null}">--</c:if><c:if test="${directionTpNm ne '' && directionTpNm ne null}">${directionTpNm}향</c:if>
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
			<td class="title">유형</td>
			<td colspan="2"><!--  -->${saleTpNm}</td>
			<td class="title">만기일</td>
			<td><c:if test="${dueDt eq null }">--</c:if><c:if test="${dueDt ne null }">${dueDt}</c:if><!-- 만기일 --></td>
		</tr>
		<tr>
			<td class="title">입주일</td>
			<td colspan="4"><c:if test="${availableDt eq null }">--</c:if><c:if test="${availableDt ne null }">${availableDt}</c:if></td>
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