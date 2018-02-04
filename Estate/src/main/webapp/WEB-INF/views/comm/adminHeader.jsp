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
<script type="text/javascript" src="./resources/js/report/rollingNotice.js?v20180204"></script>
<script type="text/javascript" src="./resources/js/comm/jquery.vticker-min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	
	var login_contents = "<a id='login' href='./loginView.go'>로그인</a><a id='login' href='./regView.go'> | 회원가입</a>";

	$("#memberInfo").empty();
	
	userSession = '${sessionScope.user}';
	
	if( '${sessionScope.user.mbrId}' != null && '${sessionScope.user.mbrId}' != ''){
		
		login_contents = "<b>${sessionScope.user.mbrNm}</b>"+ "님 | " + " <a id='modifyMbrInfo' href='./modifyMemberView.do'>회원정보</a> | <a id='login' href='./logout.go'>로그아웃</a>";
		
		if ( '${sessionScope.user.mbrTp}'  == "MT003" || '${sessionScope.user.mbrTp}' == "MT004") {
			login_contents += " | <a id='memberMng' href='./memberListView.do'>회원관리</a> | ";
			login_contents += "<a href='./categoryList.do'>카테고리</a> | ";
			login_contents += "<a href='./estateCategoryList.do'>부동산</a>";
		}
		
	} else {
		//$("#loginDiv").show();
	} 
	
	$("#memberInfo").append(login_contents);
	
	$('#menubarBtn').click(function(e) {
		e.preventDefault();
		var current_url = window.location.href;
		var pageArr = current_url.split('/');
		var current_page = pageArr[pageArr.length-1];
		
		// adminMain 화면에서는 버튼 동작하지 않도록 처리
		if(current_page != "" && current_page != "adminMainView.do" && current_page != "adminMainView.do?" && current_page != "logout.go"){
			if ($(this).attr("mode") == "hide") {
				$("#menubarBtn_img").attr("src", "./resources/images/btn_menu_hide.png");
				$('#menu_bar').slideDown(350);
				$(this).attr("mode", "show");

			} else {
				$("#menubarBtn_img").attr("src", "./resources/images/btn_menu_show.png");
				$('#menu_bar').slideUp(350);
				$(this).attr("mode", "hide");
			}			
		}

	});

	f_getListForNewReportNotice();


});

</script>
<style>
	#rollingText .viewArea{height:22px;width:510px;position:relative;overflow:hidden;}
	#rollingText ul{position:absolute; top:0px;}
	#rollingText li{margin:5px 0;}
</style>

<body style="margin:0; background-color: #f6f8f7;overflow-x:hidden;">
<form id="adminHeaderForm" style="padding:0; margin:0;">
<table style="border-spacing:0px; padding:0; border:0; border-collapse:collapse; background-color:#eaebeb; width:100%">
	<tr><td style="height: 12px; background-color:#393939;"></td></tr>
	<tr><td height="15px"></td></tr>
	<tr>
		<td align="center">
			<div id="memberDiv" style="width:1480px;text-align: left; margin:0; padding-left:5px; padding-top:0; padding-right:0; padding-bottom:5px;position:relative;">
				<table style="border-spacing:0px; padding:0; border:0; border-collapse:collapse; width:100%">
					<tr>
						<td width="472px" id="memberInfo" height="40px;"></td>
						<td width="514px">
							<div id="rollingText" style="height:22px;"><div class="viewArea"><ul class="notice-list" id="newReportNt" name="newReportNt"></ul></div></div>
						</td>
						<td width="58px" align="right" height="40px;">
							<a href="./adminMainView.do"><img src="./resources/images/btn_home.png"></a>
						</td>
						<td width="58px" align="right" height="40px;">
							<a href="./"><img src="./resources/images/btn_main.png"></a>
						</td>
						<td width="13px"></td>
						<td width="364px"><a href="#" id="menubarBtn" mode="hide"><img src="./resources/images/btn_menu_show.png" id="menubarBtn_img"></a></td>
					</tr>
				</table>
				<div id="menu_bar" style="width:364px;display:none;position:absolute;left:1118px;top:46px;background-color:#f6f8f7;z-index:999;">
					<%@ include file="/WEB-INF/views/admin/submenu.jsp" %> 
				</div>
			</div>
		</td>
	</tr>
</table>
</form>

