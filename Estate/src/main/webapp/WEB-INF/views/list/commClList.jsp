<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page contentType="text/html; charset=utf-8" %>
<% request.setCharacterEncoding("utf-8");%>
<%@ include file="/WEB-INF/views/comm/adminHeader.jsp" %> 
<%@ include file="/WEB-INF/views/list/listStyle.jsp" %> 
<link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script type="text/javascript" src="./resources/js/comm/jquery.tmpl.js"></script>
<script type="text/javascript" src="./resources/js/list/custList.js?v20180204"></script>	
<form id="commClList">
<div id="cl_list" name="cl_list" style="width:1500px;margin:auto;padding:0;">
	<div style="width:1500px;height:78px;">
		<!-- 공동 -->
		<c:if test="${pageNm eq 'custPublic' }"> 
			<img src="./resources/images/title_comm_cl_list.jpg">
		</c:if>
		<!-- 활성 -->
		<c:if test="${pageNm eq 'custActiveY' }">
			<img src="./resources/images/title_cl_active.jpg">
		</c:if>
		<!-- 보류 -->
		<c:if test="${pageNm eq 'custActiveN' }">
			<img src="./resources/images/title_cl_reserve.jpg">
		</c:if>
	</div>
	
	<table width="1500px" cellpadding="0" cellspacing="0" border="0">
		<tr>
			<td width="20px"></td>
			<td width="1460px" valign="top"></td>
			<td width="20px"></td>
		</tr>
	</table>
	
	<table width="1460px" cellpadding="0" cellspacing="0" border="0">
		<tr>
			<td width="100%" align="right" valign="bottom">
				<input type="checkbox" name="activeTp1" id="activeTp1" onclick = "f_custList_select()" value="AT001" /><label for="activeTp1">활성</label>
				<input type="checkbox" name="activeTp2" id="activeTp2" onclick = "f_custList_select()" value="AT002" /><label for="activeTp2">보류</label>
				<input type="checkbox" name="activeTp3" id="activeTp3" onclick = "f_custList_select()" value="AT003" /><label for="activeTp3">내가등록한물건만보기</label>
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
						<td style="width:180px">고객명</td>
						<td style="width:180px">연락처</td>
						<td style="width:750px">의뢰내역</td>
						<td style="width:120px">등록자</td>
						<td style="width:80px">상태</td>
					</tr>
					<tbody id="custTbody">
		
					</tbody>
				</table>
			</td>
		</tr>
	</table>
								
	<table>
	<tr><td height="20px">&nbsp;</td></tr>
		<tr><!-- paging -->
			<td align="center">
				<table width="1460px" height="41px" cellpadding="0" cellspacing="0" border="0">
					<tr>
						<td width="150px" height="41px">
							<div style="width:150px;height:41px;margin:0;padding:0;text-align:left">
								<a href="./totalSearch.do"><img src="./resources/images/btn_search2.jpg"></a>
							</div>
						</td>
						<td width="1160px" align="center">
							<div id="pagingDiv" class="pagination"></div>
						</td>
						<td width="150px" align="right">
							<div style="width:150px;height:41px;margin:0;padding:0;text-align:right">
								<a href="./newClient.do"><img src="./resources/images/btn_new_cl.jpg"></a>
							</div>
						</td>
					</tr>
				</table>	
			</td>
		</tr>
	</table>			
</div>

<input type="hidden" name="publicYn" id="publicYn" value="${publicYn}"/>
<input type="hidden" name="activeTp" id="activeTp" value="${activeTp}"/>
<input type="hidden" name="pageNm" id="pageNm" value="${pageNm}"/>
<input type="hidden" name="custId" id="custId" />

</form>

<script id="custListTemplte" type="text/x-jquery-tmpl">	
{{each custList}}					
	<tr class="list_data" onclick="f_mbrDtl_view({{html $index}});return false;">
		<td>{{html $value.frstRegDt}}</td>
		<td>{{html $value.custNm}}</td>
		<td>{{html $value.custTel1}}-{{html $value.custTel2}}-{{html $value.custTel3}}</td>
		<td>{{html $value.reqContent}}</td>
		<td>{{html $value.mbrNm}}</td>
		<td>{{html $value.activeTpNm}}</td>
	</tr>
							
{{/each}}
	
</script>
<script id="custListEmptyTemplte" type="text/x-jquery-tmpl">	
	<tr>
		<td class="list_data" colspan="6">고객이 존재하지 않습니다.</td>
	</tr>
</script>

<%@ include file="/WEB-INF/views/comm/adminFooter.jsp" %> 
