package com.ch.cinephile.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.ch.cinephile.model.Customer;
import com.ch.cinephile.service.CustomerService;
import com.ch.cinephile.service.FavoritezipService;


@Controller
public class CustomerController {
	@Autowired
	private CustomerService cs;
	@Autowired
	private FavoritezipService fs;
	@RequestMapping("loginForm")
	public String loginForm() {
		return "joinus/loginForm";
	}
	
	@RequestMapping("login")
	public String login(Customer customer, Model model, HttpSession session) {
		int result=0;
		Customer customerChk = cs.select(customer.getC_id());
		if (customerChk == null || customerChk.getC_del()!='n') 
			result = -1;
		else if (customerChk.getC_password().equals(customer.getC_password())) {
			result = 1;
			session.setAttribute("c_id", customer.getC_id());
		}
		model.addAttribute("result",result);
		return "joinus/login";
	}
	@RequestMapping("joinForm")
	public String joinForm() {
		return "joinus/joinForm";
	}
	
	
	  @RequestMapping(value="idChk",produces="text/html;charset=utf-8")
	  @ResponseBody public String idChk(String c_id) { 
		  String msg = ""; 
		  Customer customer = cs.select(c_id);
		  if (customer == null) msg="사용가능한 ID입니다."; 
		  else  msg="이미 있으니 다른 ID를 사용하시오"; 
		  return msg; 
	  }
	 
	  @RequestMapping(value="nickChk",produces="text/html;charset=utf-8")
	  @ResponseBody public String nickChk(String c_nickname) { 
		  String msg = ""; 
		  Customer customer = cs.select(c_nickname);
		  if (customer == null)
			  msg="사용가능한 닉네임입니다."; 
		  else  msg="이미 있으니 다른 닉네임을 사용하시오"; 
		  return msg; 
	  }
	  @RequestMapping(value="join",method=RequestMethod.POST ) 
	  public String join(Customer customer, Model model) { 
			  int result=0;
			  Customer customer2 =  cs.select(customer.getC_id()); 
			  if(customer2 == null) { 
				  result=cs.insert(customer);
				  System.out.println(customer.getC_id());
				  int a=fs.insert(customer.getC_id());
			  } 
			  else  result=-1;
			  model.addAttribute("result",result); 
			  return "joinus/join"; 
			  }
	  @RequestMapping("logout")
	  public ModelAndView logout(HttpSession session) {
		  session.removeAttribute("c_id");
		  ModelAndView mav =new ModelAndView();
		  mav.setView(new RedirectView("/main"));
		  return mav;
	  }
			
}
