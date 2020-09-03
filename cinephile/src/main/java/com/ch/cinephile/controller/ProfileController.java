package com.ch.cinephile.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ch.cinephile.model.Customer;
import com.ch.cinephile.model.Monologue;
import com.ch.cinephile.model.Movie;
import com.ch.cinephile.service.CfavoriteService;
import com.ch.cinephile.service.CustomerService;
import com.ch.cinephile.service.FavoritezipService;
import com.ch.cinephile.service.MonologueService;
import com.ch.cinephile.service.MovieService;

@Controller
public class ProfileController {
	@Autowired
	private FavoritezipService fs;
	@Autowired
	private CfavoriteService cs;
	@Autowired
	private MovieService ms;
	@Autowired
	private MonologueService mls;
	@Autowired
	private CustomerService cts;
	@RequestMapping("profileMain")
	public String profileMain(String c_id,Model model) {
		//취향집 찾기
		int zipnum=fs.selectZipnum(c_id);
		List<Integer> fList=cs.getCustomer(zipnum);
		List<Movie> mList= new ArrayList<Movie>();
		for(int i=0;i<fList.size();i++) {
			mList.add(ms.getMovie(fList.get(i)));
			
		}
		model.addAttribute("mList", mList);
		
		//모놀로그 찾기
		List<Monologue> mlList=mls.getForCid(c_id);
		model.addAttribute("mlList", mlList);
		return "profile/profileMain";
	}
	@RequestMapping("profileOther")
	public String profileOther(String c_id,Model model) {
		Customer customer=cts.select(c_id);
		customer.setC_password("");
		int zipnum=fs.selectZipnum(c_id);
		List<Integer> fList=cs.getCustomer(zipnum);
		List<Movie> mList= new ArrayList<Movie>();
		for(int i=0;i<fList.size();i++) {
			mList.add(ms.getMovie(fList.get(i)));
			
		}
		model.addAttribute("mList", mList);
		
		//모놀로그 찾기
		List<Monologue> mlList=mls.getForCid(c_id);
		model.addAttribute("mlList", mlList);
		
		model.addAttribute("customer", customer);
		return "profile/profileOther";
	}
}
