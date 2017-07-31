<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=utf-8" %>
<% request.setCharacterEncoding("utf-8"); %>
<% response.setContentType("text/html; charset=utf-8"); %>
<%@ page session="false" %>
<c:set var="contextPath" value="./resources"></c:set>  
<html>
  <head>
    <meta charset="utf-8">
    <title>test 게시판!!!!!</title>
	<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
    <script src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
    <script type="text/javascript" src="./resources/js/mbr/joinMember.js"></script>
	<script type="text/javascript" src="./resources/js/comm/jquery.tmpl.js"></script>
	<script type="text/javascript" src="./resources/js/comm/common.js"></script>
  </head>
  <body>
 	<script>
 	

 	</script>	
    <form id="joinMember" method="post" > 
    <div id="container" name="container">
    </div>
		<table>
			<tr>
				<td>아이디</td>
				<td><input type="text" id="mbr_id" name="mbr_id"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" id="mbr_pw" name="mbr_pw"></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" id="mbr_nm" name="mbr_nm"></td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td>
					<input type="text" id="phone1" name="phone1" maxlength="3">
					-<input type="text" id="phone2" name="phone2" maxlength="4">
					-<input type="text" id="phone3" name="phone3" maxlength="4">
				</td>
			</tr>
			<tr>
				<td>소속</td>
				<td><input type="text" id=agency" name="agency"></td>
			</tr>
			
		</table>
    <div>
    <button id="save" type="button" onclick="f_member_save();return false;">가입하기</button>
    <a href="#member" onclick="f_member_list();return false;">목록</a>
    </div>
    </form>

  </body>
  <script id="mbrListTemplte" type="text/x-jquery-tmpl">	

{{each mbrList}}		
			<tr>
				<td>아이디</td>
				<td>{{html $value.mbr_id}}</td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" id="password" name="password"></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" id="name" name="name"></td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td>
					<input type="text" id="tel1" name="tel1" maxlength="3">
					-<input type="text" id="tel2" name="tel2" maxlength="4">
					-<input type="text" id="tel3" name="tel3" maxlength="4">
				</td>
			</tr>
			<tr>
				<td>소속</td>
				<td><input type="text" id=groupId" name="groupId"></td>
			</tr>
{{/each}}

</html>