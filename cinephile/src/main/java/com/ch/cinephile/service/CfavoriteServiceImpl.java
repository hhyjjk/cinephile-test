package com.ch.cinephile.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ch.cinephile.dao.CfavoriteDao;
import com.ch.cinephile.model.Cfavorite;

@Service
public class CfavoriteServiceImpl implements CfavoriteService{
	@Autowired
	CfavoriteDao cd;
	public int selectZipnum(String id) {
		return cd.selectZipnum(id);
	}
	public Cfavorite ckChoice(int mv_num, int zipnum) {
		return cd.ckChoice(mv_num,zipnum);
	}
	public int insert(int mv_num, int zipnum) {
		return cd.insert(mv_num,zipnum);
	}
	public List<Integer> getCustomer(int zipnum) {
		return cd.getCustomer(zipnum);
	}
	@Override
	public void delete(int mv_num, int zipnum) {
		cd.delete(mv_num,zipnum);
	}
}
