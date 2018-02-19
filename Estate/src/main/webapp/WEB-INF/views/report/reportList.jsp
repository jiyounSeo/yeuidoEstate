<%@ include file="/WEB-INF/views/comm/adminHeader.jsp" %> 
<%@ page contentType="text/html; charset=utf-8" %>
<%@ include file="/WEB-INF/views/report/listStyle.jsp" %> 
<script type="text/javascript" src="./resources/js/report/reportList.js?v20180219"></script>

<div style="width:1500px;margin:auto;padding:0;">

	<img src="./resources/images/title_report_list.jpg">
		<table id="reportList" class="report">
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
			</table>
			<table width="1460px" height="41px" cellpadding="0" cellspacing="0" border="0">
			<tr><td height="20px">&nbsp;</td></tr>
				<tr>
					<td width="488px" height="41px" align="right"><a href="./newReport.do"><img src="./resources/images/btn_add_report.jpg"></a></td>
				</tr>
				<tr><td height="20px">&nbsp;</td></tr>
			</table>				
		</table>
</div>
<div class="new_page_container" style="text-align:center;">
	<div id="pagingDiv" class="pagination" style="margin:0 auto;"></div>
</div>

<%@ include file="/WEB-INF/views/comm/adminFooter.jsp" %> 