<%@ include file="/WEB-INF/views/comm/indexHeader.jsp" %> 
<%@ include file="/WEB-INF/views/list/listStyle.jsp" %> 
<%@ page contentType="text/html; charset=utf-8" %>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=Z0U9uQFTmyK7bim6HrQ6&submodules=geocoder"></script>
<script type="text/javascript" src="./resources/js/list/mainObject.js"></script>
<div id="ob_list" style="width:1500px;margin:auto;padding:0;">
	
	<div style="width:1470px; text-align:left; margin:auto; padding:0">		
		<table style="width: 1470px;" cellpadding="0" cellspacing="0" border="0">
			<tr><td height="600px" style="background-color:#e0e0e0;">
				<div id="map" style="width:100%;height:600px;"></div>
			</td>
			</tr>
			<tr><td height="30px"></td></tr>
		</table>
	</div>
  	<div class="list_div2" style="background-color :#F6F8F7; height:100px;" >	
		<table style="background-color :#F6F8F7;" width="1500px" cellpadding="0" cellspacing="0" border="0">
			<tr>
				<td style="width:14%;"><a href='#objt' onclick="f_category_combo('OT001')"  style='text-decoration: none;'><li id="li_OT001" style="width:100%" class='tab_on_txt'>아파트</li></a></td>
				<td style="width:2%;"></td>
				<td style="width:14%;"><a href='#objt' onclick="f_category_combo('OT002')"  style='text-decoration: none;'><li id="li_OT002" style="width:100%"class='tab_on_txt'>상가</li></a></td>
				<td style="width:2%;"></td>
				<td style="width:14%;"><a href='#objt' onclick="f_category_combo('OT003')"  style='text-decoration: none;'><li id="li_OT003" style="width:100%"class='tab_on_txt'>사무실/빌딩</li></a></td>
				<td style="width:2%;"></td>
				<td style="width:14%;"><a href='#objt' onclick="f_category_combo('OT004')"  style='text-decoration: none;'><li id="li_OT004" style="width:100%"class='tab_on_txt'>오피스텔</li></a></td>
				<td style="width:2%;"></td>
				<td style="width:14%;"><a href='#objt' onclick="f_category_combo('OT005')"  style='text-decoration: none;'><li id="li_OT005" style="width:100%"class='tab_on_txt'>주상복합</li></a></td>
				<td style="width:2%;"></td>
				<td style="width:14%;"><a href='#objt' onclick="f_category_combo('OT006')"  style='text-decoration: none;'><li id="li_OT006" style="width:100%"class='tab_on_txt'>분양권</li></a></td>
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
									<div style="width:488px;height:41px;margin:0;padding:0;text-align:left">
										<a href="#"><img src="./resources/images/btn_search2.jpg"></a> 새창으로 떠서 검색 후 결과는 현재 페이지로 (검색페이지????페이지도없고...이건 추후개발로하자 11월이후..)
									</div>
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
		<table style="background-color :#F6F8F7;" width="1500px" class="ob_list" id="objtTable">
			<tr>
				<td width="8%">등록일</td><td width="6%">유형</td><td width="6%">종류</td><td width="32%">물건명</td><td width="8%">면적(평형)</td><td width="5%">층</td><td width="15%">매물가(만원)</td><td width="20%">연락처</td>
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
							<td width="486px" align="center">
								<div id="pagingDiv" class="pagination"></div>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</div>
</div>
<%@ include file="/WEB-INF/views/comm/footer.jsp" %> 
<script id="objtListTemplte" type="text/x-jquery-tmpl">	
{{each objtList}}		
	<tr class="list_data" >
		<td>{{html $value.frstRegDt}}</td>
		<td>{{html $value.saleTpNm}}</td>
		<td>{{html $value.objtTpNm}}</td>
		<td>{{html $value.objtNm}}</td>
		<td>{{html $value.area}}</td>
		<td>{{html $value.floor}}</td>
		<td>{{html $value.bargainAmt}}</td>
		<td>{{html $value.estateInfo}}</td>
	</tr>
{{/each}}	
</script>
<script id="objtListEmptyTemplte" type="text/x-jquery-tmpl">	
	<tr class="list_data" >
		<td colspan="8">조회된 결과가 존재하지 않습니다.</td>
	</tr>
</script>