package com.ch.cinephile.model;

import java.sql.Date;

import lombok.Data;

@Data
public class Monologue {
	int mo_num;
	String c_id;
	String mo_content;
	int mo_good;
	Date mo_regdate;
	String mo_del;
}
