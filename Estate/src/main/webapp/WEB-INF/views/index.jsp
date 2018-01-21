<%@ include file="/WEB-INF/views/comm/indexHeader.jsp" %> 
<%@ include file="/WEB-INF/views/mainStyle.jsp" %> 
<%@ page contentType="text/html; charset=utf-8" %>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=Z0U9uQFTmyK7bim6HrQ6&submodules=geocoder"></script>
<script type="text/javascript" src="./resources/js/list/mainObject.js"></script>

<%@ include file="/WEB-INF/views/tabMenuBar.jsp" %> 

<div style="width:970px;margin:auto;padding:0;">
	<table style="width: 970px;" cellpadding="0" cellspacing="0" border="0">	
		<tr><td height="5px"></td></tr>
		<tr>
			<td width="970px" height="500px" style="border-bottom:1px solid #cccccc;">
				<div id="main_map" style="width:100%;height:100%;"></div>
			</td>
		</tr>
		<tr><td height="20px"></td></tr>
	</table>
</div>

<div id="ob_list" style="width:970px;margin:auto;padding:0;">		
	<table style="width:970px" cellpadding="0" cellspacing="0" border="0">
		<tr>
			<td class="nav" id="selected_list"></td>
			<td class="orderMenu"><div id="order_menu" name="order_menu"></div></td>		
		</tr>
	</table>
	<table width="970px" cellpadding="0" cellspacing="0" id="objtTable">
		<tr id="objtListTr" class="objtListTrHeader">
		</tr>
		<tbody id="objtTbody" class="objtListTrBody">
		</tbody>
		
	</table>
	<table style="width:970px" cellpadding="0" cellspacing="0" border="0">
		<tr><td height="20px">&nbsp;</td></tr>
		<tr><!-- paging -->
			<td align="center">
				<table width="970px" height="41px" cellpadding="0" cellspacing="0" border="0">
					<tr>
						<td width="100%" align="center">
							<div id="pagingDiv" class="pagination"></div>
						</td>						
					</tr>
				</table>
			</td>
		</tr>
		<tr><td height="40px">&nbsp;</td></tr>
	</table>
</div>
<input type="hidden" name="objtTp" id="objtTp" />
<input type="hidden" name="saleTp" id="saleTp" />


<%@ include file="/WEB-INF/views/comm/footer.jsp" %> 



<!-- 아파트 매매 -->
<script id="saleTpTrTmpl" type="text/x-jquery-tmpl">	
		<td width="80px">등록일</td>
		<td width="60px">거래</td>
		<td width="60px">종류</td>
		<td width="375px">매물명</td>
		<td width="55px">면적(㎡)</td>
		<td width="80px">층</td>
		<td width="110px">매물가(만원)</td>
		<td width="150px">연락처</td>
</script>


