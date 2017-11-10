<%@ page contentType="text/html; charset=utf-8" %>
<% request.setCharacterEncoding("utf-8");%>
<input type="hidden" name="getPath" id="getPath" value="<%=request.getContextPath()%>"/>


<table width="365px" cellpadding="0" cellspacing="0" border="0">
			<!-- 고객/물건목록 -->
	<tr><td><a href="./totalListView.do"><img src="./resources/images/btn_m1.jpg" border="0"></a></td></tr>
	<tr><td height="8px"></td></tr>
	<tr>
		<td height="87px" valign="middle">
			<!-- 공동물건목록 / 공동고객목록 -->
			<a href="./commObListView.do?pageNm=objtPublic&publicYn=Y"><img src="./resources/images/btn_m2.jpg"></a>&nbsp;&nbsp;<a href="./commClListView.do?pageNm=custPublic&publicYn=Y"><img src="./resources/images/btn_m3.jpg"></a>
		</td>
	</tr>
	<tr><td height="6px"></td></tr>
	<tr>
		<td height="87px">
			<!-- 활성물건카드 / 보류물건카드 -->
			<a href="./commObListView.do?pageNm=objtActiveY&activeTp=AT001"><img src="./resources/images/btn_m4.jpg"></a>&nbsp;&nbsp;<a href="./commObListView.do?pageNm=objtActiveN&activeTp=AT002"><img src="./resources/images/btn_m6.jpg"></a>
		</td><!-- ./viewActClCardView.do?activeTp=AT001&estateRange=Y -->
	</tr>
	<tr><td height="6px"></td></tr>
	<tr>
		<td height="87px">
			<!-- 활성고객카드 / 보류고객카드 -->
			<a href="./commClListView.do?pageNm=custActiveY&activeTp=AT001"><img src="./resources/images/btn_m5.jpg"></a>&nbsp;&nbsp;<a href="./commClListView.do?pageNm=custActiveN&activeTp=AT002"><img src="./resources/images/btn_m7.jpg"></a>
		</td>		
	</tr>
	<tr><td height="6px"></td></tr>
			<!-- 통합검색 -->
	<tr><td><a href="./totalSearch.do"><img src="./resources/images/btn_m8.jpg"></a></td></tr>
	<tr><td height="9px"></td></tr>
	<tr>
		<td height="87px">
			<!-- 업무일지작성 / 업무일지목록 -->
			<a href="./newLogbookView.do"><img src="./resources/images/btn_m10.jpg"></a>&nbsp;&nbsp;<a href="./logbookListView.do"><img src="./resources/images/btn_m9.jpg"></a>
		</td>
	</tr>
	<tr><td height="6px"></td></tr>
	<tr>
		<td height="87px">
			<!-- 계약보고서작성 / 계약보고서목록 -->
			<a href="./newReport.do"><img src="./resources/images/btn_m12.jpg"></a>&nbsp;&nbsp;<a href="./commRepList.do"><img src="./resources/images/btn_m11.jpg"></a>
		</td>
	</tr>
	<tr><td height="6px"></td></tr>
	<tr>
		<td height="87px">
			<!-- 신규물건등록 / 신규고객등록 -->
			<a href="./addObject.do"><img src="./resources/images/btn_m13.jpg"></a>&nbsp;&nbsp;<a href="./newClient.do"><img src="./resources/images/btn_m14.jpg"></a>
		</td>
	</tr>
	<tr><td height="6px"></td></tr>
	<tr>
		<td height="87px">
			<!-- 신규메모등록 / 메모목록 -->
			<a href="./newMemo.do"><img src="./resources/images/btn_m15.jpg"></a>&nbsp;&nbsp;<a href="./memoList.do"><img src="./resources/images/btn_m16.jpg"></a>
		</td>
	</tr>
	
<!-- 	 <tr>
		<td><button id="btnAddrPopup" onclick="buildingPopup();return false;">카테고리등록</button>
		<button id="btnAddrPopup" onclick="estatePopup();return false;">부동산등록</button></td>
	
	</tr> -->
	<!-- <tr><td><button id="btnAddrPopup" onclick="buildingPopup();return false;">건물등록</button></td></tr> -->
</table>