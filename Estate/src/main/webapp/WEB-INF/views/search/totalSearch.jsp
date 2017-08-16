<%@ include file="/WEB-INF/views/comm/adminHeader.jsp" %> 
<%@ page contentType="text/html; charset=utf-8" %>

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
</style>


<div style="width:1500px;margin:auto;padding:0;">

	<img src="./resources/images/title_total_search.jpg">
	
	<table class="search">
		<tr>
			<td class="title">담당자</td>
			<td><input type="text"></td>
			<td width="50px;">&nbsp;</td>
			<td class="title">연락처(고객)</td>
			<td><input type="text"></td>
		</tr>
		<tr>
			<td class="title">주소(물건)</td>
			<td><input type="text"></td>
			<td></td>
			<td class="title">물건명</td>
			<td><input type="text"></td>
		</tr>
		<tr><td colspan="5" height="10px"></td></tr>
		<tr><td colspan="5" align="right"><img src="./resources/images/btn_search2.jpg"></td></tr>
		<tr><td colspan="5" height="10px"></td></tr>
	</table>
	
	<div class="search_result_box">
	</div>

</div>
<%@ include file="/WEB-INF/views/comm/footer.jsp" %> 