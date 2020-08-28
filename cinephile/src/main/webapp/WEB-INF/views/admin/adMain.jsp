<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="a_header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>

</head>
<body>




	<div class="container">
		<div class="row">
			<div class="col-lg-8">
				<div class="pd-text">
				
					<div class="row">
						<div class="col-lg-6">
							<div class="pd-title">
								<c:set var="admin" value="${sessionScope.c_id }" />
								<c:if test="${not empty admin }">
									<h4>접속자: ${admin } </h4>
								</c:if>
								<p>
									<span class="icon_pin_alt"></span> 3 Middle Winchendon Rd,
									Rindge, NH 03463
								</p>
							</div>
						</div>
						<div class="col-lg-6">
							<div class="pd-social">
								<a href="#"><i class="fa fa-mail-forward"></i></a> <a href="#"><i
									class="fa fa-send"></i></a> <a href="#"><i class="fa fa-heart"></i></a>
								<a href="#"><i class="fa fa-mail-forward"></i></a> <a href="#"><i
									class="fa fa-cloud-download"></i></a>
							</div>
						</div>
					</div>
					<div class="pd-board">
						<div class="tab-board">
							<ul class="nav nav-tabs" role="tablist">
								<li class="nav-item"><a class="nav-link active"
									data-toggle="tab" href="#tabs-1" role="tab">Overview</a></li>
								<li class="nav-item"><a class="nav-link" data-toggle="tab"
									href="#tabs-2" role="tab">Description</a></li>
								<li class="nav-item"><a class="nav-link" data-toggle="tab"
									href="#tabs-3" role="tab">회원관리</a></li>
							</ul>
							<div class="tab-content">
								<div class="tab-pane active" id="tabs-1" role="tabpanel">
									<div class="tab-details">
										<ul class="left-table">
											<li><span class="type-name">Property Type</span> <span
												class="type-value">House</span></li>
											<li><span class="type-name">Property ID</span> <span
												class="type-value">#219</span></li>
											<li><span class="type-name">Price</span> <span
												class="type-value">$ 289.0/mounth</span></li>
											<li><span class="type-name">Year Built</span> <span
												class="type-value">2019</span></li>
											<li><span class="type-name">Contract type</span> <span
												class="type-value">Rent</span></li>
											<li><span class="type-name">Agent</span> <span
												class="type-value">Ashton Kutcher</span></li>
										</ul>
										<ul class="right-table">
											<li><span class="type-name">Home Area</span> <span
												class="type-value">1200 sqft</span></li>
											<li><span class="type-name">Rooms</span> <span
												class="type-value">9</span></li>
											<li><span class="type-name">Bedrooms</span> <span
												class="type-value">4</span></li>
											<li><span class="type-name">Bathrooms</span> <span
												class="type-value">3</span></li>
											<li><span class="type-name">Garages</span> <span
												class="type-value">2</span></li>
											<li><span class="type-name">Parking lots</span> <span
												class="type-value">2</span></li>
										</ul>
									</div>
								</div>
								<div class="tab-pane" id="tabs-2" role="tabpanel">
									<div class="tab-desc">
										<p>Lorem ipsum dolor sit amet consectetur adipisicing
											elit. Nesciunt dolor itaque facere consequatur, dignissimos
											minus adipisci ipsam repudiandae nisi illum provident, natus
											quidem vero? Quaerat ducimus sequi praesentium commodi,
											consectetur corporis eos sit perspiciatis, quae sed officia
											error, iure quasi.</p>
										<p>Lorem ipsum dolor sit amet consectetur adipisicing
											elit. Nesciunt dolor itaque facere consequatur, dignissimos
											minus adipisci ipsam repudiandae nisi illum provident, natus
											quidem vero? Quaerat ducimus sequi praesentium commodi,
											consectetur corporis eos sit perspiciatis, quae sed officia
											error, iure quasi.</p>
									</div>
								</div>
								<div class="tab-pane" id="tabs-3" role="tabpanel">
									<div class="tab-details">
										<ul class="left-table">
											<li><span class="type-name">Property Type</span> <span
												class="type-value">House</span></li>
											<li><span class="type-name">Property ID</span> <span
												class="type-value">#219</span></li>
											<li><span class="type-name">Price</span> <span
												class="type-value">$ 289.0/mounth</span></li>
											<li><span class="type-name">Year Built</span> <span
												class="type-value">2019</span></li>
											<li><span class="type-name">Contract type</span> <span
												class="type-value">Rent</span></li>
											<li><span class="type-name">Agent</span> <span
												class="type-value">Ashton Kutcher</span></li>
										</ul>
										<ul class="right-table">
											<li><span class="type-name">Home Area</span> <span
												class="type-value">1200 sqft</span></li>
											<li><span class="type-name">Rooms</span> <span
												class="type-value">9</span></li>
											<li><span class="type-name">Bedrooms</span> <span
												class="type-value">4</span></li>
											<li><span class="type-name">Bathrooms</span> <span
												class="type-value">3</span></li>
											<li><span class="type-name">Garages</span> <span
												class="type-value">2</span></li>
											<li><span class="type-name">Parking lots</span> <span
												class="type-value">2</span></li>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>

					<!-- 메세지 보내는 폼 -->
					<!-- 				<div class="pd-widget">
						<h4>YOur Rating</h4>
						<form action="#" class="review-form">
							<div class="group-input">
								<input type="text" placeholder="Name"> <input
									type="text" placeholder="Email"> <input type="text"
									placeholder="Website">
							</div>
							<textarea placeholder="Messages"></textarea>
							<div class="rating">
								<span>Your Rating:</span> <i class="fa fa-star"></i> <i
									class="fa fa-star"></i> <i class="fa fa-star"></i> <i
									class="fa fa-star"></i> <i class="fa fa-star"></i>
							</div>
							<button type="submit" class="site-btn">send messages</button>
						</form>
					</div> -->
				
				<a href="cinfoList.html">회원 관리</a>
				
				
				</div>
			</div>

		</div>
	</div>
</body>
</html>