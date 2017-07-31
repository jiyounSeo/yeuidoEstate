<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% request.setCharacterEncoding("utf-8");%>
<%@ page contentType="text/html; charset=utf-8" %>
<%@ include file="/WEB-INF/views/comm/adminHeader.jsp" %> 
<%@ include file="/WEB-INF/views/list/listStyle.jsp" %> 
<script type="text/javascript" src="./resources/js/list/addObject.js"></script>

<div id="ob_list" style="width:1500px;margin:auto;padding:0;">
	<div style="width:1500px;height:78px;">
		<img src="./resources/images/title_ob_list.jpg">
	</div>
	<table class="add_ob_list">
		<tr>
			<td><a href="./newObApt.do"><img src="./resources/images/btn_add_ob1.jpg"></a></td>
			<td><a href="./commObList?mainc=1&tab=1"><img src="./resources/images/icon_ob1.jpg" style="padding-right:20px;vertical-align:middle"><span id="OT001ST001"></span>건</a></td>
			<td><a href="./commObList?mainc=1&tab=2"><img src="./resources/images/icon_ob2.jpg" style="padding-right:20px;vertical-align:middle"><span id="OT001ST002"></span>건</a></td>
			<td><a href="./commObList?mainc=1&tab=3"><img src="./resources/images/icon_ob3.jpg" style="padding-right:20px;vertical-align:middle"><span id="OT001ST003"></span>건</a></td>
			<td><a href="./commObList?mainc=1&tab=4"><img src="./resources/images/icon_ob4.jpg" style="padding-right:20px;vertical-align:middle"><span id="OT001ST004"></span>건</a></td>
		</tr>	
		<tr><td colspan="6"></td></tr>
		<tr>
			<td><a href="./newObStore.do"><img src="./resources/images/btn_add_ob2.jpg"></a></td>
			<td><a href="./commObList?mainc=2&tab=1"><img src="./resources/images/icon_ob1.jpg" style="padding-right:20px;vertical-align:middle"><span id="OT002ST001"></span>건</a></td>
			<td><a href="./commObList?mainc=2&tab=1"><img src="./resources/images/icon_ob5.jpg" style="padding-right:20px;vertical-align:middle"><span id="OT002ST005"></span>건</a></td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>	
		<tr><td colspan="6"></td></tr>
		<tr>
			<td><a href="./newObOffice.do"><img src="./resources/images/btn_add_ob3.jpg"></a></td>
			<td><a href="./commObList?mainc=3&tab=1"><img src="./resources/images/icon_ob1.jpg" style="padding-right:20px;vertical-align:middle"><span id="OT003ST001"></span>건</a></td>
			<td><a href="./commObList?mainc=3&tab=1"><img src="./resources/images/icon_ob5.jpg" style="padding-right:20px;vertical-align:middle"><span id="OT003ST005"></span>건</a></td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>	
		<tr><td colspan="6"></td></tr>
		<tr>
			<td><a href="./newObOps.do"><img src="./resources/images/btn_add_ob4.jpg"></a></td>
			<td><a href="./commObList?mainc=4&tab=1"><img src="./resources/images/icon_ob1.jpg" style="padding-right:20px;vertical-align:middle"><span id="OT004ST001"></span>건</a></td>
			<td><a href="./commObList?mainc=4&tab=2"><img src="./resources/images/icon_ob2.jpg" style="padding-right:20px;vertical-align:middle"><span id="OT004ST002"></span>건</a></td>
			<td><a href="./commObList?mainc=4&tab=3"><img src="./resources/images/icon_ob3.jpg" style="padding-right:20px;vertical-align:middle"><span id="OT004ST003"></span>건</a></td>
			<td><a href="./commObList?mainc=4&tab=4"><img src="./resources/images/icon_ob4.jpg" style="padding-right:20px;vertical-align:middle"><span id="OT004ST004"></span>건</a></td>
		</tr>	
		<tr><td colspan="6"></td></tr>
		<tr>
			<td><a href="./newObHrapt.do"><img src="./resources/images/btn_add_ob5.jpg"></a></td>
			<td><a href="./commObList?mainc=5&tab=1"><img src="./resources/images/icon_ob1.jpg" style="padding-right:20px;vertical-align:middle"><span id="OT005ST001"></span>건</a></td>
			<td><a href="./commObList?mainc=5&tab=2"><img src="./resources/images/icon_ob2.jpg" style="padding-right:20px;vertical-align:middle"><span id="OT005ST002"></span>건</a></td>
			<td><a href="./commObList?mainc=5&tab=3"><img src="./resources/images/icon_ob3.jpg" style="padding-right:20px;vertical-align:middle"><span id="OT005ST003"></span>건</a></td>
			<td><a href="./commObList?mainc=5&tab=4"><img src="./resources/images/icon_ob4.jpg" style="padding-right:20px;vertical-align:middle"><span id="OT005ST004"></span>건</a></td>
		</tr>	
		<tr><td colspan="6"></td></tr>
		<tr>
			<td><a href="./newObTicket.do"><img src="./resources/images/btn_add_ob6.jpg"></a></td>
			<td><a href="./commObList?mainc=6&tab=1"><img src="./resources/images/icon_ob6.jpg" style="padding-right:20px;vertical-align:middle"><span id="OT006ST006"></span>건</a></td>
			<td><a href="./commObList?mainc=6&tab=1"><img src="./resources/images/icon_ob7.jpg" style="padding-right:20px;vertical-align:middle"><span id="OT006ST007"></span>건</a></td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>	
	</table>
	<table width="1500px" cellpadding="0" cellspacing="0" border="0">
		<tr><td height="50px"></td></tr>
		<tr><td style="text-align:center"><a href="#"><img src="./resources/images/btn_cancel.jpg"></a></td></tr>
	</table>
</div>

<%@ include file="/WEB-INF/views/comm/footer.jsp" %> 