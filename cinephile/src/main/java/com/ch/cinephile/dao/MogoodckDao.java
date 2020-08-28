package com.ch.cinephile.dao;

import com.ch.cinephile.model.Mogoodck;

public interface MogoodckDao {

	Mogoodck selectMonum(Mogoodck mgc);

	void delete(Mogoodck mogoodck);

	void insert(Mogoodck mogoodck);

}
