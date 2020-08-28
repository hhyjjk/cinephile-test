<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
</head>
<body>
<%-- <%@ include file="../mainheader.jsp" %> 
<%@ include file="../sessionChk.jsp" %>  --%>
<style type="text/css" >
#left1{
	 width:35%;
	 height:100%;
	 /* background-color:Chartreuse;  */
	 float:left;
	 border: #d9d9d9 1px solid;
}

#left2{
	 width:65%;
	 height:100%;
	/*  background-color:BlueViolet; */
	 float:left;
	
}
.cimovie{

    height: 30px;
    padding-left: 10px;
    font-size: 18px;
    color: #503396;
    border: 1px solid #503396;
    border-radius: 3px;
} 
#cinemaId{
	 width:100%;
	 height:25%;
	 border: #d9d9d9 1px solid;
	/*  background-color:yellow; */
}

#movieId{
	 width:100%;
	 height:50%;
	 border: #d9d9d9 1px solid;
	/*  background-color:green; */
} 
#picme{
	margin-top: 10px;
}
#movie_dayId{
	 width:100%;
	 height:25%;
	 border: #d9d9d9 1px solid;
	/*  background-color:green; */
} 

div.mov_list {
    
    width: 600px;
    height: 700px;
    overflow: scroll;
}
#displaylis{
 background-color: #503396;

}
table {
	width: 600px;
}
th {
 background-color: #503396;
height: 40px;	
color: white;
}

td{
border: #d9d9d9 1px solid;	
height: 40px;	
}
.btn btn-sm btn-warning{
	padding-left: 5px;
}

/* table,th,td {
	border: 1px solid black;
} */
.cssbt{
	background: url(img/seat1.png)no-repeat;
}
.active, .cssbt:hover{
	background: url(img/seat2.png)no-repeat;
}
</style>

<script type="text/javascript">

var seatInfo = new Map();  // 좌석별 예매 상태 유무
var seatPerson = new Map();  // 성인, 청소년, 어린이 선택 좌석수
var saveInfo = new Map();  // 기타 값 저장

var total = 0;  // 선택한 좌석수
seatPerson.set("성인", 0 );
seatPerson.set("청소년",  0 );
seatPerson.set("어린이",  0 );

var price_ad = 12000;  // 성인 가격
var price_teen = 9000; // 청소년 가격
var price_ch = 7000;  // 어린이 가격

var limitNumSeat = 8;  // 최대 선택 가능 좌석수

var seatSel1 = 0;  // 성인 좌석 선택 가능 인원수
var seatSel2 = 0;  // 청소년 좌석 선택 가능인원수
var seatSel3 = 0;  // 어린이 좌석 선택 가능 인원수 


function getSeatDB(msno){
 	var frmData ="msno_sid="+msno;
	$.post('getSeatDB.do', frmData, function(data) {
		var seatList = data;
		

		for(var i=0;i<seatList.length;i++){
			var seat=seatList[i];
			seatInfo.set(seat.sno, 'x');

			$("#"+seat.sno).css("background-image","url(img/seat3.png)", "no-repeat");
		}			
		
		
	}); 
	
	saveInfo.set("msno",  msno );
	
	$("#myModal").modal();
	
	if(("#myModal").close){
		$("#myModal *").remove();
	}
}

function reserveInform(){
	
 	if(total == 0){
		alert("좌석을 선택해 주세요.");
		return false;
	} 
	
	//saveInfo.get("movieName");
	//saveInfo.get("cinemaName");
	
	frm3.msno_reid.value = saveInfo.get("msno");
	frm3.numAdult.value = seatPerson.get("성인");
	frm3.numTeenager.value = seatPerson.get("청소년");
	frm3.numChild.value = seatPerson.get("어린이");
	frm3.price.value = saveInfo.get("price");
	
	var mapIter_tmp = new Map([...seatInfo.entries()].sort());
	var mapIter = mapIter_tmp.entries();
	
	var val = [];
	while( val = mapIter.next().value){
		if( val[1] == 'y' ) {
			var input = $( "#numSeat" );
			if(input.val()=="" ){
				input.val(val[0]);
			}else{
				input.val( input.val() +" "+ val[0] );
			}
		}
	}
	
	reserveClose();
	
}

