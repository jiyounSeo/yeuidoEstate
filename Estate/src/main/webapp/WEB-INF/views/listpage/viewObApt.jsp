<%@ include file="/WEB-INF/views/comm/adminHeader.jsp" %> 
<%@ page contentType="text/html; charset=utf-8" %>
<%@ include file="/WEB-INF/views/list/listStyle.jsp" %> 

<%@ include file="/WEB-INF/views/comm/viewTitle.jsp" %> 

<div class="new_page_container">
	<table class="new_page_table">
		<tr>
			<td class="title">물건명</td>
			<td colspan="4"><!-- 물건명 --></td>
		</tr>
		<tr>
			<td class="title">고객정보</td>
			<td class="title2">성명 </td>
			<td width="365px"><!-- 성명 --></td>
			<td class="title2">연락처</td>
			<td><!-- 연락처1 --> - <!-- 연락처2 --> - <!-- 연락처3 --></td>
		</tr>
		<tr>
			<td class="title">단지명/면적</td>
			<td colspan="2"><!-- 아파트명 -->&nbsp;&nbsp;&nbsp;&nbsp;<!-- 평형 --> 평형</td>
			<td class="title">유형</td>
			<td>
				<!-- 유형 -->
			</td>
		</tr>
		<tr>
			<td class="title">매매가</td>
			<td colspan="2"><!-- 매매가 --> 만원</td>
			<td class="title">보증금</td>
			<td><!-- 보증금 --> 만원 / 월세 <!-- 월세 --> 만원</td>
		</tr>
		<tr>
			<td class="title">동 / 층 / 향</td>
			<td colspan="2">
				<!-- 동 --> 동&nbsp;&nbsp;&nbsp;
				<!-- 층 --> 층&nbsp;&nbsp;&nbsp;
				<!-- 향 --></td>
			<td class="title">만기일</td>
			<td><img src="./resources/images/icon_cal.jpg"><!-- 만기일 --></td>
		</tr>
		<tr>
			<td class="title">방 수 / 욕실 수</td>
			<td colspan="2"><!-- 방 --> 개 / <!-- 욕실 --> 개</td>
			<td class="title">온돌</td>
			<td><!-- 온돌유무 --></td>
		</tr>
		<tr>
			<td class="title">입주가능일</td>
			<td colspan="4"><!-- 입주가능일 --></td>
		</tr>
		<tr>
			<td class="title">상태</td>
			<td colspan="4"><!-- 상태 --></td>
		</tr>
		<tr>
			<td class="title">매물설명</td>
			<td colspan="4"><!-- 매물설명 -->
			</td>
		</tr>
		<tr>
			<td class="title">첨부사진</td>
			<td colspan="4"><!-- 첨부사진 --></td>
		</tr>
		<tr>
			<td class="title">분류</td>
			<td colspan="4"><!-- 분류 --></td>
		</tr>
	</table>

<%@ include file="/WEB-INF/views/comm/viewObBottom.jsp" %> 
</div>

<%@ include file="/WEB-INF/views/comm/footer.jsp" %> 