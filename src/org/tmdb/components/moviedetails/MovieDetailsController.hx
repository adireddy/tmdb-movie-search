package org.tmdb.components.moviedetails;

import js.Browser;
import bindx.Bind;
import org.tmdb.model.Model;
import externs.tmdb.TMDb;

class MovieDetailsController implements IComponentController {

	@inject public var model:Model;
	@inject public var componentModel:MovieDetailsModel;
	@inject public var view:MovieDetailsView;

	public function new() {}

	public function init() {
		Bind.bind(model.searchString, _hideMovieDetails);
		Bind.bind(model.selectedMovie, _getMovieDetails);
	}

	function _hideMovieDetails(oldString:String, newString:String) {
		if (newString != null) {
			view.hideMovieDetails();
		}
	}

	function _getMovieDetails(oldMovie:Int, newMovie:Int) {
		if (newMovie > -1) {
			TMDb.movies.getById({ id:newMovie }, _onMovieDetailsSuccess, _onError);
		}
	}

	function _onMovieDetailsSuccess(response:Dynamic) {
		componentModel.processMovieDetails(response);
		view.showMovieDetails(
			componentModel.posterPath,
			componentModel.title,
			componentModel.releaseDate,
			componentModel.overview,
			componentModel.rating
		);
	}

	function _onError(response:Dynamic) {
		Browser.console.warn(response);
	}

	public function reset() {
		componentModel.reset();
		view.reset();
	}
}