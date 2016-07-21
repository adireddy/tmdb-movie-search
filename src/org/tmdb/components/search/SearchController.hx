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

	}

	function _onSearch(val:String) {
		if (val.trim() != "") {
			TMDb.search.getMovie({query:val}, _onSearchSuccess, _onError);
		}
	}

	function _onSearchSuccess(response:Dynamic) {

	}

	function _onError(response:Dynamic) {

	}

	public function reset() {}
}