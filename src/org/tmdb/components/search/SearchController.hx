package org.tmdb.components.search;

import js.Browser;
import externs.tmdb.TMDb;
import org.tmdb.model.Model;

class SearchController implements IComponentController {

	@inject public var model:Model;
	@inject public var componentModel:SearchModel;
	@inject public var view:SearchView;

	public function new() {}

	public function init() {
		view.getMovieDetails.add(_onGetMovieDetails);
		view.search.add(_onSearch);
	}

	function _onGetMovieDetails(val:String) {
		model.reset();
		model.selectedMovie = Std.parseInt(val);
		view.clearResults();
	}

	function _onSearch(val:String) {
		model.searchString = val;
		TMDb.search.getMovie({query:val}, _onSearchSuccess, _onError);
	}

	function _onSearchSuccess(response:Dynamic) {
		componentModel.processSearchResults(response);
		view.clearResults();
		view.hideProgress();
		for (movie in componentModel.movies) {
			view.addMovie(movie.id, movie.original_title, movie.release_date);
		}
	}

	function _onError(response:Dynamic) {
		Browser.console.warn(response);
	}

	public function reset() {
		componentModel.reset();
		view.reset();
	}
}