function reserveClose(){
	seatReserveInit();
	numseat1.value = 0;
	numseat2.value = 0;
	numseat3.value = 0;
	$("#myModal").modal('hide');
}

function display_list(movSchedule){
	
	var jq_List=$("#schedule");
	$("#schedule *").remove();
	var schedules = movSchedule.schedule;
	var movie = movSchedule.movie;
	var cinema = movSchedule.cinema;
	
	saveInfo.set("movieName",  movie.mname );
	saveInfo.set("cinemaName",  cinema.cname );
	
	var jqMovPic = $("<img src='upload/"+movie.picUrl+"' style='width: 100%; height: 242px;'>");
	$("#right1 *").remove();
	$("#right1").append(jqMovPic);

 	var jqMovGradNname = $( "<i class='age'><img src='img/"+movie.grade+".jpg'></i>"+
							"<h4>"+movie.mname+"</h4>"	);
	$("#title2 *").remove();
	$("#title2").append(jqMovGradNname); 

 	var jqMovGradNname = $("<li>"+movie.genre+"</li><li>"+cinema.cname+"</li><li>"+movie.playdate+"</li>");
 	$("#title3_info *").remove();
	$("#title3_info").append(jqMovGradNname); 
		

	var jqLis= $("<tr><th>상영일</th><th>시작시간</th><th>종료시간</th><th>회차</th><th>관람등급</th><th>예약</th></tr>");
	jq_List.append(jqLis);
	
	if(schedules.length == 0){
		/* var jqList= $("<tr><td colspan='6' align='center'>상영 일정이 없습니다.</td></tr>");
		jq_List.append(jqList); */
		alert("상영일정이 없습니다.");
	}else{
	
		for(var i=0;i<schedules.length;i++){
			var schedule=schedules[i];
			var jqLi=$("<tr><td>"+schedule.day+"</td>"+"<td>"+schedule.startTime+"</td><td>"+schedule.endTime+"</td>"+
					"<td>"+schedule.times+"</td><td>"+movie.grade+
					//"<td><a data-toggle='modal' data-backdrop='static' href='#myModal' class='btn btn-sm btn-warning' href='#'>예약</a></td>"+	"</tr>");
					"<td><button data-backdrop='static' onclick='getSeatDB("+schedule.msno+")' class='btn btn-sm btn-warning' >예약</button></td>"+"</tr>");
	
			jqLi[0].schedule=schedule;
			jq_List.append(jqLi);
		}	
	}	
}

function movSelectFunction() {
	var frmData ="movieno="+frm.movie_id.value;
	$.post('reserveGetMov.do', frmData, function(data) {
		var jq_picMov=$("#picme");
		$("#picme *").remove();
		var jqPicMov= $("<img src='upload/"+data.picUrl+"' width='250px' height='250px' class='img1'>");
		jq_picMov.append(jqPicMov);
	});
}

function getTotalSeat(){
	var cut = parseInt(numseat1.value) + parseInt(numseat2.value) + parseInt(numseat3.value);
	return cut;
}

