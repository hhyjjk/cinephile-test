package com.ch.cinephile.service;

import java.util.Collection;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ch.cinephile.dao.BoardDao;
import com.ch.cinephile.model.Board;

@Service
public class BoardServiceImpl implements BoardService {
	@Autowired
	private BoardDao bd;
//	public int getTotal() {
//		return bd.getTotal();
//	}
	public int getTotal(Board board) {
		return bd.getTotal(board);
	}
//	public Collection<Board> list(int startRow, int endRow) {
//		return bd.list(startRow, endRow);
//	}
	public Collection<Board> list(Board board) {
		return bd.list(board);
	}
	public int insert(Board board) {
		return bd.insert(board);
	}
	public void updateReadCount(int bNum) {
		bd.updateReadCount(bNum);
		
	}
	public Board select(int bNum) {
		return bd.select(bNum);
	}
	public int update(Board board) {
		return bd.update(board);
	}
	public int delete(int bNum) {
		return bd.delete(bNum);
	}
	public int maxNum() {
		return bd.maxNum();
	}
	public void updateStep(Board board) {
		bd.updateStep(board);
	}
	
	// 통합검색
	public Collection<Board> rbList(Board board) {
		return bd.rbList(board);
	}
}

