<%@ include file="/WEB-INF/views/comm/adminHeader.jsp" %> 
<%@ page contentType="text/html; charset=utf-8" %>
<%@ include file="/WEB-INF/views/sugg/listStyle.jsp" %> 
<script type="text/javascript" src="./resources/js/sugg/selectSugg.js"></script>
<div class="new_page_title">
	<!-- <img src="./resources/images/title_logbook.jpg"> -->
	<h1>건의게시판</h1>
</div>

<div class="new_page_container">
	<table class="new_suggbd_table">
		<tr><td>${item.sugg}</td></tr>
		<tr><td>${item.frstRegUser} / ${item.frstRegDt}</td></tr>
	</table>
</div>

<%@ include file="/WEB-INF/views/comm/footer.jsp" %> 