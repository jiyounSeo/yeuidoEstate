<%@ include file="/WEB-INF/views/comm/adminHeader.jsp" %> 
<%@ page contentType="text/html; charset=utf-8" %>
<head>
	<meta charset="utf-8">
	<title>여의도 부동산</title>
	<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
	<script src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
	<script type="text/javascript" src="./resources/js/comm/jquery.tmpl.js"></script>
	<script type="text/javascript" src="./resources/js/comm/common.js"></script>				
	
</head>

<div style="width:1485px; margin:auto">
<table width="1485px" cellpadding="0" cellspaing="0" border="0">
	<tr>
		<td width="1103px" valign="top">
		
			<%@ include file="/WEB-INF/views/admin/cal.jsp" %> 
		</td>
		<td width="17px"></td>
		<td width="365px" valign="top">
			<%@ include file="/WEB-INF/views/admin/submenu.jsp" %> 
		</td>
	</tr>
</table>


<%@ include file="/WEB-INF/views/memo/memoList.jsp" %> 	
<table width="100%" cellpadding="0" cellspaing="0" border="0">
	<tr><td height="15px" colspan="7"></td></tr>
	<tr>
		<td width="136px">
			<a href="#" id="addMemoBtn"><img src="./resources/images/btn_new_memo.jpg"><br><div style="height: 16px;"></a></div>
			<a href="#" id="listMemoBtn"><img src="./resources/images/btn_list_memo.jpg"></a>
		</td>
		<td width="10px"></td>
		<td width="572px" height="276px" background="./resources/images/lst_todo_bg.jpg">&nbsp;</td>
		<td width="10px"></td>
		<td width="372px" height="276px" background="./resources/images/lst_notice_bg.jpg">&nbsp;</td>
		<td width="10px"></td>
		<td width="372px" height="276px" background="./resources/images/lst_bbs_bg.jpg">&nbsp;</td>
	</tr>
</table>
</div>
<%@ include file="/WEB-INF/views/comm/footer.jsp" %> 	
