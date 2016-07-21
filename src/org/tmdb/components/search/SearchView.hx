package org.tmdb.components.search;

import haxe.Timer;
import js.Browser;
import js.html.Element;
import js.html.InputElement;
import msignal.Signal.Signal1;

class SearchView implements IComponentView {

	public var search:Signal1<String>;
	public var getMovieDetails:Signal1<String>;

	var _searchElement:InputElement;
	var _progressElement:Element;

	var _delay:Timer;

	public function new() {
		search = new Signal1(String);
		getMovieDetails = new Signal1(String);

		_progressElement = cast Browser.document.getElementById("progress");
		_searchElement = cast Browser.document.getElementById("search");

		_searchElement.onkeyup = _search;
	}

	function _search() {
		if (_delay != null) _delay.stop();
		showProgress();
		_delay = Timer.delay(function() {
			search.dispatch(_searchElement.value);
		}, 1000);
	}

	public function showProgress() {
		_progressElement.style.visibility = "visible";
	}

	public function hideProgress() {
		_progressElement.style.visibility = "hidden";
	}

	public function reset() {
		_searchElement.value = "";
		_progressElement.style.visibility = "hidden";
	}
}