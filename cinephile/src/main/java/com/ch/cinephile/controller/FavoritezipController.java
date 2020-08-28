package com.ch.cinephile.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.RedirectView;

import com.ch.cinephile.model.Cfavorite;
import com.ch.cinephile.model.Movie;
import com.ch.cinephile.service.CfavoriteService;
import com.ch.cinephile.service.FavoritezipService;
import com.ch.cinephile.service.MovieService;

@Controller
public class FavoritezipController {
	@Autowired
	private FavoritezipService fs;
	@Autowired
	private CfavoriteService cs;
	@Autowired
	private MovieService ms;
	@RequestMapping("favoritechoice")
	public ModelAndView favoritechoice(int mv_num,Model model,HttpSession session) throws UnsupportedEncodingException {
		Movie movie=ms.searchMovienum(mv_num);
		String c_id=(String)session.getAttribute("c_id");
		int zipnum=fs.selectZipnum(c_id);
		Cfavorite cfavorite=cs.ckChoice(mv_num,zipnum);
		String encodedParam = URLEncoder.encode(movie.getMv_name(), "UTF-8");
		String url = "redirect:/movieInfo?mv_num="+mv_num+"&mv_name="+encodedParam;
		//ModelAndView mav= new ModelAndView();
		//mav.setView(new RedirectView("movieInfo?mv_num="+mv_num+"&mv_name="+movie.getMv_name()));
		if(cfavorite!=null) {
			cs.delete(mv_num,zipnum);
			return new ModelAndView(url);
			//return  mav;
		}
		else{
			cs.insert(mv_num,zipnum);
		}
		
		//ModelAndView mav new ModelAndView();
		//mav.setView(new RedirectView("/movieInfo?movie=movie"));
		return new ModelAndView(url);
		//return mav;
	}
}