function seatPersonCount(inc){
	if(inc){ 
		var cnt = 0;
		total++;
		if(getTotalSeat() >= ( total ) ){
			if( ( cnt = seatPerson.get("성인") ) < numseat1.value ){
				cnt++;
				seatPerson.set("성인", cnt );
			} 
			else if ( ( cnt = seatPerson.get("청소년") ) < numseat2.value ){
				cnt++;
				seatPerson.set("청소년",  cnt );
			}
			else if ( ( cnt = seatPerson.get("어린이") ) < numseat3.value ){
				cnt++;
				seatPerson.set("어린이",  cnt );
			}
			$('#info3 *').remove();
			var price=0;
			if(( cnt = seatPerson.get("성인")) > 0){
				$('#info3').append('<li>'+"성인 : "+cnt+" 명"+'</li>');
				price += cnt*price_ad;
			}
			if(( cnt = seatPerson.get("청소년")) > 0){
				$('#info3').append('<li>'+"청소년 : "+cnt+" 명"+'</li>');
				price += cnt*price_teen;				
			}
			if(( cnt = seatPerson.get("어린이")) > 0){
				$('#info3').append('<li>'+"어린이 : "+cnt+" 명"+'</li>');
				price += cnt*price_ch;
			}
			$("#ticketTotalPrice").text(price);
			saveInfo.set("price",  price );
		}	
	}
	else{
		var cnt = 0;
		total--;
		if ( ( cnt = seatPerson.get("어린이") ) > 0 ){
			cnt--;
			seatPerson.set("어린이",  cnt );
		}
		else if ( ( cnt = seatPerson.get("청소년") ) > 0 ){
			cnt--;
			seatPerson.set("청소년",  cnt );
		}
		else if ( ( cnt = seatPerson.get("성인") ) > 0 ){
			cnt--;
			seatPerson.set("성인",  cnt );
		}	
		$('#info3 *').remove();
		var price=0;
		if(( cnt = seatPerson.get("성인")) > 0){
			$('#info3').append('<li>'+"성인 : "+cnt+" 명"+'</li>');
			price += cnt*price_ad;
		}
		if(( cnt = seatPerson.get("청소년")) > 0){
			$('#info3').append('<li>'+"청소년 : "+cnt+" 명"+'</li>');
			price += cnt*price_teen;
		}
		if(( cnt = seatPerson.get("어린이")) > 0){
			$('#info3').append('<li>'+"어린이 : "+cnt+" 명"+'</li>');
			price += cnt*price_ch;
		}		
		$("#ticketTotalPrice").text(price);
		saveInfo.set("price",  price );
	}
}

function displayClickSeat(){
	var mapIter = seatInfo.entries();
	var val = [];
	while( val = mapIter.next().value){
		if( val[1] == 'y' ) {
			$('#info2').append('<li>'+val[0]+'</li>');
		}
	}
} 

function btnClick(n) {
	if( seatInfo.get(n) == null | seatInfo.get(n) == 'n' ) {

		if( getTotalSeat() == 0 ){
			alert("좌석인원수를 선택하세요.");
			return;			
		} 

		if( getTotalSeat() < (total + 1) ){
			alert("좌석인원수를 초과하였습니다.");
			return;
		}
			
		$("#"+n).css("background-image","url(img/seat2.png)", "no-repeat");
		seatInfo.set(n, 'y');	
		seatPersonCount(true);
		$('#info2 *').remove();
		displayClickSeat();
	}
	else if( seatInfo.get(n) == 'y' ) {
		$("#"+n).css("background-image","url(img/seat1.png)", "no-repeat");
		//seatInfo.set(n, 'n');
		seatInfo.delete(n);
		seatPersonCount(false);
		$('#info2 *').remove();
		displayClickSeat();
	}
};

function initClickSeat(){
	var mapIter = seatInfo.entries();
	var val = [];
	while( val = mapIter.next().value){
		if( val[1] == 'y' ) {
			//seatInfo.set(val[0], 'n');
			seatInfo.delete(val[0]);
			$("#"+val[0]).css("background-image","url(img/seat1.png)", "no-repeat");
		}
	}
} 

function seatReserveInit(){
	total = 0;
	seatPerson.set("성인", 0 );
	seatPerson.set("청소년",  0 );
	seatPerson.set("어린이",  0 );
	$('#info2 *').remove();
	$('#info3 *').remove();
	initClickSeat();
	$("#ticketTotalPrice").text(0);
}

function numseatFunction(numPerson){
	
	if( getTotalSeat() > limitNumSeat ){
		alert("선택할 수 있는 최대 좌석수는 "+limitNumSeat+"석 입니다.");
		
    	if(numPerson == 1)
    		numseat1.value = seatSel1;
    	else if(numPerson == 2)
    		numseat2.value = seatSel2;
    	else if(numPerson == 3)
    		numseat3.value = seatSel3;
		return;
	}
	
	if( total > 0 ) {
	    var txt;
	    if (confirm("좌석 인원수를 변경하면 선택한 좌석이 사라집니다. 계속 하시겠습니끼? ")) {
	    	seatReserveInit();
	    } 
	    else{
	    	if(numPerson == 1)
	    		numseat1.value = seatSel1;
	    	else if(numPerson == 2)
	    		numseat2.value = seatSel2;
	    	else if(numPerson == 3)
	    		numseat3.value = seatSel3;
	    }
	}
	if(numPerson == 1)
		seatSel1 = numseat1.value;
	else if(numPerson == 2)
		seatSel2 = numseat2.value;
	else if(numPerson == 3)
		seatSel3 = numseat3.value;
}

