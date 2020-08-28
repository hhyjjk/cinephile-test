package com.ch.cinephile.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ch.cinephile.dao.MovieDao;
import com.ch.cinephile.model.Movie;

@Service
public class MovieServiceImpl implements MovieService{
	@Autowired
	private MovieDao md;
	public List<Movie> searchMovie(String mv_name) {
		return md.searchMovie(mv_name);
	}
	public int insert(Movie movie) {
		return md.insert(movie);
	}
	@Override
	public Movie searchMoviee(String mv_name) {
		return md.searchMoviee(mv_name);
	}
	@Override
	public Movie getMovie(Integer mv_num) {
		return md.getMovie(mv_num);
	}
	@Override
	public Movie searchMovienum(int mv_num) {
		return md.searchMovienum(mv_num);
	}
}
