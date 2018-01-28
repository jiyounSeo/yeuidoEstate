<%@ include file="/WEB-INF/views/comm/indexHeader.jsp" %> 
<%@ include file="/WEB-INF/views/mainStyle.jsp" %> 
<%@ page contentType="text/html; charset=utf-8" %>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=Z0U9uQFTmyK7bim6HrQ6&submodules=geocoder"></script>
<script type="text/javascript" src="./resources/js/list/mainDtlObject.js"></script>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 

<%@ include file="/WEB-INF/views/tabMenuBar.jsp" %> 

<div id="ob_dtail" style="width:970px;margin:auto;padding:10px 0;">		
	<table style="width:970px" cellpadding="0" cellspacing="0" class="ob_detail">
		<tr>
			<td class="title" width="485px"><span class="obTitle">${objtNm}</span></td>
			<td class="title" width="243px">
				<span class="areaText1">면적<!-- 계약/전용면적--></span><!--  <span class="areaText2">(전용률 51.3%)</span> --><br>
				<span class="areaValue" title="${area}평">${areaCal}</span>
				<!-- <span class="bar">/</span><span class="areaValue"><fmt:formatNumber value="${areaCal*0.513}" pattern="#.##"/></span> --><span class="areaText1">㎡</span>
			</td>
			<td class="title" width="242px">
				<c:if test="${saleTp eq 'ST001'}">
					<span class="areaText1">매매가</span><br>
					<c:if test="${bargainAmt eq '' }">--</c:if>
					<c:if test="${bargainAmt ne '' }"><span class="priceValue"><fmt:formatNumber value="${bargainAmt}" pattern="#,###"/><!-- 매매가 --></span><span class="areaText1">만원</span></c:if>
				</c:if>	
				<c:if test="${saleTp eq 'ST002'}">
					<span class="areaText1">전세가</span><br>
					<c:if test="${depositAmt eq '' }">--</c:if>
					<c:if test="${depositAmt ne '' }"><span class="priceValue"><fmt:formatNumber value="${depositAmt}" pattern="#,###"/><!-- 전세가 --></span><span class="areaText1">만원</span></c:if>
				</c:if>	
				<c:if test="${saleTp eq 'ST003' || saleTp eq 'ST004' || saleTp eq 'ST005'}">
					<span class="areaText1">보증금/월세</span><br>
						<c:if test="${depositAmt eq '0' }">--</c:if><c:if test="${depositAmt ne '0' }"><span class="priceValue"><fmt:formatNumber value="${depositAmt}" pattern="#,###"/></span></c:if><span class="bar">/</span>
						<c:if test="${monthlyAmt eq '0' }">--</c:if><c:if test="${monthlyAmt ne '0' }"><span class="priceValue"><fmt:formatNumber value="${monthlyAmt}" pattern="#,###"/></span><span class="areaText1">만원</span></c:if>
				</c:if>
				<c:if test="${objtTp eq 'OT006'}">
					<span class="areaText1">분양가/프리미엄</span><br>
					<c:if test="${parcelAmt == 0.00 }">--</c:if><c:if test="${parcelAmt != 0.00 }"><fmt:formatNumber value="${parcelAmt}" pattern="#,###"/>만원</c:if>/
					<c:if test="${premiumAmt == 0.00 }">--</c:if><c:if test="${premiumAmt != 0.00 }"><fmt:formatNumber value="${premiumAmt}" pattern="#,###"/>만원</c:if>
				</c:if>
			</td>
		</tr>
	</table>
	<table style="width:970px;" cellpadding="0" cellspacing="0" class="ob_detail2">
		<c:if test="${objtTp eq 'OT001' || objtTp eq 'OT004' || objtTp eq 'OT005' }">
			<tr>
				<td class="title">동</td>
				<td class="value"><!-- 동 --> <c:if test="${dong eq '' || dong eq null }">--</c:if><c:if test="${dong ne '' && dong ne null}">${dong}동&nbsp;&nbsp;&nbsp;</c:if></td>
				<td class="title">해당층</td>
				<td class="value">
					<!-- 층 --> <c:if test="${floor eq '' || floor eq null}">--</c:if><c:if test="${floor ne '' && floor ne null}">${floor}층&nbsp;&nbsp;&nbsp;</c:if>
				</td>
				<td class="title">향</td>
				<td class="value"><!-- 향 --> <c:if test="${directionTpNm eq '' || directionTpNm eq null}">--</c:if><c:if test="${directionTpNm ne '' && directionTpNm ne null}">${directionTpNm}향</c:if></td>
				<td class="title">온돌</td>
				<td class="value"><!-- 온돌유무 --><c:if test="${ondolYn eq null }">--</c:if><c:if test="${ondolYn ne null }">${ondolYn}</c:if> </td>				
			</tr>
			<tr>
				<td class="title">방수/욕실수</td>
				<td class="value">
					<!-- 방 --><c:if test="${roomCnt eq '0' || roomCnt eq null}">--</c:if><c:if test="${roomCnt ne '0' && roomCnt ne null}">${roomCnt} 개 </c:if> / 
					<!-- 욕실 --><c:if test="${bathCnt eq '0' || bathCnt eq null}">--</c:if><c:if test="${bathCnt ne '0' && bathCnt ne null}">${bathCnt} 개</c:if>
				</td>			
				<td class="title">명도</td>
				<td class="value">${availableTpNm}&nbsp;&nbsp;<!--  -->${availableDt}</td>
				<c:if test="${objtTp eq 'OT001'}">
				<td class="title">상태</td>
				<td class="value" colspan="3"><!-- 상태 -->${conditionTpNm}</td>		
				</c:if>
				<c:if test="${objtTp eq 'OT004'}">
				<td class="title">부가세</td>
				<td class="value" colspan="3"><c:if test="${surtaxYn eq '' || surtaxYn eq null }">--</c:if><c:if test="${surtaxYn ne '' && surtaxYn ne null}">${surtaxYn}</c:if></td>		
				</c:if>
			</tr>
		</c:if>
		<c:if test="${objtTp eq 'OT002'}">
			<tr>
				<td class="title">해당층</td>
				<td class="value"><!-- 층 --> <c:if test="${floor eq '' || floor eq null}">--</c:if><c:if test="${floor ne '' && floor ne null}">${floor}층</c:if></td>
				<td class="title">권리금</td>
				<td class="value"><c:if test="${rightAmt eq '0' }">--</c:if><c:if test="${rightAmt ne '0' }"><fmt:formatNumber value="${rightAmt}" pattern="#,###"/>만원</c:if></td>
				<td class="title">관리비</td>
				<td class="value"><c:if test="${manageAmt eq '0' }">--</c:if><c:if test="${manageAmt ne '0' }"><fmt:formatNumber value="${manageAmt}" pattern="#,###"/> <!-- 관리비   --> 만원</c:if></td>
				<td class="title"></td>
				<td class="value"></td>				
			</tr>
			<tr>
				<td class="title">업종</td>
				<td class="value"><c:if test="${businessNm eq '' }">--</c:if><c:if test="${businessNm ne '' }">${businessNm}</c:if></td>			
				<td class="title">명도</td>
				<td class="value">${availableTpNm}&nbsp;&nbsp;<!--  -->${availableDt}</td>
				<td class="title"></td>
				<td class="value"></td>	
				<td class="title"></td>
				<td class="value"></td>	
			</tr>
		</c:if>
		<c:if test="${objtTp eq 'OT003'}">
			<tr>
				<td class="title">해당층</td>
				<td class="value" colspan="7"><!-- 층 --> <c:if test="${floor eq '' || floor eq null}">--</c:if><c:if test="${floor ne '' && floor ne null}">${floor}층</c:if></td>		
			</tr>
			<tr>
				<td class="title">명도</td>
				<td class="value">${availableTpNm}&nbsp;&nbsp;<!--  -->${availableDt}</td>			
				<td class="title"></td>
				<td class="value"></td>
				<td class="title">인테리어</td>
				<td class="value"><c:if test="${interiorYn eq null || interiorYn eq ''}">--</c:if><c:if test="${interiorYn ne null }">${interiorYn}</c:if><!-- 인테리어 --></td>				
				<td class="title"></td>
				<td class="value"></td>	
			</tr>
		</c:if>
		<c:if test="${objtTp eq 'OT003'}">
			<tr>
				<td class="title">해당층</td>
				<td class="value" colspan="7"><!-- 층 --> <c:if test="${floor eq '' || floor eq null}">--</c:if><c:if test="${floor ne '' && floor ne null}">${floor}층</c:if></td>
			</tr>
			<tr>
				<td class="title">명도</td>
				<td class="value">${availableTpNm}&nbsp;&nbsp;<!--  -->${availableDt}</td>			
				<td class="title"></td>
				<td class="value"></td>
				<td class="title">인테리어</td>
				<td class="value"><c:if test="${interiorYn eq null || interiorYn eq ''}">--</c:if><c:if test="${interiorYn ne null }">${interiorYn}</c:if><!-- 인테리어 --></td>				
				<td class="title"></td>
				<td class="value"></td>	
			</tr>
		</c:if>
		<c:if test="${objtTp eq 'OT006'}">
			<tr>
				<td class="title">동</td>
				<td class="value"><!-- 동 --> <c:if test="${dong eq '' || dong eq null }">--</c:if><c:if test="${dong ne '' && dong ne null}">${dong}동&nbsp;&nbsp;&nbsp;</c:if></td>
				<td class="title">해당층</td>
				<td class="value">
					<!-- 층 --> <c:if test="${floor eq '' || floor eq null}">--</c:if><c:if test="${floor ne '' && floor ne null}">${floor}층&nbsp;&nbsp;&nbsp;</c:if>
				</td>
				<td class="title">향</td>
				<td class="value"><!-- 향 --> <c:if test="${directionTpNm eq '' || directionTpNm eq null}">--</c:if><c:if test="${directionTpNm ne '' && directionTpNm ne null}">${directionTpNm}향</c:if></td>
				<td class="title"></td>
				<td class="value"></td>				
			</tr>
			<tr>
				<td class="title">입주가능일</td>
				<td class="value" colspan="7"><c:if test="${availableDt eq null }">--</c:if><c:if test="${availableDt ne null }">${availableDt}</c:if></td>
			</tr>
		</c:if>
		<tr>
			<td class="title">중개업소</td>
			<td class="value" colspan="7">${estateNm} <span class="estateTelText">${estateTel}</span></td>		
		</tr>
	</table>
