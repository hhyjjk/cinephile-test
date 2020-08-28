package com.ch.cinephile.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ch.cinephile.model.Mogoodck;
import com.ch.cinephile.service.MogoodckService;
import com.ch.cinephile.service.MonologueService;

@Controller
public class MonologueController {
	@Autowired
	private MonologueService ms;
	@Autowired
	private MogoodckService mgs;
	@RequestMapping("monoWrite")
	public String monoWrite(String contents, String c_id) {
		ms.write(c_id,contents);
		return "redirect:/main";
		
	}
	@RequestMapping("monologuegood")
	public String monologuegood(Mogoodck mogoodck) {
		if(mgs.selectMonum(mogoodck)!=null) {
			mgs.delete(mogoodck);
			ms.gooddown(mogoodck.getMo_num());
		}
		else {
			mgs.insert(mogoodck);
			ms.goodup(mogoodck.getMo_num());
		}
		return "redirect:/main";
	}
}
