<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../header2.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${customer.c_nickname }프로필</title>
</head>
<body>
${customer.c_nickname }님의 취향집
<c:forEach var="movie" items="${mList }" varStatus="status">
	<a href="movieInfo?mv_num=${movie.mv_num }&mv_name=${movie.mv_name }"><img alt="" src="${movie.mv_imageurl }"></a>
</c:forEach>

<section class="testimonial-section spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title">
                        <h4>${customer.c_nickname }님의 모놀로그</h4>
                    </div>
                </div>
            </div>
            	<c:forEach var="tlist" items="${mlList }">
            	<form action="monoWrite">
                        <div class="ti-text">
                        	${tlist.mo_content }
                        </div>
                        <div class="ti-author">
                            <div class="ta-pic">
                                <img src="img/testimonial-author/ta-1.jpg" alt="">
                            </div>
                            <div class="ta-text">
                            </div>
                        </div>
                 </form>
    		</c:forEach>
        </div>
    </section>
</body>
</html>