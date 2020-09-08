<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header2.jsp" %>
<%@include file="../loginsessionck.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개인정보수정</title>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
function addressOpen(){
	new daum.Postcode({
        oncomplete: function(data) {
            var roadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ''; // 참고 항목 변수
            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraRoadAddr += data.bname;
            }
            if(data.buildingName !== '' && data.apartment === 'Y'){
               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            if(extraRoadAddr !== ''){
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('postcode').value = data.zonecode;
            document.getElementById("address").value = roadAddr;
            document.getElementById("jibunAddress").value = data.jibunAddress;
            
            if(roadAddr !== ''){
                document.getElementById("extraAddress").value = extraRoadAddr;
            } else {
                document.getElementById("extraAddress").value = '';
            }

            var guideTextBox = document.getElementById("guide");
            if(data.autoRoadAddress) {
                var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                guideTextBox.style.display = 'block';

            } else if(data.autoJibunAddress) {
                var expJibunAddr = data.autoJibunAddress;
                guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                guideTextBox.style.display = 'block';
            } else {
                guideTextBox.innerHTML = '';
                guideTextBox.style.display = 'none';
            }
        }
    }).open();
}
	
	function nickChk(){
		if (!frm.c_nickname.value) { alert("닉네임 필수 입력 후 중복체크바랍니다.");
		frm.c_nickname.focus(); return false;
		}
		$.post('nickChk','c_nickname='+frm.c_nickname.value, function(data){
			$('#disp2').html(data);
		});
	}
	function passChk(){
		if (!frm.c_password2.value) {
			alert("현재암호 필수 입력 후 암호확인바랍니다.");
			frm.c_password2.focus(); return false;
		}
		$.post('passChk','c_password='+frm.c_password2.value+'&c_id='+frm.c_id.value, function(data){
			$('#disp').html(data);
		});
	}
	function chk(){
		var reg_pw = /^.*(?=.{4,8})(?=.*[0-9])(?=.*[a-zA-Z])(?=.*[@!#$*()_&]).*$/; 
		if(!reg_pw.test(frm.c_password.value)){
			alert("4 ~ 8자 영문 대 소문자, 숫자, 특수문자를 사용하세요.");
			frm.c_password.focus();
			frm.c_password.value="";
			return false;
		}
		var reg_email = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
		if (!reg_email.test(frm.c_email.value)){
			alert("이메일 형식이 올바르지 않습니다.");
			frm.password.focus();
			return false;
		}
		if(!frm.c_address.value){
			alert("주소를 입력해주세요");
			return false;
		}
		return true;
	
                          

	}
/* 	function CheckEmail(str)
		{                                                 
		     var c_email =document.getElementById("c_email").value;
		     var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
		     if(exptext.test(c_email)==false){
		    	 alert("이 메일형식이 올바르지 않습니다.");
					document.addjoin.c_email.focus();
					return false;
				}
			} */
</script>
</head>
<body>
<div class="container">
<form action="cusUpdate" name="frm" onsubmit="return chk()" method="post">
<table class="table table-boardered">
<caption class="text-primary">개인정보 수정</caption>
	<tr><td>아이디</td>
	<td><input type="text" name="c_id" max="12" min="4" readonly="readonly" value="${customer.c_id }"></td></tr>
	<tr><td>닉네임</td>
	<td><input type="text" name="c_nickname" required="required" value="${customer.c_nickname }">
	<input type="button" onclick="nickChk()" class="btn btn-info btn-sm" value="중복체크">
	<span id="disp2" class="err"></span><span style=" font-size:small; color: red;">*현재 닉네임은 중복 사용 가능</span></td></tr>
	<tr><td>현재 암호</td>
	<td><input type="password" name="c_password2" max="12" min="4" required="required" >
	<input type="button" onclick="passChk()" class="btn btn-info btn-sm" value="암호확인">
	<span id="disp" class="err"></span></td></tr>
	<tr><td>변경할 암호</td><td><input type="password" name="c_password" max="12" min="4" required="required">
	* 4~8자의 영문, 숫자, 특수문자( ! # $ * ( ) _ = |) 조합 <span style=" font-size:small; color: red;">*변경하고싶지 않을시 현재 비밀번호</span> </td></tr>
	<tr><td>이름</td><td><input type="text" name="c_name" required="required" value="${customer.c_name }"></td></tr>
	<tr><td>우편번호</td><td><input type="text" id="postcode" readonly="readonly">  </td></tr>
	<tr><td>주소</td><td><input type="text" name="c_address" id="address" readonly="readonly" required="required" value="${customer.c_address }"><input type="button" onclick="addressOpen()" class="btn btn-info btn-sm" value="주소 검색"></td></tr>
	<tr><td>전화번호</td><td><input type="tel" name="c_tel" required="required" value="${customer.c_tel }"></td></tr>
	<tr><td>이메일</td><td><input type="email" name="c_email" required="required" value="${customer.c_email }">
	<span id="disp3" class="err"></span></td></tr>
</table>
	<div class="button">
	<input type="submit" value="등록">&nbsp;
	<input type="reset" value="취소">&nbsp;<a href="main.html"></a>
	</div>
</form>

</div>
<input type="hidden" id="jibunAddress">
<span id="guide" style="color:#999;display:none"></span>
<input type="hidden" id="detailAddress">
<input type="hidden" id="extraAddress">
</body>
</html>