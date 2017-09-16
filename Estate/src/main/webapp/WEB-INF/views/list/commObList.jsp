<%@ include file="/WEB-INF/views/comm/adminHeader.jsp" %> 
<%@ include file="/WEB-INF/views/list/listStyle.jsp" %> 
<%@ page contentType="text/html; charset=utf-8" %>
<% request.setCharacterEncoding("utf-8");%>
<script type="text/javascript" src="./resources/js/list/objtList.js"></script>	
<body >
<form id="commObjtList" name="commObjtList" action="post">
<div id="ob_list" style="width:1500px;margin:auto;padding:0;">
	<div style="width:1500px;height:78px;">
		<img src="./resources/images/title_comm_ob_list.jpg">
	</div>
	<div class="list_div2" style="background-color :#F6F8F7;" >	
		<table style="background-color :#F6F8F7;" width="1500px" cellpadding="0" cellspacing="0" border="0">
			<tr>
				<td style="width:14%;"><a href='#objt' onclick="f_objt_select('OT001','ST001')"  style='text-decoration: none;'><li id="li_OT001" style="width:100%" class='tab_on_txt'>아파트</li></a></td>
				<td style="width:2%;"></td>
				<td style="width:14%;"><a href='#objt' onclick="f_objt_select('OT002','ST001')"  style='text-decoration: none;'><li id="li_OT002" style="width:100%"class='tab_on_txt'>상가</li></a></td>
				<td style="width:2%;"></td>
				<td style="width:14%;"><a href='#objt' onclick="f_objt_select('OT003','ST001')"  style='text-decoration: none;'><li id="li_OT003" style="width:100%"class='tab_on_txt'>사무실/빌딩</li></a></td>
				<td style="width:2%;"></td>
				<td style="width:14%;"><a href='#objt' onclick="f_objt_select('OT004','ST001')"  style='text-decoration: none;'><li id="li_OT004" style="width:100%"class='tab_on_txt'>오피스텔</li></a></td>
				<td style="width:2%;"></td>
				<td style="width:14%;"><a href='#objt' onclick="f_objt_select('OT005','ST001')"  style='text-decoration: none;'><li id="li_OT005" style="width:100%"class='tab_on_txt'>주상복합</li></a></td>
				<td style="width:2%;"></td>
				<td style="width:14%;"><a href='#objt' onclick="f_objt_select('OT006','ST006')"  style='text-decoration: none;'><li id="li_OT006" style="width:100%"class='tab_on_txt'>분양권</li></a></td>
			</tr>
			<tr>
				<td stlye="width;100%;height:45px;" colspan="11">&nbsp;</td>
			</tr>
			
		</table>
		<table style="background-color :#F6F8F7;" width="1500px" cellpadding="0" cellspacing="0" border="0">
			<tr id="saleTpTr">
				
			</tr>
			
		</table>
		<table style="background-color :#F6F8F7;" width="1500px" class="ob_list" id="objtTable">
			<tr id="objtListTr">
			</tr>
			<tbody id="objtTbody">
			</tbody>
			
		</table>
		<table style="background-color :#F6F8F7;" width="1500px" cellpadding="0" cellspacing="0" border="0">
		<tr><td height="20px">&nbsp;</td></tr>
			<tr><!-- paging -->
				<td align="center">
					<table width="1460px" height="41px" cellpadding="0" cellspacing="0" border="0">
						<tr>
							<td width="488px" height="41px">
								<div style="width:488px;height:41px;margin:0;padding:0;text-align:left">
									<a href="#"><img src="./resources/images/btn_search2.jpg"></a>
									<a href="#"><img src="./resources/images/btn_print.jpg"></a>
									<a href="#"><img src="./resources/images/btn_export_excel.jpg" border="0"></a>
								</div>
							</td>
							<td width="486px" align="center">
								<div id="pagingDiv" class="pagination"></div>
							</td>
							<td width="486px" align="right">
								<div style="width:486px;height:41px;margin:0;padding:0;text-align:right">
									<a href="./addObject"><img src="./resources/images/btn_new_ob.jpg"></a>
								</div>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</div>
