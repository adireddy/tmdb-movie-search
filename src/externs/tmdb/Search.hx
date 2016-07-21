package externs.tmdb;

@:native("theMovieDb.search")
extern class Search {
	function getMovie(query:Dynamic, ?success:Dynamic, ?error:Dynamic):Void;
}