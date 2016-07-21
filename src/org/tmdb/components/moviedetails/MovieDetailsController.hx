package org.tmdb.components.moviedetails;

import org.tmdb.model.Model;
import externs.tmdb.TMDb;

class MovieDetailsController implements IComponentController {

	@inject public var model:Model;
	@inject public var view:MovieDetailsView;

	public function new() {}

	public function init() {

	}

	function _onGetMovieDetails(id:Int) {
		TMDb.movies.getById({ id:id }, _onMovieDetailsSuccess, _onError);
	}

	function _onMovieDetailsSuccess(response:Dynamic) {

	}

	function _onError(response:Dynamic) {
		
	}

	public function reset() {}
}