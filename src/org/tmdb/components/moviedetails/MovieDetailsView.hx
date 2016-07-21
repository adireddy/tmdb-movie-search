package org.tmdb.components.moviedetails;

import js.html.ImageElement;
import js.html.DivElement;
import js.Browser;

class MovieDetailsView  implements IComponentView {

	var _movieElement:DivElement;

	public function new() {
		_movieElement = cast Browser.document.getElementById("movie");
	}

	public function showMovieDetails(posterPath:String, title:String, releaseDate:String, overview:String, rating:Float) {
		if (posterPath != null) {
			cast(Browser.document.getElementById("moviePoster"), ImageElement).src = posterPath;
		}
		Browser.document.getElementById("movieName").innerText = title;
		Browser.document.getElementById("releaseDate").innerHTML = "<i class='fa fa-calendar'> </i> " + releaseDate;
		Browser.document.getElementById("movieDescription").innerText = overview;
		Browser.document.getElementById("movieRating").innerHTML = "<i class='fa fa-star'> </i> " + rating;
		_movieElement.style.position = "relative";
		_movieElement.style.visibility = "visible";
	}

	public function hideMovieDetails() {
		_movieElement.style.visibility = "hidden";
		cast(Browser.document.getElementById("moviePoster"), ImageElement).src = "";
		Browser.document.getElementById("movieDescription").innerText = "";
		_movieElement.style.position = "absolute";
	}

	public function reset() {
		hideMovieDetails();
	}
}