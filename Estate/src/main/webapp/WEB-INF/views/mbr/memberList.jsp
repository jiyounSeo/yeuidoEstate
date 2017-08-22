  <%@ include file="/WEB-INF/views/comm/mbrHeader.jsp" %> 
  <%@ page contentType="text/html; charset=utf-8" %>
  <script type="text/javascript" src="./resources/js/mbr/memberList.js"></script>
    <form id="memberList" method="post" > 
    
    <div style="width:1205px; text-align:left; margin:auto; padding:0">		
		<table style="width: 1205px;" cellpadding="0" cellspacing="0" border="0">
			<tr><td height="40"><img src="./resources/images/mbr_title.jpg"></td></tr>
		</table>
	</div>
	
	<div style="width:1200px; text-align:left; margin:auto; box-shadow:0 0 5px #c3c3c3;">	
		<table style="width: 1200px;" cellpadding="0" cellspacing="0">
			<tr>
				<td width="94px"><img src="./resources/images/mbr_title_1.jpg"></td>
				<td width="148px"><img src="./resources/images/mbr_title_2.jpg"></td>
				<td width="166px"><img src="./resources/images/mbr_title_3.jpg"></td>
				<td width="211px"><img src="./resources/images/mbr_title_4.jpg"></td>
				<td width="210px"><img src="./resources/images/mbr_title_5.jpg"></td>
				<td width="168px"><img src="./resources/images/mbr_title_6.jpg"></td>				
				<td width="203px"><img src="./resources/images/mbr_title_7.jpg"></td>
			</tr>
			<tbody id="mbrTbody">
			</tbody>
		</table>
	</div>
	<div style="width:1200px; text-align:right; margin:auto;">
		<br>
		<a href="/estate/adminMainView.do"><img src="./resources/images/btn_mbr_main.jpg" border="0"></a>
	</div> 
   
    <button id="save" type="button" onclick="f_member_insert();return false;">가입하기</button>

    </form>

<%@ include file="/WEB-INF/views/comm/footer.jsp" %> 

  <script id="mbrListTemplte" type="text/x-jquery-tmpl">	
{{each mbrList}}		
	<tr>
		<td class="mbr_mem"></td>
		<td class="mbr_mem">{{html $value.mbr_id}}</td>
		<td class="mbr_mem">{{html $value.mbr_nm}}</td>
		<td class="mbr_mem">
			{{html $value.phone1}}
			-{{html $value.phone2}}
			-{{html $value.phone3}}
		</td>
		<td class="mbr_mem">{{html $value.agency}}</td>
		<td class="mbr_mem">{{html $value.reg_date}}</td>
		<td class="mbr_mem">
			<button type="button" class="mbr"><img src="./resources/images/icon_approve.jpg" width="50px" height="46px"></button>
			<button type="button" class="mbr"><img src="./resources/images/icon_del.jpg" width="50px" height="46px"></button>
		</td>
	</tr>
{{/each}}
</script>

