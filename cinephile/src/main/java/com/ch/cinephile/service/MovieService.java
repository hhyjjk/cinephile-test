package com.ch.cinephile.service;

import java.util.Collection;
import java.util.List;

import com.ch.cinephile.model.Cfavorite;
import com.ch.cinephile.model.Movie;

public interface MovieService {

	List<Movie> searchMovie(String mv_name);

	int insert(Movie movie);

	Movie searchMoviee(String mv_name);

	Movie getMovie(Integer integer);

	Movie searchMovienum(int mv_num);

	List<Movie> getImgurl(List<Integer> cfList);

	List<Movie> getAllMovie(List<Integer> mvnumList);

	Collection<Movie> mvList(Movie movie);

}
