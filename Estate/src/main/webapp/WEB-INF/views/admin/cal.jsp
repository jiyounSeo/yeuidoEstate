<%@ page contentType="text/html; charset=utf-8" %>
<script type="text/javascript" src="./resources/js/cal/clndr.js"></script>
<script type="text/javascript" src="./resources/js/cal/cal.js"></script>
<%@ include file="/WEB-INF/views/admin/calStyle.jsp" %> 

<table width="1103px" cellpadding="0" cellspacing="0" border="0">
	<tr>
		<td>
			<div class="cal1"></div>        
		</td>
	</tr>
	<tr><td height="12px"></td></tr>
	<tr>
		<td>
			<div class="work" style="height:177px; overflow-x:hidden; overflow-y:scroll;border: 1px solid #b2b2b2;" id="workList">
				<table cellpadding="0" cellspacing="0">
					<tr><td>test1</td></tr>
					<tr><td>test2</td></tr>
					<tr><td>test3</td></tr>
					<tr><td>test4</td></tr>
					<tr><td>test5</td></tr>
				</table>
			</div>        
		</td>
	</tr>
</table>