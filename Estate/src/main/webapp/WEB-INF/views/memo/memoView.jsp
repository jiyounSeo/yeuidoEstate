<%@ include file="/WEB-INF/views/comm/adminHeader.jsp" %> 
<%@ include file="/WEB-INF/views/memo/memoStyle.jsp" %> 
<script type="text/javascript" src="./resources/js/comm/common.js"></script>
<%@ page contentType="text/html; charset=utf-8" %>
<%@ page session="true" %>
<% request.setCharacterEncoding("utf-8");%>
<script type="text/javascript" src="./resources/js/memo/listMemo.js"></script>

<div class="new_page_title">
	<img src="./resources/images/title_memo.jpg">
</div>

<div class="new_page_container">
	<table class="new_memo_table">
		<tr>
			<td class="title" width="140px">제목</td>
			<td width="800px">${item.memoSbj}</td>
			<td class="title" width="140px">작성일</td>
			<td>${item.frstRegDt}</td>
		</tr>
		<tr>
			<td class="content" colspan="5" valign="top">${item.memoCont}</td>
		</tr>
	</table>
</div>
<br>
<div class="new_page_container" style="text-align: center;">
	<a href="#" onClick="f_del_memo()"><img src="./resources/images/btn_del2.jpg"></a>&nbsp;&nbsp;&nbsp;
	<a  href="./modifyMemoInfo.do?memoDocId=${item.memoDocId}"><img src="./resources/images/btn_edit.jpg"></a>&nbsp;&nbsp;&nbsp;
	<a href="./memoList.do"><img src="./resources/images/btn_list.jpg"></a>&nbsp;&nbsp;&nbsp;
</div>
<input type="hidden" value="${item.memoDocId}" name="memoDocId" id="memoDocId">
<%@ include file="/WEB-INF/views/comm/adminFooter.jsp" %> 