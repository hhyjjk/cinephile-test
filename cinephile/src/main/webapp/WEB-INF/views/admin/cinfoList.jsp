<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="a_header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
</head>
<body>
<!--WRAP-->
<section id="wrap">
	<!--HGROUP-->
	<div class="hgroup"><h1>회원 리스트</h1>
		<p><a href="adMain.html">관리자 페이지</a></p>		
	</div>
	<!--/HGROUP-->
	<c:set var="num" value="${pb.num }" />
	<table class="list_table">
	<caption class="#">회원 리스트</caption>	
		<col style="width:50px"><col style="width:80px">
		<col style="width:80px"><col style="width:80px">
		<col><col style="width:150px">
	<thead>
	<tr>
		<th scope="col">번호</th>	<th scope="col">유저ID</th>
		<th scope="col">이름</th>	<th scope="col">닉네임</th>
		<th scope="col">주소</th>	<th scope="col">전화번호</th>
		<th scope="col">이메일</th><th scope="col">가입날짜</th>
		<th scope="col">탈퇴여부</th>
	</tr>
	</thead>
	<tbody>
	<c:forEach  items="${getCustomerList }" var="customer">
	<tr><td>${num }</td><td>${customer.c_id}</td>			
		<td class="#"><%-- <a href="cinfo.html?c_id=${customer.c_id }"> --%>${customer.c_name }</td>	
		<td>${customer.c_nickname }</td>
		<td class="#">${customer.c_address }</td>	
		<td>${customer.c_tel }</td>
		<td class="#">${customer.c_email}</td>
		<td>${customer.c_regdate}</td>
		<td class="#">${customer.c_del }</td>
	</tr>
	<c:set var="num" value="${num -1 }" />
	</c:forEach>
	</tbody>
	</table>	
	<!--페이징-->
	<p class="paging">
		<c:forEach var="i" begin="${pb.startPage }" end="${pb.endPage }">
		<c:if test="${i <= pb.total }">
			<a href="cinfoList.html?currentPage=${i }">${i }</a>
		</c:if>
		</c:forEach>
	</p>
	<!--/페이징-->		
	</section>	
</body>
</html>