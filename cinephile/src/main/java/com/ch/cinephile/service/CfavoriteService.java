package com.ch.cinephile.service;

import java.util.List;

import com.ch.cinephile.model.Cfavorite;

public interface CfavoriteService {

	List<Integer> selectZipnum(int zipnum);
	//int selectZipnum(int zipnum);

	Cfavorite ckChoice(int mv_num, int zipnum);

	int insert(int mv_num, int zipnum);

	List<Integer> getCustomer(int zipnum);

	void delete(int mv_num, int zipnum);

}
