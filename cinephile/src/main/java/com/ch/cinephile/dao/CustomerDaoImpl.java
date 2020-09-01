package com.ch.cinephile.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ch.cinephile.model.Customer;

@Repository
public class CustomerDaoImpl implements CustomerDao {
	@Autowired
	private SqlSessionTemplate sst;

	@Override
	public Customer select(String c_id) {
		return sst.selectOne("customerns.selectCid",c_id);
	}

	@Override
	public int insert(Customer customer) {
		return sst.insert("customerns.insert",customer);
	}

	@Override
	public List<Customer> getCustomerList(int start) {
		return sst.selectList("customerns.getCustomerList",start);
	}

	@Override
	public int getTotalCustomer() {
		return sst.selectOne("customerns.getTotalCustomer");
	}
	public String getNickname(String fid) {
		return sst.selectOne("customerns.getNickname", fid);
	}
}
