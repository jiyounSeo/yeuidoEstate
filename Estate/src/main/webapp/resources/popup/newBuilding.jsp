<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page contentType="text/html; charset=utf-8" %>
<% request.setCharacterEncoding("utf-8");%>
<%@ include file="/WEB-INF/views/list/popupListStyle.jsp" %> 
<link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script type="text/javascript" src="../js/list/newBuilding.js"></script>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=Z0U9uQFTmyK7bim6HrQ6&submodules=geocoder"></script>
<!-- 아파트 -->
<body >
<form id="buildingPopup" method="post"> 
<div class="popup_page_title">
	<img src="./resources/images/title_popup_ob_1.jpg">
</div>
<div class="popup_page_container">
	<table class="popup_page_table" style="width:100%;">
		<tr>
			<td class="title">유형</td>
			<td colspan="2">
			  <input type="radio" id="objtTp1" name="objtTp" value="OT001"/><label for="objtTp1">아파트</label>
			  <input type="radio" id="objtTp2" name="objtTp" value="OT002"/><label for="objtTp2">상가</label>
			  <input type="radio" id="objtTp3" name="objtTp" value="OT003"/><label for="objtTp3">사무실/빌딩</label>
			  <input type="radio" id="objtTp4" name="objtTp" value="OT004"/><label for="objtTp4">오피스텔</label>
			  <input type="radio" id="objtTp5" name="objtTp" value="OT005"/><label for="objtTp5">주상복합</label>
			  <input type="radio" id="objtTp6" name="objtTp" value="OT006"/><label for="objtTp6">분양권</label>
			</td>
		</tr>
		
		<tr>
			<td class="title">카테고리명</td>
			<td colspan="2"><input type="text" id="buildNm" name="buildNm"> </td>
		</tr>
		<tr>
			<td style="width:15%" class="title" rowspan="3">주소<input type= "button" onClick="goPopup();" value= "주소찾기 " /> </td>
			<td style="width:15%" >
				도로명주소	 
			</td>
			<td>
				<input type="text" id="roadAddrPart1" name="roadAddrPart1" disabled> 
			</td>
		</tr>
		<tr>
			<td style="width:15%" rowspan="2">
				지번주소	 
			</td>
			<td>
				<input type="text" id="zipNo" name="zipNo" disabled>
			</td>
		</tr>
		<tr>
			<td>
				<input type="text" id="jibunAddr" name="jibunAddr" disabled>
			</td>
		</tr>
		<tr>
			<td style="width:15%" class="title" rowspan="2">상세 주소</td>
			<td colspan="2">
				<input type="text" id="addrDetail" name="addrDetail"> 
			</td>
		</tr>
	</table>
	<div id="map" style="width:100%;height:400px;"></div>
	<img src="../images/btn_add.jpg" onclick="f_building_save();return false;">
	
</div>
<input type="hidden" id="buildCd" name="buildCd" />
</form>
