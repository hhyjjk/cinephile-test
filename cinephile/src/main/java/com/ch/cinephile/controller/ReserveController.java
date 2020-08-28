package com.ch.cinephile.controller;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ch.cinephile.model.Cgvcode;
import com.ch.cinephile.model.Movie;

@Controller
public class ReserveController {
	
	@RequestMapping("/reserveSeat")
	public String reserveSeat(Movie movie,Cgvcode cgvcode,String date,Model model) {
		model.addAttribute("mv_name", movie.getMv_name());
		model.addAttribute("cgvcode",cgvcode);
		model.addAttribute("movie", movie);
		return "movie/reserveSeat";
	}
	
}
