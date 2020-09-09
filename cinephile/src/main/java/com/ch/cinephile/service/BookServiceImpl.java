package com.ch.cinephile.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ch.cinephile.dao.BookDao;
import com.ch.cinephile.model.Book;

@Service
public class BookServiceImpl implements BookService{
	@Autowired
	private BookDao bd;

	public void insert(Book book) {
		bd.insert(book);
	}
	public List<Book> searchall(String c_id) {
		return bd.searchall(c_id);
	}
}
