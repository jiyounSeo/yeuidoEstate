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
    <script type="text/javascript" src="./resources/js/mbr/memberList.js"></script>
	<script type="text/javascript" src="./resources/js/comm/jquery.tmpl.js"></script>
	<script type="text/javascript" src="./resources/js/comm/common.js"></script>
  </head>
  <body>
    <form id="memberList" method="post" > 
    <div id="container" name="container">
    </div>
		<table border='1'>
			<tr>
				<td>아이디</td>
				<td>이름</td>
				<td>전화번호</td>
				<td>소속</td>
			</tr>
			<tbody id="mbrTbody">
			</tbody>
			
		</table>
    <div>
    <button id="save" type="button" onclick="f_member_insert();return false;">가입하기</button>
    <a href="#member" onclick="f_member_list();return false;">회원목록</a>
    </div>
    </form>

  </body>
  <script id="mbrListTemplte" type="text/x-jquery-tmpl">	
{{each mbrList}}		
	<tr>
				<td>{{html $value.mbr_id}}</td>
				<td>{{html $value.mbr_nm}}</td>
				<td>{{html $value.phone1}}
					-{{html $value.phone2}}
					-{{html $value.phone3}}
				</td>
				<td>{{html $value.agency}}</td>
			</tr>
{{/each}}
			
</html>