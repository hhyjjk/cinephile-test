<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../header2.jsp" %>
<%@include file="../loginsessionck.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로필</title>
</head>
<body>
<div class="as-pic">
	<img src="${path }/img/logo.png" width="100" alt="">
	<div class="rating-point">${movie.mv_rate }</div>
	<div class="btn btn-success" onclick="location.href='updateForm?c_id=${nowid}'">개인정보 수정</div><br>
</div>

<c:if test="${not empty mList }">
<c:forEach var="movie" items="${mList }" varStatus="status" end="5">
	<a href="movieInfo?mv_num=${movie.mv_num }&mv_name=${movie.mv_name }"><img alt="" src="${movie.mv_imageurl }"></a>
</c:forEach><button onclick="location.href='favoritemovie?c_id=${nowid}'" value="더보기">더보기</button>
</c:if>

<section class="testimonial-section spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title">
                        <h4>나의 모놀로그</h4>
                    </div>
                </div>
            </div>
            	<c:forEach var="tlist" items="${mlList }">
            	<form action="monoWrite">
                        <div class="ti-text">
                        	${tlist.mo_content }
                        	<input type="hidden" name="c_id" value="${nowid }">
                        </div>
                        <div class="ti-author">
                            <div class="ta-pic">
                                <img src="img/testimonial-author/ta-1.jpg" alt="">
                           		좋아요수:${tlist.mo_good }
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