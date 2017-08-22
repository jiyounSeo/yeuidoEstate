<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page contentType="text/html; charset=utf-8" %>
<% request.setCharacterEncoding("utf-8");%>
<%@ include file="/WEB-INF/views/comm/adminHeader.jsp" %> 
<%@ include file="/WEB-INF/views/list/listStyle.jsp" %> 
<link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script type="text/javascript" src="./resources/js/list/objtList.js"></script>
<script type="text/javascript" src="./resources/js/comm/jquery.tmpl.js"></script>
	
	
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
										 <input type="checkbox" name="activeTp1" id="activeTp1" value="AT001" /><label for="activeTp1">활성</label>
									 	 <input type="checkbox" name="activeTp2" id="activeTp2" value="AT002" /><label for="activeTp2">보류</label>
			  							 <input type="checkbox" name="activeTp3" id="activeTp3" value="AT003" /><label for="activeTp3">내가등록한물건만보기</label>
										</td>
									</tr>									
								</table>
							</td>
						</tr>
						<tr><!-- list -->
							<td height="306" valign="top">
								<table class="ob_list" id="objtTable">
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
											<td>온돌</td>
											<td>상태</td>
											<td>등록인</td>
											<td>분류</td>
											<td>기타</td>
										</tr>
									</c:when>
									<c:when test="${mainc == 2}">
											<td>등록일</td>
											<td>분양평수</td>
											<td>실평수</td>
											<td>층</td>
											<td>보증금 / 월세</td>
											<td>권리금</td>
											<td>등록인</td>
											<td>분류</td>
											<td>기타</td>
										</tr>
									</c:when>
									<c:when test="${mainc == 3}">
											<td>등록일</td>
											<td>분양평수</td>
											<td>실평수</td>
											<td>층</td>
											<td>매매가</td>
											<td>등록인</td>
											<td>분류</td>
											<td>기타</td>
										</tr>
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
											<td>등록인</td>
											<td>분류</td>
											<td>기타</td>
										</tr>
									</c:when>
									<c:when test="${mainc == 5}">
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
										</tr>
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
									</c:when>
								</c:choose>	
								<tbody id="objtTbody">
								</tbody>																		
								
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
<input type="hidden" name="objtTp" id="objtTp" value="${objtTp}"/>
<input type="hidden" name="saleTp" id="saleTp" value="${saleTp}"/>
<input type="hidden" name="viewUrl" id="viewUrl" value="${viewUrl[0]}"/>
<input type="hidden" name="pageMark" id="pageMark" value="${pageMark}"/>

<%@ include file="/WEB-INF/views/comm/footer.jsp" %> 
<!-- <a href="${viewUrl[0]}?pm=${pageMark}">${viewUrl[0]}</a> -->
<script id="objtListTemplte1" type="text/x-jquery-tmpl">	
{{each objtList}}		
	<tr>
		<td><a href="{{html $value.viewUrl}}.do?objtNo={{html $value.objtNo}}&objtTp={{html $value.objtTp}}">{{html $value.firstRegDt}}</a></td>
		<td>{{html $value.objtNm}}</td>
		<td>{{html $value.area}}</td>
		<td>{{html $value.dong}}</td>
		<td>{{html $value.floor}}</td>
		<td>{{html $value.directionTpNm}}</td>
		<td>{{html $value.bargainAmt}}</td>
		<td>{{html $value.ondolYn}}</td>
		<td>{{html $value.conditionTpNm}}</td>
		<td>{{html $value.firstRegNm}}</td>
		<td>{{html $value.activeTpNm}}</td>
		<td>{{html $value.etc}}</td>											
	</tr>
{{/each}}	
</script>

<script id="objtListTemplte2" type="text/x-jquery-tmpl">	
{{each objtList}}		
	<tr>
		<td><a href="{{html $value.viewUrl}}.do?objtNo={{html $value.objtNo}}&objtTp={{html $value.objtTp}}">{{html $value.firstRegDt}}</a></td>
		<td>{{html $value.area}}</td>
		<td>{{html $value.realArea}}</td>
		<td>{{html $value.floor}}</td>
		<td>{{html $value.depositAmt}}</td>
		<td>{{html $value.rightAmt}}</td>
		<td>{{html $value.firstRegNm}}</td>
		<td>{{html $value.activeTpNm}}</td>
		<td>{{html $value.etc}}</td>
	</tr>
{{/each}}	
</script>

<script id="objtListTemplte3" type="text/x-jquery-tmpl">	
{{each objtList}}		
	<tr>
		<td><a href="{{html $value.viewUrl}}.do?objtNo={{html $value.objtNo}}&objtTp={{html $value.objtTp}}">{{html $value.firstRegDt}}</a></td>
		<td>{{html $value.area}}</td>
		<td>{{html $value.realArea}}</td>
		<td>{{html $value.floor}}</td>
		<td>{{html $value.bargainAmt}}</td>
		<td>{{html $value.firstRegNm}}</td>
		<td>{{html $value.activeTpNm}}</td>
		<td>{{html $value.etc}}</td>
	</tr>
{{/each}}	
</script>

<script id="objtListTemplte4" type="text/x-jquery-tmpl">	
{{each objtList}}		
	<tr>
		<td><a href="{{html $value.viewUrl}}.do?objtNo={{html $value.objtNo}}&objtTp={{html $value.objtTp}}">{{html $value.firstRegDt}}</a></td>
		<td>{{html $value.objtNm}}</td>
		<td>{{html $value.area}}</td>
		<td>{{html $value.dong}}</td>
		<td>{{html $value.floor}}</td>
		<td>{{html $value.directionTpNm}}</td>
		<td>{{html $value.depositAmt}}</td>
		<td>{{html $value.surtaxYn}}</td>
		<td>{{html $value.firstRegNm}}</td>
		<td>{{html $value.activeTpNm}}</td>
		<td>{{html $value.etc}}</td>	
	</tr>
{{/each}}	
</script>


<script id="objtListTemplte5" type="text/x-jquery-tmpl">	
{{each objtList}}		
	<tr>
		<td><a href="{{html $value.viewUrl}}.do?objtNo={{html $value.objtNo}}&objtTp={{html $value.objtTp}}">{{html $value.firstRegDt}}</a></td>
		<td>{{html $value.objtNm}}</td>
		<td>{{html $value.area}}</td>
		<td>{{html $value.dong}}</td>
		<td>{{html $value.floor}}</td>
		<td>{{html $value.directionTpNm}}</td>
		<td>{{html $value.depositAmt}}</td>
		<td>{{html $value.firstRegNm}}</td>
		<td>{{html $value.activeTpNm}}</td>
		<td>{{html $value.etc}}</td>	
	</tr>
{{/each}}	
</script>

	
<script id="objtListTemplte6" type="text/x-jquery-tmpl">	
{{each objtList}}		
	<tr>
		<td><a href="{{html $value.viewUrl}}.do?objtNo={{html $value.objtNo}}&objtTp={{html $value.objtTp}}">{{html $value.firstRegDt}}</a></td>
		<td>{{html $value.objtNm}}</td>
		<td>{{html $value.area}}</td>
		<td>{{html $value.dong}}</td>
		<td>{{html $value.floor}}</td>
		<td>{{html $value.directionTpNm}}</td>
		<td>{{html $value.parcelAmt}}</td>
		<td>{{html $value.premiumAmt}}</td>
		<td>{{html $value.availableDt}}</td>
		<td>{{html $value.firstRegNm}}</td>
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



