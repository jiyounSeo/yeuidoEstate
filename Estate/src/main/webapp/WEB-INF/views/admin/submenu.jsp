<%@ page contentType="text/html; charset=utf-8" %>
<% request.setCharacterEncoding("utf-8");%>
<input type="hidden" name="getPath" id="getPath" value="<%=request.getContextPath()%>"/>
<script type="text/javascript" src="./resources/js/list/newBuilding.js"></script>

<table width="365px" cellpadding="0" cellspacing="0" border="0">
	<tr><td><a href="./totalListView.do"><img src="./resources/images/btn_m1.jpg" border="0"></a></td></tr>
	<tr><td height="6px"></td></tr>
	<tr>
		<td height="90px" valign="middle">
			<!-- 공동물건카드 -->
			<a href="./commObListView.do?pageNm=objtPublic&publicYn=Y"><img src="./resources/images/btn_m2.jpg"></a>&nbsp;<a href="./commClListView.do?pageNm=custPublic&publicYn=Y"><img src="./resources/images/btn_m3.jpg"></a>
		</td>
	</tr>
	<tr>
		<td height="90px">
			<!-- 활성물건카드 -->
			<a href="./commObListView.do?pageNm=objtActiveY&activeTp=AT001"><img src="./resources/images/btn_m4.jpg"></a>&nbsp;<a href="./commClListView.do?pageNm=custActiveY&activeTp=AT001"><img src="./resources/images/btn_m5.jpg"></a>
		</td><!-- ./viewActClCardView.do?activeTp=AT001&estateRange=Y -->
	</tr>
	<tr>
		<td height="90px">
			<!-- 보류물건카드 -->
			<a href="./commObListView.do?pageNm=objtActiveN&activeTp=AT002"><img src="./resources/images/btn_m6.jpg"></a>&nbsp;<a href="./commClListView.do?pageNm=custActiveN&activeTp=AT002"><img src="./resources/images/btn_m7.jpg"></a>
		</td>
		
	</tr>
	<tr><td><a href=""><img src="./resources/images/btn_m8.jpg"></a></td></tr>
	<tr><td height="6px"></td></tr>
	<tr>
		<td>
			<a href="./logbookListView.do"><img src="./resources/images/btn_m9.jpg"></a>&nbsp;<a href="./newLogbookView.do"><img src="./resources/images/btn_m10.jpg"></a>
		</td>
	</tr>
	<tr>
		<td>
			<a href="./commRepList.do"><img src="./resources/images/btn_m11.jpg"></a>&nbsp;<a href="./newReport.do"><img src="./resources/images/btn_m12.jpg"></a>
		</td>
	</tr>
	<tr><td><button id="btnAddrPopup" onclick="buildingPopup();return false;">건물등록</button></td></tr>
</table>