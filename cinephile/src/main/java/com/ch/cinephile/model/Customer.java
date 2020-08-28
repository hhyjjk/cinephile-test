package com.ch.cinephile.model;

import java.sql.Date;

import lombok.Data;
@Data
public class Customer {
	private String c_id; 
	private String c_password; 
	private String c_name; 
	private String c_address;
	private String c_tel; 
	private String c_email; 
	private char c_del; 
	private Date c_regdate; 
	private String c_nickname; 
	//private MultipartFile c_proimg; 
	//private MultipartFile c_headerimg; 
	//private String c_probio;
	 
}
