<%@ include file="/WEB-INF/views/comm/indexHeader.jsp" %> 
<%@ include file="/WEB-INF/views/list/listStyle.jsp" %> 
<%@ page contentType="text/html; charset=utf-8" %>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=Z0U9uQFTmyK7bim6HrQ6&submodules=geocoder"></script>
<script type="text/javascript" src="./resources/js/list/mainObject.js"></script>
<form id="indexSearch" name="indexSearch">	
<div id="ob_list" style="width:1500px;margin:auto;padding:0;">
	<div style="width:1470px; text-align:left; margin:auto; padding:0">		
		<table style="width: 1470px;" cellpadding="0" cellspacing="0" border="0">
			<tr>
				<td width="1040px;" height="560px" style="background-color:#e0e0e0;">
					<div id="main_map" style="width:100%;height:550px;"></div>
				</td>
				<td width="20px"></td>
				<td width="400px" valign="bottom" align="right">
					<table style="width:100%;border:0;border-collapse:collapse;border: 1px solid #b2b2b2;">
						<tr>
							<td style="width:15%;height:70px;text-align:center;background:#8e81bb;color:#fff;font-weight: bold;">종류</td>
							<td style="width:75%;padding-left:10px;">
								<input type="radio" onclick="f_setting_search_form('OT001')" id="search_OT001" name="search_obTp" value="OT001" checked /><label for="search_OT001">아파트</label>
								<input type="radio" onclick="f_setting_search_form('OT002')" id="search_OT002" name="search_obTp" value="OT002"/><label for="search_OT002">상가</label>
								<input type="radio" onclick="f_setting_search_form('OT003')" id="search_OT003" name="search_obTp" value="OT003"/><label for="search_OT003">사무실/빌딩</label><br>
								<input type="radio" onclick="f_setting_search_form('OT004')" id="search_OT004" name="search_obTp" value="OT004"/><label for="search_OT004">오피스텔</label>
								<input type="radio" onclick="f_setting_search_form('OT005')" id="search_OT005" name="search_obTp" value="OT005"/><label for="search_OT005">주상복합</label>
								<input type="radio" onclick="f_setting_search_form('OT006')" id="search_OT006" name="search_obTp" value="OT006"/><label for="search_OT006">분양권</label>
							</td>
						</tr>
						<tr><td colspan="2" height="5px"></td></tr>
						<tr>
							<td style="width:15%;height:50px;text-align:center;background:#8e81bb;color:#fff;font-weight: bold;">유형</td>
							<td style="width:75%;padding-left:10px;" id="search_st_form" name="search_st_form">
								<input type="radio" onclick="f_setting_search_form_price('ST001')" id="search_ST001" name="search_slTp" value="ST001" checked /><label for="search_ST001">매매</label>
								<input type="radio" onclick="f_setting_search_form_price('ST002')" id="search_ST002" name="search_slTp" value="ST002"/><label for="search_ST002">전세</label>
								<input type="radio" onclick="f_setting_search_form_price('ST003')" id="search_ST003" name="search_slTp" value="ST003"/><label for="search_ST003">월세</label>
								<input type="radio" onclick="f_setting_search_form_price('ST004')" id="search_ST004" name="search_slTp" value="ST004"/><label for="search_ST004">렌트</label>
							</td>
						</tr>
					</table>
					<div id="search_detail" name="search_detail" style="margin-top:5px;">
					<table style="width:100%;border:0;border-collapse:collapse;border: 1px solid #b2b2b2;">
						<tr>
							<td style="width:15%;height:50px;text-align:center;background:#8e81bb;color:#fff;font-weight: bold;">매매가</td>
							<td style="width:75%;padding-left:10px;">
								<select id="search_bargain" name="search_bargain" onchange="f_enabled_value_form('bargain');" style="width:90px;height:30px;">
									<option value="all">전체</option>
									<option value="10000">1억이하</option>
									<option value="20000">1억 ~ 3억</option>
									<option value="40000">3억 ~ 6억</option>
									<option value="70000">6억 ~ 9억</option>
									<option value="90000">9억 이상</option>
									<option value="self">직접입력</option>
								</select>
								<input type="text" id="search_bargain_min_input" name="search_bargain_min_input" style="width:80px;height:30px;" disabled> ~ <input type="text" id="search_bargain_max_input" name="search_bargain_max_input" style="width:80px;height:30px;" disabled> 만원
							</td>
						</tr>
						<tr><td colspan="2" height="5px"></td></tr>
					</table>
					</div>
					<table style="margin-top:5px;width:100%;border:0;border-collapse:collapse;border: 1px solid #b2b2b2;">
						<tr>
							<td style="width:15%;height:50px;text-align:center;background:#8e81bb;color:#fff;font-weight: bold;">면적</td>
							<td style="width:75%;padding-left:10px;">
								<select  id="search_area" name="search_area" style="width:90px;height:30px;">
									<option value="all">전체</option>
									<option value="0/66">0 ~ 66</option>
									<option value="66/99">66 ~ 99</option>
									<option value="99/132">99 ~ 132</option>
									<option value="132/165">132 ~ 165</option>
									<option value="165/198">165 ~ 198</option>
									<option value="198/330">198 ~ 330</option>
									<option value="330/991">330 ~ 991</option>
									<option value="self" onclick="f_eabled_value_form('area');">직접입력</option>
								</select>
								<input type="text" id="search_area_min_input" name="search_area_min_input" style="width:80px;height:30px;" disabled> ~ <input type="text" id="search_area_max_input" name="search_area_max_input" style="width:80px;height:30px;" disabled> ㎡							
							</td>
						</tr>						
					</table>
					<br>
					<a href="#"><img src="./resources/images/btn_clear_index.jpg"></a>&nbsp;&nbsp;<a href="#" onclick="f_search()"><img src="./resources/images/btn_search_index.jpg"></a>
					<input type="hidden" name="searchObjtTp" id="searchObjtTp" />
					<input type="hidden" name="searchSaleTp" id="searchSaleTp" />
					<input type="hidden" name="search_bargain_min" id="search_bargain_min" />
					<input type="hidden" name="search_bargain_max" id="search_bargain_max" />
					<input type="hidden" name="search_bargain_min" id="search_bargain_min" />
					<input type="hidden" name="search_bargain_max" id="search_bargain_max" />				
					<input type="hidden" name="search_deposit_min" id="search_deposit_min" />
					<input type="hidden" name="search_deposit_max" id="search_deposit_max" />	
					<input type="hidden" name="search_monthly_min" id="search_monthly_min" />
					<input type="hidden" name="search_monthly_max" id="search_monthly_max" />
					<input type="hidden" name="search_area_min" id="search_area_min" />
					<input type="hidden" name="search_area_max" id="search_area_max" />
				</td>
			</tr>
			<tr><td height="30px" colspan="3"></td></tr>
		</table>
	</div>
  	<div class="list_div2" style="background-color :#F6F8F7; height:100px;" >	
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
			<tr id="trCategory">

			</tr>
		</table>
	</div>
	<div id="ob_list" style="width:1500px;margin:auto;padding:0;">
		<table style="background-color :#F6F8F7;" width="1500px" cellpadding="0" cellspacing="0" border="0">
			<tr>
				<td width="100%" align="left" valign="bottom">
					<table width="100%" height="41px" cellpadding="0" cellspacing="0" border="0">
							<tr>
								<td width="70%" height="41px">
									<!-- <div style="width:488px;height:41px;margin:0;padding:0;text-align:left">
										<a href="#"><img src="./resources/images/btn_search2.jpg"></a> 새창으로 떠서 검색 후 결과는 현재 페이지로 (검색페이지????페이지도없고...이건 추후개발로하자 11월이후..)
									</div> -->
								</td>
								<td width="30%" align="right">							 
								</td>
							</tr>
						</table>
				</td>	
			</tr>
			<tr><td colspan="2" height="15px;"></td></tr>
		</table>
		<table style="background-color :#F6F8F7;" width="1500px" cellpadding="0" cellspacing="0" border="0">
			<tr id="saleTpTr">
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
							<td width="100%" align="center">
								<div id="pagingDiv" class="pagination"></div>
							</td>
							
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</div>
</div>
<input type="hidden" name="objtTp" id="objtTp" />
<input type="hidden" name="saleTp" id="saleTp" />
</form>
<%@ include file="/WEB-INF/views/comm/footer.jsp" %> 

