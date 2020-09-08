package com.ch.cinephile.dao;

import java.util.List;

import com.ch.cinephile.model.Customer;

public interface CustomerDao {

	Customer select(String c_id);

	int insert(Customer customer);

	List<Customer> getCustomerList(int start);

	int getTotalCustomer();

	String getNickname(String fid);

	String passwordChk(String c_id);

	int update(Customer customer);

}
