package com.ch.cinephile.dao;
import java.util.Collection;

import com.ch.cinephile.model.Board;

public interface BoardDao {
//	int getTotal();
	int getTotal(Board board);
//	Collection<Board> list(int startRow, int endRow);
	Collection<Board> list(Board board);
	int insert(Board board);
	Board select(int bNum);
	void updateReadCount(int bNum);
	int update(Board board);
	int delete(int bNum);
	int maxNum();
	void updateStep(Board board);
	
	// 통합검색
	Collection<Board> rbList(Board board);

}