package com.ch.cinephile.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ch.cinephile.dao.MonologueDao;
import com.ch.cinephile.model.Mogoodck;
import com.ch.cinephile.model.Monologue;

@Service
public class MonologueServiceImpl implements MonologueService{
	@Autowired
	MonologueDao md;
	public void write(String c_id, String contents) {
		md.write(c_id,contents);
	}
	@Override
	public List<Monologue> getForCid(String c_id) {
		return md.getForCid(c_id);
	}
	@Override
	public List<Monologue> searchHot() {
		return md.searchHot();
	}
	@Override
	public void goodup(int mo_num) {
		md.goodup(mo_num);
	}
	public void gooddown(int mo_num) {
		md.gooddown(mo_num);
	}
}
