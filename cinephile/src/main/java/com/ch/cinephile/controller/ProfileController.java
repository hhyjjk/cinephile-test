package com.ch.cinephile.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ch.cinephile.model.Book;
import com.ch.cinephile.model.Customer;
import com.ch.cinephile.model.Monologue;
import com.ch.cinephile.model.Movie;
import com.ch.cinephile.service.BookService;
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
	@Autowired
	private BookService bs;
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
	@RequestMapping("bookChk")
	public String bookChk(HttpSession session, Model model) {
		String c_id=(String) session.getAttribute("c_id");
		List<Book> bList= bs.searchall(c_id);
		model.addAttribute("bList", bList);
		return "profile/bookChk";
	}
	@RequestMapping("updateForm")
	public String cusUpdateForm(String c_id,Model model) {
		Customer customer=cts.select(c_id);
		model.addAttribute("customer", customer);
		return "profile/updateForm";
	}
	@RequestMapping(value="passChk",produces="text/html;charset=utf-8")
	@ResponseBody public String passChk(String c_password,String c_id) {
		String msg = ""; 
		String nowpass = cts.passwordChk(c_id);
		if (nowpass.equals(c_password))
			msg="비밀번호가 맞습니다."; 
		else
			msg="비밀번호가 틀립니다."; 
		return msg; 
	}
	@RequestMapping(value="cusUpdate",method=RequestMethod.POST)
	public String update(Customer customer,String c_password2,Model model) {
		int result=0;
		Customer cus=cts.select(customer.getC_nickname());
		if(cus!=null&&!cus.getC_id().equals(customer.getC_id())) {
			result=-1;
			model.addAttribute("result", result);
			return "profile/update";
		}
		String nowpass = cts.passwordChk(customer.getC_id());
		if (!nowpass.equals(c_password2)) {
			result=-1;
			model.addAttribute("result", result);
			return "profile/update";
		}
		result=cts.update(customer);
		model.addAttribute("result", result);
		return "profile/update";
	}
}