<script id="objtTrTemplte1" type="text/x-jquery-tmpl">	
<td width='100px' height='25px'>
	<a href='#objt' onclick="f_objt_select('OT001','ST001')" style='text-decoration: none;'><li id="li_ST001" class='tab_bg'>매매</li></a>
</td>	
<td width='5px'>&nbsp;</td>
<td width='100px'>
	<a href='#objt' onclick="f_objt_select('OT001','ST002')"  style='text-decoration: none;'><li id="li_ST002" class='tab_bg'>전세</li></a>
</td>	
<td width='5px'>&nbsp;</td>
<td width='100px'>
	<a href='#objt' onclick="f_objt_select('OT001','ST003')" style='text-decoration: none;'><li id="li_ST003" class='tab_bg'>월세</li></a>
</td>	
<td width='5px'>&nbsp;</td>
<td width='100px'>
	<a href='#objt' onclick="f_objt_select('OT001','ST004')" style='text-decoration: none;'><li id="li_ST004" class='tab_bg'>렌트</li></a>
</td>
<td align='right'>
	<div id="order_menu" name="order_menu"></div>		
</td>	
</script>
<script id="objtTrTemplte2" type="text/x-jquery-tmpl">	
<td width='100px' height='25px'>
	<a href='#objt' onclick="f_objt_select('OT002','ST001')" style='text-decoration: none;'><li id="li_ST001" class='tab_bg'>매매</li></a>
