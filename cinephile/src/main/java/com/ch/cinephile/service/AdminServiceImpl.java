package com.ch.cinephile.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ch.cinephile.dao.AdminDao;
import com.ch.cinephile.model.Customer;

@Service
public class AdminServiceImpl implements AdminService {
	@Autowired
	private AdminDao ad;
	@Override
	public String adminChk(Customer customer) {
		return ad.adminChk(customer);
	}


	
}
