package com.ch.cinephile.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ch.cinephile.model.Customer;

@Repository
public class AdminDaoImpl implements AdminDao{
	@Autowired
	private SqlSessionTemplate sst;

	@Override
	public String adminChk(Customer customer) {
		return sst.selectOne("customerns.adminChk",customer);
	}
}
