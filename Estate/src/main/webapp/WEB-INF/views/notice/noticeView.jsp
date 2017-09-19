<%@ include file="/WEB-INF/views/comm/adminHeader.jsp" %> 
<%@ page contentType="text/html; charset=utf-8" %>
<%@ include file="/WEB-INF/views/notice/listStyle.jsp" %> 
<script type="text/javascript" src="./resources/js/notice/crudNotice.js"></script>
<%@ include file="/WEB-INF/views/notice/delPopup.jsp" %> 
<script type="text/javascript">
$(document).ready(function() {
	
	if ( '${sessionScope.user.mbrTp}'  == "MT003" || '${sessionScope.user.mbrTp}' == "MT004") {
		$('#newBtn').append("<a href='./newNoticeView.do'><img src='./resources/images/btn_add.jpg'></a>");
	}
	
});
</script> 
<div class="new_page_title">
	<img src="./resources/images/title_notice.jpg">
</div>
<form id="noticeView">
<div class="new_page_container">
	<table class="new_notice_table">
		<tr><td width="155px" class="title">제목</td><td width="930px">${item.ntSbj}</td><td width="155px" class="title">날짜</td><td width="200px">${item.frstRegDt}</td></tr>
		<tr><td width="155px" class="title">글쓴이</td><td width="930px">${item.frstRegUser}</td><td width="155px" class="title">조회수</td><td width="200px">${item.viewCnt}</td></tr>
		<tr><td colspan="4" class="content" valign="top">${item.ntConts}</td></tr>
	</table>
</div>
	<br>
<div class="new_page_container" style="text-align: center;">
	<a href="./noticeList.do"><img src="./resources/images/btn_list.jpg"></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<a  href="./modifyNoticeInfo.do?noticeId=${item.noticeId}"><img src="./resources/images/btn_edit.jpg"></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<a href="#" id="delBtn"><img src="./resources/images/btn_del2.jpg"></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</div>
<input type="hidden" value="${item.noticeId}" name="noticeId" id="noticeId">

</form>
<%@ include file="/WEB-INF/views/comm/footer.jsp" %> 