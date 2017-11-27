<%@ include file="/WEB-INF/views/comm/indexHeader.jsp" %> 
<%@ include file="/WEB-INF/views/list/listStyle.jsp" %> 
<%@ page contentType="text/html; charset=utf-8" %>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=Z0U9uQFTmyK7bim6HrQ6&submodules=geocoder"></script>
<script type="text/javascript" src="./resources/js/list/mainObject.js"></script>
<div id="ob_list" style="width:1500px;margin:auto;padding:0;">
	
	<div style="width:1470px; text-align:left; margin:auto; padding:0">		
		<table style="width: 1470px;" cellpadding="0" cellspacing="0" border="0">
			<tr>
				<td width="1040px;" height="550px" style="background-color:#e0e0e0;">
					<div id="main_map" style="width:100%;height:550px;"></div>
				</td>
				<td width="30px"></td>
				<td width="400px" valign="bottom" align="right">
					<table style="width:100%;border:0;border-collapse:collapse;border: 1px solid #b2b2b2;">
						<tr>
							<td style="width:15%;height:70px;text-align:center;background:#0063b1;color:#fff;font-weight: bold;">종류</td>
							<td style="width:75%;padding-left:10px;">
								<input type="radio" id="caTp1" name="caTp" value="ST001" checked /><label for="caTp1">아파트</label>
								<input type="radio" id="caTp2" name="caTp" value="ST002"/><label for="caTp2">상가</label>
								<input type="radio" id="caTp3" name="caTp" value="ST003"/><label for="caTp3">사무실/빌딩</label><br>
								<input type="radio" id="caTp4" name="caTp" value="ST004"/><label for="caTp4">오피스텔</label>
								<input type="radio" id="caTp5" name="caTp" value="ST003"/><label for="caTp5">주상복합</label>
								<input type="radio" id="caTp6" name="caTp" value="ST004"/><label for="caTp6">분양권</label>
							</td>
						</tr>
						<tr><td colspan="2" height="5px"></td></tr>
						<tr>
							<td style="width:15%;height:50px;text-align:center;background:#0063b1;color:#fff;font-weight: bold;">유형</td>
							<td style="width:75%;padding-left:10px;">
								<input type="radio" id="saleTp1" name="saleTp" value="ST001" checked /><label for="saleTp1">매매</label>
								<input type="radio" id="saleTp2" name="saleTp" value="ST002"/><label for="saleTp2">전세</label>
								<input type="radio" id="saleTp3" name="saleTp" value="ST003"/><label for="saleTp3">월세</label>
								<input type="radio" id="saleTp4" name="saleTp" value="ST004"/><label for="saleTp4">렌트</label>
							</td>
						</tr>
						<tr><td colspan="2" height="5px"></td></tr>
						<tr>
							<td style="width:15%;height:50px;text-align:center;background:#0063b1;color:#fff;font-weight: bold;">매매가</td>
							<td style="width:75%;padding-left:10px;">
								<select  style="width:90px;height:30px;">
									<option>전체</option>
									<option>1억이하</option>
									<option>1억 ~ 3억</option>
									<option>3억 ~ 6억</option>
									<option>6억 ~ 9억</option>
									<option>9억 이상</option>
									<option>직접입력</option>
								</select>
								<input type="text" style="width:80px;height:30px;"> ~ <input type="text" style="width:80px;height:30px;"> 만원
							</td>
						</tr>
						<tr><td colspan="2" height="5px"></td></tr>
						<tr>
							<td style="width:15%;height:50px;text-align:center;background:#0063b1;color:#fff;font-weight: bold;">보증금</td>
							<td style="width:75%;padding-left:10px;">
								<select  style="width:90px;height:30px;">
									<option>전체</option>
									<option>1억이하</option>
									<option>1억 ~ 3억</option>
									<option>3억 ~ 6억</option>
									<option>6억 ~ 9억</option>
									<option>9억 이상</option>
									<option>직접입력</option>
								</select>
								<input type="text" style="width:80px;height:30px;"> ~ <input type="text" style="width:80px;height:30px;"> 만원
							</td>
						</tr>
						<tr><td colspan="2" height="5px"></td></tr>
						<tr>
							<td style="width:15%;height:50px;text-align:center;background:#0063b1;color:#fff;font-weight: bold;">월세</td>
							<td style="width:75%;padding-left:10px;">
								<select  style="width:90px;height:30px;">
									<option>전체</option>
									<option>1억이하</option>
									<option>1억 ~ 3억</option>
									<option>3억 ~ 6억</option>
									<option>6억 ~ 9억</option>
									<option>9억 이상</option>
									<option>직접입력</option>
								</select>
								<input type="text" style="width:80px;height:30px;"> ~ <input type="text" style="width:80px;height:30px;"> 만원
							</td>
						</tr>
						<tr><td colspan="2" height="5px"></td></tr>
						<tr>
							<td style="width:15%;height:50px;text-align:center;background:#0063b1;color:#fff;font-weight: bold;">면적</td>
							<td style="width:75%;padding-left:10px;">
								<select  style="width:90px;height:30px;">
									<option>전체</option>
									<option>0 ~ 66</option>
									<option>66 ~ 99</option>
									<option>99 ~ 132</option>
									<option>132 ~ 165</option>
									<option>165 ~ 198</option>
									<option>198 ~ 330</option>
									<option>330 ~ 991</option>
									<option>직접입력</option>
								</select>
								<input type="text" style="width:80px;height:30px;"> ~ <input type="text" style="width:80px;height:30px;"> ㎡
							</td>
						</tr>
					</table><br>
					<input type="button" value="초기화">&nbsp;&nbsp;<input type="button" value="검색">
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
									<a href='#cate' onclick="f_order('frstRegDt');return false">등록일자순</a>|<a href='#cate' onclick="f_order('area');return false;">면적순</a>|<a href='#cate' onclick="f_order('bargainAmt');return false">가격순</a> 
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