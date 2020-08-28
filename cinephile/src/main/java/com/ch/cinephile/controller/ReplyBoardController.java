package com.ch.cinephile.controller;
import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ch.cinephile.model.Board;
import com.ch.cinephile.model.ReplyBoard;
import com.ch.cinephile.service.BoardService;
import com.ch.cinephile.service.ReplyBoardService;
@Controller
public class ReplyBoardController {
	@Autowired
	private BoardService bs;
	@Autowired
	private ReplyBoardService rbs;
	@RequestMapping("/replyList/bno/{bno}")
	public String replyList(@PathVariable int bno, Model model) {
//		System.out.println("bno = "+bno);
		Board board = bs.select(bno);
		Collection<ReplyBoard> rbdList = rbs.list(bno);
//		System.out.println("size = "+rbdList.size());
		model.addAttribute("board", board);
		model.addAttribute("rbdList", rbdList);
		return "/board/replyList";
	}
	@RequestMapping("/rInsert")
	public String rInsert(ReplyBoard rb) {
		rbs.insert(rb);
		return "redirect:/replyList/bno/"+rb.getBno();
	}
	@RequestMapping("/rUpdate")
	public String rUpdate(ReplyBoard rb) {
		rbs.update(rb);
		return "redirect:/replyList/bno/"+rb.getBno();
	}
	@RequestMapping("/rDelete")
	public String rDelete(ReplyBoard rb) {
		rbs.delete(rb.getRno());
		return "redirect:/replyList/bno/"+rb.getBno();
	}
	
	
	
	
}