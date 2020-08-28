<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function rDelete(bno, rno) {
		var sendData = 'bno='+bno+'&rno='+rno;
		$.post('${path}/rDelete',sendData, function(data) {
			alert("댓글이 삭제 되었습니다");
			$('#rbdListDisp').html(data);
		});
	}
	function rUpdate(bno, rno) {
/* 		input, textarea을 읽을 때는 val()
		td을 읽을 때는 text() */
		var txt = $('#td_'+rno).text();
		// 읽은 글을 편집할 수 있도록 textarea에 입력
		$('#td_'+rno).html("<textarea rows='3' colos='30' id='rt'>"+
				txt+"</textarea>");
		$('#btn_'+rno).html("<button onclick='up("+bno+","+rno+
				")' class='btn btn-sm btn-danger'>확인</button> "+
				"<button onclick='lst("+bno+
				")' class='btn btn-sm btn-info'>취소</button>");
	}
	function up(bno,rno) {
		var sendData = "replytext="+$('#rt').val()+"&bno="+bno+"&rno="+rno;
		$.post('${path}/rUpdate',sendData, function(data) {
			alert('수정 되었습니다');
			$('#rbdListDisp').html(data);
		});
	}
	function lst(bno) {
		$('#rbdListDisp').load('${path}/replyList/bno/'+bno);
	}
</script>
</head>
<body>
	<c:if test="${not empty rbdList }">
		<table class="table table-striped">
			<tr><td>작성자</td>
				<td>내용</td>
				<td>수정일</td>
				<td></td></tr>
			<c:forEach var="rbd" items="${rbdList}">
				<c:if test="${rbd.del == 'y' }">
					<tr>
						<td colspan="4">삭제된 댓글입니다</td>
					</tr>
				</c:if>
				<c:if test="${rbd.del != 'y' }">
					<tr>
						<td>${rbd.replyer }</td>
						<td id="td_${rbd.rno }">${rbd.replytext }</td>
						<td>${rbd.updatedate}</td>
						<td id="btn_${rbd.rno}">
							<!-- 원래는 댓글 작성자와 로그인한 사람과 비교  회원 게시판이 아니라 임시로 게시작성자 비교 --> 
							<c:if test="${rbd.replyer==board.cId }">
								<button class="btn btn-warning btn-sm" onclick="rUpdate(${rbd.bno},${rbd.rno})">수정</button>
								<button class="btn btn-danger btn-sm" onclick="rDelete(${rbd.bno},${rbd.rno})">삭제</button>
							</c:if>
						</td>
				</c:if>
			</c:forEach>
		</table>
	</c:if>
</body>
</html>