<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:set var="id" value="${sessionScope.c_id }"/>
<c:if test="${empty id }">
	<script type="text/javascript">
	alert("로그인이 필요합니다.")
	location.href="loginForm";
	</script>
	</c:if>
</body>
</html>