</td>	
<td width='5px'>&nbsp;</td>
<td width='100px'>
	<a href='#objt' onclick="f_objt_select('OT002','ST005')"  style='text-decoration: none;'><li id="li_ST005" class='tab_bg'>임대</li></a>
</td>
<td align='right'>
	<div id="order_menu" name="order_menu"></div>		
</td>
</script>
<script id="objtTrTemplte3" type="text/x-jquery-tmpl">	
<td width='100px' height='25px'>
	<a href='#objt' onclick="f_objt_select('OT003','ST001')" style='text-decoration: none;'><li id="li_ST001" class='tab_bg'>매매</li></a>
</td>	
<td width='5px'>&nbsp;</td>
<td width='100px'>
	<a href='#objt' onclick="f_objt_select('OT003','ST005')"  style='text-decoration: none;'><li id="li_ST005" class='tab_bg'>임대</li></a>
</td>	
<td align='right'>
	<div id="order_menu" name="order_menu"></div>		
</td>
</script>
<script id="objtTrTemplte4" type="text/x-jquery-tmpl">	
<td width='100px' height='25px'>
	<a href='#objt' onclick="f_objt_select('OT004','ST001')" style='text-decoration: none;'><li id="li_ST001" class='tab_bg'>매매</li></a>
</td>	
<td width='5px'>&nbsp;</td>
<td width='100px'>
	<a href='#objt' onclick="f_objt_select('OT004','ST002')"  style='text-decoration: none;'><li id="li_ST002" class='tab_bg'>전세</li></a>
</td>	
<td width='5px'>&nbsp;</td>
<td width='100px'>
	<a href='#objt' onclick="f_objt_select('OT004','ST003')" style='text-decoration: none;'><li id="li_ST003" class='tab_bg'>월세</li></a>
</td>	
<td width='5px'>&nbsp;</td>
<td width='100px'>
	<a href='#objt' onclick="f_objt_select('OT004','ST004')" style='text-decoration: none;'><li id="li_ST004" class='tab_bg'>렌트</li></a>
</td>	
<td align='right'>
	<div id="order_menu" name="order_menu"></div>		
</td>
</script>
<script id="objtTrTemplte5" type="text/x-jquery-tmpl">	
<td width='100px' height='25px'>
	<a href='#objt' onclick="f_objt_select('OT005','ST001')" style='text-decoration: none;'><li id="li_ST001" class='tab_bg'>매매</li></a>
</td>	
<td width='5px'>&nbsp;</td>
<td width='100px'>
	<a href='#objt' onclick="f_objt_select('OT005','ST002')"  style='text-decoration: none;'><li id="li_ST002" class='tab_bg'>전세</li></a>
</td>	
<td width='5px'>&nbsp;</td>
<td width='100px'>
	<a href='#objt' onclick="f_objt_select('OT005','ST003')" style='text-decoration: none;'><li id="li_ST003" class='tab_bg'>월세</li></a>
</td>	
<td width='5px'>&nbsp;</td>
<td width='100px'>
	<a href='#objt' onclick="f_objt_select('OT005','ST004')" style='text-decoration: none;'><li id="li_ST004" class='tab_bg'>렌트</li></a>
</td>
<td align='right'>
	<div id="order_menu" name="order_menu"></div>		
</td>
</script>
<script id="objtTrTemplte6" type="text/x-jquery-tmpl">	
<td width='100px' height='25px'>
	<a href='#objt' onclick="f_objt_select('OT006','ST006')" style='text-decoration: none;'><li id="li_ST006" class='tab_bg'>분양권</li></a>
</td>	
<td width='5px'>&nbsp;</td>
<td width='100px'>
	<a href='#objt' onclick="f_objt_select('OT006','ST007')"  style='text-decoration: none;'><li id="li_ST007" class='tab_bg'>전매</li></a>
</td>	
<td align='right'>
	<div id="order_menu" name="order_menu"></div>		
