package com.ch.cinephile.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

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

import com.ch.cinephile.model.Cfavorite;
import com.ch.cinephile.model.Favoritezip;
import com.ch.cinephile.model.Mogoodck;
import com.ch.cinephile.model.Monologue;
import com.ch.cinephile.model.Movie;
import com.ch.cinephile.service.CfavoriteService;
import com.ch.cinephile.service.CustomerService;
import com.ch.cinephile.service.FavoritezipService;
import com.ch.cinephile.service.MogoodckService;
import com.ch.cinephile.service.MonologueService;
import com.ch.cinephile.service.MovieService;


@Controller
public class MainController {
	@Autowired
	private MovieService ms;
	@Autowired
	private MonologueService mls;
	@Autowired
	private MogoodckService mgs;
	@Autowired
	private FavoritezipService fs;
	@Autowired
	private CfavoriteService cs;
	@Autowired
	private CustomerService cus;
	@RequestMapping("/main")
	public String main(Model model,HttpSession session) throws IOException {
		//ms.getMovieRank();
		String URL = "http://www.cgv.co.kr/movies/";
		String NURL = "https://movie.naver.com/movie/running/current.nhn";
		Document doc = Jsoup.connect(URL).get();
		Document ndoc = Jsoup.connect(NURL).get();
		
		Elements nimages = ndoc.select("#content > div.article > div > div.lst_wrap > ul > li > div > a");
		Elements ncontents = ndoc.select("#content > div.article > div > div.lst_wrap > ul > li > dl > dt > a");
		//cgv
		//Elements contents = doc.select("div.wrap-movie-chart > div.sect-movie-chart > ol > li > div.box-contents > a > strong");
		//Elements images = doc.select("div.wrap-movie-chart > div.sect-movie-chart > ol > li > div.box-image > a > span > img");
		
		List<String> imageList=new ArrayList<String>();
		List<Integer> codeList=new ArrayList<Integer>();
		List<String> nameList=new ArrayList<String>();
		//영화 포스터 이미지 받기
		/*
		 * for(Element image: images) { //Elements
		 * movieimg=image.select("img[src$=.jpg]"); //String imgSrc =
		 * movieimg.attr("img src"); String src= image.attr("src"); list.add(src); }
		 */
		//영화 이름
		//for(Element content: contents) {
			//Elements moviename=content.select("strong");
			//nameList.add(moviename.text());
			//ms.searchMovie(moviename.text());
			//result=ms.searchMovie(moviename.text());
			//if(result==0) { ms.insertMovie() }
		//}
		//네이버 영화제목
		for(int i=0;i<10;i++) {
			Elements nm=ncontents.get(i).select("a");
			nameList.add(nm.text());
		}
		//네이버 이미지
		for(int i=0;i<10;i++) {
			Elements moviecode=nimages.get(i).select("a");
			String href= moviecode.attr("href");
			int idx=href.indexOf('?');
			String mc=href.substring(idx+6);
			int Imc=Integer.parseInt(mc);
			
			String IURL = "https://movie.naver.com/movie/bi/mi/photoViewPopup.nhn?movieCode="+mc;
			Document idoc = Jsoup.connect(IURL).get();
			Elements bimages= idoc.select("#targetImage"); 
			String src= bimages.attr("src");
			codeList.add(Imc);
			imageList.add(src);
		}
		/*
		 * for(Element ncontent: ncontents) { Elements nm=ncontent.select("img");
		 * System.out.println(nm); System.out.println(nm.text());
		 * //ms.searchMovie(moviename.text());
		 * //result=ms.searchMovie(moviename.text()); //if(result==0) { ms.insertMovie()
		 * } }
		 */
		model.addAttribute("imageList", imageList);
		model.addAttribute("nameList", nameList);
		model.addAttribute("codeList", codeList);
		
		//모놀로그 인기순
		List<Monologue> moList=mls.searchHot();
		model.addAttribute("moList", moList);
		//로그인 했을시 모놀로그 좋아요 체크
		List<String> mogoodList =new ArrayList<String>();
		String c_id=(String) session.getAttribute("c_id");
		if(c_id!=null&&!c_id.equals("")) {
			for(int i=0;i<moList.size();i++) {
				int monum=moList.get(i).getMo_num();
				Mogoodck mgc=new Mogoodck();
				mgc.setC_id(c_id);
				mgc.setMo_num(monum);
				Mogoodck mgc2=mgs.selectMonum(mgc);
				if(mgc2!=null) {
					mogoodList.add("y");
				}
				else
					mogoodList.add("n");
			}
			model.addAttribute("mogoodList", mogoodList);
		}
		//취향집 인기순
		List<Favoritezip> faList=fs.searchHot();
		//한사람 랜덤으로 취향집에 저장된 영화 목록 가져오기
		int random=(int)(Math.random()*faList.size());
		int zipnum=faList.get(random).getZip_num();
		String fid=fs.getId(zipnum);
		String nickname=cus.getNickname(fid);
		List<Integer> CfList=cs.selectZipnum(zipnum);
		//mvnum으로 영화 이미지 가져오기
		List<Movie> favmList=ms.getImgurl(CfList);
		model.addAttribute("favmList", favmList);
		model.addAttribute("nickname", nickname);
		return "main";
	}
	@RequestMapping("/main2")
	public String main2(Model model) throws IOException {
		//ms.getMovieRank();
		String URL = "http://www.cgv.co.kr/movies/";
		String NURL = "https://movie.naver.com/movie/running/current.nhn";
		Document doc = Jsoup.connect(URL).get();
		Document ndoc = Jsoup.connect(NURL).get();
		
		Elements nimages = ndoc.select("#content > div.article > div > div.lst_wrap > ul > li > div > a");
		Elements ncontents = ndoc.select("#content > div.article > div > div.lst_wrap > ul > li > dl > dt > a");
		//cgv
		//Elements contents = doc.select("div.wrap-movie-chart > div.sect-movie-chart > ol > li > div.box-contents > a > strong");
		//Elements images = doc.select("div.wrap-movie-chart > div.sect-movie-chart > ol > li > div.box-image > a > span > img");
		
		List<String> imageList=new ArrayList<String>();
		List<Integer> codeList=new ArrayList<Integer>();
		List<String> nameList=new ArrayList<String>();
		//영화 포스터 이미지 받기

		//네이버 영화제목
		for(int i=0;i<10;i++) {
			Elements nm=ncontents.get(i).select("a");
			nameList.add(nm.text());
		}
		//네이버 이미지
		for(int i=0;i<10;i++) {
			Elements moviecode=nimages.get(i).select("a");
			String href= moviecode.attr("href");
			int idx=href.indexOf('?');
			String mc=href.substring(idx+6);
			int Imc=Integer.parseInt(mc);
			
			String IURL = "https://movie.naver.com/movie/bi/mi/photoViewPopup.nhn?movieCode="+mc;
			Document idoc = Jsoup.connect(IURL).get();
			Elements bimages= idoc.select("#targetImage"); 
			String src= bimages.attr("src");
			codeList.add(Imc);
			imageList.add(src);
		}

		model.addAttribute("imageList", imageList);
		model.addAttribute("nameList", nameList);
		model.addAttribute("codeList", codeList);
		return "main2";
	}
	
}