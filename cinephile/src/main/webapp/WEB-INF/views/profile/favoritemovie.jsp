<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../header2.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:forEach var="movie" items="${mList }">
	<a href="movieInfo?mv_num=${movie.mv_num }&mv_name=${movie.mv_name }"><img alt="" src="${movie.mv_imageurl }"></a>
	<!-- <img alt="" src="${movie.mv_imageurl }" onclick="location.href='movieInfo?mv_num=${movie.mv_num}&mv_name=${movie.mv_name }'"> -->
</c:forEach>
</body>
</html>