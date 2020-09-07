<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:if test="${msg==1 }">
<script type="text/javascript">
	
	alert("결제가 완료됐습니다");
	location.href="main";
</script>
</c:if>
<c:if test="${msg==2 }">
<script type="text/javascript">
	
	alert("결제가 취소됐습니다");
	location.href="main";
</script>
</c:if>
</body>
</html>