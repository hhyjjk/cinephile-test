<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="description" content="Aler Template">
    <meta name="keywords" content="Aler, unica, creative, html">
    <!-- <meta name="viewport" content="width=device-width, initial-scale=1.0"> -->
    <title>시네필</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:300,400,500,600,700,800,900&display=swap"
        rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Lato:400,700,900&display=swap" rel="stylesheet">
</head>

<body>		
    <!-- Page Preloder -->
    <!-- <div id="preloder">
        <div class="loader"></div>
    </div> -->

    <!-- Hero Section Begin -->
    <section class="hero-section">
        <div class="container">
            <div class="hs-slider owl-carousel">
            <c:if test="${not empty imageList}">
			<c:forEach var="board" items="${imageList}" varStatus="status">
                <div class="hs-item set-bg" data-setbg="${board}" style="cursor: pointer;" onclick="location.href='movieInfo?mv_num=${codeList[status.index] }&mv_name=${nameList[status.index] }'"> <!-- img/hero/hero-1.jpg -->
					<div class="row">
                    	<div class="col-md-12">
                        	<%-- <div class="col-md-6">
                            	<div class="hc-inner-text">
                            		<div class="hc-text">
                                    	<h4>${nameList[status.index] }</h4>
                                    	<p><span class="icon_pin_alt"></span> Panvel, Navi Mumbai</p>
                                    	<div class="label">For Rent</div>
                                    	<h5>$ 65.0<span>/month</span></h5>
                                	</div>
                               		<div class="hc-widget">
                                    	<ul>
                                        	<li><i class="fa fa-object-group"></i> 2, 283</li>
                                        	<li><i class="fa fa-bathtub"></i> 03</li>
                                        	<li><i class="fa fa-bed"></i> 05</li>
                                        	<li><i class="fa fa-automobile"></i> 01</li>
                                    	</ul>
                                	</div>
                            	</div>
                        	</div> --%>
                    	</div>
                	</div>
                </div>
			</c:forEach>
			</c:if>
            </div>
        </div>
    </section>
    <!-- Hero Section End -->
	<!-- Testimonial Section Begin -->
    <section class="testimonial-section spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title">
                        <h4>모놀로그 글쓰기</h4>
                    </div>
                </div>
            </div>
            	<form action="monoWrite">
                        <div class="ti-text">
                        	<input type="text" class="form-control clo-sm-5" rows="3" name="contents">
                        	<input type="hidden" name="c_id" value="${nowid }">
                        </div>
                        <div class="ti-author">
                            <div class="ta-pic">
                                <img src="img/testimonial-author/ta-1.jpg" alt="">
                            </div>
                            <div class="ta-text">
                             <c:if test="${not empty nowid }">
                             	<input type="submit" value="글올리기">
                                	<h5>${nowid }</h5>
                             </c:if>
                             <c:if test="${empty nowid }">
                             	<h5>회원만 가능합니다</h5>
                             </c:if>
                            </div>
                        </div>
                 </form>
        </div>
    </section>
    <!-- Testimonial Section End -->

    <!-- Chooseus Section Begin -->
    <section class="chooseus-section spad set-bg" data-setbg="img/chooseus/chooseus-bg.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-8">
                    <div class="chooseus-text">
                        <div class="section-title">
                            <h4>Why choose us</h4>
                        </div>
                        <p>Ltype specimen book.</p>
                    </div>
                    <div class="chooseus-features">
                        <div class="cf-item">
                            <div class="cf-pic">
                                <img src="img/chooseus/chooseus-icon-4.png" alt="">
                            </div>
                            <div class="cf-text">
                                <h5>List your own property</h5>
                                <p>Sign up now and sell or rent your own properties</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Chooseus Section End -->
    <!-- Testimonial Section Begin -->
    <section class="testimonial-section spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title">
                        <h4>What our client says?</h4>
                    </div>
                </div>
            </div>
            <div class="row testimonial-slider owl-carousel">
            	<c:if test="${not empty  moList}">
    			<c:forEach var="mono" items="${moList}" varStatus="status">
    				<div class="col-lg-6">
                    <div class="testimonial-item">
                        <div class="ti-text">
                            <p>${mono.mo_content }</p>
                        </div>
                        <div class="ti-author">
                            <div class="ta-pic">
                                <img src="img/testimonial-author/ta-1.jpg" alt="">
                            </div>
                            <div class="ta-text">
                                <a href="profileOther?c_id=${mono.c_id }"><h5>${mono.c_id }</h5></a>
                                <span>Designer</span>
                                <c:if test="${not empty nowid }">
                                	<c:if test="${'y' eq mogoodList[status.index]}">
                                		<div class="btn btn-link" onclick="location.href='monologuegood?mo_num=${mono.mo_num}&c_id=${nowid }'"><img alt="" src="${path}/img/hearton.png" width="1" height="40">${mono.mo_good }</div>
                              		</c:if>
                                	<c:if test="${'n' eq mogoodList[status.index]}">
                                		<div class="btn btn-link" onclick="location.href='monologuegood?mo_num=${mono.mo_num}&c_id=${nowid }'"><img alt="" src="${path}/img/heartoff.png" width="1" height="40">${mono.mo_good }</div>
                              		</c:if>
                                </c:if>
                                <c:if test="${empty nowid }">
                                	<div class="btn btn-link"><img alt="" src="${path}/img/heartoff.png" width="1" height="40">${mono.mo_good }</div>
                                </c:if>
                                
                                <div class="ta-rating">
                                </div>
                            </div>
                        </div>
                    </div>
                	</div>
    			</c:forEach>
			</c:if>
            </div>
        </div>
    </section>
    <!-- Testimonial Section End -->
    <!-- Footer Section Begin -->
    <footer class="footer-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-4 col-md-6">
                    <div class="fs-about">
                        <div class="fs-logo">
                            <a href="#">
                                <img src="img/f-logo.png" alt="">
                            </a>
                        </div>
                        <p>Lorem ipsum dolor sit amet, consect</p>
                        <div class="fs-social">
                            <a href="#"><i class="fa fa-facebook"></i></a>
                            <a href="#"><i class="fa fa-twitter"></i></a>
                            <a href="#"><i class="fa fa-youtube-play"></i></a>
                            <a href="#"><i class="fa fa-instagram"></i></a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-2 col-sm-6">
                    <div class="fs-widget">
                        <h5>Help</h5>
                        <ul>
                            <li><a href="#">Privacy Policy</a></li>
                            <li><a href="#">Contact Support</a></li>
                            <li><a href="#">Knowledgebase</a></li>
                            <li><a href="#">Careers</a></li>
                            <li><a href="#">FAQs</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-2 col-sm-6">
                    <div class="fs-widget">
                        <h5>Links</h5>
                        <ul>
                            <li><a href="a_loginForm">Admin</a></li>
                            <li><a href="#">Create Property</a></li>
                            <li><a href="#">My Properties</a></li>
                            <li><a href="#">Register</a></li>
                            <li><a href="#">Login</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6">
                    <div class="fs-widget">
                        <h5>Newsletter</h5>
                        <p>Deserunt mollit anim id est laborum.</p>
                        <form action="#" class="subscribe-form">
                            <input type="text" placeholder="Email">
                            <button type="submit" class="site-btn">Subscribe</button>
                        </form>
                    </div>
                </div>
            </div>
            <div class="copyright-text">
                <p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
  Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
  <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
            </div>
        </div>
    </footer>
    <!-- Footer Section End -->

    <!-- Js Plugins -->
    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.magnific-popup.min.js"></script>
    <script src="js/mixitup.min.js"></script>
    <script src="js/jquery-ui.min.js"></script>
    <script src="js/jquery.nice-select.min.js"></script>
    <script src="js/jquery.slicknav.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/jquery.richtext.min.js"></script>
    <script src="js/image-uploader.min.js"></script>
    <script src="js/main.js"></script>
</body>

</html>