package com.ch.cinephile.service;

import java.util.List;

import com.ch.cinephile.model.Cfavorite;

public interface CfavoriteService {

	int selectZipnum(String id);

	Cfavorite ckChoice(int mv_num, int zipnum);

	int insert(int mv_num, int zipnum);

	List<Integer> getCustomer(int zipnum);

	void delete(int mv_num, int zipnum);

}
