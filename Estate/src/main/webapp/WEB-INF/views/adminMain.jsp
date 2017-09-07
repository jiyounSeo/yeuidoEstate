<%@ include file="/WEB-INF/views/comm/adminHeader.jsp" %> 
<%@ page contentType="text/html; charset=utf-8" %>
<head>
	<meta charset="utf-8">
	<title>여의도 부동산</title>
	<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
	<script src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
	<script type="text/javascript" src="./resources/js/comm/jquery.tmpl.js"></script>
	<script type="text/javascript" src="./resources/js/comm/common.js"></script>				
	
</head>

<div style="width:1485px; margin:auto">
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

<%@ include file="/WEB-INF/views/memo/memoList.jsp" %> 	
<table width="100%" cellpadding="0" cellspaing="0" border="0">
	<tr><td height="15px" colspan="7"></td></tr>
	<tr>
		<td width="136px">
			<a href="#"  onClick="f_addMeno()"><img src="./resources/images/btn_new_memo.jpg"><br><div style="height: 16px;"></a></div>
			<a href="#" id="listMemoBtn"><img src="./resources/images/btn_list_memo.jpg"></a>
		</td>
		<td width="10px"></td>
		<td width="572px" height="276px" background="./resources/images/lst_todo_bg.jpg">-- 메모는 div 로 띄우다보니 *.do 인데도 세션이 안먹는듯함... 확인필요..<br>-- CRUD 기능은 memo, 업무일지, 공지사항, 건의게시판 완료<br>-- 게시판속성들은 내용입력하고나면 엔터가 표시가안됨</td>
		<td width="10px"></td>
		<td width="372px" height="276px" background="./resources/images/lst_notice_bg.jpg"><a href="./noticeList.do"><br><br>최근게시물처리 필요<br>(테이블생성쿼리는 구글드라이버참고)</a></td>
		<td width="10px"></td>
		<td width="372px" height="276px" background="./resources/images/lst_bbs_bg.jpg"><a href="./suggBoardList.do"><br><br>최근게시물처리 필요</a></td>
	</tr>
</table>
</div>
<%@ include file="/WEB-INF/views/comm/footer.jsp" %> 	
