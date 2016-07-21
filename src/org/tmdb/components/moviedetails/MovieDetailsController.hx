package org.tmdb.components.moviedetails;

import bindx.Bind;
import org.tmdb.model.Model;
import externs.tmdb.TMDb;

class MovieDetailsController implements IComponentController {

	@inject public var model:Model;
	@inject public var view:MovieDetailsView;

	public function new() {}

	public function init() {
		Bind.bind(model.selectedMovie, _getMovieDetails);
	}

	function _getMovieDetails(oldMovie:Int, newMovie:Int) {
		TMDb.movies.getById({ id:newMovie }, _onMovieDetailsSuccess, _onError);
	}

	function _onMovieDetailsSuccess(response:Dynamic) {

	}

	function _onError(response:Dynamic) {

	}

	public function reset() {}
}