<%@ include file="/WEB-INF/views/comm/indexHeader.jsp" %> 
<%@ include file="/WEB-INF/views/list/listStyle.jsp" %> 
<%@ page contentType="text/html; charset=utf-8" %>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=Z0U9uQFTmyK7bim6HrQ6&submodules=geocoder"></script>
<script type="text/javascript" src="./resources/js/list/mainDtlObject.js"></script>


<div class="new_page_container">
	<table class="new_page_table">
		<tr>
			<td class="title">물건명</td>
			<td colspan="2">${objtNm}<!-- 물건명 --></td>
			<td class="title">등록인</td>
			<td>${estateInfo}</td>
		</tr>
		<tr>
			<td class="title">단지명/면적</td>
			<td colspan="2">${buildNm} &nbsp;&nbsp;${area}평형</td>
			<td class="title">유형</td>
			<td> ${saleTpNm}
				<!-- 유형 -->
			</td>
		</tr>
		<tr>
			<td class="title">매매가</td>
			<td colspan="2"><fmt:formatNumber value="${bargainAmt}" pattern="#,###"/><!-- 매매가 --> 만원</td>
			<td class="title">보증금</td>
			<td><!-- 보증금 --><fmt:formatNumber value="${depositAmt}" pattern="#,###"/>만원 / 월세  <fmt:formatNumber value="${monthlyAmt}" pattern="#,###"/> <!-- 월세 --> 만원</td>
		</tr>
		<tr>
			<td class="title">동 / 층 / 향</td>
			<td colspan="2">
				<!-- 동 --> <c:if test="${dong != '' && dong ne null}">${dong}동/&nbsp;&nbsp;&nbsp;</c:if>
				<!-- 층 --> <c:if test="${floor != '' && floor ne null}">${floor}층/&nbsp;&nbsp;&nbsp;</c:if>
				<!-- 향 --> <c:if test="${directionTpNm != '' && directionTpNm ne null}">${directionTpNm}향</c:if>
			</td>
			<td class="title">만기일</td>
			<td>${dueDt}<!-- 만기일 --></td>
		</tr>
		<tr>
			<td class="title">방 수 / 욕실 수</td>
			<td colspan="2"><!-- 방 -->${roomCnt} 개 / <!-- 욕실 -->${bathCnt} 개</td>
			<td class="title">온돌</td>
			<td><!-- 온돌유무 -->${ondolYn} </td>
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
			<td colspan="4">${memo}<!-- 매물설명 -->
			</td>
		</tr>
		<tr>
			<td class="title">위치</td>
			<td colspan="4">
				<div id="map" style="width:100%;height:300px;"></div>
			</td>
		</tr>		
	</table>
	<%-- <div id="viewBottomDiv">
		<%@ include file="/WEB-INF/views/comm/viewObBottom.jsp" %> 
	</div>	
	 --%>
	 <input type="hidden" name="objtNo" id="objtNo" value="${objtNo}"/>
	 <input type="hidden" name="objtNo" id="objtTp" value="${objtTp}"/>
	 <input type="hidden" name="jibunAddr" id="jibunAddr" value="${jibunAddr}"/>
	
</div>
<%@ include file="/WEB-INF/views/comm/footer.jsp" %>