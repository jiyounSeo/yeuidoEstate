<%@ include file="/WEB-INF/views/comm/adminHeader.jsp" %> 
<%@ page contentType="text/html; charset=utf-8" %>
<%@ include file="/WEB-INF/views/notice/listStyle.jsp" %> 
<script type="text/javascript" src="./resources/js/notice/crudNotice.js"></script>

<div class="new_page_title">
	<img src="./resources/images/title_notice.jpg">
</div>

<div class="new_page_container">
	<table class="notice">
		<tr class="title">
			<td width="5%">번호</td>
			<td width="70%">제목</td>
			<td width="10%">글쓴이</td>
			<td width="10%">날짜</td>
			<td width="5%">조회</td>
		</tr>
		<tbody id="noticeTbody">

		</tbody>
	</table>
	<br>
</div>
<div class="new_page_container" style="text-align:center;">
	<div id="pagingDiv" class="pagination" style="margin:0 auto;"></div>
</div>

<script type="text/javascript">console.log("${sessionScope.user.mbrTp}");</script> 
<c:if test="${sessionScope.user.mbrTp == 'MT003' || sessionScope.user.mbrTp == 'MT004'}">
	<div class="new_page_container" style="text-align:right;padding-right:100px;" id="newBtn" name="newBtn"><a href='./newNoticeView.do'><img src='./resources/images/btn_add.jpg'></a></div>
	<script type="text/javascript">console.log("if--sucess");</script> 
</c:if>

<script id="noticeListTemplte" type="text/x-jquery-tmpl">	
{{each ntList}}					
	<tr onClick="location.href='./viewNoticeItem.do?noticeId={{html $value.noticeId}}'" style="cursor:pointer;">
		<td>{{html $value.noticeId}}</td>
		<td style="text-align:left;padding-left:10px;">{{html $value.ntSbj}}</td>
		<td>{{html $value.mbrNm}}</td>
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
<%@ include file="/WEB-INF/views/comm/adminFooter.jsp" %> 