</td>
</script>

<!-- 아파트 매매 -->
<script id="saleTpTrTmpl1_ST001" type="text/x-jquery-tmpl">	
		<td>등록일</td>
		<td>단지명</td>
		<td>평형</td>
		<td>동</td>
		<td>층</td>
		<td>향</td>
		<td>매매가</td>
		<td>명도</td>
		<td>온돌</td>
		<td>상태</td>
		<td>등록인</td>
		<td>분류</td>
</script>
<!-- 아파트 전세 -->
<script id="saleTpTrTmpl1_ST002" type="text/x-jquery-tmpl">	
		<td>등록일</td>
		<td>단지명</td>
		<td>평형</td>
		<td>동</td>
		<td>층</td>
		<td>향</td>
		<td>보증금</td>
		<td>명도</td>
		<td>온돌</td>
		<td>상태</td>
		<td>등록인</td>
		<td>분류</td>
</script>
<!-- 아파트 월세 -->
<script id="saleTpTrTmpl1_ST003" type="text/x-jquery-tmpl">	
		<td>등록일</td>
		<td>단지명</td>
		<td>평형</td>
		<td>동</td>
		<td>층</td>
		<td>향</td>
		<td>보증금</td>
		<td>월세</td>
		<td>명도</td>
		<td>온돌</td>
		<td>상태</td>
		<td>등록인</td>
		<td>분류</td>
</script>
<!--  아파트 렌트 -->
<script id="saleTpTrTmpl1_ST004" type="text/x-jquery-tmpl">	
		<td>등록일</td>
		<td>단지명</td>
		<td>평형</td>
		<td>동</td>
		<td>층</td>
		<td>향</td>
		<td>렌트비(월)</td>
		<td>명도</td>
		<td>온돌</td>
		<td>상태</td>
		<td>등록인</td>
		<td>분류</td>
</script>

<!-- 상가 매매 -->
<script id="saleTpTrTmpl2_ST001" type="text/x-jquery-tmpl">	
		<td>등록일</td>
		<td>건물명</td>
		<td>분양평수</td>
		<td>실평수</td>
		<td>층</td>
		<td>매매가</td>
		<td>보증금</td>
		<td>월세</td>
		<td>명도</td>
		<td>업종</td>
		<td>등록인</td>
		<td>분류</td>
</script>

<!-- 상가 임대 -->
<script id="saleTpTrTmpl2_ST005" type="text/x-jquery-tmpl">	
		<td>등록일</td>
		<td>건물명</td>
		<td>분양평수</td>
		<td>실평수</td>
		<td>층</td>
		<td>보증금</td>
		<td>월세</td>
		<td>권리금</td>
		<td>명도</td>
		<td>업종</td>
		<td>등록인</td>
		<td>분류</td>
</script>

<!-- 사무실/빌딩  -->
<script id="saleTpTrTmpl3_ST001" type="text/x-jquery-tmpl">	
		<td>등록일</td>
		<td>건물명</td>
		<td>분양평수</td>
		<td>실평수</td>
		<td>층</td>
		<td>매매가</td>
		<td>보증금</td>
		<td>월세</td>
		<td>명도</td>
		<td>등록인</td>
		<td>분류</td>
</script>
<!-- 사무실/빌딩 임대 -->
<script id="saleTpTrTmpl3_ST005" type="text/x-jquery-tmpl">	
		<td>등록일</td>
		<td>건물명</td>
		<td>분양평수</td>
		<td>실평수</td>
		<td>층</td>
		<td>보증금</td>
		<td>월세</td>
		<td>관리비</td>
		<td>명도</td>
		<td>등록인</td>
		<td>분류</td>
</script>

<!-- 오피스텔 매매 -->
<script id="saleTpTrTmpl4_ST001" type="text/x-jquery-tmpl">	
		<td>등록일</td>
		<td>건물명</td>
		<td>평형</td>
		<td>동</td>
		<td>층</td>
		<td>향</td>
		<td>매매가</td>
		<td>명도</td>
		<td>등록인</td>
		<td>분류</td>
</script>
<!-- 오피스텔 전세 -->
<script id="saleTpTrTmpl4_ST002" type="text/x-jquery-tmpl">	
		<td>등록일</td>
		<td>건물명</td>
		<td>평형</td>
		<td>동</td>
		<td>층</td>
		<td>향</td>
		<td>보증금</td>
		<td>명도</td>
		<td>등록인</td>
		<td>분류</td>
