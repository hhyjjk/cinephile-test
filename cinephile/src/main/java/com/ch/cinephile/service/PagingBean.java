package com.ch.cinephile.service;
import javax.servlet.http.HttpServletRequest;

import lombok.Getter;
import lombok.Setter;
@Getter
@Setter
public class PagingBean {
	private int currentPage; 	private int rowPerPage;//페이지당 글 수
	private int total;			private int pagePerBlock=10;
	private int totalPage;		private int endPage;
	private int startPage;
	
	//++
	private int curPos; 			// 페이지당 시작 index(list계열의)
	private int num; 				// 페이지당 시작 번호

	
	
	public PagingBean(int currentPage, int rowPerPage, int total) {
		this.currentPage = currentPage; this.rowPerPage=rowPerPage;
		this.total = total;
		// double은 소숫점 이하를 보존
		// Math.ceil는 소숫점 이하에 숫자가 있으면 1증가
		totalPage = (int)Math.ceil((double)total/rowPerPage);
		startPage = currentPage - (currentPage - 1)%pagePerBlock;
		endPage = startPage + pagePerBlock - 1;
		// 마지막 페이지에 게시글이 10개가 안되는 경우에 해당
		if (endPage > totalPage) endPage = totalPage;
	}
	
	
	// request , int 
	public PagingBean(HttpServletRequest request, int total2) {
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		total = total2;
		totalPage=(int)Math.ceil((float)total/rowPerPage);
		startPage= currentPage-((currentPage-1)%pagePerBlock);
		endPage= startPage+ pagePerBlock -1;
		curPos = (currentPage -1 )* rowPerPage;
		num=total - curPos;
			
	}

}
