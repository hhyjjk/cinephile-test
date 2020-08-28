package com.ch.cinephile.dao;

import java.util.List;

import com.ch.cinephile.model.Mogoodck;
import com.ch.cinephile.model.Monologue;

public interface MonologueDao {

	void write(String c_id, String contents);

	List<Monologue> getForCid(String c_id);

	List<Monologue> searchHot();

	void goodup(int mo_num);

	void gooddown(int mo_num);
	
}
