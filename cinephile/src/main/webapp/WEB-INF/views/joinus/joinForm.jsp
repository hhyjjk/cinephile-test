<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../header2.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
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
            document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
            
            if(roadAddr !== ''){
                document.getElementById("extraaddress").value = extraRoadAddr;
            } else {
                document.getElementById("extraaddress").value = '';
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
	
	function idChk(){
		if (!frm.c_id.value) { alert("아이디 필수 입력 후 중복체크바랍니다.");
		frm.c_id.focus(); return false;
		
		}
		$.post('idChk','c_id='+frm.c_id.value, function(data){
			$('#disp').html(data);
		});
	}
	
	function nickChk(){
		if (!frm.c_nickname.value) { alert("닉네임 필수 입력 후 중복체크바랍니다.");
		frm.c_nickname.focus(); return false;
		}
		$.post('nickChk','c_nickname='+frm.c_nickname.value, function(data){
			$('#disp2').html(data);
		});
	}
	function chk(){
		if(frm.c_id.value.length < 4 || frm.c_id.value.length > 12 ){
			
			alert("아이디는 4 ~ 12 글자내로 입력해주세요");
			frm.c_id.foucus();
			return false;
		}
		var reg_pw = /^.*(?=.{4,8})(?=.*[0-9])(?=.*[a-zA-Z])(?=.*[@!#$*()_&]).*$/; 
		if(!reg_pw.test(frm.c_password.value)){
			alert("4 ~ 8자 영문 대 소문자, 숫자, 특수문자를 사용하세요.");
			frm.c_password.focus();
			return false;
		}
		if (frm.c_password.value != frm.c_password2.value) {
			alert("암호와 암호확인이 다릅니다. 다시 입력해주세요.");
			frm.password.focus(); frm.password.value="";
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
<form action="join" name="frm" onsubmit="return chk()" method="post">
<table class="table table-boardered">
<caption class="text-primary">회원가입</caption>
	<tr><td>아이디</td>
	<td><input type="text" name="c_id" max="12" min="4" required="required" autofocus="autofocus">
	<input type="button" onclick="idChk()" class="btn btn-info btn-sm" value="중복체크">* 4~12자 &nbsp;
	<span id="disp" class="err"></span></td></tr>
	<tr><td>닉네임</td>
	<td><input type="text" name="c_nickname" required="required" >
	<input type="button" onclick="nickChk()" class="btn btn-info btn-sm" value="중복체크">
	<span id="disp2" class="err"></span></td></tr>
	<tr><td>암호</td><td><input type="password" name="c_password" max="12" min="4" required="required" >
	 * 4~8자의 영문, 숫자, 특수문자( ! # $ * ( ) _ = |) 조합 </td></tr>
	<tr><td>암호확인</td><td><input type="password" name="c_password2" max="12" min="4" required="required" ></td></tr>
	<tr><td>이름</td><td><input type="text" name="c_name" required="required" ></td></tr>
	<tr><td>우편번호</td><td><input type="text" id="postcode" readonly="readonly"></td></tr>
	<tr><td>주소</td><td><input type="text" name="c_address" id="address" readonly="readonly" required="required"><input type="button" onclick="addressOpen()" class="btn btn-info btn-sm" value="주소 검색"></td></tr>
	<tr><td>전화번호</td><td><input type="tel" name="c_tel" required="required" ></td></tr>
	<tr><td>이메일</td><td><input type="email" name="c_email" required="required" >
	<span id="disp3" class="err"></span></td></tr>
</table>
	<div class="button">
	<input type="submit" value="등록">&nbsp;
	<input type="reset" value="취소">&nbsp;<a href="main.html"></a>
	<a href="loginForm.html" class="btn btn-default">로그인</a>
	</div>
</form>
</div>
<span id="guide" style="color:#999;display:none"></span>
<input type="hidden" id="extraaddress" >
</body>
</html>