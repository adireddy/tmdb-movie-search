package externs.tmdb;

@:native("theMovieDb.movies")
extern class Movies {
	function getById(query:Dynamic, ?success:Dynamic, ?error:Dynamic):Void;
}