</div>
<input type="hidden" name="viewUrl" id="viewUrl" />
<input type="hidden" name="objtNo" id="objtNo"/>
<input type="hidden" name="objtTp" id="objtTp" value="${objtTp}"/>
<input type="hidden" name="saleTp" id="saleTp" value="${saleTp}"/>
<input type="hidden" name="publicYn" id="publicYn" value="${publicYn}"/>
<input type="hidden" name="activeTp" id="activeTp" value="${activeTp}"/>
<input type="hidden" name="estateRange" id="estateRange" value="${estateRange}"/>

</form>
</body>
<%@ include file="/WEB-INF/views/comm/footer.jsp" %> 

<script id="objtTrTemplte1" type="text/x-jquery-tmpl">	
<td width='100px' height='25px'>
	<a href='#objt' onclick="f_objt_select('OT001','ST001')" style='text-decoration: none;'><li id="li_ST001" class='tab_bg'>매매</li></a>
</td>	
<td width='20px'>&nbsp;</td>
<td width='100px'>
	<a href='#objt' onclick="f_objt_select('OT001','ST002')"  style='text-decoration: none;'><li id="li_ST002" class='tab_bg'>전세</li></a>
</td>	
<td width='20px'>&nbsp;</td>
<td width='100px'>
	<a href='#objt' onclick="f_objt_select('OT001','ST003')" style='text-decoration: none;'><li id="li_ST003" class='tab_bg'>월세</li></a>
</td>	
<td width='20px'>&nbsp;</td>
<td width='100px'>
	<a href='#objt' onclick="f_objt_select('OT001','ST004')" style='text-decoration: none;'><li id="li_ST004" class='tab_bg'>렌트</li></a>
</td>
<td width='70%'>&nbsp;</td>
<td style="width:30%; align:right; valign:middle;">
	<input type="checkbox" name="activeTp1" id="activeTp1" value="AT001" /><label for="activeTp1">활성</label>
	<input type="checkbox" name="activeTp2" id="activeTp2" value="AT002" /><label for="activeTp2">보류</label>
	<input type="checkbox" name="activeTp3" id="activeTp3" value="AT003" /><label for="activeTp3">내가등록한물건만보기</label>
</td>	
</script>
<script id="objtTrTemplte2" type="text/x-jquery-tmpl">	
<td width='100px' height='25px'>
	<a href='#objt' onclick="f_objt_select('OT002','ST001')" style='text-decoration: none;'><li id="li_ST001" class='tab_bg'>매매</li></a>
</td>	
<td width='20px'>&nbsp;</td>
<td width='100px'>
	<a href='#objt' onclick="f_objt_select('OT002','ST005')"  style='text-decoration: none;'><li id="li_ST005" class='tab_bg'>임대</li></a>
</td>	
<td width='76%'>&nbsp;</td>
<td style="width:24%; align:right; valign:middle;">
	<input type="checkbox" name="activeTp1" id="activeTp1" value="AT001" /><label for="activeTp1">활성</label>
	<input type="checkbox" name="activeTp2" id="activeTp2" value="AT002" /><label for="activeTp2">보류</label>
	<input type="checkbox" name="activeTp3" id="activeTp3" value="AT003" /><label for="activeTp3">내가등록한물건만보기</label>
</td>
</script>
<script id="objtTrTemplte3" type="text/x-jquery-tmpl">	
<td width='100px' height='25px'>
	<a href='#objt' onclick="f_objt_select('OT003','ST001')" style='text-decoration: none;'><li id="li_ST001" class='tab_bg'>매매</li></a>
</td>	
<td width='20px'>&nbsp;</td>
<td width='100px'>
	<a href='#objt' onclick="f_objt_select('OT003','ST005')"  style='text-decoration: none;'><li id="li_ST005" class='tab_bg'>임대</li></a>
