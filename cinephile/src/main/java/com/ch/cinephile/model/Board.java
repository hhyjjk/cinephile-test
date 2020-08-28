package com.ch.cinephile.model;

import java.sql.Date;
import lombok.Data;

@Data 
public class Board {
	private int bNum;
	private int bGood;
	private String cId;
	private String bSubject;
	private String bContent;
	private int bReadcount;
	private int ref; // 아래 세 개 답변글
	private int re_step;
	private int re_level;
	private String ip;  // 쓴 장소를 추적하기 위한 거
	private Date bRegdate;
	private String bDel;
	private String bType;
	private String bCategory;
	// 페이징용
	private int startRow;
	private int endRow;
	// 검색용
	private String search;
	private String keyword;

}
