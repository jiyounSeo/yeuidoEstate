<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8");%>

<%@ include file="/WEB-INF/views/comm/adminHeader.jsp" %> 
<%@ include file="/WEB-INF/views/list/listStyle.jsp" %> 
<link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script type="text/javascript" src="./resources/js/comm/jquery.tmpl.js"></script>
<script type="text/javascript" src="./resources/js/search/objtSearch.js?v20180208"></script>	

<form id="commObjtList">
<div id="ob_list" name="ob_list" style="width:1500px;margin:auto;padding:0;">
	<div style="width:1500px;height:78px;">
		<img src="./resources/images/title_objt_search.jpg">
	</div>
	
	
	<table style="background-color :#F6F8F7;" width="1500px" cellpadding="0" cellspacing="0" border="0">
		<tr>
			<td width="100%" align="right" valign="bottom">
				<input type="checkbox" name="activeTp1" id="activeTp1" onclick = "f_objtCkbox_check(this)" value="AT001" checked /><label for="activeTp1">활성</label>
				<input type="checkbox" name="activeTp2" id="activeTp2" onclick = "f_objtCkbox_check(this)" value="AT002" checked /><label for="activeTp2">보류</label>
				<input type="checkbox" name="activeTp3" id="activeTp3" onclick = "f_objtCkbox_check(this)" value="AT003" checked /><label for="activeTp3">계약완료</label>
				<input type="checkbox" name="activeTp4" id="activeTp4" onclick = "f_objtCkbox_check(this)" value="AT004" /><label for="activeTp4">내가등록한물건만보기</label>
			</td>
		</tr>
		<tr>
			<td height="10px"></td>
		</tr>
		<tr>
			<td>
				<table class="cl_list">
					<tr class="title">
						<td style="width:150px;">등록일자</td>
						<td style="width:750px">물건명</td>
						<td style="width:180px">물건종류</td>
						<td style="width:180px">물건유형</td>
						<td style="width:120px">등록자</td>
						<td style="width:80px">상태</td>
					</tr>
					<tbody id="objtTbody">
		
					</tbody>
				</table>
			</td>
		</tr>
	</table>
	
	<table style="background-color :#F6F8F7;" width="1500px" cellpadding="0" cellspacing="0" border="0">
		<tr><td height="20px">&nbsp;</td></tr>
		<tr><!-- paging -->
			<td align="center">
				<table width="1500px" height="41px" cellpadding="0" cellspacing="0" border="0">
					<tr>
						<td width="440px" height="41px">
							<div style="width:440px;height:41px;margin:0;padding:0;text-align:left">
								<a href="#" onClick="f_show_searchbox();"><img src="./resources/images/btn_search2.jpg"></a>&nbsp;
								<span id="searchbox" name="searchbox" style="display:none;">
									<select style="width:80px;height:40px;vertical-align:top">
										<option>물건명</option>
									</select>
									<input type="text" id="keyname" name="keyname" style="width:190px;height:40px;;vertical-align:top;padding-left:10px;" onkeydown="f_enter(this.value);" value="${keyword}">
									<a href="#" onClick="f_search_obName();"><img src="./resources/images/sBnt.png"></a>
								</span>
							</div>
						</td>
						<td width="620px" align="center">
							<div id="pagingDiv" class="pagination"></div>
						</td>
						<td width="440px" align="right">
							<div style="width:150px;height:41px;margin:0;padding:0;text-align:right">
								<a href="#add" onclick="f_add_objt();return false;"><img src="./resources/images/btn_new_ob.jpg"></a>
							</div>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>	
</div>

<input type="hidden" name="objtNo" id="objtNo" />
<input type="hidden" name="objtTp" id="objtTp" />
<input type="hidden" name="saleTp" id="saleTp" />
<input type="hidden" name="viewUrl" id="viewUrl" />
<input type="hidden" name="keyword" id="keyword" />

</form>



<script id="objtListTemplte" type="text/x-jquery-tmpl">	
{{each objtList}}					
	<tr class="list_data" onclick="f_objtDtl_view({{html $index}});return false;">
		<td>{{html $value.frstRegDt}}</td>
		<td>{{html $value.objtNm}}</td>
		<td>{{html $value.objtTpNm}}</td>
		<td>{{html $value.saleTpNm}}</td>
		<td>{{html $value.mbrNm}}</td>
		<td>{{html $value.activeTpNm}}</td>
	</tr>
							
{{/each}}
	
</script>
<script id="objtListEmptyTemplte" type="text/x-jquery-tmpl">	
	<tr>
		<td class="list_data" colspan="6">검색한 물건이 존재하지 않습니다.</td>
	</tr>
</script>

<%@ include file="/WEB-INF/views/comm/adminFooter.jsp" %> 