</td>	
<td width='76%'>&nbsp;</td>
<td style="width:24%; align:right; valign:middle;">
	<input type="checkbox" name="activeTp1" id="activeTp1" value="AT001" /><label for="activeTp1">활성</label>
	<input type="checkbox" name="activeTp2" id="activeTp2" value="AT002" /><label for="activeTp2">보류</label>
	<input type="checkbox" name="activeTp3" id="activeTp3" value="AT003" /><label for="activeTp3">내가등록한물건만보기</label>
</td>
</script>
<script id="objtTrTemplte4" type="text/x-jquery-tmpl">	
<td width='100px' height='25px'>
	<a href='#objt' onclick="f_objt_select('OT004','ST001')" style='text-decoration: none;'><li id="li_ST001" class='tab_bg'>매매</li></a>
</td>	
<td width='20px'>&nbsp;</td>
<td width='100px'>
	<a href='#objt' onclick="f_objt_select('OT004','ST002')"  style='text-decoration: none;'><li id="li_ST002" class='tab_bg'>전세</li></a>
</td>	
<td width='20px'>&nbsp;</td>
<td width='100px'>
	<a href='#objt' onclick="f_objt_select('OT004','ST003')" style='text-decoration: none;'><li id="li_ST003" class='tab_bg'>월세</li></a>
</td>	
<td width='20px'>&nbsp;</td>
<td width='100px'>
	<a href='#objt' onclick="f_objt_select('OT004','ST004')" style='text-decoration: none;'><li id="li_ST004" class='tab_bg'>렌트</li></a>
</td>	
<td width='70%'>&nbsp;</td>
<td style="width:30%; align:right; valign:middle;">
	<input type="checkbox" name="activeTp1" id="activeTp1" value="AT001" /><label for="activeTp1">활성</label>
	<input type="checkbox" name="activeTp2" id="activeTp2" value="AT002" /><label for="activeTp2">보류</label>
	<input type="checkbox" name="activeTp3" id="activeTp3" value="AT003" /><label for="activeTp3">내가등록한물건만보기</label>
</td>
</script>
<script id="objtTrTemplte5" type="text/x-jquery-tmpl">	
<td width='100px' height='25px'>
	<a href='#objt' onclick="f_objt_select('OT005','ST001')" style='text-decoration: none;'><li id="li_ST001" class='tab_bg'>매매</li></a>
</td>	
<td width='20px'>&nbsp;</td>
<td width='100px'>
	<a href='#objt' onclick="f_objt_select('OT005','ST002')"  style='text-decoration: none;'><li id="li_ST002" class='tab_bg'>전세</li></a>
</td>	
<td width='20px'>&nbsp;</td>
<td width='100px'>
	<a href='#objt' onclick="f_objt_select('OT005','ST003')" style='text-decoration: none;'><li id="li_ST003" class='tab_bg'>월세</li></a>
</td>	
<td width='20px'>&nbsp;</td>
<td width='100px'>
	<a href='#objt' onclick="f_objt_select('OT005','ST004')" style='text-decoration: none;'><li id="li_ST004" class='tab_bg'>렌트</li></a>
</td>
<td width='70%'>&nbsp;</td>
<td style="width:30%; align:right; valign:middle;">
	<input type="checkbox" name="activeTp1" id="activeTp1" value="AT001" /><label for="activeTp1">활성</label>
	<input type="checkbox" name="activeTp2" id="activeTp2" value="AT002" /><label for="activeTp2">보류</label>
	<input type="checkbox" name="activeTp3" id="activeTp3" value="AT003" /><label for="activeTp3">내가등록한물건만보기</label>
</td>
</script>
<script id="objtTrTemplte6" type="text/x-jquery-tmpl">	
<td width='100px' height='25px'>
	<a href='#objt' onclick="f_objt_select('OT006','ST006')" style='text-decoration: none;'><li id="li_ST006" class='tab_bg'>분양권</li></a>
