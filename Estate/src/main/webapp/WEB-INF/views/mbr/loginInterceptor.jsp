<%@ include file="/WEB-INF/views/comm/mbrHeader.jsp" %> 
<%@ page contentType="text/html; charset=utf-8" %>
<script type="text/javascript">

$(document).ready(function(){
	fn_submit();     
});
function fn_submit(){
	alert("로그인이 필요한 페이지입니다.\n로그인 화면으로 이동합니다.");
    var frm = $('#formId')[0];
    frm.action = "/loginView.go";
    frm.method = 'get';
    frm.submit();  
};

</script>
<html>
	<head>
	  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	  <title></title>
	</head>
	<body>
		<form id="formId">
		</form>
	</body>
</html>	 