<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
<div class="container">
<form action="login.html" method="post">
<table class="table table-bordered">
	<caption class="text-primary">로그인</caption>
	<tr><td>아이디<span class="glyphicon glyphicon-user"></span></td>
		<td><input type="text" name="c_id" required="required" 
			autofocus="autofocus"></td></tr>
	<tr><td>암호<span class="glyphicon glyphicon-lock"></span></td>
		<td><input type="password" name="c_password" required="required">
		</td></tr>
	<tr><td colspan="2"><input type="submit"></td></tr>
</table>
</form>
</div>
</body>
</html>