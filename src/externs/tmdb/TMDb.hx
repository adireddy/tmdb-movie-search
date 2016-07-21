package externs.tmdb;

@:native("theMovieDb")
extern class TMDb {
	static var common:Common;
	static var search:Search;
	static var movies:Movies;
}