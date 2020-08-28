package com.ch.cinephile.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ch.cinephile.dao.MogoodckDao;
import com.ch.cinephile.model.Mogoodck;

@Service
public class MogoodckServiceImpl implements MogoodckService{
	@Autowired
	MogoodckDao md;

	@Override
	public Mogoodck selectMonum(Mogoodck mgc) {
		return md.selectMonum(mgc);
	}
	public void delete(Mogoodck mogoodck) {
		md.delete(mogoodck);
	}

	@Override
	public void insert(Mogoodck mogoodck) {
		md.insert(mogoodck);
	}
}