</script>
<!-- 오피스텔 월세 -->
<script id="saleTpTrTmpl4_ST003" type="text/x-jquery-tmpl">	
		<td>등록일</td>
		<td>건물명</td>
		<td>평형</td>
		<td>동</td>
		<td>층</td>
		<td>향</td>
		<td>보증금</td>
		<td>월세</td>
		<td>부가세</td>
		<td>명도</td>
		<td>등록인</td>
		<td>분류</td>
</script>
<!-- 오피스텔 렌트 -->
<script id="saleTpTrTmpl4_ST004" type="text/x-jquery-tmpl">	
		<td>등록일</td>
		<td>건물명</td>
		<td>평형</td>
		<td>동</td>
		<td>층</td>
		<td>향</td>
		<td>렌트비(월)</td>
		<td>명도</td>
		<td>등록인</td>
		<td>분류</td>
</script>

<!-- 주상복합 매매 -->
<script id="saleTpTrTmpl5_ST001" type="text/x-jquery-tmpl">	
		<td>등록일</td>
		<td>건물명</td>
		<td>평형</td>
		<td>동</td>
		<td>층</td>
		<td>향</td>
		<td>매매가</td>
		<td>명도</td>
		<td>등록인</td>
		<td>분류</td>
</script>

<!-- 주상복합 전세 -->
<script id="saleTpTrTmpl5_ST002" type="text/x-jquery-tmpl">	
		<td>등록일</td>
		<td>건물명</td>
		<td>평형</td>
		<td>동</td>
		<td>층</td>
		<td>향</td>
		<td>보증금</td>
		<td>명도</td>
		<td>등록인</td>
		<td>분류</td>
</script>

<!-- 주상복합 월세 -->
<script id="saleTpTrTmpl5_ST003" type="text/x-jquery-tmpl">	
		<td>등록일</td>
		<td>건물명</td>
		<td>평형</td>
		<td>동</td>
		<td>층</td>
		<td>향</td>
		<td>보증금</td>
		<td>월세</td>
		<td>명도</td>
		<td>등록인</td>
		<td>분류</td>
</script>

<!-- 주상복합 렌트 -->
<script id="saleTpTrTmpl5_ST004" type="text/x-jquery-tmpl">	
		<td>등록일</td>
		<td>건물명</td>
		<td>평형</td>
		<td>동</td>
		<td>층</td>
		<td>향</td>
		<td>렌트비(월)</td>
		<td>명도</td>
		<td>등록인</td>
		<td>분류</td>
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
</script>



<!-- 아파트 매매 -->
<script id="objtListTemplte1_ST001" type="text/x-jquery-tmpl">	
{{each objtList}}		
	<tr class="list_data" onclick="location.href='./indexObjectDtl.go?objtNo={{html $value.objtNo}}&objtTp={{html $value.objtTp}}'">
		<td>{{html $value.frstRegDt}}</td>
		<td>{{html $value.objtNm}}</td>
		<td>{{html $value.area}}</td>
		<td>{{html $value.dong}}</td>
		<td>{{html $value.floor}}</td>
		<td>{{html $value.directionTpNm}}</td>
		<td>{{html $value.bargainAmt}}</td>
		<td>{{html $value.availableTpNm}}</td>
		<td>{{html $value.ondolYn}}</td>
		<td>{{html $value.conditionTpNm}}</td>
		<td>{{html $value.estateInfo}}</td>
		<td>{{html $value.activeTpNm}}</td>
	</tr>
{{/each}}	
</script>
<!-- 아파트 전세 -->
<script id="objtListTemplte1_ST002" type="text/x-jquery-tmpl">	
{{each objtList}}		
	<tr class="list_data" onclick="location.href='./indexObjectDtl.go?objtNo={{html $value.objtNo}}&objtTp={{html $value.objtTp}}'">
		<td>{{html $value.frstRegDt}}</td>
		<td>{{html $value.objtNm}}</td>
		<td>{{html $value.area}}</td>
		<td>{{html $value.dong}}</td>
		<td>{{html $value.floor}}</td>
		<td>{{html $value.directionTpNm}}</td>
		<td>{{html $value.depositAmt}}</td>
		<td>{{html $value.availableTpNm}}</td>
		<td>{{html $value.ondolYn}}</td>
		<td>{{html $value.conditionTpNm}}</td>
		<td>{{html $value.estateInfo}}</td>
		<td>{{html $value.activeTpNm}}</td>
	</tr>
{{/each}}	
</script>
<!-- 아파트 월세 -->
<script id="objtListTemplte1_ST003" type="text/x-jquery-tmpl">	
{{each objtList}}		
	<tr class="list_data" onclick="location.href='./indexObjectDtl.go?objtNo={{html $value.objtNo}}&objtTp={{html $value.objtTp}}'">
		<td>{{html $value.frstRegDt}}</td>
		<td>{{html $value.objtNm}}</td>
		<td>{{html $value.area}}</td>
		<td>{{html $value.dong}}</td>
		<td>{{html $value.floor}}</td>
		<td>{{html $value.directionTpNm}}</td>
		<td>{{html $value.depositAmt}}</td>
		<td>{{html $value.monthlyAmt}}</td>
		<td>{{html $value.availableTpNm}}</td>
		<td>{{html $value.ondolYn}}</td>
		<td>{{html $value.conditionTpNm}}</td>
		<td>{{html $value.estateInfo}}</td>
		<td>{{html $value.activeTpNm}}</td>
	</tr>
{{/each}}	
</script>
<!-- 아파트 렌트 -->
<script id="objtListTemplte1_ST004" type="text/x-jquery-tmpl">	
{{each objtList}}		
	<tr class="list_data" onclick="location.href='./indexObjectDtl.go?objtNo={{html $value.objtNo}}&objtTp={{html $value.objtTp}}'">
		<td>{{html $value.frstRegDt}}</td>
		<td>{{html $value.objtNm}}</td>
		<td>{{html $value.area}}</td>
		<td>{{html $value.dong}}</td>
		<td>{{html $value.floor}}</td>
		<td>{{html $value.directionTpNm}}</td>
		<td>{{html $value.monthlyAmt}}</td>
		<td>{{html $value.availableTpNm}}</td>
		<td>{{html $value.ondolYn}}</td>
		<td>{{html $value.conditionTpNm}}</td>
		<td>{{html $value.estateInfo}}</td>
		<td>{{html $value.activeTpNm}}</td>
	</tr>
{{/each}}	
</script>

