<%@ include file="/WEB-INF/views/comm/adminHeader.jsp" %> 
<%@ page contentType="text/html; charset=utf-8" %>
<%@ include file="/WEB-INF/views/notice/listStyle.jsp" %> 
<script type="text/javascript" src="./resources/js/notice/crudNotice.js"></script>
<%@ include file="/WEB-INF/views/notice/delPopup.jsp" %> 
<div class="new_page_title">
	<!-- <img src="./resources/images/title_logbook.jpg"> -->
	<h1>공지사항</h1>
</div>
<form id="noticeView">
<div class="new_page_container">
	<table>
		<tr><td>제목 : ${item.ntSbj}</td></tr>
		<tr><td>내용 : ${item.ntConts}</td></tr>
		<tr><td>${item.frstRegUser} / ${item.frstRegDt} / ${item.viewCnt}</td></tr>
	</table>
	<br>
	<a href="./noticeList.do"><img src="./resources/images/btn_list.jpg"></a>
	<a  href="./modifyNoticeInfo.do?noticeId=${item.noticeId}"><img src="./resources/images/btn_edit.jpg"></a>
	<a href="#" id="delBtn"><img src="./resources/images/btn_del2.jpg"></a>
</div>
<input type="hidden" value="${item.noticeId}" name="noticeId" id="noticeId">

</form>
<%@ include file="/WEB-INF/views/comm/footer.jsp" %> 