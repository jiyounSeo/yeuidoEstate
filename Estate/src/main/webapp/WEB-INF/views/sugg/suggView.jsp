<%@ include file="/WEB-INF/views/comm/adminHeader.jsp" %> 
<%@ page contentType="text/html; charset=utf-8" %>
<%@ include file="/WEB-INF/views/sugg/listStyle.jsp" %> 
<script type="text/javascript" src="./resources/js/sugg/selectSugg.js"></script>
<div class="new_page_title">	
	<img src="./resources/images/title_sugg.jpg">
</div>
<div class="new_page_container">
	<table class="new_suggbd_table">
		<tr><td width="155px" class="title">제목</td><td width="930px" colspan="3">${item.frstRegUser} 님이 작성한 건의사항입니다</td></tr>
		<tr><td width="155px" class="title">글쓴이</td><td width="930px">${item.frstRegUser}</td><td width="155px" class="title">날짜</td><td width="200px">${item.frstRegDt}</td></tr>
		<tr><td colspan="4" class="content" valign="top">${item.sugg}</td></tr>
	</table>
</div>
	<br>
<div class="new_page_container" style="text-align: center;" id="btnDiv">
	<a href="./suggBoardList.do"><img src="./resources/images/btn_list.jpg"></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<c:if test="${item.frstRegUser == sessionScope.user.mbrId}">
		<a  href="modifyLogbookInfo.do?taskDocId=${item.taskDocId}"><img src="./resources/images/btn_edit.jpg"></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	</c:if>
</div>

<%@ include file="/WEB-INF/views/comm/footer.jsp" %> 