<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header2.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<section class="property-section latest-property-section spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-5">
                    <div class="section-title">
                        <h4>예매 내역</h4>
                    </div>
                </div>
                
            </div>
            <c:if test="${empty bList }">
				예매 내역이 없습니다.
			</c:if>
			<c:if test="${not empty bList }">
            <div class="row property-filter">
          		 <c:forEach items="${bList }" var="book">
					<div class="col-lg-4 col-md-6 mix all house">
                    <div class="property-item">
                        <div class="pi-pic set-bg" data-setbg="img/property/property-1.jpg">
                            <div class="label">이미지 넣기?</div>
                        </div>
                        <div class="pi-text">
                            <a href="#" class="heart-icon"><span class="icon_heart_alt"></span></a>
                            <div class="pt-price">날짜 ${book.book_date }<span>/month</span></div>
                            <h5><a href="#">${book.mv_name }</a></h5>
                            <p><span class="icon_pin_alt"></span> ${book.book_loc }</p>
                            <ul>
                                <li><i class="fa fa-money"></i> ${book.book_price}</li>
                                <li><i class="fa fa-child"></i> ${book.book_humantype }</li>
                                <li><i class="fa fa-bed"></i> 05</li>
                            </ul>
                        </div>
                    </div>
                </div>
				</c:forEach>
            </div>
            </c:if>
        </div>
    </section>
</body>
</html>