<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% request.setCharacterEncoding("utf-8");%>
<%@ page contentType="text/html; charset=utf-8" %>
<%@ include file="/WEB-INF/views/comm/adminHeader.jsp" %> 
<%@ include file="/WEB-INF/views/list/listStyle.jsp" %> 
<link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script type="text/javascript" src="./resources/js/list/objectCnt.js"></script>

<form id="addObject" method="post" > 
<div id="ob_list" style="width:1500px;margin:auto;padding:0;">
	<div style="width:1500px;height:78px;">
		<img src="./resources/images/title_ob_list.jpg">
	</div>
	<table class="add_ob_list">
		<tr>
			<td><a href="./newObApt.do"><img src="./resources/images/btn_add_ob1.jpg"></a></td>
			<td><a href="#objt" onclick="f_add_objectView('OT001','ST001');return false;"><img src="./resources/images/icon_ob1.jpg" style="padding-right:20px;vertical-align:middle"><span id="OT001ST001"></span>건</a></td>
			<td><a href="#objt" onclick="f_add_objectView('OT001','ST002');return false;"><img src="./resources/images/icon_ob2.jpg" style="padding-right:20px;vertical-align:middle"><span id="OT001ST002"></span>건</a></td>
			<td><a href="#objt" onclick="f_add_objectView('OT001','ST003');return false;"><img src="./resources/images/icon_ob3.jpg" style="padding-right:20px;vertical-align:middle"><span id="OT001ST003"></span>건</a></td>
			<td><a href="#objt" onclick="f_add_objectView('OT001','ST004');return false;"><img src="./resources/images/icon_ob4.jpg" style="padding-right:20px;vertical-align:middle"><span id="OT001ST004"></span>건</a></td>
		</tr>	
		<tr><td colspan="6"></td></tr>
		<tr>
			<td><a href="./newObStore.do"><img src="./resources/images/btn_add_ob2.jpg"></a></td>
			<td><a href="#objt" onclick="f_add_objectView('OT002','ST001');return false;"><img src="./resources/images/icon_ob1.jpg" style="padding-right:20px;vertical-align:middle"><span id="OT002ST001"></span>건</a></td>
			<td><a href="#objt" onclick="f_add_objectView('OT002','ST005');return false;"><img src="./resources/images/icon_ob5.jpg" style="padding-right:20px;vertical-align:middle"><span id="OT002ST005"></span>건</a></td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>	
		<tr><td colspan="6"></td></tr>
		<tr>
			<td><a href="./newObOffice.do"><img src="./resources/images/btn_add_ob3.jpg"></a></td>
			<td><a href="#objt" onclick="f_add_objectView('OT003','ST001');return false;"><img src="./resources/images/icon_ob1.jpg" style="padding-right:20px;vertical-align:middle"><span id="OT003ST001"></span>건</a></td>
			<td><a href="#objt" onclick="f_add_objectView('OT003','ST005');return false;"><img src="./resources/images/icon_ob5.jpg" style="padding-right:20px;vertical-align:middle"><span id="OT003ST005"></span>건</a></td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>	
		<tr><td colspan="6"></td></tr>
		<tr>
			<td><a href="./newObOps.do"><img src="./resources/images/btn_add_ob4.jpg"></a></td>
			<td><a href="#objt" onclick="f_add_objectView('OT004','ST001');return false;"><img src="./resources/images/icon_ob1.jpg" style="padding-right:20px;vertical-align:middle"><span id="OT004ST001"></span>건</a></td>
			<td><a href="#objt" onclick="f_add_objectView('OT004','ST002');return false;"><img src="./resources/images/icon_ob2.jpg" style="padding-right:20px;vertical-align:middle"><span id="OT004ST002"></span>건</a></td>
			<td><a href="#objt" onclick="f_add_objectView('OT004','ST003');return false;"><img src="./resources/images/icon_ob3.jpg" style="padding-right:20px;vertical-align:middle"><span id="OT004ST003"></span>건</a></td>
			<td><a href="#objt" onclick="f_add_objectView('OT004','ST004');return false;"><img src="./resources/images/icon_ob4.jpg" style="padding-right:20px;vertical-align:middle"><span id="OT004ST004"></span>건</a></td>
		</tr>	
		<tr><td colspan="6"></td></tr>
		<tr>
			<td><a href="./newObHrapt.do"><img src="./resources/images/btn_add_ob5.jpg"></a></td>
			<td><a href="#objt" onclick="f_add_objectView('OT005','ST001');return false;"><img src="./resources/images/icon_ob1.jpg" style="padding-right:20px;vertical-align:middle"><span id="OT005ST001"></span>건</a></td>
			<td><a href="#objt" onclick="f_add_objectView('OT005','ST002');return false;"><img src="./resources/images/icon_ob2.jpg" style="padding-right:20px;vertical-align:middle"><span id="OT005ST002"></span>건</a></td>
			<td><a href="#objt" onclick="f_add_objectView('OT005','ST003');return false;"><img src="./resources/images/icon_ob3.jpg" style="padding-right:20px;vertical-align:middle"><span id="OT005ST003"></span>건</a></td>
			<td><a href="#objt" onclick="f_add_objectView('OT005','ST004');return false;"><img src="./resources/images/icon_ob4.jpg" style="padding-right:20px;vertical-align:middle"><span id="OT005ST004"></span>건</a></td>
		</tr>	
		<tr><td colspan="6"></td></tr>
		<tr>
			<td><a href="./newObTicket.do"><img src="./resources/images/btn_add_ob6.jpg"></a></td>
			<td><a href="#objt" onclick="f_add_objectView('OT006','ST006');return false;"><img src="./resources/images/icon_ob6.jpg" style="padding-right:20px;vertical-align:middle"><span id="OT006ST006"></span>건</a></td>
			<td><a href="#objt" onclick="f_add_objectView('OT006','ST007');return false;"><img src="./resources/images/icon_ob7.jpg" style="padding-right:20px;vertical-align:middle"><span id="OT006ST007"></span>건</a></td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>	
	</table>
	<div id="pagingDiv">
	</div>
	<table width="1500px" cellpadding="0" cellspacing="0" border="0">
		<tr><td height="50px"></td></tr>
		<tr><td style="text-align:center"><a href="#obj" onclick="f_objt_dtl_view();return false;"><img src="./resources/images/btn_cancel.jpg" "></a></td></tr>
	</table>
</div>

<input type="hidden" name="objtTp" id="objtTp"/>
<input type="hidden" name="saleTp" id="saleTp"/>
<input type="hidden" name="publicYn" id="publicYn" value="${publicYn}"/>
<input type="hidden" name="activeTp" id="activeTp" value="${activeTp}"/>
<input type="hidden" name="estateRange" id="estateRange" value="${estateRange}"/>
</form>
<%@ include file="/WEB-INF/views/comm/footer.jsp" %> 