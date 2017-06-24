<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=utf-8" %>
<% request.setCharacterEncoding("utf-8"); %>
<% response.setContentType("text/html; charset=utf-8"); %>
<%@ page session="false" %>

<c:set var="contextPath" value="<%= request.getContextPath()%>"></c:set>  

<html>
  <head>
    <meta charset="utf-8">
    <title>test 게시판</title>

    <script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
    <script src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
  </head>
  <body>
	<script>
	$(document).ready(function(){
		$.ajax({
            url : "/estate/jsonTestList.do",
            type: "post",
            data : { "id" : "123" }, //$("#id").val()
            contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
            success : function(responseData){
                var data = responseData.person;
                alert (data.length);
                //$("#ajax").remove();
                if(!data){
                    return false;
                }
                var html = '';
               	$.each (data, function(index,key) {
               		var info = data[index];
                	html += '아이디<input type="text" name=id" value="'+info.name+'">';
                });
                //html += '나이<input type="text"  name="age" value="'+data.age+'">';
               $("#container").after(html);
            }
        });
 
    });
    </script>

    <form id="form" method="post" > 
    <div id="container" name="container">
    </div>

    <div>
    <button id="save" type="button" onclick="form_save('#form');">저장</button>
    <a href="./">목록</a>
    </div>
    </form>
  </body>
</html>