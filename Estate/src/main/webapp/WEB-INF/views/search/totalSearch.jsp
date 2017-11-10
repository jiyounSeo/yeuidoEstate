<%@ include file="/WEB-INF/views/comm/adminHeader.jsp" %> 
<%@ include file="/WEB-INF/views/list/listStyle.jsp" %> 
<%@ page contentType="text/html; charset=utf-8" %>
<% request.setCharacterEncoding("utf-8");%>
<script type="text/javascript" src="./resources/js/search/totalSearch.js"></script>	

<style>
.search {
	width: 1460px;
	border-collapse:collapse;
	borde: 1px solid #444444;
}

.search td.title {
	height: 60px;
	background-color:#0063b1;
	border-right: 1px solid #fff;
	text-align: center;
	color: white;
}

.search td:first-child.title,
.search td:nth-child(4).title  {
	border-bottom:2px solid #fff;
}


.search input[type=text] {
    width: 100%;
    height: 54px;
    padding: 12px 20px;
    margin-left: 5px;
    box-sizing: border-box;
    border: 1px solid #d3d3d3;
    background-color: #fff;
}

.search_result_box{
	width:1470px;
	background-color:white;
	border:1px solid #b2b2b2;
	height:625px;
	overflow-x:hidden; 
	overflow-y:scroll;
}

.cl_list tr.list_data  {
	cursor:pointer;
}

.cl_list tr:hover.list_data  {
	background-color: #eeeeee;
}
</style>

<form id="totalSearch" name="totalSearch" action="post">
<div style="width:1500px;margin:auto;padding:0;">
	<img src="./resources/images/title_total_search.jpg">
	<table class="search">
		<tr>
			<td class="title">물건명</td>
			<td><input type="text" id="objtNm" name="objtNm" maxLength="50"></td>
			<td width="50px;">&nbsp;</td>
			<td class="title">연락처(고객)</td>
			<td>
				<input style="width:200px;" type="text" id="tel1" name="tel1" maxlength="3">
				- <input style="width:200px;" type="text" id="tel2" name="tel2" maxlength="4">
				- <input style="width:200px;" type="text" id="tel3" name="tel3" maxlength="4">
			</td>
		</tr>
		<tr>
			<td class="title">담당자</td>
			<td><input type="text" id="mbrNm" name="mbrNm" maxlength="50"></td>
			<td></td>
			<td class="title">주소(물건)</td>
			<td><input type="text" id="addr" name="addr" maxLength="50"></td>
		</tr>
		<tr><td colspan="5" height="10px"></td></tr>
		<tr><td colspan="5" align="right">
			<a href="#add" onclick="f_objectList_select();return false;"><img src="./resources/images/btn_search2.jpg"></a>
			</td></tr>
		<tr><td colspan="5" height="10px"></td></tr>
	</table>
</div>
<input type="hidden" name="objtNo" id="objtNo" value=""/>
<input type="hidden" name="objtTp" id="objtTp" value=""/>
<input type="hidden" name="saleTp" id="saleTp" value=""/>
<input type="hidden" name="viewUrl" id="viewUrl" value=""/>


<input type="hidden" name="pageNm" id="pageNm" value="total"/>
<div style="width:1500px;margin:auto;padding:0;">
	<table class="cl_list">
		<tbody>
		<tr class="title">
			<td style="width:10%">등록일자</td>
			<td style="width:10%">물건명</td>
			<td style="width:10%">물건종류</td>
			<td style="width:10%">물건유형</td>
			<td style="width:10%">고객명</td>
			<td style="width:10%">고객전화번호</td>
			<td style="width:30%">주소</td>
			<td style="width:10%">담당자</td>
		</tr>
		</tbody>
		<tbody id="objtTbody">
		</tbody>
		
	</table>
<table width="1460px" height="70px" cellpadding="0" cellspacing="0" border="0">
<tbody id="objtPage">
		<tr><!-- paging -->
			<td colspan="8" align="center">
				<div id="pagingDiv" class="pagination"></div>
			</td>
		</tr>
		</tbody>
</table>			
</div>
</form>
<%@ include file="/WEB-INF/views/comm/adminFooter.jsp" %> 
<script id="objtListEmptyTemplte" type="text/x-jquery-tmpl">	
	<tr>
		<td colspan="8">조회결과가 존재하지 않습니다.</td>
	</tr>
</script>
<script id="objtListTemplte" type="text/x-jquery-tmpl">	
{{each objtList}}		
	<tr onclick="f_objtDtl_view('{{html $index}}');return false;" class="list_data">
		<td>{{html $value.frstRegDt}}</td>
		<td>{{html $value.objtNm}}</td>
		<td>{{html $value.objtTpNm}}</td>
		<td>{{html $value.saleTpNm}}</td>
		<td>{{html $value.custNm}}</td>
		<td>{{html $value.custTel}}</td>
		<td>{{html $value.addr}}</td>
		<td>{{html $value.frstRegNm}}</td>
	</tr>
{{/each}}	
</script>

<!-- 
<td style="width:10%">등록일자</td>
			<td style="width:10%">물건명</td>
			<td style="width:10%">물건종류</td>
			<td style="width:10%">물건유형</td>
			<td style="width:10%">고객명</td>
			<td style="width:10%">고객전화번호</td>
			<td style="width:30%">주소</td>
			<td style="width:10%">담당자</td>
 -->
