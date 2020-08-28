package com.ch.cinephile.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ch.cinephile.model.Movie;

@Repository
public class MovieDaoImpl implements MovieDao{
	@Autowired
	private SqlSessionTemplate sst;
	public List<Movie> searchMovie(String mv_name) {
		return sst.selectList("moviens.searchMovie",mv_name);
	}
	public int insert(Movie movie) {
		return sst.insert("moviens.insertMovie",movie);
	}
	public Movie searchMoviee(String mv_name) {
		return sst.selectOne("moviens.searchMoviee", mv_name);
	}
	@Override
	public Movie getMovie(Integer mv_num) {
		return sst.selectOne("moviens.getMovie", mv_num);
	}
	@Override
	public Movie searchMovienum(int mv_num) {
		return sst.selectOne("moviens.searchMovienum", mv_num);
	}
}
