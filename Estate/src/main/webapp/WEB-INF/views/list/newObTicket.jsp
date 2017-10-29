<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page contentType="text/html; charset=utf-8" %>
<% request.setCharacterEncoding("utf-8");%>
<%@ include file="/WEB-INF/views/comm/adminHeader.jsp" %> 
<%@ include file="/WEB-INF/views/list/listStyle.jsp" %> 
<link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script type="text/javascript" src="./resources/js/list/addObject.js"></script>

<form id="newObTicket" method="post" > 
<div class="new_page_title">
	<img src="./resources/images/title_new_ob_6.jpg">
</div>

<div class="new_page_container">
	<table class="new_page_table">
		<tr>
			<td class="title_ess">물건명(*)</td>
			<td colspan="4"><input type="text" id="objtNm" name="objtNm"> </td>
		</tr>
		<tr>
			<td class="title">고객정보</td>
			<td class="title2">성명 </td>
			<td width="365px"><input type="text" id="custNm" name="custNm" ></td>
			<td class="title2">연락처</td>
			<td><input type="text" maxLength ="3" style="width:105px" id="custTel1" name="custTel1"  >
				 - <input type="text" maxLength ="4" style="width:105px" id="custTel2" name="custTel2"  >
				 - <input type="text" maxLength ="4" style="width:105px" id="custTel3" name="custTel3"  ></td>
		</tr>
		<tr>
			<td class="title">건물명/면적</td>
			<td colspan="2">
				<select  id="buildCd" name="buildCd" style="width:350px">
				</select>&nbsp;
				<input type="number" style="width:135px" id="area" name="area" min="0" max="999999" oninput="if(this.value.length>7) this.value=this.value.slice(0,6)"> 평형
			</td>
			<td class="title_ess">유형(*)</td>
			<td>
			  <input type="radio" id="saleTp1" name="saleTp" value="ST006"/><label for="saleTp1">분양권</label>
			  <input type="radio" id="saleTp2" name="saleTp" value="ST007"/><label for="saleTp2">전매</label>
			
			</td>
		</tr>
		<tr>
			<td class="title_ess">분양가(*)</td>
			<td colspan="2">
			<input type="text" id="parcelAmt" name="parcelAmt"  onkeyup="inputNumberFormat(this)" maxLength="10" style="text-align:right;width:140px"/> 만원</td>
			<td class="title_ess">프리미엄(*)</td>
			<td>
			<input type="text" id="premiumAmt" name="premiumAmt"  onkeyup="inputNumberFormat(this)" maxLength="10" style="text-align:right;width:140px"/> 만원</td>
		
		</tr>
		<tr>
			<td class="title">동 / 층 / 향</td>
			<td colspan="4">
				<input type="text" name="dong" id="dong" style="width:140px" maxlength="5">
			<input type="number" name="floor" name="floor" style="width:140px" min="0" max="999" oninput="if(this.value.length>3) this.value=this.value.slice(0,3)"  /> 층&nbsp;&nbsp;&nbsp;
				<select style="width:130px" id="directionTp" name="directionTp" >
					<option value="DR001">동</option>
					<option value="DR002">서</option>
					<option value="DR003">남</option>
					<option value="DR004">북</option>
					<option value="DR005">남동</option>
					<option value="DR006">남서</option>
					<option value="DR007">북서</option>
					<option value="DR008">북동</option>
				</select>
			</td>
		</tr>
		<tr>
			<td class="title">입주가능일</td>
			<td colspan="2">
			  <input type="text" style="width:140px" id="availableDt" readonly="true"  name="availableDt" readonly="true"  class="datepicker"> 일
			</td>			
			<td class="title">만기일</td>
			<td><input type="text" id="dueDt" name="dueDt" readonly="true"  class="datepicker" style="width:140px"><img src="./resources/images/icon_cal.jpg"></td>
			
		</tr>
		<tr>
			<td class="title">매물설명</td>
			<td colspan="4">
				<textarea rows="6" cols="50" id="memo" name="memo" style="width:90%;height:450px;"></textarea>
			</td>
		</tr>
		<tr>
			<td class="title_ess">분류(*)</td>
			<td colspan="4">
			  <input type="radio" id="activeTp1" name="activeTp" value="AT001"/><label for="activeTp1">활성</label>
			  <input type="radio" id="activeTp2" name="activeTp" value="AT002"/><label for="activeTp2">보류</label>
			  <input type="radio" id="activeTp3" name="activeTp" value="AT003"/><label for="activeTp3">계약완료</label>
			  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			  <input type="checkbox" name="publicYn" id="publicYn" value="Y" /><label for="publicYn">공동</label>
			  <input type="checkbox" name="advertiseYn" id="advertiseYn" value="Y" /><label for="advertiseYn">광고</label>
			</td>
		</tr>
	</table>
	
	<div style="height:50px;"></div>
	<div style="width:1400px;margin:auto;text-align:center;">
		<a href="#"><img src="./resources/images/btn_save.jpg" onclick="f_saleobject_save();return false;"></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="#"><img src="./resources/images/btn_cancel.jpg" onclick="f_objt_dtl_view();return false;"></a>
	</div>
</div>
<input type="hidden" name="objtNo" id="objtNo" value="${objtNo}"/>
<input type="hidden" name="objtTp" id="objtTp" value="OT006"/>
<input type="hidden" name="custId" id="custId" value="">
<input type="hidden" name="pageNm" id="pageNm" value="${pageNm}"/>
</form>
<%@ include file="/WEB-INF/views/comm/adminFooter.jsp" %> 