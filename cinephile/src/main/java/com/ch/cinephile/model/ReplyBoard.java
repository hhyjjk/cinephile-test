package com.ch.cinephile.model;
import java.sql.Date;
import lombok.Getter;
import lombok.Setter;
@Getter
@Setter
public class ReplyBoard {
	private int rno;   // 댓글 번호 1씩증가
	private int bno;   // 게시글번호
	private String replytext; // 댓글
	private String replyer;   // 댓글 작성자
	private Date regdate;     // 댓글 작성일
	private Date updatedate;  // 댓글 수정일
	private String del;       // 삭제 여부
}
