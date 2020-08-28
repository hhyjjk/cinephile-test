<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(function() {
		//$('#boardListDisp').load('${path}/list/pageNum/${pageNum}');
		$('#rbdListDisp').load('${path}/replyList/bno/${board.bNum}');
		$('#rInsert').click(function() {
			/* 			var sendData = 'bno='+frm.bno.value+
			 '&replyer='+frm.replyer.value+
			 '&replytext='+frm.replytext.value; */
			var sendData = $('#frm').serialize();
			$.post('${path}/rInsert', sendData, function(data) {
				alert('댓글이 작성 되었습니다');
				$('#rbdListDisp').html(data);
				frm.replytext.value = "";
			});
		});
	});
</script>
</head>
<body>
	<div class="container" align="center">
		<table class="table table-hover">
			<caption class="text-primary">게시글 상세 내역</caption>
			<tr><td>제목</td>
				<td>${board.bSubject }</td></tr>
			<tr><td>작성자</td>
				<td>${board.cId }</td></tr>
			<tr><td>내용</td>
				<td>${board.bContent }</td></tr>
			<%-- <tr><td>이메일</td>
				<td>${board.email }</td></tr> --%>
			<tr><td>조회수</td>
				<td>${board.bReadcount }</td></tr>
			<tr><td>작성일</td>
				<td>${board.bRegdate }</td></tr>
			<tr align="center"><td colspan="2"><a href="${path}/list/pageNum/${pageNum}" class="btn btn-info">게시글 목록</a> 
				<a href="${path}/updateForm/bNum/${board.bNum}/pageNum/${pageNum}" class="btn btn-warning">수정</a> 
				<a href="${path}/deleteForm/bNum/${board.bNum}/pageNum/${pageNum}" class="btn btn-danger">삭제</a> 
				<%-- <a	href="${path}/insertForm/nm/${board.num}/pageNum/${pageNum}" class="btn btn-success">답글</a></td> --%>
		</table>
		<form action="" name="frm" id="frm">
			<input type="hidden" name="bno" value="${board.bNum}">
				<table class="table table-hover">
					<caption>댓글 작성</caption>
					<!-- 회원 게시글인 경우는 작성자는 로그인 한 사람의 이름 또는 id -->
						<tr><td>작성자</td><td><input type="text" name="replyer" value="${board.cId}" size="4"></td>
							<td>댓글</td>	<td><textarea rows="3" cols="30" name="replytext"></textarea></td>
							<td><input type="button" value="댓글입력" id="rInsert"></td></tr>
				</table>
		</form>
			<div id="rbdListDisp"></div>
		<!-- <div id="boardListDisp"></div> -->
	</div>
</body>
</html>


