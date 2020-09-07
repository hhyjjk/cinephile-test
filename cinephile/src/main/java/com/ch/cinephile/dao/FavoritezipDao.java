package com.ch.cinephile.dao;

import java.util.List;

import com.ch.cinephile.model.Favoritezip;

public interface FavoritezipDao {

	int insert(String c_id);

	int selectZipnum(String c_id);
	List<Favoritezip> searchHot();

	String getId(int zipnum);
}
