<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=utf-8" %>
<% request.setCharacterEncoding("utf-8"); %>
<% response.setContentType("text/html; charset=utf-8"); %>
<%@ page session="false" %>
<c:set var="contextPath" value="./resources"></c:set>  
<html>
  <head>
    <meta charset="utf-8">
    <title>여의도 부동산</title>
	<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
    <script src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
	<script type="text/javascript" src="./resources/js/comm/jquery.tmpl.js"></script>
	<script type="text/javascript" src="./resources/js/comm/common.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/underscore.js/1.8.3/underscore-min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.10.6/moment.min.js"></script>
  </head>