<!-- 아파트 매매 -->
<script id="objtListTemplte1_ST001" type="text/x-jquery-tmpl">	
{{each objtList}}		
	<tr class="list_data" onclick="location.href='./indexObjectDtl.go?objtNo={{html $value.objtNo}}&objtTp={{html $value.objtTp}}'">
		<td>{{html $value.frstRegDt}}</td>
		<td>{{html $value.saleTpNm}}</td>
		<td>{{html $value.objtTpNm}}</td>
		<td class="obName">{{html $value.objtNm}}</td>
		<td>{{html $value.areaCal}}</td>
		<td>{{html $value.floor}}</td>
		<td><div class="obPrice">{{html $value.bargainAmt}}</div></td>
		<td>{{html $value.estateNm}}<br>({{html $value.estateTel}})</td>
	</tr>
{{/each}}	
</script>
<!-- 아파트 전세 -->
<script id="objtListTemplte1_ST002" type="text/x-jquery-tmpl">	
{{each objtList}}		
	<tr class="list_data" onclick="location.href='./indexObjectDtl.go?objtNo={{html $value.objtNo}}&objtTp={{html $value.objtTp}}'">
		<td>{{html $value.frstRegDt}}</td>
		<td>{{html $value.saleTpNm}}</td>
		<td>{{html $value.objtTpNm}}</td>
		<td class="obName">{{html $value.objtNm}}</td>
		<td>{{html $value.areaCal}}</td>
		<td>{{html $value.floor}}</td>
		<td><div class="obPrice">{{html $value.depositAmt}}</div></td>
		<td>{{html $value.estateNm}}<br>({{html $value.estateTel}})</td>
	</tr>
{{/each}}	
</script>
<!-- 아파트 월세 -->
<script id="objtListTemplte1_ST003" type="text/x-jquery-tmpl">	
{{each objtList}}		
	<tr class="list_data" onclick="location.href='./indexObjectDtl.go?objtNo={{html $value.objtNo}}&objtTp={{html $value.objtTp}}'">
		<td>{{html $value.frstRegDt}}</td>
		<td>{{html $value.saleTpNm}}</td>
		<td>{{html $value.objtTpNm}}</td>
		<td class="obName">{{html $value.objtNm}}</td>
		<td>{{html $value.areaCal}}</td>
		<td>{{html $value.floor}}</td>
		<td><span class="obPrice">{{html $value.depositAmt}}</span>/&nbsp;<span class="obPrice">{{html $value.monthlyAmt}}</span></td>
		<td>{{html $value.estateNm}}<br>({{html $value.estateTel}})</td>
	</tr>
{{/each}}	
</script>
<!-- 아파트 렌트 -->
<script id="objtListTemplte1_ST004" type="text/x-jquery-tmpl">	
{{each objtList}}		
	<tr class="list_data" onclick="location.href='./indexObjectDtl.go?objtNo={{html $value.objtNo}}&objtTp={{html $value.objtTp}}'">
		<td>{{html $value.frstRegDt}}</td>
		<td>{{html $value.saleTpNm}}</td>
		<td>{{html $value.objtTpNm}}</td>
		<td class="obName">{{html $value.objtNm}}</td>
		<td>{{html $value.areaCal}}</td>
		<td>{{html $value.floor}}</td>
		<td><div class="obPrice">{{html $value.monthlyAmt}}</div></td>
		<td>{{html $value.estateNm}}<br>({{html $value.estateTel}})</td>
	</tr>
{{/each}}	
</script>

<!-- 상가 매매 -->
<script id="objtListTemplte2_ST001" type="text/x-jquery-tmpl">	
{{each objtList}}		
	<tr class="list_data" onclick="location.href='./indexObjectDtl.go?objtNo={{html $value.objtNo}}&objtTp={{html $value.objtTp}}'">
		<td>{{html $value.frstRegDt}}</td>
		<td>{{html $value.saleTpNm}}</td>
		<td>{{html $value.objtTpNm}}</td>
		<td class="obName">{{html $value.objtNm}}</td>
		<td>{{html $value.areaCal}}</td>
		<td>{{html $value.floor}}</td>
		<td><div class="obPrice">{{html $value.bargainAmt}}</div></td>
		<td>{{html $value.estateNm}}<br>({{html $value.estateTel}})</td>
	</tr>
{{/each}}	
</script>
<!-- 상가 임대 -->
<script id="objtListTemplte2_ST005" type="text/x-jquery-tmpl">	
{{each objtList}}		
	<tr class="list_data" onclick="location.href='./indexObjectDtl.go?objtNo={{html $value.objtNo}}&objtTp={{html $value.objtTp}}'">
		<td>{{html $value.frstRegDt}}</td>
		<td>{{html $value.saleTpNm}}</td>
		<td>{{html $value.objtTpNm}}</td>
		<td class="obName">{{html $value.objtNm}}</td>
		<td>{{html $value.areaCal}}</td>
		<td>{{html $value.floor}}</td>
		<td><span class="obPrice">{{html $value.depositAmt}}</span>/&nbsp;<span class="obPrice">{{html $value.monthlyAmt}}</span></td>
		<td>{{html $value.estateNm}}<br>({{html $value.estateTel}})</td>
	</tr>
{{/each}}	
</script>

<!-- 사무실/빌딩 매매 -->
<script id="objtListTemplte3_ST001" type="text/x-jquery-tmpl">	
{{each objtList}}		
	<tr class="list_data" onclick="location.href='./indexObjectDtl.go?objtNo={{html $value.objtNo}}&objtTp={{html $value.objtTp}}'">
		<td>{{html $value.frstRegDt}}</td>
		<td>{{html $value.saleTpNm}}</td>
		<td>{{html $value.objtTpNm}}</td>
		<td class="obName">{{html $value.objtNm}}</td>
		<td>{{html $value.areaCal}}</td>
		<td>{{html $value.floor}}</td>
		<td><div class="obPrice">{{html $value.bargainAmt}}</div></td>
		<td>{{html $value.estateNm}}<br>({{html $value.estateTel}})</td>
	</tr>
{{/each}}	
</script>
<!-- 사무실/빌딩 임대 -->
<script id="objtListTemplte3_ST005" type="text/x-jquery-tmpl">	
{{each objtList}}		
	<tr class="list_data" onclick="location.href='./indexObjectDtl.go?objtNo={{html $value.objtNo}}&objtTp={{html $value.objtTp}}'">
		<td>{{html $value.frstRegDt}}</td>
		<td>{{html $value.saleTpNm}}</td>
		<td>{{html $value.objtTpNm}}</td>
		<td class="obName">{{html $value.objtNm}}</td>
		<td>{{html $value.areaCal}}</td>
		<td>{{html $value.floor}}</td>
		<td><span class="obPrice">{{html $value.depositAmt}}</span>/&nbsp;<span class="obPrice">{{html $value.monthlyAmt}}</span></td>
		<td>{{html $value.estateNm}}<br>({{html $value.estateTel}})</td>
	</tr>
{{/each}}	
</script>

