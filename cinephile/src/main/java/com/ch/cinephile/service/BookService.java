package com.ch.cinephile.service;

import java.util.List;

import com.ch.cinephile.model.Book;

public interface BookService {

	void insert(Book book);

	List<Book> searchall(String c_id);

}
