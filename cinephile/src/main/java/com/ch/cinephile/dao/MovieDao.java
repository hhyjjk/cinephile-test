package com.ch.cinephile.dao;

import java.util.List;

import com.ch.cinephile.model.Cfavorite;
import com.ch.cinephile.model.Movie;

public interface MovieDao {

	List<Movie> searchMovie(String mv_name);

	int insert(Movie movie);

	Movie searchMoviee(String mv_name);

	Movie getMovie(Integer mv_num);

	Movie searchMovienum(int mv_num);

	List<Movie> getImgurl(List<Integer> cfList);

	List<Movie> getAllMovie(List<Integer> mvnumList);

}
