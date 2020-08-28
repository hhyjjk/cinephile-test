package com.ch.cinephile.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ch.cinephile.dao.CgvcodeDao;
import com.ch.cinephile.model.Cgvcode;

@Service
public class CgvcodeServiceImpl implements CgvcodeService{
	@Autowired
	private CgvcodeDao cd;

	@Override
	public List<Cgvcode> searchThe() {
		return cd.searchThe();
	}
	
}
