package com.ch.cinephile.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ch.cinephile.dao.BookDao;
import com.ch.cinephile.model.Book;

@Service
public class BookServiceImpl implements BookService{
	@Autowired
	private BookDao bd;

	@Override
	public void insert(Book book) {
		bd.insert(book);
	}
}
