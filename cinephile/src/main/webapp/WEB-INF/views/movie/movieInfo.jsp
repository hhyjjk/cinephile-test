<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta name="description" content="Aler Template">
    <meta name="keywords" content="Aler, unica, creative, html">
    <!-- <meta name="viewport" content="width=device-width, initial-scale=1.0"> -->
    <title>영화정보</title>
</head>
<body>

     <!-- About Section Begin -->
    <section class="about-section spad">
        <div class="container">
            <div class="row">
            <div class="col-lg-3">
            	<div class="about-pic set-bg" data-setbg="${nmovie.mv_imageurl }">
                	 <img alt="" src="${nmovie.mv_imageurl }">
                        <a href="https://www.youtube.com/watch?v=8EJ3zbKTWQ8" class="play-btn video-popup">
                            <i class="fa fa-play-circle"></i>
                        </a>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="about-text">
                        <div class="at-title">
                            <h3>${nmovie.mv_name }</h3>
                        </div>
                        <div class="at-feature">
                            <div class="af-item">
                                <div class="af-text">
                                    <strong>감독: </strong> ${nmovie.mv_direct }&nbsp;
                                    <strong>장르: </strong> ${nmovie.mv_genre }&nbsp;
                                    <strong>주연: </strong> ${nmovie.mv_mjactor }
                                </div>
                            </div>
                            <div class="af-item">
                                <div class="af-text">
                                	 <strong>개봉날짜: </strong> ${nmovie.mv_reldate }&nbsp;
                                	 <strong>평점: </strong> ${nmovie.mv_rate }점&nbsp;
                                	 <strong>러닝타임: </strong> ${nmovie.mv_runtime }분
                                </div>
                            </div>
                            <div class="af-item">
                                <div class="af-text">
                                	 <strong>조연: </strong> ${nmovie.mv_minactor }
                                </div>
                            </div>
                            <div class="af-item">
                                <div class="af-text">
                                <h6>줄거리</h6>
                                    <p>${nmovie.mv_content }</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <c:if test="${not empty streserve }">
                   		<div class="btn btn-success" onclick="location.href='reserve?mv_name=${nmovie.mv_name}'">예매하기</div>
                    </c:if>
                    <c:if test="${not empty nowid }">
                    	<c:if test="${not empty cfaon }">
                    		<div class="btn btn-warning" onclick="location.href='favoritechoice?mv_num=${nmovie.mv_num}'">추천중<img src="${path}/img/hearton.png" width="25"></div>
                    	</c:if>
                    	<c:if test="${empty cfaon }">
                    		<div class="btn btn-warning" onclick="location.href='favoritechoice?mv_num=${nmovie.mv_num}'">추천하기<img src="${path}/img/heartoff.png" width="25"></div>
                    	</c:if>
					</c:if>
                </div>
                
            </div>
        </div>
    </section>
    <!-- About Section End -->
    
</body>
</html>