</div>
<br>	
<div style="width:850px;margin:auto;padding:0 0 20px 0;">	
	<table style="width:850px" cellpadding="0" cellspacing="0" class="mapInfo">
		<tr><td class="addrText"><b>위치 : </b>${jibunAddr} <font color="#8f8f8f">(도로명 : ${roadAddrPart1})</font></td></tr>
		<tr><td><div id="map" style="width:850px;height:340px;"></div></td></tr>	
	</table>
</div>

<div style="width:970px;margin:auto;padding:10px 0 20px 0;">		
	<table style="width:970px" cellpadding="0" cellspacing="0" class="objtCommInfo">
		<tr>
			<td class="detail_text">매물세부정보</td>
			<td class="space"></td>
			<td class="detail_text">단지정보</td>
		</tr>
		<tr>
			<td>
				<table style="width:475px;height:230px;" cellpadding="0" cellspacing="0" class="objtCommInfo">
					<tr><td style="height:10px;background-color:fafafa"></td><td class="info"></td></tr>
					<tr><td class="title1">해당동</td><td class="info"><c:if test="${dong eq '' || dong eq null }">--</c:if><c:if test="${dong ne '' && dong ne null}">${dong}동</c:if></td></tr>
					<tr><td class="title1">해당면적세대수</td><td class="info"><c:if test="${sameHouseholdNum eq '' || sameHouseholdNum eq null}">--</c:if><c:if test="${sameHouseholdNum ne '' && sameHouseholdNum ne null}">${sameHouseholdNum}&nbsp;세대</c:if></td></tr>
					<tr><td class="title1">방향</td><td class="info"><c:if test="${directionTpNm eq '' || directionTpNm eq null}">--</c:if><c:if test="${directionTpNm ne '' && directionTpNm ne null}">${directionTpNm}향</c:if></td></tr>
					<tr><td class="title1">현관구조</td><td class="info"><c:if test="${frontDoorType eq '' || frontDoorType eq null}">--</c:if><c:if test="${frontDoorType ne '' && frontDoorType ne null}">${frontDoorType}</c:if></td></tr>
					<tr><td style="height:100px;background-color:fafafa;border-bottom:1px solid #e1e1e1"></td><td style="background-color:#fff;border-bottom:1px solid #e1e1e1"></td></tr>
				</table>
			</td>
			<td class="space"></td>
			<td>
				<table style="width:475px;height:230px;" cellpadding="0" cellspacing="0" class="objtCommInfo">
					<tr><td style="height:10px;background-color:fafafa"></td><td></td></tr>
					<tr>
						<td class="title2">종동수</td>
						<td class="info"><c:if test="${totalDongNum eq '' || totalDongNum eq null}">--</c:if><c:if test="${totalDongNum ne '' && totalDongNum ne null}">${totalDongNum} 동</c:if></td>
					</tr>
					<tr>
						<td class="title2">총세대수</td>
						<td class="info"><c:if test="${totalHouseholdNum eq '' || totalHouseholdNum eq null}">--</c:if><c:if test="${totalHouseholdNum ne '' && totalHouseholdNum ne null}">${totalHouseholdNum} 세대</c:if></td>
					</tr>
					<tr>
						<td class="title2">총주차대수</td>
						<td class="info"><c:if test="${totalParkingNum eq '' || totalParkingNum eq null}">--</c:if><c:if test="${totalParkingNum ne '' && totalParkingNum ne null}">${totalParkingNum} 대</c:if></td>
					</tr>
					<tr>
						<td class="title2">난방방식</td>
						<td class="info"><c:if test="${heatingType eq '' || heatingType eq null}">--</c:if><c:if test="${heatingType ne '' && heatingType ne null}">${heatingType}</c:if></td>
					</tr>
					<tr>
						<td class="title2">난방연료</td>
						<td class="info"><c:if test="${heatingFuel eq '' || heatingFuel eq null}">--</c:if><c:if test="${heatingFuel ne '' && heatingFuel ne null}">${heatingFuel}</c:if></td>
					</tr>
					<tr>
						<td class="title2">세부종류</td>
						<td class="info"><c:if test="${objtTpNm eq '' || objtTpNm eq null}">--</c:if><c:if test="${objtTpNm ne '' && objtTpNm ne null}">${objtTpNm}</c:if></td>
					</tr>
					<tr>
						<td class="title2">건설사명</td>
						<td class="info"><c:if test="${builderName eq '' || builderName eq null}">--</c:if><c:if test="${builderName ne '' && builderName ne null}">${builderName}</c:if></td>
					</tr>
					<tr>
						<td class="title2">준공년월</td>
						<td class="info"><c:if test="${finishedDate eq '' || finishedDate eq null}">--</c:if><c:if test="${finishedDate ne '' && finishedDate ne null}">${finishedDate}</c:if></td>
					</tr>
					<tr><td style="height:20px;background-color:fafafa;border-bottom:1px solid #e1e1e1"></td><td style="background-color:#fff;border-bottom:1px solid #e1e1e1"></td></tr>
				</table>
			</td>
		</tr>
	</table>
