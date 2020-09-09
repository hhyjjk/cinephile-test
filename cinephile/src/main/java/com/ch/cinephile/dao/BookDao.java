package com.ch.cinephile.dao;

import java.util.List;

import com.ch.cinephile.model.Book;

public interface BookDao {

	void insert(Book book);

	List<Book> searchall(String c_id);

}