<!-- 상가 매매 -->
<script id="objtListTemplte2_ST001" type="text/x-jquery-tmpl">	
{{each objtList}}		
	<tr class="list_data" onclick="location.href='./indexObjectDtl.go?objtNo={{html $value.objtNo}}&objtTp={{html $value.objtTp}}'">
		<td>{{html $value.frstRegDt}}</td>
		<td>{{html $value.objtNm}}</td>
		<td>{{html $value.area}}</td>
		<td>{{html $value.realArea}}</td>
		<td>{{html $value.floor}}</td>
		<td>{{html $value.bargainAmt}}</td>
		<td>{{html $value.depositAmt}}</td>
		<td>{{html $value.monthlyAmt}}</td>
		<td>{{html $value.availableTpNm}}</td>
		<td>{{html $value.businessNm}}</td>
		<td>{{html $value.estateInfo}}</td>
		<td>{{html $value.activeTpNm}}</td>
	</tr>
{{/each}}	
</script>
<!-- 상가 임대 -->
<script id="objtListTemplte2_ST005" type="text/x-jquery-tmpl">	
{{each objtList}}		
	<tr class="list_data" onclick="location.href='./indexObjectDtl.go?objtNo={{html $value.objtNo}}&objtTp={{html $value.objtTp}}'">
		<td>{{html $value.frstRegDt}}</td>
		<td>{{html $value.objtNm}}</td>
		<td>{{html $value.area}}</td>
		<td>{{html $value.realArea}}</td>
		<td>{{html $value.floor}}</td>
		<td>{{html $value.depositAmt}}</td>
		<td>{{html $value.monthlyAmt}}</td>
		<td>{{html $value.rightAmt}}</td>
		<td>{{html $value.availableTpNm}}</td>
		<td>{{html $value.businessNm}}</td>
		<td>{{html $value.estateInfo}}</td>
		<td>{{html $value.activeTpNm}}</td>
	</tr>
{{/each}}	
</script>

