'use strict';

// Factory
teil.service('Module', function ($http, TOKEN, MODULES_LIST_URL, INSTALLED_MODULES_LIST_URL) {

	// List all the modules
	var getAllModules = function() {
		return $http.jsonp(MODULES_LIST_URL);
	};

	// Get list of already installed apps
	var getInstalledModules = function() {
		return $http.get(INSTALLED_MODULES_LIST_URL + '&token=' + TOKEN);
	};

	// Facade
	return {
		all: getAllModules,
		my: getInstalledModules
	};
});