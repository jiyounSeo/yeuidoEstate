<%@ include file="/WEB-INF/views/comm/header.jsp" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page contentType="text/html; charset=utf-8" %>
<%@ page session="true" %>
<% request.setCharacterEncoding("utf-8");%>
<link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script type="text/javascript" src="./resources/js/comm/jquery.tmpl.js"></script>
<script type="text/javascript" src="./resources/js/comm/common.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	/* $("#loginDiv").hide();
	$("#logoutDiv").hide(); */
	$("#loginDiv").hide();
	$("#logoutDiv").hide();
	//$("#loginDiv").css('visibility','visible');
	userSession = '${sessionScope.user}';
	
	if( '${sessionScope.user.mbrId}' != null && '${sessionScope.user.mbrId}' != ''){
		$("#logoutDiv").show();
	 	$('#userNm').text('${sessionScope.user.mbrNm}'+'님|');	
		//$('#userNm').css('display','inline');
		//$('#modifyMbrInfo').css('display','inline');
		$('#login').text('로그아웃|');
		if ( '${sessionScope.user.mbrTp}'  == "MT003" || '${sessionScope.user.mbrTp}' == "MT004") {
			$('#memberMng').css('display','inline');
		} else {
			$('#memberMng').css('display','none');
		}
		
	} else {
		$("#loginDiv").show();
	} 
});
</script>

<body style="margin:0; background-color: #f6f8f7;overflow-x:hidden;">
<table width="100%" height="121px" cellpadding="0" cellspacing="0" border="0">
	<tr>
		<td align="center" background="./resources/images/bg.jpg"  style="background-repeat:repeat-x;margin: 0; padding: 0; height: 121px;">
			<a href="./"><img src="./resources/images/logo.jpg" style="height: 121px; border: 0" /></a>
		</td>
	</tr>
	<tr><td height="14px">&nbsp;</td></tr>
	<tr>
		<td height="36px" align="center">
			<div id="loginDiv" style="width: 1486px; height: 36px; text-align: left;">
				<a id="login" href="./loginView.go">로그인</a> 
				<a id="login" href="./regView.go"> | 회원가입</a> 
			</div>
			<div id="logoutDiv" style="width: 1486px; height: 36px; text-align: left;">
				<span id="userNm" style="display:none;"></span> 
				<a id="modifyMbrInfo" href="./loginView.go">회원정보수정</a>
				<a id="login" href="./logout.go"> | 로그아웃</a> 
				<a id="memberMng" href="./memberListView.do"> | 회원관리</a>
			</div>
			
		</td>
	</tr>
</table>