<!-- 오피스텔 매매 -->
<script id="objtListTemplte4_ST001" type="text/x-jquery-tmpl">	
{{each objtList}}		
	<tr class="list_data" onclick="location.href='./indexObjectDtl.go?objtNo={{html $value.objtNo}}&objtTp={{html $value.objtTp}}'">
		<td>{{html $value.frstRegDt}}</td>
		<td>{{html $value.saleTpNm}}</td>
		<td>{{html $value.objtTpNm}}</td>
		<td class="obName">{{html $value.objtNm}}</td>
		<td>{{html $value.areaCal}}</td>
		<td>{{html $value.floor}}</td>
		<td><div class="obPrice">{{html $value.bargainAmt}}</div></td>
		<td>{{html $value.estateNm}}<br>({{html $value.estateTel}})</td>
	</tr>
{{/each}}	
</script>
<!-- 오피스텔 전세 -->
<script id="objtListTemplte4_ST002" type="text/x-jquery-tmpl">	
{{each objtList}}		
	<tr class="list_data" onclick="location.href='./indexObjectDtl.go?objtNo={{html $value.objtNo}}&objtTp={{html $value.objtTp}}'">
		<td>{{html $value.frstRegDt}}</td>
		<td>{{html $value.saleTpNm}}</td>
		<td>{{html $value.objtTpNm}}</td>
		<td class="obName">{{html $value.objtNm}}</td>
		<td>{{html $value.areaCal}}</td>
		<td>{{html $value.floor}}</td>
		<td><div class="obPrice">{{html $value.depositAmt}}</div></td>
		<td>{{html $value.estateNm}}<br>({{html $value.estateTel}})</td>
	</tr>
{{/each}}	
</script>
<!-- 오피스텔 월세 -->
<script id="objtListTemplte4_ST003" type="text/x-jquery-tmpl">	
{{each objtList}}		
	<tr class="list_data" onclick="location.href='./indexObjectDtl.go?objtNo={{html $value.objtNo}}&objtTp={{html $value.objtTp}}'">
		<td>{{html $value.frstRegDt}}</td>
		<td>{{html $value.saleTpNm}}</td>
		<td>{{html $value.objtTpNm}}</td>
		<td class="obName">{{html $value.objtNm}}</td>
		<td>{{html $value.areaCal}}</td>
		<td>{{html $value.floor}}</td>
		<td><span class="obPrice">{{html $value.depositAmt}}</span>/&nbsp;<span class="obPrice">{{html $value.monthlyAmt}}</span></td>
		<td>{{html $value.estateNm}}<br>({{html $value.estateTel}})</td>
	</tr>
{{/each}}	
</script>
<!-- 오피스텔 렌트 -->
<script id="objtListTemplte4_ST004" type="text/x-jquery-tmpl">	
{{each objtList}}		
	<tr class="list_data" onclick="location.href='./indexObjectDtl.go?objtNo={{html $value.objtNo}}&objtTp={{html $value.objtTp}}'">
		<td>{{html $value.frstRegDt}}</td>
		<td>{{html $value.saleTpNm}}</td>
		<td>{{html $value.objtTpNm}}</td>
		<td class="obName">{{html $value.objtNm}}</td>
		<td>{{html $value.areaCal}}</td>
		<td>{{html $value.floor}}</td>
		<td><div class="obPrice">{{html $value.monthlyAmt}}</div></td>
		<td>{{html $value.estateNm}}<br>({{html $value.estateTel}})</td>
	</tr>
{{/each}}	
</script>

