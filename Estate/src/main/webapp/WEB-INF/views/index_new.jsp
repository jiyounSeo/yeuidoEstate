<%@ include file="/WEB-INF/views/comm/indexHeader.jsp" %> 
<%@ include file="/WEB-INF/views/mainStyle.jsp" %> 
<%@ page contentType="text/html; charset=utf-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=Z0U9uQFTmyK7bim6HrQ6&submodules=geocoder"></script>
<script type="text/javascript" src="./resources/js/list/mainObject.js"></script>

<div id="ob_list" style="width:970px;margin:auto;padding:0;">
  	<div class="list_div2">	
		<table style="background-color :#F6F8F7;" width="970px" cellpadding="0" cellspacing="0" border="0">
			<tr style="background-image:url(./resources/images/index_top_bg.gif);height:38px;">
				<td width="12px"></td>
				<td width="40px"><a href='#objt' onclick="f_objt_select('OT001','ST001');"><img src="./resources/images/tab1_off.png" id="tab_OT001" class='tab_on'/></a></td>
				<td width="2px"></td>
				<td width="22px"><a href='#objt' onclick="f_objt_select('OT002','ST001');"><img src="./resources/images/tab2_off.png" id="tab_OT002" class='tab_on'/></a></td>
				<td width="72px"><a href='#objt' onclick="f_objt_select('OT003','ST001');"><img src="./resources/images/tab3_off.png" id="tab_OT003" class='tab_on'/></a></td>
				<td width="1px"></td>
				<td width="53px"><a href='#objt' onclick="f_objt_select('OT004','ST001');"><img src="./resources/images/tab4_off.png" id="tab_OT004" class='tab_on'/></a></td>
				<td width="2px"></td>
				<td width="53px"><a href='#objt' onclick="f_objt_select('OT005','ST001');"><img src="./resources/images/tab5_off.png" id="tab_OT005" class='tab_on'/></a></td>
				<td width="5px"></td>
				<td width="40px"><a href='#objt' onclick="f_objt_select('OT006','ST006');"><img src="./resources/images/tab6_off.png" id="tab_OT006" class='tab_on'/></a></td>
				<td width="16px"><img src="./resources/images/tab_bar.png"/></td>
				<td width="652px;" id="saleTpTr" style="vertical-align:middle;padding-top:4px;" ></td>
			</tr>
		</table>
		<table style="width:970px;" cellpadding="0" cellspacing="0" border="0" class="trCategory">
			<tr><td id="trCategory"></td></tr>
		</table>
	</div>
</div>

<div style="width:970px;margin:auto;padding:0;">
	<table style="width: 970px;" cellpadding="0" cellspacing="0" border="0">	
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



<script id="objtTrTemplte1" type="text/x-jquery-tmpl">	
	<a href='#objt' onclick="f_objt_select('OT001','ST001')"><img src="./resources/images/s_tab1_off.png" id="li_ST001" class='tab_bg'></a>
	<a href='#objt' onclick="f_objt_select('OT001','ST002')"><img src="./resources/images/s_tab2_off.png" id="li_ST002" class='tab_bg'></a>
	<a href='#objt' onclick="f_objt_select('OT001','ST003')"><img src="./resources/images/s_tab3_off.png" id="li_ST003" class='tab_bg'></a>
	<a href='#objt' onclick="f_objt_select('OT001','ST004')"><img src="./resources/images/s_tab4_off.png" id="li_ST004" class='tab_bg'></a>
</script>
<script id="objtTrTemplte2" type="text/x-jquery-tmpl">	
	<a href='#objt' onclick="f_objt_select('OT002','ST001')"><img src="./resources/images/s_tab1_off.png" id="li_ST001" class='tab_bg'></a>
	<a href='#objt' onclick="f_objt_select('OT002','ST005')"><img src="./resources/images/s_tab5_off.png" id="li_ST005" class='tab_bg'></a>
</script>
<script id="objtTrTemplte3" type="text/x-jquery-tmpl">	
	<a href='#objt' onclick="f_objt_select('OT003','ST001')"><img src="./resources/images/s_tab1_off.png" id="li_ST001" class='tab_bg'></a>
	<a href='#objt' onclick="f_objt_select('OT003','ST005')"><img src="./resources/images/s_tab5_off.png" id="li_ST005" class='tab_bg'></a>
</script>
<script id="objtTrTemplte4" type="text/x-jquery-tmpl">	
	<a href='#objt' onclick="f_objt_select('OT004','ST001')"><img src="./resources/images/s_tab1_off.png" id="li_ST001" class='tab_bg'></a>
	<a href='#objt' onclick="f_objt_select('OT004','ST002')"><img src="./resources/images/s_tab2_off.png" id="li_ST002" class='tab_bg'></a>
	<a href='#objt' onclick="f_objt_select('OT004','ST003')"><img src="./resources/images/s_tab3_off.png" id="li_ST003" class='tab_bg'></a>
	<a href='#objt' onclick="f_objt_select('OT004','ST004')"><img src="./resources/images/s_tab4_off.png" id="li_ST004" class='tab_bg'></a>
</script>
<script id="objtTrTemplte5" type="text/x-jquery-tmpl">	
	<a href='#objt' onclick="f_objt_select('OT005','ST001')"><img src="./resources/images/s_tab1_off.png" id="li_ST001" class='tab_bg'></a>
	<a href='#objt' onclick="f_objt_select('OT005','ST002')"><img src="./resources/images/s_tab2_off.png" id="li_ST002" class='tab_bg'></a>
	<a href='#objt' onclick="f_objt_select('OT005','ST003')"><img src="./resources/images/s_tab3_off.png" id="li_ST003" class='tab_bg'></a>
	<a href='#objt' onclick="f_objt_select('OT005','ST004')"><img src="./resources/images/s_tab4_off.png" id="li_ST004" class='tab_bg'></a>
</script>
<script id="objtTrTemplte6" type="text/x-jquery-tmpl">	
	<a href='#objt' onclick="f_objt_select('OT006','ST006')"><img src="./resources/images/s_tab1_off.png" id="li_ST006" class='tab_bg'></a>
	<a href='#objt' onclick="f_objt_select('OT006','ST007')"><img src="./resources/images/s_tab5_off.png" id="li_ST007" class='tab_bg'></a>
</script>

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