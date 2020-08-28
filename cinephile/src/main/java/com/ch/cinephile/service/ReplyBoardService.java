package com.ch.cinephile.service;
import java.util.Collection;
import com.ch.cinephile.model.ReplyBoard;
public interface ReplyBoardService {
	Collection<ReplyBoard> list(int bno);
	void insert(ReplyBoard rb);
	void update(ReplyBoard rb);
	void delete(int rno);

}