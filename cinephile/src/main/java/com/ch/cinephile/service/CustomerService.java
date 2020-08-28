package com.ch.cinephile.service;

import java.util.List;

import com.ch.cinephile.model.Customer;

public interface CustomerService {

	Customer select(String c_id);

	int insert(Customer customer);

	List<Customer> getCustomerList(int start);

	int getTotalCustomer();

}
