<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page contentType="text/html; charset=utf-8" %>
<% request.setCharacterEncoding("utf-8");%>
<%@ include file="/WEB-INF/views/list/popupListStyle.jsp" %> 
<link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script type="text/javascript" src="../js/list/newEstate.js?v20180202"></script>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=Z0U9uQFTmyK7bim6HrQ6&submodules=geocoder"></script>
<body >
<form id="estatePopup" method="post"> 
<div class="popup_page_title">
	<img src="../images/title_estate_add.jpg">
</div>
<div class="popup_page_container">
	<table class="popup_page_table" style="width:100%;">
		<tr>
			<td class="title">부동산명</td>
			<td colspan="2"><input type="text" id="estateNm" name="estateNm"> </td>
		</tr>
		<tr>
			<td style="width:15%" class="title">전화번호</td>
			<td colspan="2">
				<input type="text" maxLength ="3" style="width:105px" id="tel1" name="tel1"  >
				 - <input type="text" maxLength ="4" style="width:105px" id="tel2" name="tel2"  >
				 - <input type="text" maxLength ="4" style="width:105px" id="tel3" name="tel3"  >
			</td>
		</tr>
		<tr>
			<td style="width:15%" class="title" >대표자명</td>
			<td colspan="2"><input type="text" id="rprsnNm" name="rprsnNm"> </td>
		</tr>
		<tr>
			<td style="width:15%" class="title" >대표자 전화번호</td>
			<td colspan="2">
				<input type="text" maxLength ="3" style="width:105px" id="rprsnTel1" name="rprsnTel1"  >
				 - <input type="text" maxLength ="4" style="width:105px" id="rprsnTel2" name="rprsnTel2"  >
				 - <input type="text" maxLength ="4" style="width:105px" id="rprsnTel3" name="rprsnTel3"  >
			</td>
		</tr>
		<tr>
			<td style="width:15%" class="title" >사업자 등록번호</td>
			<td colspan="2">
				<input type="text" id="businessCode" name="businessCode"  >
			</td>
		</tr>
		<tr>
			<td style="width:15%" class="title" >부동산 등록번호</td>
			<td colspan="2">
				<input type="text" id="estateCode" name="estateCode"  >
			</td>
		</tr>	
		<tr>
			<td style="width:15%" class="title" height="70px;">주소<a href="#"  onClick="goPopup();"><br><img src="../images/btn_search_address.jpg" /></a><!-- input type= "button" onClick="goPopup();" value= "주소찾기 " />--> </td>
			<td style="width:15%" >
				도로명주소	 
			</td>
			<td>
				<input type="text" id="estateAddr" name="estateAddr" disabled>
			</td>
		</tr>
		<tr>
			<td style="width:15%" class="title" rowspan="2">상세 주소</td>
			<td colspan="2">
				<input type="text" id="estateAddrDtl" name="estateAddrDtl"> 
			</td>
		</tr>
			
	</table>
	<div style="width:97%;height:45px;text-align:right;padding-top:10px;">
		<a href="#"><img src="../images/btn_add.jpg" onclick="f_estate_save();return false;"></a>
	</div>
<input type="hidden" id="estateCd" name="estateCd" />
</div>
</form>
