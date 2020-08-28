<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title>
<!-- <script type="text/javascript">
	function chk() {
		if (frm.password.value != frm.password2.value) {
			alert("암호가 다릅니다");		
			frm.password.focus();
			frm.password.value = "";	
			return false;
		}
	}
</script> -->
</head>
<body>
<div class="container">
	<form action="${path}/delete" name="frm" onsubmit="return chk()">
		<input type="hidden" name="bNum" value="${board.bNum }">
		<%-- <input type="hidden" name="password2" value="${board.password}"> --%>
		<input type="hidden" name="pageNum" value="${pageNum}">
			<table class="table table-bordered">
				<!-- <tr><th>암호</th><td><input type="password" name="password" required="required" autofocus="autofocus"></td></tr> -->
				<tr><th colspan="2"><input type="submit"></th></tr>
			</table>
	</form>
</div>
</body>
</html>