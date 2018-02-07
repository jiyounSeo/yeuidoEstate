<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="/WEB-INF/views/list/listStyle.jsp" %> 
<%@ include file="/WEB-INF/views/list/popupListStyle.jsp" %> 
<%@ page contentType="text/html; charset=utf-8" %>
<% request.setCharacterEncoding("utf-8");%>
<link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script type="text/javascript" src="../js/comm/jquery.tmpl.js"></script>
<script type="text/javascript" src="../js/list/srchInterObjt.js?v20180207"></script>
<!-- 아파트 -->
<body >
<form id="srchObjtPop" method="post"> 

<div  style="text-align: right;">
	<table class="new_page_table" style="width:100%;">
		<tr>
			<td class="title" colspan="4">고객이 찾는 대상 물건조건</td>
		</tr>
		<tr>
			<td class="title2">물건명</td>
			<td colspan="3"><input type="text" id="objtNm" name="objtNm"> </td>
		</tr>
		<tr>
			<td class="title2">물건종류</td>
			<td colspan="3">
			  <input type="checkbox" id="objtTp1" name="objtTp1" value="OT001"/><label for="objtTp1">아파트</label>
			  <input type="checkbox" id="objtTp2" name="objtTp2" value="OT002"/><label for="objtTp2">상가</label>
			  <input type="checkbox" id="objtTp3" name="objtTp3" value="OT003"/><label for="objtTp3">사무실/빌딩</label>
			  <input type="checkbox" id="objtTp4" name="objtTp4" value="OT004"/><label for="objtTp4">오피스텔</label>
			  <input type="checkbox" id="objtTp5" name="objtTp5" value="OT005"/><label for="objtTp5">주상복합</label>
			  <input type="checkbox" id="objtTp6" name="objtTp6" value="OT006"/><label for="objtTp6">분양권</label>
			</td>
		</tr>
		<tr>
			<td class="title2">물건유형</td>
			<td colspan="3">
			  <input type="checkbox" id="saleTp1" name="saleTp1" value="ST001"/><label for="saleTp1">매매</label>
			  <input type="checkbox" id="saleTp2" name="saleTp2" value="ST002"/><label for="saleTp2">전세</label>
			  <input type="checkbox" id="saleTp3" name="saleTp3" value="ST003"/><label for="saleTp3">월세</label>
			  <input type="checkbox" id="saleTp4" name="saleTp4" value="ST004"/><label for="saleTp4">렌트</label>
			</td>
		</tr>
		<tr>
			<td class="title2">주소</td>
			<td colspan="3">
				<input type="text" id="addr" name="addr" style="width:65%;" onKeydown="f_controlTypeBox()"  onChange="f_controlTypeBox()">&nbsp;&nbsp; 
				<span id="addrType" name="addrType" style="visibility:hidden">
					<input type="radio" id="rdoAddr1" name="rdoAddr" value="1"/><label for="rdoAddr1">도로명</label>
					<input type="radio" id="rdoAddr2" name="rdoAddr" value="2"/><label for="rdoAddr1">지번</label>
				</span>
			</td>
		</tr>
		<tr>
			<td class="title2">평수</td>
			<td>
				<input type="number" style="width:135px" id="fromArea" name="fromArea" min="0" max="999999" oninput="if(this.value.length>7) this.value=this.value.slice(0,6)">
				&nbsp;~&nbsp;<input type="number" style="width:135px" id="toArea" name="toArea" min="0" max="999999" oninput="if(this.value.length>7) this.value=this.value.slice(0,6)"> 평형
			</td>
			<td class="title2">매매가</td>
			<td >
			<input type="text" id="fromBargainAmt" name="fromBargainAmt"  onkeyup="inputNumberFormat(this)" style="text-align:right;width:140px"/>
			&nbsp;~&nbsp;<input type="text" id="toBargainAmt" name="toBargainAmt"  onkeyup="inputNumberFormat(this)" style="text-align:right;width:140px"/> 만원
			</td>
		</tr>
		<tr>
			<td class="title2">보증금</td>
			<td>
			<input type="text" id="fromDepositAmt" name="fromDepositAmt" onkeyup="inputNumberFormat(this)" style="text-align:right;width:140px"/>
			&nbsp;~&nbsp;<input type="text" id="toDepositAmt" name="toDepositAmt" onkeyup="inputNumberFormat(this)" style="text-align:right;width:140px"/> 만원
			</td>
			<td class="title2">월세</td>
			<td >
			<input type="text" id="fromMonthlyAmt" name="fromMonthlyAmt" onkeyup="inputNumberFormat(this)" style="text-align:right;width:140px"/>
			&nbsp;~&nbsp;<input type="text" id="toMonthlyAmt" name="toMonthlyAmt" onkeyup="inputNumberFormat(this)" style="text-align:right;width:140px"/> 만원</td>
		</tr>
		<tr>
			<td class="title2">고객성명 </td>
			<td width="365px"><input type="text" id="custNm" name="custNm" ></td>
			<td class="title2">고객연락처</td>
			<td><input type="number" style="width:100px" id="custTel1" name="custTel1" min="0" max="999" oninput="if(this.value.length>4) this.value=this.value.slice(0,3)">
				 - <input type="number" style="width:100px" id="custTel2" name="custTel2" min="0" max="9999" oninput="if(this.value.length>5) this.value=this.value.slice(0,4)">
				 - <input type="number" style="width:100px" id="custTel3" name="custTel3" min="0" max="9999" oninput="if(this.value.length>5) this.value=this.value.slice(0,4)"></td>
		</tr>
	</table>	
	<div width="100%" style="text-align: right;margin:10px;">
		<button type="button" style="align:right;" id="btnSrch" class="btn_type1" onclick="f_objt_search();return false;">검색</button>
	</div>	
	
	</p>
	
	<table style="background-color :#F6F8F7; width:100%" class="ob_list" id="objtTable">
		<tr id="objtListTr">
			<td style="background-color:#55555D; color:#fff;">선택</td>
			<td style="background-color:#55555D; color:#fff;">물건명</td>
			<td style="background-color:#55555D; color:#fff;">종류</td>
			<td style="background-color:#55555D; color:#fff;">유형</td>
			<td style="background-color:#55555D; color:#fff;">주소</td>
			<td style="background-color:#55555D; color:#fff;">실평수</td>
			<td style="background-color:#55555D; color:#fff;">매매가</td>
			<td style="background-color:#55555D; color:#fff;">보증금</td>
			<td style="background-color:#55555D; color:#fff;">월세</td>
		</tr>
		<tbody id="objtTbody">
			
		</tbody>
	</table>
	<div width="100%" style="text-align: right;margin:10px;">
		<button type="button" style="align:right;" id="btnSave" class="btn_type1" onclick="f_interObjt_insert();return false;">관심물건 등록</button>
	</div>	
</div>
<input type="hidden" name="custId" id="custId" >
</form>
<script id="objtListTemplte" type="text/x-jquery-tmpl">	
{{each srchObjt}}		
	<tr>
		<td><input type="checkbox" name="chk" id="chk{{html $index}}" value="{{html $value.objtNo}}" /><label for="chk{{html $index}}"></label></td>
		<td>{{html $value.objtNm}}</td>
		<td>{{html $value.objtTpNm}}</td>
		<td>{{html $value.saleTpNm}}</td>
		<td>{{html $value.area}}</td>
		<td>{{html $value.area}}</td>
		<td>{{html $value.bargainAmt}}</td>
		<td>{{html $value.depositAmt}}</td>
		<td>{{html $value.monthlyAmt}}</td>
	</tr>
{{/each}}	
</script>
<script id="objtListEmptyTemplte" type="text/x-jquery-tmpl">	
	<tr>
		<td colspan="9">조회된 물건이 존재하지 않습니다.</td>
	</tr>
</script>

