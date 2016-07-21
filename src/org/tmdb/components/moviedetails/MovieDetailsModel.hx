package org.tmdb.components.moviedetails;

import org.tmdb.utils.FormatUtils;
import externs.tmdb.TMDb;
import haxe.Json;
import org.tmdb.model.Model;
import org.tmdb.components.IComponentModel;

class MovieDetailsModel implements IComponentModel {

	@inject public var model:Model;

	static inline var POSTER_SIZE:String = "w300";

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
		releaseDate = FormatUtils.formatDate(res.release_date);
		rating = res.vote_average;
		if (res.poster_path != null) posterPath = TMDb.common.images_uri + POSTER_SIZE + res.poster_path;
	}

	public function reset() {
		init();
	}
}