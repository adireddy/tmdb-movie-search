package org.tmdb.components.search;

import externs.tmdb.TMDb;
import org.tmdb.model.Model;

using StringTools;

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
		model.selectedMovie = Std.parseInt(val);
	}

	function _onSearch(val:String) {
		if (val.trim() != "") {
			TMDb.search.getMovie({query:val}, _onSearchSuccess, _onError);
		}
	}

	function _onSearchSuccess(response:Dynamic) {
		componentModel.processSearchResults(response);
		for (movie in componentModel.movies) {
			//set the view
		}
	}

	function _onError(response:Dynamic) {

	}

	public function reset() {
		componentModel.reset();
		view.reset();
	}
}