<%@ include file="/WEB-INF/views/comm/adminHeader.jsp" %> 
<%@ page contentType="text/html; charset=utf-8" %>
<%@ include file="/WEB-INF/views/sugg/listStyle.jsp" %> 
<script type="text/javascript" src="./resources/js/sugg/selectSugg.js"></script>

<div class="new_page_title">
	<img src="./resources/images/title_sugg.jpg">
</div>

<div class="new_page_container">
	<table class="suggbd">
		<tr class="title">
			<td>subject</td>
			<td>date</td>
			<td>regUser</td>
		</tr>
		<tbody id="suggTbody">

		</tbody>
		<tr>
	</table>
	<br>
</div>
<div class="new_page_container" style="text-align:center;">
	<div id="pagingDiv" class="pagination" style="margin:0 auto;"></div>
</div>
<script id="suggListTemplte" type="text/x-jquery-tmpl">	
{{each sbList}}					
	<tr>
		<td><a href="./viewSuggItem.do?taskDocId={{html $value.taskDocId}}">{{html $value.mbrNm}} 님이 작성한 건의사항입니다</a></td>
		<td>{{html $value.frstRegDt}}</td>
		<td>{{html $value.mbrNm}}</td>
	</tr>
							
{{/each}}
	
</script>
<script id="suggListEmptyTemplte" type="text/x-jquery-tmpl">	
	<tr>
		<td colspan="6">게시글이 존재하지 않습니다.</td>
	</tr>
</script>
<%@ include file="/WEB-INF/views/comm/adminFooter.jsp" %> 