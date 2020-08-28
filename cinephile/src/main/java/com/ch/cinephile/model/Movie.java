package com.ch.cinephile.model;

import lombok.Data;
@Data
public class Movie {
	private int mv_num;
	private String mv_name;
	private String mv_direct;
	private String mv_genre;
	private String mv_content;
	private String mv_mjactor;
	private String mv_minactor;
	private String mv_reldate;
	private float mv_rate;
	private int mv_runtime;
	private String mv_imageurl;
}
