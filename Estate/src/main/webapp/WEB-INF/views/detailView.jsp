<%@ include file="/WEB-INF/views/comm/indexHeader.jsp" %> 
<%@ include file="/WEB-INF/views/list/listStyle.jsp" %> 
<%@ page contentType="text/html; charset=utf-8" %>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=Z0U9uQFTmyK7bim6HrQ6&submodules=geocoder"></script>
<script type="text/javascript" src="./resources/js/list/mainDtlObject.js"></script>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 

<div class="new_page_container">
	<table class="new_page_table">
		<tr>
			<td class="title">물건명</td>
			<td colspan="2">${objtNm}<!-- 물건명 --></td>
			<td class="title">등록인</td>
			<td>${estateInfo}</td>
		</tr>
		<tr>
		<c:if test="${objtTp eq 'OT001' || objtTp eq 'OT004' || objtTp eq 'OT005'}">
			<td class="title">단지명/면적</td>
			<td colspan="2">${buildNm} &nbsp;&nbsp;<c:if test="${area != 0.00 }">${area}평형</c:if></td>
			<td class="title">유형</td>
			<td> ${saleTpNm}
				<!-- 유형 -->
			</td>
		</c:if>
		<c:if test="${objtTp eq 'OT002' || objtTp eq 'OT003'}">
			<td class="title">건물명</td>
			<td colspan="2">${buildNm} &nbsp;&nbsp;<c:if test="${area != 0.00 }">${area}평형</c:if></td>
			<td class="title">유형</td>
			<td> ${saleTpNm}
				<!-- 유형 -->
			</td>
		</c:if>
		<c:if test="${objtTp eq 'OT006'}">
			<td class="title">건물명/면적</td>
			<td colspan="4">${buildNm} &nbsp;&nbsp;<c:if test="${area != 0.00 }">${area}평형</c:if></td>
		</c:if>
		</tr>
		<tr>
		<c:if test="${objtTp eq 'OT001' || objtTp eq 'OT002' || objtTp eq 'OT004' || objtTp eq 'OT005'}">
			<td class="title">매매가</td>
			<td colspan="2"><c:if test="${bargainAmt eq '' }">--</c:if><c:if test="${bargainAmt ne '' }"><fmt:formatNumber value="${bargainAmt}" pattern="#,###"/><!-- 매매가 -->만원</c:if></td>
			<td class="title">보증금</td>
			<td>
				<c:if test="${depositAmt eq '0' }">--</c:if><c:if test="${depositAmt ne '0' }"><fmt:formatNumber value="${depositAmt}" pattern="#,###"/>만원</c:if> / 
				<c:if test="${monthlyAmt eq '0' }">--</c:if><c:if test="${monthlyAmt ne '0' }">월세  <fmt:formatNumber value="${monthlyAmt}" pattern="#,###"/> <!-- 월세 --> 만원</c:if>
			</td>
		</c:if>	
		<c:if test="${objtTp eq 'OT003'}">
			<td class="title">매매가</td>
			<td colspan="2"><c:if test="${bargainAmt eq '' }">--</c:if><c:if test="${bargainAmt ne '' }"><fmt:formatNumber value="${bargainAmt}" pattern="#,###"/><!-- 매매가 --> 만원</c:if></td>
			<td class="title">보증금</td>
			<td>
				<c:if test="${depositAmt eq '0' }">--</c:if><c:if test="${depositAmt ne '0' }"><fmt:formatNumber value="${depositAmt}" pattern="#,###"/>만원</c:if> / 
				<c:if test="${monthlyAmt eq '0' }">--</c:if><c:if test="${monthlyAmt ne '0' }">월세  <fmt:formatNumber value="${monthlyAmt}" pattern="#,###"/> <!-- 월세 --> 만원</c:if>
			</td>
		</c:if>
		<c:if test="${objtTp eq 'OT006'}">
			<td class="title">분양가</td>
			<td colspan="2"><c:if test="${parcelAmt == 0.00 }">--</c:if><c:if test="${parcelAmt != 0.00 }"><fmt:formatNumber value="${parcelAmt}" pattern="#,###"/>만원</c:if></td>
			<td class="title">프리미엄</td>
			<td><c:if test="${premiumAmt == 0.00 }">--</c:if><c:if test="${premiumAmt != 0.00 }"><fmt:formatNumber value="${premiumAmt}" pattern="#,###"/>만원</c:if></td>
		</c:if>
		</tr>
		<c:if test="${objtTp eq 'OT001' || objtTp eq 'OT004' || objtTp eq 'OT005'}">
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
		</c:if>
		<c:if test="${objtTp eq 'OT002'}">
		<tr>
			<td class="title">권리금</td>
			<td colspan="2">
				<c:if test="${rightAmt eq '0' }">--</c:if><c:if test="${rightAmt ne '0' }">권리금  <fmt:formatNumber value="${rightAmt}" pattern="#,###"/>만원</c:if> / 
				<c:if test="${manageAmt eq '0' }">--</c:if><c:if test="${manageAmt ne '0' }">관리비  <fmt:formatNumber value="${manageAmt}" pattern="#,###"/> <!-- 관리비   --> 만원</c:if>
			</td>
			<td class="title">만기일</td>
			<td><c:if test="${dueDt eq null }">--</c:if><c:if test="${dueDt ne null }">${dueDt}</c:if><!-- 만기일 --></td>
		</tr>
		</c:if>
		<c:if test="${objtTp eq 'OT003'}">
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
			<td class="title">인테리어 유무</td>
			<td colspan="2"><c:if test="${interiorYn eq null || interiorYn eq ''}">--</c:if><c:if test="${interiorYn ne null }">${interiorYn}</c:if><!-- 인테리어 --></td>
			<td class="title">만기일</td>
			<td><c:if test="${dueDt eq null }">--</c:if><c:if test="${dueDt ne null }">${dueDt}</c:if><!-- 만기일 --></td>
		</tr>
		</c:if>
		<c:if test="${objtTp eq 'OT006'}">
		<tr>
			<td class="title">동 / 층 / 향</td>
			<td colspan="4">
				<!-- 동 --> <c:if test="${dong eq '' || dong eq null }">--</c:if><c:if test="${dong ne '' && dong ne null}">${dong}동&nbsp;&nbsp;&nbsp;</c:if> / 
				<!-- 층 --> <c:if test="${floor eq '' || floor eq null}">--</c:if><c:if test="${floor ne '' && floor ne null}">${floor}층&nbsp;&nbsp;&nbsp;</c:if> / 
				<!-- 향 --> <c:if test="${directionTpNm eq '' || directionTpNm eq null}">--</c:if><c:if test="${directionTpNm ne '' && directionTpNm ne null}">${directionTpNm}향</c:if>
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
		</c:if>
		<c:if test="${objtTp eq 'OT001'}">
		<tr>
			<td class="title">방 수 / 욕실 수</td>
			<td colspan="2">
				<!-- 방 --><c:if test="${roomCnt eq '0' || roomCnt eq null}">--</c:if><c:if test="${roomCnt ne '0' && roomCnt ne null}">${roomCnt} 개 </c:if> / 
				<!-- 욕실 --><c:if test="${bathCnt eq '0' || bathCnt eq null}">--</c:if><c:if test="${bathCnt ne '0' && bathCnt ne null}">${bathCnt} 개</c:if>
			</td>
			<td class="title">온돌</td>
			<td><!-- 온돌유무 --><c:if test="${ondolYn eq null }">--</c:if><c:if test="${ondolYn ne null }">${ondolYn}</c:if> </td>
		</tr>
		</c:if>
		<c:if test="${objtTp eq 'OT002'}">
		<tr>
			<td class="title">면적 / 층</td>
			<td colspan="2">
				<!-- 분양 --> <c:if test="${area == 0.00 || area eq null }">--</c:if><c:if test="${area != 0.00 && area ne null}">분양 ${area} 평&nbsp;&nbsp;&nbsp;</c:if> / 
				<!-- 층 --> <c:if test="${realArea == 0.00 || realArea eq null}">--</c:if><c:if test="${realArea != 0.00 && realArea ne null}">실 ${realArea} 평&nbsp;&nbsp;&nbsp;</c:if> / 
				<!-- 향 --> <c:if test="${floor eq '0' || floor eq null}">--</c:if><c:if test="${floor ne '0' && floor ne null}">${floor} 층</c:if>
			</td>
			<td class="title">업종</td>
			<td><c:if test="${businessNm eq '' }">--</c:if><c:if test="${businessNm ne '' }">${businessNm}</c:if></td>
		</tr>
		</c:if>
		<c:if test="${objtTp eq 'OT004'}">
		<tr>
			<td class="title">방 수 / 욕실 수</td>
			<td colspan="2">
				<!-- 방 --><c:if test="${roomCnt eq '0' || roomCnt eq null}">--</c:if><c:if test="${roomCnt ne '0' && roomCnt ne null}">${roomCnt} 개 </c:if> / 
				<!-- 욕실 --><c:if test="${bathCnt eq '0' || bathCnt eq null}">--</c:if><c:if test="${bathCnt ne '0' && bathCnt ne null}">${bathCnt} 개</c:if>
			</td>
			<td class="title">부가세</td>
			<td><c:if test="${surtaxYn eq '' || surtaxYn eq null }">--</c:if><c:if test="${surtaxYn ne '' && surtaxYn ne null}">${surtaxYn}</c:if></td>
		</tr>
		</c:if>
		<c:if test="${objtTp eq 'OT005'}">
		<tr>
			<td class="title">방 수 / 욕실 수</td>
			<td colspan="4">
				<!-- 방 --><c:if test="${roomCnt eq '0' || roomCnt eq null}">--</c:if><c:if test="${roomCnt ne '0' && roomCnt ne null}">${roomCnt} 개 </c:if> / 
				<!-- 욕실 --><c:if test="${bathCnt eq '0' || bathCnt eq null}">--</c:if><c:if test="${bathCnt ne '0' && bathCnt ne null}">${bathCnt} 개</c:if>
			</td>
		</tr>
		</c:if>
		
		<c:if test="${objtTp eq 'OT001' || objtTp eq 'OT002' || objtTp eq 'OT003' || objtTp eq 'OT004' || objtTp eq 'OT005'}">
		<tr>
			<td class="title">명도</td>
			<td colspan="4">${availableTpNm}&nbsp;&nbsp;<!--  -->${availableDt}</td>
		</tr>
		</c:if>
		<c:if test="${objtTp eq 'OT001'}">
		<tr>
			<td class="title">상태</td>
			<td colspan="4"><!-- 상태 -->${conditionTpNm}</td>
		</tr>
		</c:if>
		<tr>
			<td class="title">매물설명</td>
			<td colspan="4"><c:if test="${memo eq '<p>&nbsp;</p>' || memo eq null}">--</c:if><c:if test="${memo ne '<p>&nbsp;</p>' && memo ne null}"> ${memo}</c:if><!-- 매물설명 -->
			</td>
		</tr>
		<tr>
			<td class="title">위치</td>
			<td colspan="4">
				<div id="map" style="width:100%;height:300px;"></div>
			</td>
		</tr>		
	</table>
	<div style="width:1400px;padding:20px; 0;margin:auto;text-align:center;">
		<a href="/"><input type="image" name="listBtn" src="./resources/images/btn_ob_list.jpg" ></a>
	</div>	
	 <input type="hidden" name="objtNo" id="objtNo" value="${objtNo}"/>
	 <input type="hidden" name="objtNo" id="objtTp" value="${objtTp}"/>
	 <input type="hidden" name="jibunAddr" id="jibunAddr" value="${jibunAddr}"/>
	
</div>
<%@ include file="/WEB-INF/views/comm/footer.jsp" %>