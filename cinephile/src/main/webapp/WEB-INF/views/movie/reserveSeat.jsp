<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../header.jsp"%>
<%@ include file="../loginsessionck.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>좌석 선택하기</title>
<style type="text/css">
.cssbt{
	background: url(/cinephile/img/alp/notsel.JPG)no-repeat;
}
</style>
<script type="text/javascript">
	var seatPerson = new Map();
	var totalPerson = 0;
	var adultcnt=0;
	var youthcnt=0;
	seatPerson.set("성인", 0 );
	seatPerson.set("청소년",  0 );
	
	var seatSel1 = 0;  // 성인 좌석 선택 가능 인원수
	var seatSel2 = 0;  // 청소년 좌석 선택 가능인원수
	
	var seatInfo = new Map();  // 좌석별 예매 상태 유무
	var saveInfo = new Map();  // 기타 값 저장

	var total = 0;  // 선택한 좌석수

	var price_ad = 12000;  // 성인 가격
	var price_teen = 9000; // 청소년 가격
	var price_ch = 7000;  // 어린이 가격

	var limitNumSeat = 8;  // 최대 선택 가능 좌석수
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
				$("#ticketTotalPrice").text(price);
				saveInfo.set("price",  price );
			}	
		}
		else{
			var cnt = 0;
			total--;
			if ( ( cnt = seatPerson.get("청소년") ) > 0 ){
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
			$("#ticketTotalPrice").text(price);
			saveInfo.set("price",  price );
		}
	}
	function getTotalSeat(){
		var cut = parseInt(numseat1.value) + parseInt(numseat2.value);
		return cut;
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
	function personcnt(n) {
		if( getTotalSeat() > limitNumSeat ){
			alert("선택할 수 있는 최대 좌석수는 "+limitNumSeat+"석 입니다.");
	    	if(n == 1)
	    		numseat1.value = seatSel1;
	    	else if(n == 2)
	    		numseat2.value = seatSel2;
			return;
		}
		
		if( total > 0 ) {
		    var txt;
		    if (confirm("좌석 인원수를 변경하면 선택한 좌석이 사라집니다. 계속 하시겠습니끼? ")) {
		    	seatReserveInit();
		    } 
		    else{
		    	if(n == 1)
		    		numseat1.value = seatSel1;
		    	else if(n == 2)
		    		numseat2.value = seatSel2;
		    }
		}
		if(n == 1)
			seatSel1 = numseat1.value;
		else if(n == 2)
			seatSel2 = numseat2.value;
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
			//total=total+1;
			$("#"+n).css("background-image","url(/cinephile/img/alp/select.JPG)", "no-repeat");
			seatInfo.set(n, 'y');	
			seatPersonCount(true);
			$('#info2 *').remove();
			displayClickSeat();
		}
		else if( seatInfo.get(n) == 'y' ) {
			$("#"+n).css("background-image","url(/cinephile/img/alp/notsel.JPG)", "no-repeat");
			//total=total-1;
			seatInfo.delete(n);
			seatPersonCount(false);
			$('#info2 *').remove();
			displayClickSeat();
		}
	}

	function seatReserveInit(){
		total = 0;
		seatPerson.set("성인", 0 );
		seatPerson.set("청소년",  0 );
		$('#info2 *').remove();
		$('#info3 *').remove();
		//initClickSeat();
		//$("#ticketTotalPrice").text(0);
	}
	function reserveInform(){
		
	 	if(total == 0){
			alert("좌석을 선택해 주세요.");
			return false;
		} 
		
		//saveInfo.get("movieName");
		//saveInfo.get("cinemaName");
		
		//frm3.msno_reid.value = saveInfo.get("msno");
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
</script>
</head>
<body>
	<!-- 성인<input type="number" name="acnt" max="10" min="0" onclick="humanChk()">
	아이<input type="number" name="acnt" max="10" min="0" onclick="humanChk()"> -->

	<p class="seat_ex" align="center">인원을 선택해 주세요.</p> 


	<div align="center">
	<label>성인</label>
	<select id="numseat1" onchange="personcnt(1)">
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
	<select id="numseat2" onchange="personcnt(2)">
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

<div>
	<div class="seat" id="seat" align="left">
		<img alt="라인" src="${path }/img/alp/a.JPG" width="20">
		<button onclick="btnClick('A1')" value="A1" id="A1" class="cssbt"><font color="white">1</font></button>
		<button onclick="btnClick('A2')" value="A2" id="A2" class="cssbt"><font color="white">2</font></button>&emsp;&emsp;
		<button onclick="btnClick('A3')" value="A3" id="A3" class="cssbt"><font color="white">3</font></button>
		<button onclick="btnClick('A4')" value="A4" id="A4" class="cssbt"><font color="white">4</font></button>
		<button onclick="btnClick('A5')" value="A5" id="A5" class="cssbt"><font color="white">5</font></button>
		<button onclick="btnClick('A6')" value="A6" id="A6" class="cssbt"><font color="white">6</font></button>&emsp;&emsp;
		<button onclick="btnClick('A7')" value="A7" id="A7" class="cssbt"><font color="white">7</font></button>
		<button onclick="btnClick('A8')" value="A8" id="A8" class="cssbt"><font color="white">8</font></button>
	
		<br>
		<img alt="라인" src="${path }/img/alp/b.JPG" width="20">
		<button onclick="btnClick('B1')" value="B1" id="B1" class="cssbt"><font color="white">1</font></button>
		<button onclick="btnClick('B2')" value="B2" id="B2" class="cssbt"><font color="white">2</font></button>&emsp;&emsp;
		<button onclick="btnClick('B3')" value="B3" id="B3" class="cssbt"><font color="white">3</font></button>
		<button onclick="btnClick('B4')" value="B4" id="B4" class="cssbt"><font color="white">4</font></button>
		<button onclick="btnClick('B5')" value="B5" id="B5" class="cssbt"><font color="white">5</font></button>
		<button onclick="btnClick('B6')" value="B6" id="B6" class="cssbt"><font color="white">6</font></button>&emsp;&emsp;
		<button onclick="btnClick('B7')" value="B7" id="B7" class="cssbt"><font color="white">7</font></button>
		<button onclick="btnClick('B8')" value="B8" id="B8" class="cssbt"><font color="white">8</font></button>
		<br>

		<img alt="라인" src="${path }/img/alp/c.JPG" width="20">
		<button onclick="btnClick('C1')" value="C1" id="C1" class="cssbt"><font color="white">1</font></button>
		<button onclick="btnClick('C2')" value="C2" id="C2" class="cssbt"><font color="white">2</font></button>&emsp;&emsp;
		<button onclick="btnClick('C3')" value="C3" id="C3" class="cssbt"><font color="white">3</font></button>
		<button onclick="btnClick('C4')" value="C4" id="C4" class="cssbt"><font color="white">4</font></button>
		<button onclick="btnClick('C5')" value="C5" id="C5" class="cssbt"><font color="white">5</font></button>
		<button onclick="btnClick('C6')" value="C6" id="C6" class="cssbt"><font color="white">6</font></button>&emsp;&emsp;
		<button onclick="btnClick('C7')" value="C7" id="C7" class="cssbt"><font color="white">7</font></button>
		<button onclick="btnClick('C8')" value="C8" id="C8" class="cssbt"><font color="white">8</font></button>
		<br>

		<div><img alt="라인" src="${path }/img/alp/d.JPG" width="20">
		<button onclick="btnClick('D1')" value="D1" id="D1" class="cssbt"><font color="white">1</font></button>
		<button onclick="btnClick('D2')" value="D2" id="D2" class="cssbt"><font color="white">2</font></button>&emsp;&emsp;
		<button onclick="btnClick('D3')" value="D3" id="D3" class="cssbt"><font color="white">3</font></button>
		<button onclick="btnClick('D4')" value="D4" id="D4" class="cssbt"><font color="white">4</font></button>
		<button onclick="btnClick('D5')" value="D5" id="D5" class="cssbt"><font color="white">5</font></button>
		<button onclick="btnClick('D6')" value="D6" id="D6" class="cssbt"><font color="white">6</font></button>&emsp;&emsp;
		<button onclick="btnClick('D7')" value="D7" id="D7" class="cssbt"><font color="white">7</font></button>
		<button onclick="btnClick('D8')" value="D8" id="D8" class="cssbt"><font color="white">8</font></button>
		</div><br>

		<img alt="라인" src="${path }/img/alp/e.JPG" width="20">
		<button onclick="btnClick('E1')" value="E1" id="E1" class="cssbt"><font color="white">1</font></button>
		<button onclick="btnClick('E2')" value="E2" id="E2" class="cssbt"><font color="white">2</font></button>&emsp;&emsp;
		<button onclick="btnClick('E3')" value="E3" id="E3" class="cssbt"><font color="white">3</font></button>
		<button onclick="btnClick('E4')" value="E4" id="E4" class="cssbt"><font color="white">4</font></button>
		<button onclick="btnClick('E5')" value="E5" id="E5" class="cssbt"><font color="white">5</font></button>
		<button onclick="btnClick('E6')" value="E6" id="E6" class="cssbt"><font color="white">6</font></button>&emsp;&emsp;
		<button onclick="btnClick('E7')" value="E7" id="E7" class="cssbt"><font color="white">7</font></button>
		<button onclick="btnClick('E8')" value="E8" id="E8" class="cssbt"><font color="white">8</font></button>
		<br>

		<img alt="라인" src="${path }/img/alp/f.JPG" width="20">
		<button onclick="btnClick('F1')" value="F1" id="F1" class="cssbt">1</button>
		<button onclick="btnClick('F2')" value="F2" id="F2" class="cssbt">2</button>
		<button onclick="btnClick('F3')" value="F3" id="F3" class="cssbt">3</button>
		<button onclick="btnClick('F4')" value="F4" id="F4" class="cssbt">4</button>
		<button onclick="btnClick('F5')" value="F5" id="F5" class="cssbt">5</button>
		<button onclick="btnClick('F6')" value="F6" id="F6" class="cssbt">6</button>
		<button onclick="btnClick('F7')" value="F7" id="F7" class="cssbt">7</button>
		<button onclick="btnClick('F8')" value="F8" id="F8" class="cssbt">8</button>
		<br>

		<img alt="라인" src="${path }/img/alp/g.JPG" width="20">
		<button onclick="btnClick('G1')" value="G1" id="G1" class="cssbt">1</button>
		<button onclick="btnClick('G2')" value="G2" id="G2" class="cssbt">2</button>
		<button onclick="btnClick('G3')" value="G3" id="G3" class="cssbt">3</button>
		<button onclick="btnClick('G4')" value="G4" id="G4" class="cssbt">4</button>
		<button onclick="btnClick('G5')" value="G5" id="G5" class="cssbt">5</button>
		<button onclick="btnClick('G6')" value="G6" id="G6" class="cssbt">6</button>
		<button onclick="btnClick('G7')" value="G7" id="G7" class="cssbt">7</button>
		<button onclick="btnClick('G8')" value="G8" id="G8" class="cssbt">8</button>
		<br>

		<img alt="라인" src="${path }/img/alp/h.JPG" width="20">
		<button onclick="btnClick('H1')" value="H1" id="H1" class="cssbt">1</button>
		<button onclick="btnClick('H2')" value="H2" id="H2" class="cssbt">2</button>
		<button onclick="btnClick('H3')" value="H3" id="H3" class="cssbt">3</button>
		<button onclick="btnClick('H4')" value="H4" id="H4" class="cssbt">4</button>
		<button onclick="btnClick('H5')" value="H5" id="H5" class="cssbt">5</button>
		<button onclick="btnClick('H6')" value="H6" id="H6" class="cssbt">6</button>
		<button onclick="btnClick('H7')" value="H7" id="H7" class="cssbt">7</button>
		<button onclick="btnClick('H8')" value="H8" id="H8" class="cssbt">8</button>
		<br>

		<img alt="라인" src="${path }/img/alp/i.JPG" width="20">
		<button onclick="btnClick('I1')" value="I1" id="I1" class="cssbt">1</button>
		<button onclick="btnClick('I2')" value="I2" id="I2" class="cssbt">2</button>
		<button onclick="btnClick('I3')" value="I3" id="I3" class="cssbt">3</button>
		<button onclick="btnClick('I4')" value="I4" id="I4" class="cssbt">4</button>
		<button onclick="btnClick('I5')" value="I5" id="I5" class="cssbt">5</button>
		<button onclick="btnClick('I6')" value="I6" id="I6" class="cssbt">6</button>
		<button onclick="btnClick('I7')" value="I7" id="I7" class="cssbt">7</button>
		<button onclick="btnClick('I8')" value="I8" id="I8" class="cssbt">8</button>
		<br>

		<img alt="라인" src="${path }/img/alp/j.JPG" width="20">
		<button onclick="btnClick('J1')" value="J1" id="J1" class="cssbt">1</button>
		<button onclick="btnClick('J2')" value="J2" id="J2" class="cssbt">2</button>
		<button onclick="btnClick('J3')" value="J3" id="J3" class="cssbt">3</button>
		<button onclick="btnClick('J4')" value="J4" id="J4" class="cssbt">4</button>
		<button onclick="btnClick('J5')" value="J5" id="J5" class="cssbt">5</button>
		<button onclick="btnClick('J6')" value="J6" id="J6" class="cssbt">6</button>
		<button onclick="btnClick('J7')" value="J7" id="J7" class="cssbt">7</button>
		<button onclick="btnClick('J8')" value="J8" id="J8" class="cssbt">8</button>
		<br>
	</div>
	<div class="col-lg-4 col-md-6" align="right">
	<form action="payment" onSubmit="return reserveInform()" method="post" name="frm3">
		<input type="hidden" name="mv_num" value="${movie.mv_num}">
		<input type="hidden" name="mv_name" value="${movie.mv_name}">
		<input type="hidden" name="local" value="${cgvcode.local}">
		<input type="hidden" name="date" value="${date}">
		<input type="hidden" name="numAdult">
		<input type="hidden" name="numTeenager">
		<input type="hidden" name="numChild">
		<input type="hidden" name="price">
		<input type="hidden" name="numSeat" id="numSeat">
			<div class="as-item">
				<div class="as-pic">
					<img src="${movie.mv_imageurl }" width="100" alt="">
					<div class="rating-point">${movie.mv_rate }</div>
				</div>
				<div class="as-text">
					<div class="at-title">
						<h6>${movie.mv_name }</h6>
						<div class="rating-star">
						</div>
					</div>
					<ul id="info3">
		    		</ul>
		    		<ul id="info2">
		
		    		</ul>
		    		<p class="price">
			<strong id="ticketTotalPrice"></strong>원
		</p>
		<div class="bt" align="center">
			<!-- <button type="button" data-toggle="modal" data-target="#myModal2" class="btn btn-default"  style="background-color: #503396; color: white; border: 0;"> -->
			<button class="primary-btn" type="submit" style="border:none;"><img alt="" src="${path }/img/payment_icon.png"> 카카오 결제</button>
			<!-- <a href="#" class="primary-btn">결제하기</a>-->
		</div>
				</div>
			</div>
		</form>
	</div>
</div>
                    
</body>
</html>