<!-- 사무실/빌딩 매매 -->
<script id="objtListTemplte3_ST001" type="text/x-jquery-tmpl">	
{{each objtList}}		
	<tr class="list_data" onclick="location.href='./indexObjectDtl.go?objtNo={{html $value.objtNo}}&objtTp={{html $value.objtTp}}'">
		<td>{{html $value.frstRegDt}}</td>
		<td>{{html $value.objtNm}}</td>
		<td>{{html $value.area}}</td>
		<td>{{html $value.realArea}}</td>
		<td>{{html $value.floor}}</td>
		<td>{{html $value.bargainAmt}}</td>
		<td>{{html $value.depositAmt}}</td>
		<td>{{html $value.monthlyAmt}}</td>
		<td>{{html $value.availableTpNm}}</td>
		<td>{{html $value.estateInfo}}</td>
		<td>{{html $value.activeTpNm}}</td>
	</tr>
{{/each}}	
</script>
<!-- 사무실/빌딩 임대 -->
<script id="objtListTemplte3_ST005" type="text/x-jquery-tmpl">	
{{each objtList}}		
	<tr class="list_data" onclick="location.href='./indexObjectDtl.go?objtNo={{html $value.objtNo}}&objtTp={{html $value.objtTp}}'">
		<td>{{html $value.frstRegDt}}</td>
		<td>{{html $value.objtNm}}</td>
		<td>{{html $value.area}}</td>
		<td>{{html $value.realArea}}</td>
		<td>{{html $value.floor}}</td>
		<td>{{html $value.depositAmt}}</td>
		<td>{{html $value.monthlyAmt}}</td>
		<td>{{html $value.rightAmt}}</td>
		<td>{{html $value.availableTpNm}}</td>
		<td>{{html $value.estateInfo}}</td>
		<td>{{html $value.activeTpNm}}</td>
	</tr>
{{/each}}	
</script>

<!-- 오피스텔 매매 -->
<script id="objtListTemplte4_ST001" type="text/x-jquery-tmpl">	
{{each objtList}}		
	<tr class="list_data" onclick="location.href='./indexObjectDtl.go?objtNo={{html $value.objtNo}}&objtTp={{html $value.objtTp}}'">
		<td>{{html $value.frstRegDt}}</td>
		<td>{{html $value.objtNm}}</td>
		<td>{{html $value.area}}</td>
		<td>{{html $value.dong}}</td>
		<td>{{html $value.floor}}</td>
		<td>{{html $value.directionTpNm}}</td>
		<td>{{html $value.bargainAmt}}</td>
		<td>{{html $value.availableTpNm}}</td>
		<td>{{html $value.estateInfo}}</td>
		<td>{{html $value.activeTpNm}}</td>
	</tr>
{{/each}}	
</script>
<!-- 오피스텔 전세 -->
<script id="objtListTemplte4_ST002" type="text/x-jquery-tmpl">	
{{each objtList}}		
	<tr class="list_data" onclick="location.href='./indexObjectDtl.go?objtNo={{html $value.objtNo}}&objtTp={{html $value.objtTp}}'">
		<td>{{html $value.frstRegDt}}</td>
		<td>{{html $value.objtNm}}</td>
		<td>{{html $value.area}}</td>
		<td>{{html $value.dong}}</td>
		<td>{{html $value.floor}}</td>
		<td>{{html $value.directionTpNm}}</td>
		<td>{{html $value.depositAmt}}</td>
		<td>{{html $value.availableTpNm}}</td>
		<td>{{html $value.estateInfo}}</td>
		<td>{{html $value.activeTpNm}}</td>
	</tr>
{{/each}}	
</script>
<!-- 오피스텔 월세 -->
<script id="objtListTemplte4_ST003" type="text/x-jquery-tmpl">	
{{each objtList}}		
	<tr class="list_data" onclick="location.href='./indexObjectDtl.go?objtNo={{html $value.objtNo}}&objtTp={{html $value.objtTp}}'">
		<td>{{html $value.frstRegDt}}</td>
		<td>{{html $value.objtNm}}</td>
		<td>{{html $value.area}}</td>
		<td>{{html $value.dong}}</td>
		<td>{{html $value.floor}}</td>
		<td>{{html $value.directionTpNm}}</td>
		<td>{{html $value.depositAmt}}</td>
		<td>{{html $value.monthlyAmt}}</td>
		<td>{{html $value.surtaxYn}}</td>
		<td>{{html $value.availableTpNm}}</td>
		<td>{{html $value.estateInfo}}</td>
		<td>{{html $value.activeTpNm}}</td>
	</tr>
{{/each}}	
</script>
<!-- 오피스텔 렌트 -->
<script id="objtListTemplte4_ST004" type="text/x-jquery-tmpl">	
{{each objtList}}		
	<tr class="list_data" onclick="location.href='./indexObjectDtl.go?objtNo={{html $value.objtNo}}&objtTp={{html $value.objtTp}}'">
		<td>{{html $value.frstRegDt}}</td>
		<td>{{html $value.objtNm}}</td>
		<td>{{html $value.area}}</td>
		<td>{{html $value.dong}}</td>
		<td>{{html $value.floor}}</td>
		<td>{{html $value.directionTpNm}}</td>
		<td>{{html $value.monthlyAmt}}</td>
		<td>{{html $value.availableTpNm}}</td>
		<td>{{html $value.estateInfo}}</td>
		<td>{{html $value.activeTpNm}}</td>
	</tr>
{{/each}}	
</script>

