package org.tmdb.components.moviedetails;

import haxe.Json;
import org.tmdb.model.Model;
import org.tmdb.components.IComponentModel;

class MovieDetailsModel implements IComponentModel {

	@inject public var model:Model;

	public var title(default, null):String;
	public var overview(default, null):String;
	public var releaseDate(default, null):String;
	public var rating(default, null):Float;
	public var posterPath(default, null):String;

	public function new() {}

	public function init() {
		title = "";
		overview = "";
		releaseDate = "";
		rating = 0;
		posterPath = null;
	}

	public function processMovieDetails(response:Dynamic) {
		var res = Json.parse(response);
		title = res.original_title;
		overview = res.overview;
		releaseDate = res.release_date;
		rating = res.vote_average;
		posterPath = res.poster_path;
	}

	public function reset() {
		init();
	}
}