<!-- 오피스텔 매매 -->
<script id="objtListTemplte5_ST001" type="text/x-jquery-tmpl">	
{{each objtList}}		
	<tr class="list_data" onclick="location.href='./indexObjectDtl.go?objtNo={{html $value.objtNo}}&objtTp={{html $value.objtTp}}'">
		<td>{{html $value.frstRegDt}}</td>
		<td>{{html $value.saleTpNm}}</td>
		<td>{{html $value.objtTpNm}}</td>
		<td class="obName">{{html $value.objtNm}}</td>
		<td>{{html $value.areaCal}}</td>
		<td>{{html $value.floor}}</td>
		<td><div class="obPrice">{{html $value.bargainAmt}}</div></td>
		<td>{{html $value.estateNm}}<br>({{html $value.estateTel}})</td>
	</tr>
{{/each}}	
</script>
<!-- 오피스텔 전세 -->
<script id="objtListTemplte5_ST002" type="text/x-jquery-tmpl">	
{{each objtList}}		
	<tr class="list_data" onclick="location.href='./indexObjectDtl.go?objtNo={{html $value.objtNo}}&objtTp={{html $value.objtTp}}'">
		<td>{{html $value.frstRegDt}}</td>
		<td>{{html $value.saleTpNm}}</td>
		<td>{{html $value.objtTpNm}}</td>
		<td class="obName">{{html $value.objtNm}}</td>
		<td>{{html $value.areaCal}}</td>
		<td>{{html $value.floor}}</td>
		<td><div class="obPrice">{{html $value.depositAmt}}</div></td>
		<td>{{html $value.estateNm}}<br>({{html $value.estateTel}})</td>
	</tr>
{{/each}}	
</script>
<!-- 오피스텔 월세 -->
<script id="objtListTemplte5_ST003" type="text/x-jquery-tmpl">	
{{each objtList}}		
	<tr class="list_data" onclick="location.href='./indexObjectDtl.go?objtNo={{html $value.objtNo}}&objtTp={{html $value.objtTp}}'">
		<td>{{html $value.frstRegDt}}</td>
		<td>{{html $value.saleTpNm}}</td>
		<td>{{html $value.objtTpNm}}</td>
		<td class="obName">{{html $value.objtNm}}</td>
		<td>{{html $value.areaCal}}</td>
		<td>{{html $value.floor}}</td>
		<td><span class="obPrice">{{html $value.depositAmt}}</span>/&nbsp;<span class="obPrice">{{html $value.monthlyAmt}}</span></td>
		<td>{{html $value.estateNm}}<br>({{html $value.estateTel}})</td>
	</tr>
{{/each}}	
</script>
<!-- 오피스텔 렌트 -->
<script id="objtListTemplte5_ST004" type="text/x-jquery-tmpl">	
{{each objtList}}		
	<tr class="list_data" onclick="location.href='./indexObjectDtl.go?objtNo={{html $value.objtNo}}&objtTp={{html $value.objtTp}}'">
		<td>{{html $value.frstRegDt}}</td>
		<td>{{html $value.saleTpNm}}</td>
		<td>{{html $value.objtTpNm}}</td>
		<td class="obName">{{html $value.objtNm}}</td>
		<td>{{html $value.areaCal}}</td>
		<td>{{html $value.floor}}</td>
		<td><div class="obPrice">{{html $value.monthlyAmt}}</div></td>
		<td>{{html $value.estateNm}}<br>({{html $value.estateTel}})</td>
	</tr>
{{/each}}	
</script>
	
<script id="objtListTemplte6" type="text/x-jquery-tmpl">	
{{each objtList}}		
	<tr class="list_data" onclick="location.href='./indexObjectDtl.go?objtNo={{html $value.objtNo}}&objtTp={{html $value.objtTp}}'">
		<td>{{html $value.frstRegDt}}</td>
		<td>{{html $value.saleTpNm}}</td>
		<td>{{html $value.objtTpNm}}</td>
		<td class="obName">{{html $value.objtNm}}</td>
		<td>{{html $value.areaCal}}</td>
		<td>{{html $value.floor}}</td>
		<td><span class="obPrice">{{html $value.parcelAmt}}<span>/&nbsp;<span class="obPrice">{{html $value.premiumAmt}}</span></td>
		<td>{{html $value.estateNm}}<br>({{html $value.estateTel}})</td>
	</tr>
{{/each}}	
</script>

<script id="objtListEmptyTemplte" type="text/x-jquery-tmpl">	
	<tr class="list_data">
		<td colspan = {{html col}}>해당하는 물건이 존재하지 않습니다.</td>
	</tr>
</script>