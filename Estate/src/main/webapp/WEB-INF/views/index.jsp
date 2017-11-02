<%@ include file="/WEB-INF/views/comm/indexHeader.jsp" %> 
<%@ include file="/WEB-INF/views/list/listStyle.jsp" %> 
<%@ page contentType="text/html; charset=utf-8" %>

<div id="ob_list" style="width:1500px;margin:auto;padding:0;">
	<div class="list_div2" style="background-color :#F6F8F7;" >	
		** 각 탭마다.. "전체" 버튼 필요, 선택된 탭에 따라 지도에 매물마킹 표시 --> 그래서 탭을 맨 위로 올림 (하단공백은 왜 안없어질까=_=) 
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
		</table>
		<table style="background-color :#F6F8F7;" width="1500px" cellpadding="0" cellspacing="0" border="0">
			<tr id="trCategory">
			</tr>
		</table>
</div>
	<div style="width:1470px; text-align:left; margin:auto; padding:0">		
		<table style="width: 1470px;" cellpadding="0" cellspacing="0" border="0">
			<tr><td height="600px" style="background-color:#e0e0e0;">지도</td></tr>
			<tr><td height="30px"></td></tr>
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
										<a href="#"><img src="./resources/images/btn_search2.jpg"></a> <-검색페이지가 새창으로 떠서 검색 후 결과는 현재 페이지로
									</div>
								</td>
								<td width="30%" align="right">			
									등록일자순 | 면적순 | 가격순  <-- ordering 기능
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
			<tr>
				<td>YY.MM.DD</td><td>매매</td><td>아파트</td><td>물건명입니다</td><td>123</td><td>1</td><td>28,000</td><td>여의도부동산(02-783-7722)</td>
			</tr>
			
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