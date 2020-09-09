package com.ch.cinephile.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ch.cinephile.model.Book;

@Repository
public class BookDaoImpl implements BookDao{
	@Autowired
	private SqlSessionTemplate sst;
	public void insert(Book book) {
		sst.insert("bookns.insert", book);
	}
	public List<Book> searchall(String c_id) {
		return sst.selectList("bookns.searchAll", c_id);
	}
}
