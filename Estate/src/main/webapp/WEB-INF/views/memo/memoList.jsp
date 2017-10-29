<%@ include file="/WEB-INF/views/comm/adminHeader.jsp" %> 
<%@ include file="/WEB-INF/views/memo/memoStyle.jsp" %> 
<script type="text/javascript" src="./resources/js/comm/common.js"></script>
<%@ page contentType="text/html; charset=utf-8" %>
<%@ page session="true" %>
<% request.setCharacterEncoding("utf-8");%>
<script type="text/javascript" src="./resources/js/memo/listMemo.js"></script>

<div class="new_page_title">
	<img src="./resources/images/title_notice.jpg">
</div>


<div class="new_page_container">
	<table class="memo">
		<tr class="title">
			<td width="80%">제목</td>
			<td>등록일</td>
		</tr>
		<tbody id="memoTbody"></tbody>
	</table>
	<br>
</div>
<div class="new_page_container" style="text-align:center;">
	<div id="pagingDiv" class="pagination" style="margin:0 auto;"></div>
</div>

<div class="new_page_container" style="text-align:right;padding-right:45px;">
	<a href='./newMemo.do'><img src="./resources/images/btn_add.jpg"></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</div>
<script id="memoListEmptyTemplte" type="text/x-jquery-tmpl">	
	<tr>
		<td colspan="2">메모가 존재하지 않습니다.</td>
	</tr>
</script>
<!-- memo 리스트 -->



<script id="memoListTemplte" type="text/x-jquery-tmpl">	
{{each memoList}}					
	<tr>
		<td class="subject"><a href="./viewMemoItem.do?memoDocId={{html $value.memoDocId}}">{{html $value.memoSbj}}</a></td>
		<td class="date">{{html $value.frstRegDt}}</td>
	</tr>
							
{{/each}}
	
</script>

<%@ include file="/WEB-INF/views/comm/adminFooter.jsp" %> 