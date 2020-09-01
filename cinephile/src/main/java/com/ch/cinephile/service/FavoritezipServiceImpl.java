package com.ch.cinephile.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ch.cinephile.dao.FavoritezipDao;

@Service
public class FavoritezipServiceImpl implements FavoritezipService{
	@Autowired
	FavoritezipDao fd;

	@Override
	public int insert(String c_id) {
		return fd.insert(c_id);
	}
	public int selectZipnum(String c_id) {
		return fd.selectZipnum(c_id);
	}
	public List<Favoritezip> searchHot() {
		return fd.searchHot();
	}
	@Override
	public String getId(int zipnum) {
		return fd.getId(zipnum);
	}
}
