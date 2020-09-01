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
지역: ${book.book_loc }
날짜: ${book.book_date }
인원수 ${book.book_humantype }
가격 ${book.book_price }
가격 ${book.mv_name }
</body>
</html>