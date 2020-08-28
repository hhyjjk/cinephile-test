package com.ch.cinephile.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ch.cinephile.model.Cgvcode;

@Repository
public class CgvcodeDaoImpl implements CgvcodeDao{
	@Autowired
	private SqlSessionTemplate sst;

	public List<Cgvcode> searchThe() {
		return sst.selectList("cgvcodens.searchThe");
	}
}