</div>

	
<div style="width:970px;margin:auto;padding:10px 0;">		
	<table style="width:970px" cellpadding="0" cellspacing="0">
		<tr><td class="detail_text">매물설명</td></tr>
		<tr>
			<c:if test="${memo eq '<p>&nbsp;</p>' || memo eq null}"><td class="detail_descript" align="center" height="80px;"><font color="#999999">등록된 매물 설명이 없습니다</font></td></c:if>
			<c:if test="${memo ne '<p>&nbsp;</p>' && memo ne null}"><td class="detail_descript"> ${memo}</td></c:if>			
		</tr>
		<tr><td height="30px"></td></tr>
		<tr><td align="center"><a href="./?objtTp=${objtTp}&saleTp=${saleTp}"><img src="./resources/images/btn_ob_list.jpg"></a></td></tr>
	</table>
</div>
<br><br><br>
	 <input type="hidden" name="objtNo" id="objtNo" value="${objtNo}"/>
	 <input type="hidden" name="objtTp" id="objtTp" value="${objtTp}"/>
	 <input type="hidden" name="saleTp" id="saleTp" value="${saleTp}"/>
	 <input type="hidden" name="jibunAddr" id="jibunAddr" value="${jibunAddr}"/>
	
<%@ include file="/WEB-INF/views/comm/footer.jsp" %>


