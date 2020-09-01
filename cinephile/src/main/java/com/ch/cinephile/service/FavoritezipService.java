package com.ch.cinephile.service;

public interface FavoritezipService {

	int insert(String c_id);

	int selectZipnum(String c_id);
	List<Favoritezip> searchHot();

	String getId(int zipnum);
}
