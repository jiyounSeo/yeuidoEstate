<%@ include file="/WEB-INF/views/comm/adminHeader.jsp" %> 
<%@ page contentType="text/html; charset=utf-8" %>
<%@ include file="/WEB-INF/views/list/listStyle.jsp" %> 

<div id="ob_list" style="width:1500px;margin:auto;padding:0;">
	<div style="width:1500px;height:78px;">
		<img src="./resources/images/title_comm_ob_list.jpg">
	</div>
	<div class="list_div2">	
		<table width="1500px" height="520px" cellpadding="0" cellspacing="0" border="0">
			<tr>
				<td width="20px"></td>
				<td width="1460px">
					<table style="width:1460;height:465px;" cellpadding="0" cellspacing="0" border="0">
						<tr><!-- main category -->
							<td height="45px">
								<table widht="1460px" height="44px" cellpadding="0" cellspacing="0" border="0">
									<tr>
										<td width="223px" height="44px"><a href="./commObList?mainc=1"><img src="./resources/images/ob_list_mc_${main_category_state[1]}.jpg" border="0"></a></td>
										<td width="239px"><a href="./commObList?mainc=2"><img src="./resources/images/ob_list_mc_${main_category_state[2]}.jpg" border="0"></a></td>
										<td width="255px"><a href="./commObList?mainc=3"><img src="./resources/images/ob_list_mc_${main_category_state[3]}.jpg" border="0"></a></td>
										<td width="235px"><a href="./commObList?mainc=4"><img src="./resources/images/ob_list_mc_${main_category_state[4]}.jpg" border="0"></a></td>
										<td width="262px"><a href="./commObList?mainc=5"><img src="./resources/images/ob_list_mc_${main_category_state[5]}.jpg" border="0"></a></td>
										<td width="246px"><a href="./commObList?mainc=6"><img src="./resources/images/ob_list_mc_${main_category_state[6]}.jpg" border="0"></a></td>
									</tr>
								</table>
							</td>
						</tr>
						<tr><!-- sub category -->
							<td height="60px" background="./resources/images/category_bg${mainc}.jpg" valign="center" style="padding-left:20px;padding-top:5px;background-repeat:repeat-x;">
								<c:choose>
									<c:when test="${mainc == 1}">
										아파트 카테고리					
									</c:when>
									<c:when test="${mainc == 2}">
										상가 카테고리					
									</c:when>
									<c:when test="${mainc == 3}">
										사무실/빌딩 카테고리					
									</c:when>
									<c:when test="${mainc == 4}">
										오피스텔 카테고리					
									</c:when>
									<c:when test="${mainc == 5}">
										주상복합 카테고리					
									</c:when>
									<c:when test="${mainc == 6}">
										분양권 카테고리					
									</c:when>
								</c:choose>
							</td>
						</tr>
						<tr><!-- tab -->
							<td height="55px">
								<table widht="1460px" height="55px" cellpadding="0" cellspacing="0" border="0">
									<tr>
										<c:forEach items="${tab_category_state}" var="tab" varStatus="i">
										<td width="248px" height="55px">
											<a href="./commObList?mainc=${mainc}&tab=${i.index+1}"><img src="./resources/images/ob_list_ap_tab${tab}.jpg" border="0"></a>
										</td>
										</c:forEach>
										<td width="100%" align="right" valign="bottom">
											<input type="checkbox">활성 <input type="checkbox">보류 <input type="checkbox">내가등록한물건만보기
										</td>
									</tr>									
								</table>
							</td>
						</tr>
						<tr><!-- list -->
							<td height="306" valign="top">
								<table class="ob_list">
								<c:choose>
									<c:when test="${mainc == 6}"><tr class="title${tab+4}"></c:when>
									<c:otherwise><tr class="title${tab}"></c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${mainc == 1}">
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
											<td>기타</td>
										</tr>
										<c:forEach var="i" begin="1" end="${numOfRow-1}" step="1">
										<tr>
											<td><a href="${viewUrl[0]}?pm=${pageMark}">${viewUrl[0]}</a></td>
											<td>-</td>
											<td>-</td>
											<td>-</td>
											<td>-</td>
											<td>-</td>
											<td>-</td>
											<td>-</td>
											<td>-</td>
											<td>-</td>
											<td>-</td>
											<td>-</td>
											<td>-</td>											
										</tr>
										</c:forEach>
									</c:when>
									<c:when test="${mainc == 2}">
											<td>등록일</td>
											<td>분양평수</td>
											<td>실평수</td>
											<td>층</td>
											<td>보증금 / 월세</td>
											<td>권리금</td>
											<td>명도</td>
											<td>등록인</td>
											<td>분류</td>
											<td>기타</td>
										</tr>
										<c:forEach var="i" begin="1" end="${numOfRow-1}" step="1">
										<tr>
											<td><a href="${viewUrl[0]}?pm=${pageMark}">${viewUrl[0]}</a></td>
											<td>-</td>
											<td>-</td>
											<td>-</td>
											<td>-</td>
											<td>-</td>
											<td>-</td>
											<td>-</td>
											<td>-</td>
											<td>-</td>
										</tr>
										</c:forEach>				
									</c:when>
									<c:when test="${mainc == 3}">
											<td>등록일</td>
											<td>분양평수</td>
											<td>실평수</td>
											<td>층</td>
											<td>매매가</td>
											<td>명도</td>
											<td>등록인</td>
											<td>분류</td>
											<td>기타</td>
										</tr>
										<c:forEach var="i" begin="1" end="${numOfRow-1}" step="1">
										<tr>
											<td><a href="${viewUrl[0]}?pm=${pageMark}">${viewUrl[0]}</a></td>
											<td>-</td>
											<td>-</td>
											<td>-</td>
											<td>-</td>
											<td>-</td>
											<td>-</td>
											<td>-</td>
											<td>-</td>
										</tr>
										</c:forEach>			
									</c:when>
									<c:when test="${mainc == 4}">
											<td>등록일</td>
											<td>건물명</td>
											<td>평형</td>
											<td>동</td>
											<td>층</td>
											<td>향</td>
											<td>보증금/월세</td>
											<td>부가세</td>
											<td>명도</td>
											<td>등록인</td>
											<td>분류</td>
											<td>기타</td>
										</tr>
										<c:forEach var="i" begin="1" end="${numOfRow-1}" step="1">
										<tr>
											<td><a href="${viewUrl[0]}?pm=${pageMark}">${viewUrl[0]}</a></td>
											<td>-</td>
											<td>-</td>
											<td>-</td>
											<td>-</td>
											<td>-</td>
											<td>-</td>
											<td>-</td>
											<td>-</td>
											<td>-</td>
											<td>-</td>
											<td>-</td>
										</tr>
										</c:forEach>					
									</c:when>
									<c:when test="${mainc == 5}">
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
											<td>기타</td>
										</tr>
										<c:forEach var="i" begin="1" end="${numOfRow-1}" step="1">
										<tr>
											<td><a href="${viewUrl[0]}?pm=${pageMark}">${viewUrl[0]}</a></td>
											<td>-</td>
											<td>-</td>
											<td>-</td>
											<td>-</td>
											<td>-</td>
											<td>-</td>
											<td>-</td>
											<td>-</td>
											<td>-</td>
											<td>-</td>
										</tr>
										</c:forEach>			
									</c:when>
									<c:when test="${mainc == 6}">
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
										</tr>
										<c:forEach var="i" begin="1" end="${numOfRow-1}" step="1">
										<tr>
											<td><a href="${viewUrl[0]}?pm=${pageMark}">${viewUrl[0]}</a></td>
											<td>-</td>
											<td>-</td>
											<td>-</td>
											<td>-</td>
											<td>-</td>
											<td>-</td>
											<td>-</td>
											<td>-</td>
											<td>-</td>
											<td>-</td>
											<td>-</td>
										</tr>
										</c:forEach>		
									</c:when>
								</c:choose>																			
								</table>
							</td>
						</tr>
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
										<td width="486px" align="center"><img src="./resources/images/page_temp.jpg"></td>
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
				</td>
				<td width="20px">&nbsp;</td>
			</tr>
		</table>		
	</div>
</div>

<%@ include file="/WEB-INF/views/comm/footer.jsp" %> 
