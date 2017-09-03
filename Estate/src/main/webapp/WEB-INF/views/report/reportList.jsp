<%@ include file="/WEB-INF/views/comm/adminHeader.jsp" %> 
<%@ page contentType="text/html; charset=utf-8" %>
<%@ include file="/WEB-INF/views/report/listStyle.jsp" %> 
<script type="text/javascript" src="./resources/js/report/reportList.js"></script>

<div style="width:1500px;margin:auto;padding:0;">

	<img src="./resources/images/title_report_list.jpg">
		<table class="report">
			<tr class="title">
				<td>등록일</td>
				<td>계약종류</td>
				<td>소재지</td>
				<td>계약일</td>
				<td>중도일</td>
				<td>잔금일</td>
				<td>담당자</td>
				<td>상태</td>
			</tr>
			<c:forEach var="i" begin="1" end="15" step="1">
			<tr>
				<td><a href="./viewClient">-</a></td>
				<td>-</td>
				<td>-</td>
				<td>-</td>
				<td>-</td>
				<td>-</td>
				<td>-</td>
				<td>-</td>
			</tr>
			</c:forEach>
			</table>
			<table width="1460px" height="41px" cellpadding="0" cellspacing="0" border="0">
			<tr><td height="20px" colspan="8">&nbsp;</td></tr>
				<tr>
					<td width="488px" height="41px">&nbsp;</td>
					<td width="486px" align="center"><img src="./resources/images/page_temp.jpg"></td>
					<td width="486px" align="right">
						<div style="width:486px;height:41px;margin:0;padding:0;text-align:right">
							<a href="./newReport"><img src="./resources/images/btn_add_report.jpg"></a>
						</div>
					</td>
				</tr>
				<tr><td height="20px" colspan="8">&nbsp;</td></tr>
			</table>				
		</table>
</div>

<%@ include file="/WEB-INF/views/comm/footer.jsp" %> 