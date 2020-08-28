<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html><html><head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <script type="text/javascript">
	function chk() {
		if (frm.password.value != frm.password2.value) {
			alert('암호와 암호확인이 다릅니다');
			frm.password.focus(); frm.password.value = "";
			return false;
		}
	}
</script> -->
</head>
<body>
	<div class="container">
		<form action="${path}/insert" method="post" name="frm" onsubmit="return chk()">
			<input type="hidden" name="ref" value="${ref}"> 
			<input type="hidden" name="re_level" value="${re_level}"> 
			<input type="hidden" name="re_step" value="${re_step}"> 
			<input type="hidden" name="bNum" value="${bNum}"> 
			<input type="hidden" name="pageNum" value="${pageNum}">
				<table class="table table-bordered">
					<caption>게시글 입력</caption>
						<c:if test="${bNum == 0}">
							<tr><td>제목</td>	<td><input type="text" name="bSubject" required="required" autofocus="autofocus"></td></tr>
						</c:if>
						<c:if test="${bNum != 0}">
							<tr><td>제목</td><td><input type="text" name="bSubject" required="required" autofocus="autofocus"></td></tr>
						</c:if>
				<!-- 회원 게시판일 경우에는 생략 시작 -->
				<!-- <tr><td>작성자</td><td><input type="text" name="writer" required="required"></td></tr>
				<tr><td>이메일</td><td><input type="email" name="email" required="required"></td></tr>
				<tr><td>암호</td><td><input type="password" name="password" required="required"></td>	</tr>
				<tr><td>암호확인</td><td><input type="password" name="password2" required="required"></td></tr> -->
				<!-- 회원 게시판일 경우에는 생략 끝 -->
				<tr><td>내용</td><td><textarea rows="5" cols="40" name="bContent"required="required"></textarea></td></tr>
				<tr><td colspan="2"><input type="submit" value="작성"></td></tr>
			</table>
		</form>
	</div>
</body>
</html>