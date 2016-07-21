package org.tmdb.controller;

import org.tmdb.components.IComponentModel;
import org.tmdb.components.IComponentView;
import org.tmdb.components.IComponentController;

import minject.Injector;
import org.tmdb.view.View;
import org.tmdb.model.Model;
import externs.tmdb.TMDb;

class Controller {

	@inject public var model:Model;
	@inject public var view:View;

	public function new() {
		CompileTime.importPackage("org.tmdb.components");
	}

	public function init() {
		TMDb.common.api_key = Model.API_KEY;
		model.init();
		view.init();
		_setupComponents();
	}

	function _setupComponents() {
		var models:List<Class<IComponentModel>> = CompileTime.getAllClasses(IComponentModel);
		var views:List<Class<IComponentView>> = CompileTime.getAllClasses(IComponentView);
		var controllers:List<Class<IComponentController>> = CompileTime.getAllClasses(IComponentController);

		var modelMap:Map<String, Class<IComponentModel>> = new Map();
		for (modelClass in models) modelMap.set(Type.getClassName(modelClass).split(".").pop(), modelClass);

		var viewMap:Map<String, Class<IComponentView>> = new Map();
		for (viewClass in views) viewMap.set(Type.getClassName(viewClass).split(".").pop(), viewClass);

		for (controllerClass in controllers) {
			var controllerName = Type.getClassName(controllerClass).split(".").pop();
			controllerName = controllerName.substring(0, controllerName.indexOf("Controller"));
			var modelClass = modelMap.get(controllerName + "Model");
			var viewClass = viewMap.get(controllerName + "View");
			_setupComponent(modelClass, viewClass, controllerClass);
		}
	}

	function _setupComponent(modelClass:Class<IComponentModel>, viewClass:Class<IComponentView>, controllerClass:Class<IComponentController>) {
		var componentInjector = new Injector();
		componentInjector.mapValue(Model, model);

		var componentModel:IComponentModel = null;
		var componentView:IComponentView = null;

		if (modelClass != null) {
			componentModel = Type.createInstance(modelClass, []);
			componentInjector.mapValue(modelClass, componentModel);

			var modelInjector = new Injector();
			modelInjector.mapValue(Model, model);
			modelInjector.injectInto(componentModel);

			componentModel.init();
		}

		if (viewClass != null) {
			var viewName = Type.getClassName(viewClass).split(".").pop();
			componentView = Type.createInstance(viewClass, [view, viewName]);
			componentInjector.mapValue(viewClass, componentView);
		}

		var componentController:IComponentController = Type.createInstance(controllerClass, []);
		componentInjector.injectInto(componentController);
		componentController.init();
	}

	public function reset() {
		model.reset();
		view.reset();
	}
}