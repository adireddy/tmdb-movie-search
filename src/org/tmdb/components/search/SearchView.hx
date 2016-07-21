package org.tmdb.components.search;

import msignal.Signal.Signal1;

class SearchView implements IComponentView {

	public var search:Signal1<String>;
	public var getMovieDetails:Signal1<Int>;

	public function new() {
		search = new Signal1(String);
		getMovieDetails = new Signal1(Int);
	}

	public function reset() {

	}
}