package com.ch.cinephile.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ch.cinephile.dao.CustomerDao;
import com.ch.cinephile.model.Customer;

@Service
public class CustomerServiceImpl implements CustomerService {
	@Autowired
	private CustomerDao cd;

	@Override
	public Customer select(String c_id) {
		return cd.select(c_id);
	}
	@Override
	public int insert(Customer customer) {
		return cd.insert(customer);
	}
	@Override
	public List<Customer> getCustomerList(int start) {
		return cd.getCustomerList(start);
	}
	@Override
	public int getTotalCustomer() {
		return cd.getTotalCustomer();
	}
	public String getNickname(String fid) {
		return cd.getNickname(fid);
	}
}
