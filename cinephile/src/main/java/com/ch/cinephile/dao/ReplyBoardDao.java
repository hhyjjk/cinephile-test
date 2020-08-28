package com.ch.cinephile.dao;
import java.util.Collection;
import com.ch.cinephile.model.ReplyBoard;
public interface ReplyBoardDao {
	Collection<ReplyBoard> list(int bno);
	void insert(ReplyBoard rb);
	void update(ReplyBoard rb);
	void delete(int rno);

}