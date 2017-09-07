<%@ include file="/WEB-INF/views/comm/adminHeader.jsp" %> 
<%@ page contentType="text/html; charset=utf-8" %>
<%@ include file="/WEB-INF/views/notice/listStyle.jsp" %> 
<script type="text/javascript" src="./resources/js/notice/crudNotice.js"></script>

<form id="newNotice">
<div class="new_page_title">
	<!-- <img src="./resources/images/title_logbook.jpg"> -->
	<h1>공지사항</h1>
</div>

<div class="new_page_container">
	<table class="new_page_table">
		<tr>
			<td class="title">제목</td>
			<td><input type="text" name="ntSbj" id="ntSbj"></td>
		</tr>

		<tr>
			<td class="title">내용</td>
			<td><textarea rows="20" cols="150" name="ntConts" id="ntConts"></textarea></td>
		</tr>
	</table>
	<div style="height:50px;"></div>
	<div style="width:1400px;margin:auto;text-align:center;">	
		<c:choose>
			<c:when test="${noticeId == null}">
				<a href="#"><img src="./resources/images/btn_add.jpg" onclick="f_notice_save();return false;"></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="./noticeList.do"><img src="./resources/images/btn_cancel.jpg"></a>
			</c:when>
			<c:otherwise>
				<a href="#"><img src="./resources/images/btn_save.jpg" onclick="f_notice_save();return false;"></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="#" id="delBtn"><img src="./resources/images/btn_del2.jpg"></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="./viewNoticeItem.do?noticeId=${noticeId}"><img src="./resources/images/btn_cancel.jpg"></a>			
			</c:otherwise>
		</c:choose>		
	</div>
</div>
<input type="hidden" name="noticeId" id="noticeId" value="${noticeId}" />
</form>
<%@ include file="/WEB-INF/views/comm/footer.jsp" %> 