</td>	
<td width='20px'>&nbsp;</td>
<td width='100px'>
	<a href='#objt' onclick="f_objt_select('OT006','ST007')"  style='text-decoration: none;'><li id="li_ST007" class='tab_bg'>전매</li></a>
</td>	
<td width='76%'>&nbsp;</td>
<td style="width:24%; align:right; valign:middle;">
	<input type="checkbox" name="activeTp1" id="activeTp1" value="AT001"/><label for="activeTp1">활성</label>
	<input type="checkbox" name="activeTp2" id="activeTp2" value="AT002" /><label for="activeTp2">보류</label>
	<input type="checkbox" name="activeTp3" id="activeTp3" value="AT003" /><label for="activeTp3">내가등록한물건만보기</label>
</td>
</script>

<script id="saleTpTrTmpl1" type="text/x-jquery-tmpl">	
		<td>등록일</td>
		<td>단지명</td>
		<td>평형</td>
		<td>동</td>
		<td>층</td>
		<td>향</td>
		<td>매매가</td>
		<td>온돌</td>
		<td>상태</td>
		<td>등록인</td>
		<td>분류</td>
		<td>기타</td>
</script>
<script id="saleTpTrTmpl2" type="text/x-jquery-tmpl">	
		<td>등록일</td>
		<td>분양평수</td>
		<td>실평수</td>
		<td>층</td>
		<td>보증금 / 월세</td>
		<td>권리금</td>
		<td>등록인</td>
		<td>분류</td>
		<td>기타</td>
</script>
<script id="saleTpTrTmpl3" type="text/x-jquery-tmpl">	
		<td>등록일</td>
		<td>분양평수</td>
		<td>실평수</td>
		<td>층</td>
		<td>매매가</td>
		<td>등록인</td>
		<td>분류</td>
		<td>기타</td>
</script>
<script id="saleTpTrTmpl4" type="text/x-jquery-tmpl">	
		<td>등록일</td>
		<td>건물명</td>
		<td>평형</td>
		<td>동</td>
		<td>층</td>
		<td>향</td>
		<td>보증금/월세</td>
		<td>부가세</td>
		<td>등록인</td>
		<td>분류</td>
		<td>기타</td>
</script>
<script id="saleTpTrTmpl5" type="text/x-jquery-tmpl">	
		<td>등록일</td>
		<td>건물명</td>
		<td>평형</td>
		<td>동</td>
		<td>층</td>
		<td>향</td>
		<td>보증금</td>
		<td>등록인</td>
		<td>분류</td>
		<td>기타</td>
</script>
<script id="saleTpTrTmpl6" type="text/x-jquery-tmpl">	
		<td>등록일</td>
		<td>건물명</td>
		<td>면적</td>
		<td>동</td>
		<td>층</td>
		<td>향</td>
		<td>분양가</td>
		<td>프리미엄</td>
		<td>입주일</td>
		<td>등록인</td>
		<td>분류</td>
		<td>기타</td>
</script>

<script id="objtListTemplte1" type="text/x-jquery-tmpl">	
{{each objtList}}		
	<tr>
		<td><a href="#dtl" onclick="f_objtDtl_view('{{html $index}}');return false;">{{html $value.frstRegDt}}</a></td>
		<td>{{html $value.objtNm}}</td>
		<td>{{html $value.area}}</td>
		<td>{{html $value.dong}}</td>
		<td>{{html $value.floor}}</td>
		<td>{{html $value.directionTpNm}}</td>
		<td>{{html $value.bargainAmt}}</td>
		<td>{{html $value.ondolYn}}</td>
		<td>{{html $value.conditionTpNm}}</td>
		<td>{{html $value.frstRegNm}}</td>
		<td>{{html $value.activeTpNm}}</td>
		<td>{{html $value.etc}}</td>											
	</tr>
{{/each}}	
</script>

