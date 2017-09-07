<%@ page contentType="text/html; charset=utf-8" %>
<% request.setCharacterEncoding("utf-8");%>
<input type="hidden" name="getPath" id="getPath" value="<%=request.getContextPath()%>"/>
<script type="text/javascript" src="./resources/js/list/newBuilding.js"></script>

<table width="365px" cellpadding="0" cellspacing="0" border="0">
	<tr><td><a href="./totalList"><img src="./resources/images/btn_m1.jpg" border="0"></a></td></tr>
	<tr><td height="6px"></td></tr>
	<tr>
		<td height="90px" valign="middle">
			<a href="./commObList"><img src="./resources/images/btn_m2.jpg"></a>&nbsp;<a href="./commClListView.do"><img src="./resources/images/btn_m3.jpg"></a>
		</td>
	</tr>
	<tr>
		<td height="90px">
			<img src="./resources/images/btn_m4.jpg">&nbsp;<img src="./resources/images/btn_m5.jpg">
		</td>
	</tr>
	<tr>
		<td height="90px">
			<img src="./resources/images/btn_m6.jpg">&nbsp;<img src="./resources/images/btn_m7.jpg">
		</td>
		
	</tr>
	<tr><td><a href=""><img src="./resources/images/btn_m8.jpg"></a></td></tr>
	<tr><td height="6px"></td></tr>
	<tr>
		<td>
			<a href="./logbookListView"><img src="./resources/images/btn_m9.jpg"></a>&nbsp;<img src="./resources/images/btn_m10.jpg">
		</td>
	</tr>
	<tr>
		<td>
			<img src="./resources/images/btn_m11.jpg">&nbsp;<img src="./resources/images/btn_m12.jpg">
		</td>
	</tr>
	<tr><td><button id="btnAddrPopup" onclick="buildingPopup();return falase;">건물등록</button></td></tr>
</table>