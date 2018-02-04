  <%@ include file="/WEB-INF/views/comm/adminHeader.jsp" %> 
  <%@ include file="/WEB-INF/views/list/listStyle.jsp" %> 
  <%@ page contentType="text/html; charset=utf-8" %>
<script type="text/javascript" src="./resources/js/list/newBuilding.js?v20180205"></script>
  
<script>
	$( document ).ready(function() {
		f_category_list();
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
						<td width="6%" height="60">유형</td>
						<td width="10%">카테고리명</td>
						<td width="25%">도로명주소</td>
						<td width="36%">지번주소</td>
						<td width="5%">우편번호</td>
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
						<td width="150px" height="41px">
						</td>
						<td width="1160px" align="center">
							<div id="pagingDiv" class="pagination"></div>
						</td>
						<td width="150px" align="right">
							<div style="width:150px;height:41px;margin:0;padding:0;text-align:right">
								<a href='#' onclick='buildingPopup();return false;'><img src="./resources/images/bnt_add_cl.jpg"></a>
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
		<td>{{html $value.objtTpNm}}</td>
		<td>{{html $value.buildNm}}</td>
		<td>{{html $value.roadAddrPart1}}</td>		
		<td>{{html $value.jibunAddr}}</td>	
		<td>{{html $value.zipNo}}</td>	
		<td>{{html $value.frstRegDt}}</td>	
		<td valign="middle">
			<a href="#" onclick="f_category_modify({{html $index}}, {{html $value.buildCd}});return false;"><img src="./resources/images/icon_modify.png" width="40px" height="36px"></a>
			<a href="#" onclick="f_category_del({{html $index}}, {{html $value.buildCd}});return false;"><img src="./resources/images/icon_del.png" width="40px" height="36px"></a>
		</td>
	</tr>
{{/each}}
</script>