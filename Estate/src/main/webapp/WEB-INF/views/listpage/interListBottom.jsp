<%@ page contentType="text/html; charset=utf-8" %>
<%@ include file="/WEB-INF/views/memo/memoStyle.jsp" %> 
<% request.setCharacterEncoding("utf-8");%>
<script type="text/javascript" src="./resources/js/comm/jquery.lightbox_me.js"></script>
<script type="text/javascript" src="./resources/js/list/interList.js"></script>
<script type="text/javascript" src="./resources/js/comm/common.js"></script>
	<table class="new_page_table">
		<tr>
			<td class="title4">
				고객 대상 물건
			</td>
			<td class="title4">
				<div style="text-align: right;margin:10px;">
					<button type="button" style="align:right;" id="btnAddrPopup" class="btn_type1" onclick="f_srchObjt_popup();return false;">물건검색</button>
				</div>	
			</td>
		</tr>
	</table>
	<div class="scrollDiv">
		<table class="new_page_table" style="background-color :#F6F8F7;" id="objtTable">
			<colgroup>
				<col width="15%">
				<col width="10%">
				<col width="10%">
				<col width="25%">
				<col width="8%">
				<col width="8%">
				<col width="8%">
				<col width="8%">
				<col width="8%">
			</colgroup>
			<tr id="objtListTr">
				<td style="background-color:#55555D; color:#fff; text-align:center;">물건명</td>
				<td style="background-color:#55555D; color:#fff; text-align:center;">종류</td>
				<td style="background-color:#55555D; color:#fff; text-align:center;">유형</td>
				<td style="background-color:#55555D; color:#fff; text-align:center;">주소</td>
				<td style="background-color:#55555D; color:#fff; text-align:center;">실평수</td>
				<td style="background-color:#55555D; color:#fff; text-align:center;">매매가</td>
				<td style="background-color:#55555D; color:#fff; text-align:center;">보증금</td>
				<td style="background-color:#55555D; color:#fff; text-align:center;">월세</td>
				<td style="background-color:#55555D; color:#fff; text-align:center;">삭제</td>
			</tr>
			<tbody id="objtTbody">
			</tbody>
		</table>
	</div>
	
	<script id="objtListTemplte" type="text/x-jquery-tmpl">	
{{each interList}}		
	<tr>
		<td>{{html $value.objtNm}}</td>
		<td style="text-align:center;">{{html $value.objtTpNm}}</td>
		<td style="text-align:center;">{{html $value.saleTpNm}}</td>
		<td>{{html $value.addr}}</td>
		<td>{{html $value.area}}</td>
		<td style="text-align:right;">{{html $value.bargainAmt}}</td>
		<td style="text-align:right;">{{html $value.depositAmt}}</td>
		<td style="text-align:right;">{{html $value.monthlyAmt}}</td>
		<td style="text-align:center;"><button type="button" style="align:center;" id="btnDel" class="btn_delType" onclick="f_delete_inter({{html $index}});return false;">삭제</button></td>
	</tr>
{{/each}}	
</script>
<script id="objtListEmptyTemplte" type="text/x-jquery-tmpl">	
	<tr>
		<td colspan="9" style="text-align:center;">조회된 물건이 존재하지 않습니다.</td>
	</tr>
</script>



	
	