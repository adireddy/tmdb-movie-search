package org.tmdb.model;

import bindx.Bind;
import bindx.IBindable;

using bindx.Bind;

class Model implements IBindable {

	public static inline var API_KEY:String = "e50938fa4e13e8b1b31c287c1b820574";

	@:bindable public var selectedMovie:Int;
	@:bindable public var searchString:String;

	public function new() {}

	public function init() {
		searchString = null;
		selectedMovie = -1;
	}

	public function reset() {
		init();
	}
}