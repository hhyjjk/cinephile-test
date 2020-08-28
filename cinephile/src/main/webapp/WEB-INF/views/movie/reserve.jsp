<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${mv_name} 예매 시간표</title>
<script type="text/javascript">
	function timeChk(){
		document.getElementById("disp").style.display="";
		$.post('timeChk', function(data){
			$('#disp2').html(data);
		});
	}
</script>
<style>
      .au {
        overflow: auto;
      }
</style>
</head>
<body>
    <section class="feature-property-section spad">
        <div class="container">
        <h3>${mv_name }</h3>
            <div class="row">
                <div class="col-lg-4 p-0">
                    <div class="feature-property-left">
                        <div class="section-title">
                            <h4>위치</h4>
                        </div>
                        <ul>
                          <c:if test="${empty cgvList }">
                        		<li>지역이 없습니다</li>
							</c:if>
							<c:if test="${not empty cgvList }">
								<c:forEach var="clocal" items="${cgvList }">
									<li><a href="reserve?mv_name=${mv_name}&theatercode=${clocal.theatercode}&areacode=${clocal.areacode}&local=${clocal.local}">${clocal.local }</a></li>
								</c:forEach>
							</c:if>
                        </ul>
                        <a href="#">View all property</a>
                    </div>
                </div>
                <div class="col-lg-4 p-0 au">
                    <div class="feature-property-left">
                        <div class="section-title">
                            <h4>날짜</h4>
                        </div>
                        <ul>
                        	<c:if test="${empty dateList }">
                        		<li>다른 날짜를 골라주세요</li>
							</c:if>
							<c:if test="${not empty dateList }">
								<c:forEach var="date" items="${dateList }">
									<li><a href="reserve?mv_name=${mv_name}&theatercode=${cgv.theatercode}&areacode=${cgv.areacode}&local=${cgv.local}&date=${date}">${date }</a></li>
								</c:forEach>
							</c:if>
                        </ul>
                    </div>
                </div>
                
                <div class="col-lg-4 p-0 au">
                    <div class="feature-property-left">
                        <div class="section-title">
                            <h4>시간</h4>
                        </div>
                        <ul>
                        	<c:if test="${empty timeList }">
                        		<li>극장, 날짜를 먼저 선택해주세요</li>
                        		<li>시간이 없습니다</li>
                        	</c:if>
							<c:if test="${not empty timeList }">
								<c:forEach var="time" items="${timeList }" varStatus="st">
									<c:forEach var="time2" items="${time }" varStatus="sta">
										<li><input type="button" onclick="timeChk()" style="background-color:transparent;color: white;" value="${time2}" ></li>
									</c:forEach>
								</c:forEach>
							</c:if>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    	<span id="disp" onclick="location.href='reserveSeat?mv_name=${mv_name}&mv_imageurl=${movie.mv_imageurl} &theatercode=${cgv.theatercode}&areacode=${cgv.areacode}&local=${cgv.local}&date=${date}'" style="display:none" class="btn btn-success" value="좌석선택">좌석선택</span>
    </section>
    
  
</body>
</html>