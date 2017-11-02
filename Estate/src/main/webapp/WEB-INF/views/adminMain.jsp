<%@ include file="/WEB-INF/views/comm/adminHeader.jsp" %> 
<%@ page contentType="text/html; charset=utf-8" %>
<head>
	<meta charset="utf-8">
	<title>여의도 부동산</title>
	<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
	<script src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
	<script type="text/javascript" src="./resources/js/comm/jquery.tmpl.js"></script>
	<script type="text/javascript" src="./resources/js/comm/common.js"></script>		
	<script type="text/javascript" src="./resources/js/comm/latest.js"></script>					
	
</head>

<style>
	.latest_bbs {
		width:380px;
		height:276px;
		border:0;
		border-spacing:0;
		padding:0;
		border-collapse:collapse;
		valign:top;
	}
	.todoLatest td.latest_title,
	.latest_bbs td.latest_title {
		cursor:pointer;
		padding-right:15px;
		text-align:right;
	}
	
	.todoLatest {
		width:678px;
		height:276px;
		border:0;
		border-spacing:0;
		padding:0;
		border-collapse:collapse;
		valign:top;
	}
	
	.latest_bbs td.content,
	.todoLatest td.content {
		padding-top:15px;
		padding-left:0px;
		padding-right:10px;
		padding-bottom:15px;
	}
	
	.latest_bbs li,
	.todoLatest li {
		line-height:30px;
	}
</style>

<div style="width:1485px; margin:auto;">
<table width="1485px" cellpadding="0" cellspaing="0" border="0">
	<tr>
		<td width="1103px" valign="top">		
			<%@ include file="/WEB-INF/views/admin/cal.jsp" %> 
		</td>
		<td width="17px"></td>
		<td width="365px" valign="top">
			<%@ include file="/WEB-INF/views/admin/submenu.jsp" %> 
		</td>
	</tr>
</table>

<table width="100%" cellpadding="0" cellspaing="0" border="0">
	<tr><td height="10px" colspan="7"></td></tr>
	<tr>
		<td width="690px" height="275px" background="./resources/images/lst_todo_bg.jpg">
			<table class="todoLatest">
				<c:if test="${sessionScope.user.mbrTp == 'MT003' || sessionScope.user.mbrTp == 'MT004'}"> <!-- 관리자 : 등록한 지시사항 리스트 출력 -->
					<tr><td height="60px;" onClick="location.href='./selectALLRegDirList.do'" class="latest_title">more</td></tr>
				</c:if>
				<c:if test="${sessionScope.user.mbrTp == 'MT002'}"> <!-- 일반회원 : 지시받은 리스트 출력 -->
					<tr><td height="60px;" onClick="location.href='./selectALLDirList.do'" class="latest_title">more</td></tr>
				</c:if>
				<tr><td class="content" valign="top" id="direction_latest"></td></tr>
			</table>
		</td>
		<td width="5px"></td>
		<td width="388px" height="275px" background="./resources/images/lst_notice_bg.jpg">
			<table class="latest_bbs">
				<tr><td height="60px;" onClick="location.href='./noticeList.do'" class="latest_title">more</td></tr>
				<tr><td class="content" valign="top" id="notice_latest"></td></tr>
			</table>
		</td>
		<td width="5px"></td>
		<td width="388px" height="275px" background="./resources/images/lst_bbs_bg.jpg">
			<table class="latest_bbs">
				<tr><td height="60px;" onClick="location.href='./suggBoardList.do'" class="latest_title">more</td></tr>
				<tr><td class="content" valign="top" id="taskdoc_latest"></td></tr>
			</table>
	</tr>
</table>
</div>
<%@ include file="/WEB-INF/views/comm/adminFooter.jsp" %> 	
