<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page contentType="text/html; charset=utf-8" %>
<% request.setCharacterEncoding("utf-8");%>
<%@ include file="/WEB-INF/views/comm/adminHeader.jsp" %> 
<%@ include file="/WEB-INF/views/list/listStyle.jsp" %> 
<link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script type="text/javascript" src="./resources/js/list/newBuilding.js"></script>

<!-- 아파트 -->
<form id="newObApt" method="post" > 
<div class="new_page_title">
	<img src="./resources/images/title_new_ob_1.jpg">
</div>
<div class="new_page_container">
	<table class="new_page_table">
		<tr>
			<td class="title">물건명</td>
			<td colspan="4"><input type="text" id="objtNm" name="objtNm"> </td>
		</tr>
		
		<tr>
			<td class="title">단지명/면적</td>
			<td colspan="2">
				<input type="text" id="roadFullAddr" name="roadFullAddr" />
				<input type= "button" onClick="goPopup();" value= " 팝업 " /> 
			</td>
			<td class="title">상세주소</td>
			<td>
				<input type="text" id="roadAddrPart1" name="roadAddrPart1" />
				<input type="text" id="roadAddrPart2" name="roadAddrPart2" />
				<input type="text" id="addrDetail" name="addrDetail" />
				<input type="text" id="zipNo" name="zipNo" />
			
			</td>
		</tr>
	</table>
	<div style="height:50px;"></div>
	<div style="width:1400px;margin:auto;text-align:center;">
		<a href="#"><img src="./resources/images/btn_add.jpg" onclick="f_saleobject_save();return false;"></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="#"><img src="./resources/images/btn_cancel.jpg"></a>
	</div>
</div>
<input type="hidden" name="objtNo" id="objtNo" value="${objtNo}"/>
<input type="hidden" name="objtTp" id="objtTp" value="OT001"/>

</form>
<%@ include file="/WEB-INF/views/comm/footer.jsp" %> 