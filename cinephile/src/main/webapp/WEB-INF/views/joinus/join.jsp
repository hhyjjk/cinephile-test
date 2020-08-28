<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:if test="${result > 0 }">
<script type="text/javascript">
alert("가입정보 입력 완료입니다.");
location.href="loginForm";
</script>
</c:if>

<c:if test="${result == -1 }">
	<script type="text/javascript">
	alert("아이디 중복, 다시 입력해주세요.");
	history.go(-1);
	</script>
</c:if>
</body>
</html>