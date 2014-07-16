'use strict';

// Factory
teil.service('Module', function ($http, $cookies, TOKEN, MODULES_LIST_URL, INSTALLED_MODULES_LIST_URL) {

console.log($cookies);
	// List all the modules
	var getAllModules = function() {
		return $http.jsonp(MODULES_LIST_URL + $cookies.language);
	};
	// Get list of already installed apps
	var getInstalledModules = function() {
		return $http.get(INSTALLED_MODULES_LIST_URL + $cookies.language + '&token=' + TOKEN);
	};

	// Facade
	return {
		all: getAllModules,
		my: getInstalledModules
	};
});