<script id="objtListTemplte2" type="text/x-jquery-tmpl">	
{{each objtList}}		
	<tr>
		<td><a href="#dtl" onclick="f_objtDtl_view('{{html $index}}');return false;">{{html $value.frstRegDt}}</a></td>
		<td>{{html $value.area}}</td>
		<td>{{html $value.realArea}}</td>
		<td>{{html $value.floor}}</td>
		<td>{{html $value.depositAmt}}</td>
		<td>{{html $value.rightAmt}}</td>
		<td>{{html $value.frstRegNm}}</td>
		<td>{{html $value.activeTpNm}}</td>
		<td>{{html $value.etc}}</td>
	</tr>
{{/each}}	
</script>

<script id="objtListTemplte3" type="text/x-jquery-tmpl">	
{{each objtList}}		
	<tr>
		<td><a href="#dtl" onclick="f_objtDtl_view('{{html $index}}');return false;">{{html $value.frstRegDt}}</a></td>
		<td>{{html $value.area}}</td>
		<td>{{html $value.realArea}}</td>
		<td>{{html $value.floor}}</td>
		<td>{{html $value.bargainAmt}}</td>
		<td>{{html $value.frstRegNm}}</td>
		<td>{{html $value.activeTpNm}}</td>
		<td>{{html $value.etc}}</td>
	</tr>
{{/each}}	
</script>

<script id="objtListTemplte4" type="text/x-jquery-tmpl">	
{{each objtList}}		
	<tr>
		<td><a href="#dtl" onclick="f_objtDtl_view('{{html $index}}');return false;">{{html $value.frstRegDt}}</a></td>
		<td>{{html $value.objtNm}}</td>
		<td>{{html $value.area}}</td>
		<td>{{html $value.dong}}</td>
		<td>{{html $value.floor}}</td>
		<td>{{html $value.directionTpNm}}</td>
		<td>{{html $value.depositAmt}}</td>
		<td>{{html $value.surtaxYn}}</td>
		<td>{{html $value.frstRegNm}}</td>
		<td>{{html $value.activeTpNm}}</td>
		<td>{{html $value.etc}}</td>	
	</tr>
{{/each}}	
</script>


<script id="objtListTemplte5" type="text/x-jquery-tmpl">	
{{each objtList}}		
	<tr>
		<td><a href="#dtl" onclick="f_objtDtl_view('{{html $index}}');return false;">{{html $value.frstRegDt}}</a></td>
		<td>{{html $value.objtNm}}</td>
		<td>{{html $value.area}}</td>
		<td>{{html $value.dong}}</td>
		<td>{{html $value.floor}}</td>
		<td>{{html $value.directionTpNm}}</td>
		<td>{{html $value.depositAmt}}</td>
		<td>{{html $value.frstRegNm}}</td>
		<td>{{html $value.activeTpNm}}</td>
		<td>{{html $value.etc}}</td>	
	</tr>
{{/each}}	
</script>

	
<script id="objtListTemplte6" type="text/x-jquery-tmpl">	
{{each objtList}}		
	<tr>
		<td><a href="#dtl" onclick="f_objtDtl_view('{{html $index}}');return false;">{{html $value.frstRegDt}}</a></td>
		<td>{{html $value.objtNm}}</td>
		<td>{{html $value.area}}</td>
		<td>{{html $value.dong}}</td>
		<td>{{html $value.floor}}</td>
		<td>{{html $value.directionTpNm}}</td>
		<td>{{html $value.parcelAmt}}</td>
		<td>{{html $value.premiumAmt}}</td>
		<td>{{html $value.availableDt}}</td>
		<td>{{html $value.frstRegNm}}</td>
		<td>{{html $value.activeTpNm}}</td>
		<td>{{html $value.etc}}</td>	
	</tr>
{{/each}}	
</script>

<script id="objtListEmptyTemplte" type="text/x-jquery-tmpl">	
	<tr>
		<td colspan = {{html col}}>해당하는 물건이 존재하지 않습니다.</td>
	</tr>
</script>



