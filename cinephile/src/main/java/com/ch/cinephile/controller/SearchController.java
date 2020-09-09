package com.ch.cinephile.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ch.cinephile.model.Board;
import com.ch.cinephile.model.Movie;
import com.ch.cinephile.service.BoardService;
import com.ch.cinephile.service.MovieService;


@Controller
public class SearchController {
	@Autowired
	private MovieService ms;
	@Autowired
	private BoardService bs;
	@RequestMapping("t_search")
	public String search(String keyword, Model model, Board board, Movie movie, HttpServletRequest request) {
		//리뷰게시판 검색
		board.setKeyword(keyword);
		Collection<Board> rbList = bs.rbList(board);
		model.addAttribute("rbList", rbList);
		
		//영화 검색
		movie.setKeyword(keyword);
		Collection<Movie> mvList = ms.mvList(movie);
		model.addAttribute("mvList", mvList);
		return "searchPage";
	}
}