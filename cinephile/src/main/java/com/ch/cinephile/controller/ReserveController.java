package com.ch.cinephile.controller;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ch.cinephile.model.Book;
import com.ch.cinephile.model.Cgvcode;
import com.ch.cinephile.model.Movie;
import com.ch.cinephile.service.BookService;

@Controller
public class ReserveController {
	@Autowired
	private BookService bs;
	@RequestMapping("/reserveSeat")
	public String reserveSeat(Movie movie,Cgvcode cgvcode,String date,Model model) {
		//model.addAttribute("mv_name", movie.getMv_name());
		model.addAttribute("cgvcode",cgvcode);
		model.addAttribute("movie", movie);
		model.addAttribute("date", date);
		return "movie/reserveSeat";
	}
	@RequestMapping("/payment")
	public String payment(Movie movie, String numAdult, String numTeenager, String price, String numSeat,String local, String date,Model model,HttpSession session){
		//private int book_cnt; 표갯수 사람수에 어차피 나옴
		//private String book_pay; 결제 방법
		//book.setBook_date(date); 결제 날짜 영화 상영일 나누기
		//System.out.println(numSeat);//좌석표
		Book book=new Book();
		book.setMv_num(movie.getMv_num());
		book.setMv_name(movie.getMv_name());
		book.setBook_price(Integer.parseInt(price));
		book.setC_id((String)session.getAttribute("c_id"));
		book.setBook_loc(local);
		
		//날짜 변환
		SimpleDateFormat beforeFormat = new SimpleDateFormat("yyyymmdd");
		SimpleDateFormat afterFormat = new SimpleDateFormat("yyyy-mm-dd");
        java.util.Date reverseDate = null;
        try {
        	reverseDate = beforeFormat.parse(date);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        String transDate = afterFormat.format(reverseDate);
        Date sqldate = Date.valueOf(transDate);
		book.setBook_date(sqldate);
		
		String humantype="";
		if(!numAdult.equals("0")) {
			humantype+="성인 "+numAdult+"명 ";
		}
		if(!numTeenager.equals("0")) {
			humantype+="청소년 "+numTeenager+"명 ";
		}
		book.setBook_humantype(humantype);
		bs.insert(book);
		model.addAttribute("book", book);
		return "movie/payment";
	}
	@RequestMapping("paysuccess")
	public String paysuccess(String msg,Model model) {
		model.addAttribute("msg", msg);
		//int result=Integer.parseInt(msg);
		//model.addAttribute("result", result);
		return "movie/paysuccess";
	}
}
