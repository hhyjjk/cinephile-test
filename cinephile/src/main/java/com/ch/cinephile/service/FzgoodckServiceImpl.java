package com.ch.cinephile.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ch.cinephile.dao.FzgoodckDao;
import com.ch.cinephile.model.Fzgoodck;

@Service
public class FzgoodckServiceImpl implements FzgoodckService{
	@Autowired
	private FzgoodckDao fd;

	@Override
	public Fzgoodck searchId(String c_id) {
		return fd.searchId(c_id);
	}
}
