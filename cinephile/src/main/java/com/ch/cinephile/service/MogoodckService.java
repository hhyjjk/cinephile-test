package com.ch.cinephile.service;

import com.ch.cinephile.model.Mogoodck;

public interface MogoodckService {

	Mogoodck selectMonum(Mogoodck mgc);

	void delete(Mogoodck mogoodck);

	void insert(Mogoodck mogoodck);

}
