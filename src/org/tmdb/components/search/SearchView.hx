package org.tmdb.components.search;

import js.html.DivElement;
import js.html.AnchorElement;
import haxe.Timer;
import js.Browser;
import js.html.Element;
import js.html.InputElement;
import msignal.Signal.Signal1;

using StringTools;

class SearchView implements IComponentView {

	public var search:Signal1<String>;
	public var getMovieDetails:Signal1<String>;

	var _searchElement:InputElement;
	var _resultsElement:DivElement;
	var _progressElement:Element;

	var _delay:Timer;
	var _searchString:String;

	public function new() {
		search = new Signal1(String);
		getMovieDetails = new Signal1(String);

		_progressElement = cast Browser.document.getElementById("progress");
		_searchElement = cast Browser.document.getElementById("search");
		_resultsElement = cast Browser.document.getElementById("results");

		_searchString = "";
		_searchElement.onkeyup = _search;
	}

	function _search() {
		if (_delay != null) _delay.stop();
		_searchString = _searchElement.value.trim();
		if (_searchString != "") {
			showProgress();
			_delay = Timer.delay(_delaySearch, 1000);
		}
		else {
			hideProgress();
		}
	}

	inline function _delaySearch() {
		search.dispatch(_searchString);
	}

	function _onSelect(evt:Dynamic) {
		_searchElement.value = evt.target.innerText.split(" (")[0];
		getMovieDetails.dispatch(evt.target.id);
	}

	public function addMovie(id:Int, title:String, release:String) {
		var movie:AnchorElement = Browser.document.createAnchorElement();
		movie.className = "item";
		movie.id = "" + id;
		movie.innerText = title + " (" + release + ")";
		movie.onclick = _onSelect;
		_resultsElement.appendChild(movie);
	}

	public function clearResults() {
		_resultsElement.innerHTML = "";
	}

	public function showProgress() {
		_progressElement.style.visibility = "visible";
	}

	public function hideProgress() {
		_progressElement.style.visibility = "hidden";
	}

	public function reset() {
		_searchString = "";
		_searchElement.value = "";
		_progressElement.style.visibility = "hidden";
	}
}