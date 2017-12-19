  <%@ include file="/WEB-INF/views/comm/adminHeader.jsp" %> 
  <%@ include file="/WEB-INF/views/list/listStyle.jsp" %> 
  <%@ page contentType="text/html; charset=utf-8" %>
<script type="text/javascript" src="./resources/js/list/newBuilding.js"></script>
<script type="text/javascript" src="./resources/js/list/newEstate.js"></script>
  
<script>
	$( document ).ready(function() {
		f_estate_list();
	});
</script>


<div id="cl_list" name="cl_list" style="width:1500px;margin:auto;padding:0;">
	<div style="width:1500px;height:78px;">
		<img src="./resources/images/title_category.jpg">
	</div>
	
	<table width="1460px" cellpadding="0" cellspacing="0" border="0">
		<tr>
			<td>
				<table class="cl_list">
					<tr class="title">
						<td width="20%" height="60">부동산명</td>
						<td width="32%">부동산 주소</td>
						<td width="11%">부동산 전화번호</td>
						<td width="7%">대표자명</td>
						<td width="11%">대표자 전화번호</td>
						<td width="8%">등록일</td>				
						<td width="10%"></td>
					</tr>
					<tbody id="caTbody">
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
						</td>
						<td width="486px" align="center">
							<div id="pagingDiv" class="pagination"></div>
						</td>
						<td width="486px" align="right">
							<div style="width:486px;height:41px;margin:0;padding:0;text-align:right">
								<a href='#' onclick='estatePopup();return false;'><img src="./resources/images/bnt_add_cl.jpg"></a>
							</div>
						</td>
					</tr>
				</table>	
			</td>
		</tr>
	</table>			
</div>
 
 <br><br>
  
<%@ include file="/WEB-INF/views/comm/adminFooter.jsp" %> 


<script id="caListEmptyTemplte" type="text/x-jquery-tmpl">	
<tr>
	<td class="list_data" colspan="7">카테고리가 존재하지 않습니다.</td>
</tr>
</script>

<script id="caListTemplte" type="text/x-jquery-tmpl">	
{{each caList}}		
	<tr class="list_data">
		<td>{{html $value.estateNm}}</td>
		<td>{{html $value.estateAddr}} {{html $value.estateAddrDtl}}</td>
		<td>{{html $value.tel1}} - {{html $value.tel2}} - {{html $value.tel3}}</td>		
		<td>{{html $value.rprsnNm}}</td>	
		<td>{{html $value.rprsnTel1}} - {{html $value.rprsnTel2}} - {{html $value.rprsnTel3}}</td>	
		<td>{{html $value.frstRegDt}}</td>	
		<td valign="middle">
			<a href="#" onclick="f_estate_modify({{html $index}}, {{html $value.estateCd}});return false;"><img src="./resources/images/icon_modify.png" width="40px" height="36px"></a>
			<a href="#" onclick="f_estate_del({{html $index}}, {{html $value.estateCd}});return false;"><img src="./resources/images/icon_del.png" width="40px" height="36px"></a>
		</td>
	</tr>
{{/each}}
</script>