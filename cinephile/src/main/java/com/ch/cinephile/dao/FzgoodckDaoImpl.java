package com.ch.cinephile.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ch.cinephile.model.Fzgoodck;

@Repository
public class FzgoodckDaoImpl implements FzgoodckDao{
	@Autowired
	SqlSessionTemplate sst;
	@Override
	public Fzgoodck searchId(String c_id) {
		return sst.selectOne("Fzgoodckns.searchId", c_id);
	}
}
