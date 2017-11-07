  <%@ include file="/WEB-INF/views/comm/mbrHeader.jsp" %> 
  <%@ include file="/WEB-INF/views/list/listStyle.jsp" %> 
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
		<a href="/adminMainView.do"><img src="./resources/images/btn_mbr_main.jpg" border="0"></a>
	</div> 
	<div style="width:1200px; aling:center; margin:auto;" id="pagingDiv" class="pagination centerDiv"></div>
	<div style="width:1200px; text-align:center; margin:auto;">
		<table style="width: 1200px;" cellpadding="0" cellspacing="0">
			<tr>
				<td>
					
				</td>
			</tr>
		</table>
	</div>
	
   
   <!-- Z <button id="save" type="button" onclick="f_member_insert();return false;">가입하기</button> -->

    </form>

<%@ include file="/WEB-INF/views/comm/footer.jsp" %> 

<script id="mbrListEmptyTemplte" type="text/x-jquery-tmpl">	
<tr>
	<td class="mbr_mem" colspan="7">승인처리할 회원이 존재하지 않습니다.</td>
</tr>
</script>

<script id="mbrListTemplte" type="text/x-jquery-tmpl">	
{{each mbrList}}		
	<tr>
		<td class="mbr_mem">{{html $index+1}}</td>
		<td class="mbr_mem">{{html $value.mbrNm}}</td>
		<td class="mbr_mem">{{html $value.loginId}}</td>
		<td class="mbr_mem">
			{{html $value.tel1}}
			-{{html $value.tel2}}
			-{{html $value.tel3}}
		</td>
		<td class="mbr_mem">{{html $value.estateNm}}</td>
		<td class="mbr_mem">{{html $value.frstRegDt}}</td>
		<td class="mbr_mem">
			{{if $value.mbrTpCd == "MT001"}}
			<a href="#" onclick="f_memeber_accept({{html $index}});return false;"><img src="./resources/images/icon_approve.jpg" width="50px" height="46px"></a>
			{{/if}}			
			<a href="#" onclick="f_memeber_reject({{html $index}});return false;"><img src="./resources/images/icon_del.jpg" width="50px" height="46px"></a>
			</button>
		</td>
	</tr>
{{/each}}
</script>

