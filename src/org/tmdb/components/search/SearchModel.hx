package org.tmdb.components.search;

import haxe.Json;
import org.tmdb.model.Model;
import org.tmdb.components.IComponentModel;

class SearchModel implements IComponentModel {

	@inject public var model:Model;

	public var movies(default, null):Map<Int, Dynamic>;

	public function new() {}

	public function init() {
		movies = new Map();
	}

	public function processSearchResults(response:Dynamic) {
		var res = Json.parse(response);
		movies = new Map();
		for (m in Reflect.fields(res.results)) {
			var movie = Reflect.field(res.results, m);
			movies.set(movie.id, movie);
		}
	}

	public function reset() {
		init();
	}
}