<!-- 오피스텔 매매 -->
<script id="objtListTemplte5_ST001" type="text/x-jquery-tmpl">	
{{each objtList}}		
	<tr class="list_data" onclick="location.href='./indexObjectDtl.go?objtNo={{html $value.objtNo}}&objtTp={{html $value.objtTp}}'">
		<td>{{html $value.frstRegDt}}</td>
		<td>{{html $value.objtNm}}</td>
		<td>{{html $value.area}}</td>
		<td>{{html $value.dong}}</td>
		<td>{{html $value.floor}}</td>
		<td>{{html $value.directionTpNm}}</td>
		<td>{{html $value.bargainAmt}}</td>
		<td>{{html $value.availableTpNm}}</td>
		<td>{{html $value.estateInfo}}</td>
		<td>{{html $value.activeTpNm}}</td>
	</tr>
{{/each}}	
</script>
<!-- 오피스텔 전세 -->
<script id="objtListTemplte5_ST002" type="text/x-jquery-tmpl">	
{{each objtList}}		
	<tr class="list_data" onclick="location.href='./indexObjectDtl.go?objtNo={{html $value.objtNo}}&objtTp={{html $value.objtTp}}'">
		<td>{{html $value.frstRegDt}}</td>
		<td>{{html $value.objtNm}}</td>
		<td>{{html $value.area}}</td>
		<td>{{html $value.dong}}</td>
		<td>{{html $value.floor}}</td>
		<td>{{html $value.directionTpNm}}</td>
		<td>{{html $value.depositAmt}}</td>
		<td>{{html $value.availableTpNm}}</td>
		<td>{{html $value.estateInfo}}</td>
		<td>{{html $value.activeTpNm}}</td>
	</tr>
{{/each}}	
</script>
<!-- 오피스텔 월세 -->
<script id="objtListTemplte5_ST003" type="text/x-jquery-tmpl">	
{{each objtList}}		
	<tr class="list_data" onclick="location.href='./indexObjectDtl.go?objtNo={{html $value.objtNo}}&objtTp={{html $value.objtTp}}'">
		<td>{{html $value.frstRegDt}}</td>
		<td>{{html $value.objtNm}}</td>
		<td>{{html $value.area}}</td>
		<td>{{html $value.dong}}</td>
		<td>{{html $value.floor}}</td>
		<td>{{html $value.directionTpNm}}</td>
		<td>{{html $value.depositAmt}}</td>
		<td>{{html $value.monthlyAmt}}</td>
		<td>{{html $value.availableTpNm}}</td>
		<td>{{html $value.estateInfo}}</td>
		<td>{{html $value.activeTpNm}}</td>
	</tr>
{{/each}}	
</script>
<!-- 오피스텔 렌트 -->
<script id="objtListTemplte5_ST004" type="text/x-jquery-tmpl">	
{{each objtList}}		
	<tr class="list_data" onclick="location.href='./indexObjectDtl.go?objtNo={{html $value.objtNo}}&objtTp={{html $value.objtTp}}'">
		<td>{{html $value.frstRegDt}}</td>
		<td>{{html $value.objtNm}}</td>
		<td>{{html $value.area}}</td>
		<td>{{html $value.dong}}</td>
		<td>{{html $value.floor}}</td>
		<td>{{html $value.monthlyAmt}}</td>
		<td>{{html $value.availableTpNm}}</td>
		<td>{{html $value.estateInfo}}</td>
		<td>{{html $value.activeTpNm}}</td>
	</tr>
{{/each}}	
</script>
	
<script id="objtListTemplte6" type="text/x-jquery-tmpl">	
{{each objtList}}		
	<tr class="list_data" onclick="location.href='./indexObjectDtl.go?objtNo={{html $value.objtNo}}&objtTp={{html $value.objtTp}}'">
		<td>{{html $value.frstRegDt}}</td>
		<td>{{html $value.objtNm}}</td>
		<td>{{html $value.area}}</td>
		<td>{{html $value.dong}}</td>
		<td>{{html $value.floor}}</td>
		<td>{{html $value.directionTpNm}}</td>
		<td>{{html $value.parcelAmt}}</td>
		<td>{{html $value.premiumAmt}}</td>
		<td>{{html $value.availableDt}}</td>
		<td>{{html $value.estateInfo}}</td>
		<td>{{html $value.activeTpNm}}</td>
	</tr>
{{/each}}	
</script>

<script id="objtListEmptyTemplte" type="text/x-jquery-tmpl">	
	<tr class="list_data">
		<td colspan = {{html col}}>해당하는 물건이 존재하지 않습니다.</td>
	</tr>
</script>