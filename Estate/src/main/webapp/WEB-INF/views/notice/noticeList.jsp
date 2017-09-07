<%@ include file="/WEB-INF/views/comm/adminHeader.jsp" %> 
<%@ page contentType="text/html; charset=utf-8" %>
<%@ include file="/WEB-INF/views/notice/listStyle.jsp" %> 
<script type="text/javascript" src="./resources/js/notice/crudNotice.js"></script>

<div class="new_page_title">
	<!-- <img src="./resources/images/title_logbook.jpg"> -->
	<h1>공지사항</h1>
</div>

<div class="new_page_container">
	<table class="notice">
		<tr class="title">
			<td>번호</td>
			<td>제목</td>
			<td>글쓴이</td>
			<td>날짜</td>
			<td>조회</td>
		</tr>
		<tbody id="noticeTbody">

		</tbody>
		<tr>
	</table>
	<br>
</div>
<div class="new_page_container" style="text-align:center;">
	<div id="pagingDiv" class="pagination" style="margin:0 auto;"></div>
</div>


<div class="new_page_container" style="text-align:right;padding-right:100px;">	
	<a href="./newNoticeView.do"><img src="./resources/images/btn_add.jpg"></a>
</div>
<script id="noticeListTemplte" type="text/x-jquery-tmpl">	
{{each ntList}}					
	<tr>
		<td>{{html $value.noticeId}}</td>
		<td><a href="./viewNoticeItem.do?noticeId={{html $value.noticeId}}">{{html $value.ntSbj}}</a></td>
		<td>{{html $value.frstRegUser}}</td>
		<td>{{html $value.frstRegDt}}</td>
		<td>{{html $value.viewCnt}}</td>
	</tr>							
{{/each}}
	
</script>
<script id="noticeListEmptyTemplte" type="text/x-jquery-tmpl">	
	<tr>
		<td colspan="5">게시글이 존재하지 않습니다.</td>
	</tr>
</script>
<%@ include file="/WEB-INF/views/comm/footer.jsp" %> 