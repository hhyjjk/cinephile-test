package com.ch.cinephile.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class FavoritezipDaoImpl implements FavoritezipDao{
	@Autowired
	SqlSessionTemplate sst;
	@Override
	public int insert(String c_id) {
		return sst.insert("favoritezipns.insert",c_id);
	}
	@Override
	public int selectZipnum(String c_id) {
		return sst.selectOne("favoritezipns.selectZipnum", c_id);
	}

}
