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
<script type="text/javascript">
$( document ).ready(function() {
	//년도 selectbox만들기               
	for(var sy = 1790 ; sy <= 2120 ; sy++) {
		  $('#finishedY').append('<option value="' + sy + '">' + sy + '년</option>');    
	}
	// 월별 selectbox 만들기            
	for(var i=1; i <= 12; i++) {
		  var sm = i > 9 ? i : "0"+i ;            
		  $('#finishedM').append('<option value="' + sm + '">' + sm + '월</option>');    
	} 
});
</script>
<body >
<form id="buildingPopup" method="post"> 
<div class="popup_page_title">
	<img src="../images/title_category_add.jpg">
</div>
<div class="popup_page_container">
	<table class="popup_page_table" style="width:100%;">
		<tr>
			<td class="title">유형</td>
			<td colspan="2">
			  <input type="radio" id="objtTp1" name="objtTp" value="OT001"/><label for="objtTp1">아파트</label>
			  <!-- <input type="radio" id="objtTp2" name="objtTp" value="OT002"/><label for="objtTp2">상가</label>
			  <input type="radio" id="objtTp3" name="objtTp" value="OT003"/><label for="objtTp3">사무실/빌딩</label>
			   -->
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
			<td style="width:15%" class="title" rowspan="3">주소<a href="#"  onClick="goPopup();"><br><img src="../images/btn_search_address.jpg" /></a><!-- <input type= "button" onClick="goPopup();" value= "주소찾기 " />  --></td>
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
	
	<table class="popup_page_table" style="width:100%;margin-top:10px;">
		<tr>
			<td class="title_detail">총 동수</td>
			<td><input type="text" style="width:150px;" id="totalDongNum" name="totalDongNum">&nbsp;개동</td>
		
			<td class="title_detail">총 세대수</td>
			<td><input type="text" style="width:150px;" id="totalHouseholdNum" name="totalHouseholdNum">&nbsp;세대</td>
		</tr>
		<tr>
			<td class="title_detail">총 주차대수</td>
			<td><input type="text" style="width:150px;" id="totalParkingNum" name="totalParkingNum">&nbsp;대</td>

			<td class="title_detail">최고증</td>
			<td><input type="text" style="width:150px;" id="highestFloor" name="highestFloor">층</td>
		</tr>
		<tr>
			<td class="title_detail">난방방식</td>
			<td><input type="text" id="heatingType" name="heatingType"> </td>
			
			<td class="title_detail">난방연료</td>
			<td><input type="text" id="heatingFuel" name="heatingFuel"> </td>
		</tr>
		<tr>
			<td class="title_detail">면적범위</td>
			<td><input type="text" style="width:100px;" id="minArea" name="minArea">㎡ ~ <input type="text" style="width:100px;" id="maxArea" name="maxArea">㎡</td>
			
			<td class="title_detail">건설사명</td>
			<td><input type="text" id="builderName" name="builderName"> </td>
		</tr>
		<tr>
			<td class=title_detail>준공년월</td>
			<td colspan="3">
				<select id="finishedY" name="finishedY" style="width:130px;"></select> 년
				<select id="finishedM" name="finishedM" style="width:130px;"></select> 월
			</td>
		</tr>	
	</table>
	<div style="width:97%;height:45px;text-align:right;padding:20px 30px 10px 0;">
		<a href="#"><img src="../images/btn_add.jpg" onclick="f_building_save();return false;"></a>
	</div>
	<div id="map" style="width:98%;height:380px;">
	</div>	
</div>
<input type="hidden" id="positionX" name="positionX" />
<input type="hidden" id="positionY" name="positionY" />
<input type="hidden" id="buildCd" name="buildCd" />
</form>
