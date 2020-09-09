package com.ch.cinephile.controller;

import java.io.Console;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ch.cinephile.model.Customer;
import com.ch.cinephile.service.AdminService;
import com.ch.cinephile.service.CustomerService;
import com.ch.cinephile.service.PagingBean;

@Controller
public class AdminController {
	@Autowired
	private AdminService as;
	@Autowired
	private CustomerService cs;

	// 관리자 로그인 화면
	@RequestMapping("a_loginForm")
	public String a_loginForm() {
		return "admin/a_loginForm";
	}

	// 관리자
	@RequestMapping("a_login")
	public String a_login(String c_id, String c_password, Model model, HttpSession session) {
		int result = 0;
		System.out.println(c_id);
		if (c_id.equals("master") && c_password.equals("1234")) {
			session.setAttribute("c_id", c_id);
			result = 1;
		}
		model.addAttribute("result", result);

		return "admin/a_login";
	}

	@RequestMapping("adMain")
	public String adMain(String c_id, Model model, HttpSession session) {
		session.getAttribute("c_id");
		return "admin/adMain";
	}

	@RequestMapping("a_logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "admin/a_loginForm";
	}

	//
	@RequestMapping("cinfoList")
	public String cinfoList(Model model, HttpServletRequest request, HttpSession session, String currentPage) {
		int total = cs.getTotalCustomer();
		System.out.println(total);
		int start = 1;
		if (currentPage != null && !currentPage.equals(""))
			start = Integer.parseInt(currentPage);
		/*
		 * List<Customer> customerList = cs.getCustomerList(start);
		 * 
		 * for(Customer clist:customerList) { System.out.println(clist.getC_id()); }
		 * 
		 * for(int i =0;i<customerList.size();i++ ) {
		 * System.out.println(customerList.get(i).getC_id()); }
		 */
		PagingBean pb = new PagingBean(request, total);
		System.out.println(pb);
		/* model.addAttribute("customerList", customerList); */
		model.addAttribute("pb", pb);
		
		return "admin/cinfoList";

	}
}
