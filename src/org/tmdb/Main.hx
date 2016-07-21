package org.tmdb;

import minject.Injector;
import org.tmdb.controller.Controller;
import org.tmdb.view.View;
import org.tmdb.model.Model;

class Main {

	/**
	* Main model instance.
	*
	* @property _model
	* @private
	* @type {Model}
	*/
	var _model:Model;

	/**
	* Main view instance.
	*
	* @property _view
	* @private
	* @type {View}
	*/
	var _view:View;

	/**
	* Main controller instance.
	*
	* @property _controller
	* @private
	* @type {Controller}
	*/
	var _controller:Controller;

	/**
	* Application's main class where the core MVC setup happens.
	*
	* Main Controller will automatically wire all the components available in `components` package
	*
	* @class Main
	* @constructor
	*/
	public function new() {
		_model = new Model();
		_view = new View();
		_controller = new Controller();

		var injector = new Injector();
		injector.mapValue(Model, _model);
		injector.mapValue(View, _view);
		injector.injectInto(_controller);

		_controller.init();
	}

	static function main() {
		new Main();
	}
}