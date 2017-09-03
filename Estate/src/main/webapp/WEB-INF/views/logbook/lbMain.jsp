<%@ include file="/WEB-INF/views/comm/adminHeader.jsp" %> 
<%@ page contentType="text/html; charset=utf-8" %>
<script type="text/javascript" src="./resources/js/cal/clndr.js"></script>
<script type="text/javascript" src="./resources/js/logbook/cal.js"></script>
<%@ include file="/WEB-INF/views/logbook/listStyle.jsp" %> 

<div style="width:1103px;margin:auto;padding:0;">
<table width="1103px" cellpadding="0" cellspacing="0" border="0">
	<tr>
		<td><img src="./resources/images/title_logbook_list.jpg"></td>
	</tr>
	<tr>
		<td>
			<div class="cal1"></div>        
		</td>
	</tr>
	<tr><td height="25px"></td></tr>
	<tr>
		<td align="right"><a href="./newLogbookView"><img src="./resources/images/btn_add_lb.jpg"></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
	</tr>
</table>

</div>
<%@ include file="/WEB-INF/views/comm/footer.jsp" %> 