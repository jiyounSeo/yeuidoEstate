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
<script type="text/javascript" src="./resources/js/list/custList.js"></script>	

<form id="commClList">
<div id="cl_list" name="cl_list" style="width:1500px;margin:auto;padding:0;">
	<div style="width:1500px;height:78px;">
		<img src="./resources/images/title_comm_cl_list.jpg">
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
				 <input type="checkbox" name="activeTp1" id="activeTp1" value="AT001" /><label for="activeTp1">활성</label>
				 <input type="checkbox" name="activeTp2" id="activeTp2" value="AT002" /><label for="activeTp2">보류</label>
			  	 <input type="checkbox" name="activeTp3" id="activeTp3" value="AT003" /><label for="activeTp3">내가등록한물건만보기</label>
			  							 
			</td>
		</tr>
		<tr>
			<td height="10px"></td>
		</tr>
		<tr>
			<td>
				<table class="cl_list">
					<tr class="title">
						<td style="width:15%">등록일자</td>
						<td style="width:10%">고객명</td>
						<td style="width:15%">연락처</td>
						<td style="width:40%">의뢰내역</td>
						<td style="width:10%">등록자</td>
						<td style="width:10%">상태</td>
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
								<a href="./newClient.do"><img src="./resources/images/btn_new_cl.jpg"></a>
							</div>
						</td>
					</tr>
				</table>	
			</td>
		</tr>
	</table>			
</div>
</form>

<script id="custListTemplte" type="text/x-jquery-tmpl">	
{{each custList}}					
	<tr>
		<td><a href="./viewClient.do?custNo={{html $value.custNo}}">{{html $value.firstRegDt}}</a></td>
		<td>{{html $value.custNm}}</td>
		<td>{{html $value.custTel1}}-{{html $value.custTel2}}-{{html $value.custTel3}}</td>
		<td>{{html $value.requestMemo}}</td>
		<td>{{html $value.firstRegNm}}</td>
		<td>{{html $value.activeTpNm}}</td>
	</tr>
							
{{/each}}
	
</script>
<script id="custListEmptyTemplte" type="text/x-jquery-tmpl">	
	<tr>
		<td colspan="6">고객이 존재하지 않습니다.</td>
	</tr>
</script>

<%@ include file="/WEB-INF/views/comm/footer.jsp" %> 