$(function() 
{
	var jq_List=$("#schedule");
	var jqLis= $("<tr><th>상영일</th><th>시작시간</th><th>종료시간</th><th>회차</th><th>관람등급</th><th>예약</th></tr>");
	jq_List.append(jqLis);
	
	
	var jq_picMov=$("#picme");
	var jqPicMov= $("<img src='upload/"+moviepicUrl.value+"' width='250px' height='250px' class='img1'>");
	jq_picMov.append(jqPicMov);

	
	$("#ticketTotalPrice").text(0);
	
	$('#displayLis').click(function() {
		
		if (!frm.cinema_id.value) {
			alert("상영관을 선택하세요");
			return false;
		}
		if (!frm.movie_id.value) {
			alert("영화를 선택하세요");
			return false;
		}
		
		var frmData = $('#frm').serialize();
		$.post('reserveListCall.do', frmData, function(data) {
			display_list(data);
		});		
			
	});
});

</script>
</head>
<body>

<div class="modal fade" id="myModal" >
  <div class="modal-dialog modal-lg" style="width: 970px;">
    
    <div class="modal-content">
      <!-- header -->
      <div class="modal-content2">
	      <div class="modal-header">
	        <!-- 닫기(x) 버튼 -->
	        <button type="button" class="close" data-dismiss="modal">×</button>
	        <!-- header title -->
	        <h3 class="modal-title" style="color: #503396;" align="left">인원/좌석선택</h3>
	      </div>
	      <!-- body -->
	      <div class="right_wrap">
	    		<div class="right1" id="right1" >
	    			<%-- <img src="upload/${mv.picUrl}" style="width: 100%; height: 242px;"> --%>
	    		</div>
	    		<div class="right2">
    			    <form action="saveReserve.do" onSubmit="return reserveInform()" method="post"  name="frm3" >
	
						<input type="hidden" name="msno_reid" >
	    				<input type="hidden" name="numAdult" >
	    				<input type="hidden" name="numTeenager" >
	    				<input type="hidden" name="numChild" >
	    				<input type="hidden" name="price" >
	    				<input type="hidden" name="numSeat" id="numSeat">
	    				
	    		
		    			<div class="title2" id="title2">
		    				<%-- <i class="age">${mv.grade}</i>  			
		    				<h4>${mv.mname}</h4> --%>
		    			</div>
		    			<div class="title3" >
		    				<ul class="info" id="title3_info">
		    					<%-- <li>${cnm.cname}</li>
		    					<li>${mv.playdate}</li> --%>
		    				</ul>
		    				
		    				<ul id="info3">
		
		    				</ul>
		    				
		    				<ul id="info2">
		
		    				</ul>
		    					    				
		    			</div>
			    		<p class="price">
			    			<strong id="ticketTotalPrice"></strong>원
			    		</p>
		    			<div class="bt" align="center">  
		    				<!-- <button type="button" data-toggle="modal" data-target="#myModal2" class="btn btn-default"  style="background-color: #503396; color: white; border: 0;"> -->
 		    				<button  class="btn btn-default"  type="submit"	style="background-color: #503396; color: white; border: 0;">
		    					결제
		    				</button>
		    				
		    			</div>
	    			</form>
	    		</div>
	  	  </div>
	      <div class="row1">
	      	<div class="row1-1">
		      	<label>성인</label>
		      	<select id="numseat1" onchange="numseatFunction(1)" >
		      		<option value="0">0</option>
		      		<option value="1">1</option>
		      		<option value="2">2</option>
		      		<option value="3">3</option>
		      		<option value="4">4</option>
		      		<option value="5">5</option>
		      		<option value="6">6</option>
		      		<option value="7">7</option>
		      		<option value="8">8</option>
		      	</select>
		      	<label>청소년</label>
		      	<select id="numseat2" onchange="numseatFunction(2)" >
		      		<option value="0">0</option>
		      		<option value="1">1</option>
		      		<option value="2">2</option>
		      		<option value="3">3</option>
		      		<option value="4">4</option>
		      		<option value="5">5</option>
		      		<option value="6">6</option>
		      		<option value="7">7</option>
		      		<option value="8">8</option>
		      	</select>	
		      	<label>어린이</label>
		      	<select id="numseat3" onchange="numseatFunction(3)" >
		      		<option value="0">0</option>
		      		<option value="1">1</option>
		      		<option value="2">2</option>
		      		<option value="3">3</option>
		      		<option value="4">4</option>
		      		<option value="5">5</option>
		      		<option value="6">6</option>
		      		<option value="7">7</option>
		      		<option value="8">8</option>
		      	</select>		      		      	
		      </div>
	      	<p class="seat_ex" align="center">인원을 선택해 주세요.</p>
	      </div>
	      
	      <div class="row2">
	      	<div class="place">
	      		<div class="seat_wrap">
	      			<p class="screen"><strong>SCREEN</strong></p>
	      		</div>
	      	</div>
	      </div>
	      <div class="seat_img">
	      	<img alt="좌석안내" src="img/bg_kind.png">
	      </div>
	      <div class="seat_exit1">
	      	<img alt="출구1" src="img/bg_seat.png">
	      </div>
	      <div class="seat_exit2">
	      	<img alt="출구2" src="img/bg_exit.png">
	      </div>
	      <div class="linea"><img alt="라인" src="img/bg_a.png"></div>
	      <div class="lineb"><img alt="라인" src="img/bg_b.png"></div>
	      <div class="linec"><img alt="라인" src="img/bg_c.png"></div>
	      <div class="lined"><img alt="라인" src="img/bg_d.png"></div>
	      <div class="linee"><img alt="라인" src="img/bg_ee.png"></div>
	      <div class="linef"><img alt="라인" src="img/bg_f.png"></div>
	      <div class="lineg"><img alt="라인" src="img/bg_g.png"></div>
	      <div class="lineh"><img alt="라인" src="img/bg_h.png"></div>
	      <div class="linei"><img alt="라인" src="img/bg_i.png"></div>
	      <div class="linej"><img alt="라인" src="img/bg_j.png"></div>
	      <div class="linek"><img alt="라인" src="img/bg_k.png"></div>
	      
	      
	      
	      <div class="seat" id="seat">
	      
	      	<button onclick="btnClick('A1')" value="A1" id="A1" class="cssbt">1</button>
	      	<button onclick="btnClick('A2')" value="A2" id="A2" class="cssbt">2</button>
	      	<button onclick="btnClick('A3')" value="A3" id="A3" class="cssbt">3</button>
	      	<button onclick="btnClick('A4')" value="A4" id="A4" class="cssbt">4</button>
	      	<button onclick="btnClick('A5')" value="A5" id="A5" class="cssbt">5</button>
	      	<button onclick="btnClick('A6')" value="A6" id="A6" class="cssbt">6</button>
	      	<button onclick="btnClick('A7')" value="A7" id="A7" class="cssbt">7</button>
	      	<button onclick="btnClick('A8')" value="A8" id="A8" class="cssbt">8</button><br>
	      	
	      	<button onclick="btnClick('B1')" value="B1" id="B1" class="cssbt">1</button>
	      	<button onclick="btnClick('B2')" value="B2" id="B2" class="cssbt">2</button>
	      	<button onclick="btnClick('B3')" value="B3" id="B3" class="cssbt">3</button>
	      	<button onclick="btnClick('B4')" value="B4" id="B4" class="cssbt">4</button>
	      	<button onclick="btnClick('B5')" value="B5" id="B5" class="cssbt">5</button>
	      	<button onclick="btnClick('B6')" value="B6" id="B6" class="cssbt">6</button>
	      	<button onclick="btnClick('B7')" value="B7" id="B7" class="cssbt">7</button>
	      	<button onclick="btnClick('B8')" value="B8" id="B8" class="cssbt">8</button><br>	      	
	      	
	      	<button onclick="btnClick('C1')" value="C1" id="C1" class="cssbt">1</button>
	      	<button onclick="btnClick('C2')" value="C2" id="C2" class="cssbt">2</button>
	      	<button onclick="btnClick('C3')" value="C3" id="C3" class="cssbt">3</button>
	      	<button onclick="btnClick('C4')" value="C4" id="C4" class="cssbt">4</button>
	      	<button onclick="btnClick('C5')" value="C5" id="C5" class="cssbt">5</button>
	      	<button onclick="btnClick('C6')" value="C6" id="C6" class="cssbt">6</button>
	      	<button onclick="btnClick('C7')" value="C7" id="C7" class="cssbt">7</button>
	      	<button onclick="btnClick('C8')" value="C8" id="C8" class="cssbt">8</button><br>  	

	      	<button onclick="btnClick('D1')" value="D1" id="D1" class="cssbt">1</button>
	      	<button onclick="btnClick('D2')" value="D2" id="D2" class="cssbt">2</button>
	      	<button onclick="btnClick('D3')" value="D3" id="D3" class="cssbt">3</button>
	      	<button onclick="btnClick('D4')" value="D4" id="D4" class="cssbt">4</button>
	      	<button onclick="btnClick('D5')" value="D5" id="D5" class="cssbt">5</button>
	      	<button onclick="btnClick('D6')" value="D6" id="D6" class="cssbt">6</button>
	      	<button onclick="btnClick('D7')" value="D7" id="D7" class="cssbt">7</button>
	      	<button onclick="btnClick('D8')" value="D8" id="D8" class="cssbt">8</button><br> 	      	
	      	
	      	<button onclick="btnClick('E1')" value="E1" id="E1" class="cssbt">1</button>
	      	<button onclick="btnClick('E2')" value="E2" id="E2" class="cssbt">2</button>
	      	<button onclick="btnClick('E3')" value="E3" id="E3" class="cssbt">3</button>
	      	<button onclick="btnClick('E4')" value="E4" id="E4" class="cssbt">4</button>
	      	<button onclick="btnClick('E5')" value="E5" id="E5" class="cssbt">5</button>
	      	<button onclick="btnClick('E6')" value="E6" id="E6" class="cssbt">6</button>
	      	<button onclick="btnClick('E7')" value="E7" id="E7" class="cssbt">7</button>
	      	<button onclick="btnClick('E8')" value="E8" id="E8" class="cssbt">8</button><br> 	  
	      	
	      	<button onclick="btnClick('F1')" value="F1" id="F1" class="cssbt">1</button>
	      	<button onclick="btnClick('F2')" value="F2" id="F2" class="cssbt">2</button>
	      	<button onclick="btnClick('F3')" value="F3" id="F3" class="cssbt">3</button>
	      	<button onclick="btnClick('F4')" value="F4" id="F4" class="cssbt">4</button>
	      	<button onclick="btnClick('F5')" value="F5" id="F5" class="cssbt">5</button>
	      	<button onclick="btnClick('F6')" value="F6" id="F6" class="cssbt">6</button>
	      	<button onclick="btnClick('F7')" value="F7" id="F7" class="cssbt">7</button>
	      	<button onclick="btnClick('F8')" value="F8" id="F8" class="cssbt">8</button><br> 
	      		      	    	
	      	<button onclick="btnClick('G1')" value="G1" id="G1" class="cssbt">1</button>
	      	<button onclick="btnClick('G2')" value="G2" id="G2" class="cssbt">2</button>
	      	<button onclick="btnClick('G3')" value="G3" id="G3" class="cssbt">3</button>
	      	<button onclick="btnClick('G4')" value="G4" id="G4" class="cssbt">4</button>
	      	<button onclick="btnClick('G5')" value="G5" id="G5" class="cssbt">5</button>
	      	<button onclick="btnClick('G6')" value="G6" id="G6" class="cssbt">6</button>
	      	<button onclick="btnClick('G7')" value="G7" id="G7" class="cssbt">7</button>
	      	<button onclick="btnClick('G8')" value="G8" id="G8" class="cssbt">8</button><br> 	
	      	
	      	<button onclick="btnClick('H1')" value="H1" id="H1" class="cssbt">1</button>
	      	<button onclick="btnClick('H2')" value="H2" id="H2" class="cssbt">2</button>
	      	<button onclick="btnClick('H3')" value="H3" id="H3" class="cssbt">3</button>
	      	<button onclick="btnClick('H4')" value="H4" id="H4" class="cssbt">4</button>
	      	<button onclick="btnClick('H5')" value="H5" id="H5" class="cssbt">5</button>
	      	<button onclick="btnClick('H6')" value="H6" id="H6" class="cssbt">6</button>
	      	<button onclick="btnClick('H7')" value="H7" id="H7" class="cssbt">7</button>
	      	<button onclick="btnClick('H8')" value="H8" id="H8" class="cssbt">8</button><br> 

	      	<button onclick="btnClick('I1')" value="I1" id="I1" class="cssbt">1</button>
	      	<button onclick="btnClick('I2')" value="I2" id="I2" class="cssbt">2</button>
	      	<button onclick="btnClick('I3')" value="I3" id="I3" class="cssbt">3</button>
	      	<button onclick="btnClick('I4')" value="I4" id="I4" class="cssbt">4</button>
	      	<button onclick="btnClick('I5')" value="I5" id="I5" class="cssbt">5</button>
	      	<button onclick="btnClick('I6')" value="I6" id="I6" class="cssbt">6</button>
	      	<button onclick="btnClick('I7')" value="I7" id="I7" class="cssbt">7</button>
	      	<button onclick="btnClick('I8')" value="I8" id="I8" class="cssbt">8</button><br>

	      	<button onclick="btnClick('J1')" value="J1" id="J1" class="cssbt">1</button>
	      	<button onclick="btnClick('J2')" value="J2" id="J2" class="cssbt">2</button>
	      	<button onclick="btnClick('J3')" value="J3" id="J3" class="cssbt">3</button>
	      	<button onclick="btnClick('J4')" value="J4" id="J4" class="cssbt">4</button>
	      	<button onclick="btnClick('J5')" value="J5" id="J5" class="cssbt">5</button>
	      	<button onclick="btnClick('J6')" value="J6" id="J6" class="cssbt">6</button>
	      	<button onclick="btnClick('J7')" value="J7" id="J7" class="cssbt">7</button>
	      	<button onclick="btnClick('J8')" value="J8" id="J8" class="cssbt">8</button><br>	
	      	
	      	<button onclick="btnClick('K1')" value="K1" id="K1" class="cssbt">1</button>
	      	<button onclick="btnClick('K2')" value="K2" id="K2" class="cssbt">2</button>
	      	<button onclick="btnClick('K3')" value="K3" id="K3" class="cssbt">3</button>
	      	<button onclick="btnClick('K4')" value="K4" id="K4" class="cssbt">4</button>
	      	<button onclick="btnClick('K5')" value="K5" id="K5" class="cssbt">5</button>
	      	<button onclick="btnClick('K6')" value="K6" id="K6" class="cssbt">6</button>
	      	<button onclick="btnClick('K7')" value="K7" id="K7" class="cssbt">7</button>
	      	<button onclick="btnClick('K8')" value="K8" id="K8" class="cssbt">8</button><br>	      	      	
	      	
	      </div>
	      
	      <!-- Footer -->
	      <div class="modal-footer">
	        <div class="Poll" style="display: inline; float: left; padding-left: 230px;">
	        	구성원 설문조사:
	        	<label><input type="radio" name="composition" required="required" value="10" >가족</label>
				<label><input type="radio" name="composition" required="required" value="20" >연인</label>
				<label><input type="radio" name="composition" required="required" value="30" >친구</label>
				<label><input type="radio" name="composition" required="required" value="40" >혼자</label>
				<label><input type="radio" name="composition" required="required" value="50" >기타</label>
	        </div>
	        
	        <!-- <button type="button" class="btn btn-default" data-dismiss="modal" style="background-color: #503396; color: white;">닫기</button> -->
	        <button type="button" class="btn btn-default" onclick="reserveClose()" style="background-color: #503396; color: white;">닫기</button>
	      </div>
	    </div>
    </div>
  </div>
</div>
</body>
</html>