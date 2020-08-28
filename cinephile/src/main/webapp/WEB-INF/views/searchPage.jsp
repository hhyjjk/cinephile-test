<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="description" content="Aler Template">
<meta name="keywords" content="Aler, unica, creative, html">
<!-- <meta name="viewport" content="width=device-width, initial-scale=1.0"> -->
<title>시네필 통합검색</title>

<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css?family=Montserrat:300,400,500,600,700,800,900&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Lato:400,700,900&display=swap"
	rel="stylesheet">
</head>

<body>
<body>
	<div class="offcanvas-menu-wrapper">
		<div class="canvas-close">
			<span class="icon_close"></span>
		</div>
		<div class="logo">
			<a href="./index.html"> <img src="img/logo.png" alt="">
			</a>
		</div>
		<div id="mobile-menu-wrap">
			<div class="slicknav_menu">
				<a href="#" aria-haspopup="true" role="button" tabindex="0"
					class="slicknav_btn slicknav_collapsed"><span
					class="slicknav_menutxt">MENU</span><span class="slicknav_icon"><span
						class="slicknav_icon-bar"></span><span class="slicknav_icon-bar"></span><span
						class="slicknav_icon-bar"></span></span></a>
				<nav class="slicknav_nav slicknav_hidden" aria-hidden="true"
					role="menu" style="display: none;">
					<ul>
						<li><a href="./index.html" role="menuitem">Home</a></li>
						<li class="slicknav_collapsed slicknav_parent"><a href="#"
							role="menuitem" aria-haspopup="true" tabindex="-1"
							class="slicknav_item slicknav_row"><a href="#">Properties</a>
								<span class="slicknav_arrow">►</span></a>
							<ul class="dropdown slicknav_hidden" role="menu"
								aria-hidden="true" style="display: none;">
								<li><a href="./property.html" role="menuitem" tabindex="-1">Property
										Grid</a></li>
								<li><a href="./profile.html" role="menuitem" tabindex="-1">Property
										List</a></li>
								<li><a href="./property-details.html" role="menuitem"
									tabindex="-1">Property Detail</a></li>
								<li><a href="./property-comparison.html" role="menuitem"
									tabindex="-1">Property Comperison</a></li>
								<li><a href="./property-submit.html" role="menuitem"
									tabindex="-1">Property Submit</a></li>
							</ul></li>
						<li><a href="./agents.html" role="menuitem">Agents</a></li>
						<li><a href="./about.html" role="menuitem">About</a></li>
						<li class="active"><a href="./blog.html" role="menuitem">Blog</a></li>
						<li><a href="./contact.html" role="menuitem">Contact</a></li>
					</ul>
				</nav>
			</div>
		</div>
		<div class="om-widget">
			<ul>
				<li><i class="icon_mail_alt"></i> Aler.support@gmail.com</li>
				<li><i class="fa fa-mobile-phone"></i> 125-711-811 <span>125-668-886</span></li>
			</ul>
			<a href="#" class="hw-btn">Submit property</a>
		</div>
		<div class="om-social">
			<a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i
				class="fa fa-twitter"></i></a> <a href="#"><i
				class="fa fa-youtube-play"></i></a> <a href="#"><i
				class="fa fa-instagram"></i></a> <a href="#"><i
				class="fa fa-pinterest-p"></i></a>
		</div>
	</div>

	<section class="blog-section spad">
		<div class="container">
			<!-- 여기서부터 foreach적용 -->
			<c:if test="${empty rbList }">
			<h3>리뷰게시판</h3>
			<hr>
			<div style="margin: 0 auto; width: 95%;">
				<h5>조회 된 내용이 없습니다</h5>
			</div>
			</c:if>
			<c:if test="${not empty rbList}">
			<c:forEach var="rbList" items="${rbList }">
			<div class="row">
				<div class="col-lg-8">
					<div class="blog-item-list">
						<div class="blog-item">
							<div class="bi-text">
								<h3>리뷰게시판</h3>
								<hr>
								<div style="margin: 0 auto; width: 95%;">
								<h5>
									<a href="bdContent?b_num=${rbList.b_num }">${rbList.b_subject }</a>
								</h5>
								<ul>
									<li>작성자 <span>${rbList.c_id }</span></li>
									<li>${rbList.b_regdate }</li>
									<li>댓글 개수</li>
								</ul>
								<p>${rbList.b_content }</p>
								<a href="${path}/list/pageNum/1" class="read-more">더보기  <i class="fa fa-arrow-right"></i></a>
								</div>
							</div>
						</div>
					</div>
<!-- 					<div class="blog-pagination property-pagination ">
						<a href="#">1</a> <a href="#">2</a> <a href="#">3</a> <a href="#"
							class="icon">→</a>
					</div> -->
				</div>
			</div>
			</c:forEach>
			</c:if>
			<!-- 여기까지 foreach적용 -->
		</div>
	</section>


</body>
</body>

</html>