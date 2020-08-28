package com.ch.cinephile.service;
import java.util.Collection;

import com.ch.cinephile.model.Board;
public interface BoardService {
//	int getTotal();
	int getTotal(Board board);
//	Collection<Board> list(int startRow, int endRow);
	Collection<Board> list(Board board);
	int insert(Board board);
	void updateReadCount(int bNum);
	Board select(int bNum);
	int update(Board board);
	int delete(int bNum);
	int maxNum();
	void updateStep(Board board);
	
	// 통합검색
	Collection<Board> rbList(Board board);

}