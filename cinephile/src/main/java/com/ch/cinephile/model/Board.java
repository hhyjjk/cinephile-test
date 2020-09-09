package com.ch.cinephile.model;

import java.sql.Date;
import lombok.Data;

@Data 
public class Board {
	   private int b_num;
	   private int b_good;
	   private String c_id;
	   private String b_subject;
	   private String b_content;
	   private int b_readcount;
	   private int ref; // 아래 세 개 답변글
	   private int re_step;
	   private int re_level;
	   private String ip;  // 쓴 장소를 추적하기 위한 거
	   private Date b_regdate;
	   private String b_del;
	   private String b_type;
	   private String b_category;
	   // 페이징용
	   private int startRow;
	   private int endRow;
	   // 검색용
	   private String search;
	   private String keyword;

	}