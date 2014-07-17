'use strict';

// Factory
teil.service('Module', function ($http, $cookies, ADMIN_LANGUAGE, TOKEN, MODULES_LIST_URL, INSTALLED_MODULES_LIST_URL, MODULES_DETAIL_URL) {

	var languageCode = ADMIN_LANGUAGE || $cookies.language || 'en';

	// List all the modules
	var getAllModules = function() {
		return $http.jsonp(MODULES_LIST_URL + languageCode);
	};
	// Get list of already installed apps
	var getInstalledModules = function() {
		return $http.get(INSTALLED_MODULES_LIST_URL + '&token=' + TOKEN);
	};

	var getModule = function(moduleСode) {
		var url = MODULES_DETAIL_URL.replace('{module}', moduleСode);

		return $http.jsonp(url + languageCode);
	};

	// Facade
	return {
		all: getAllModules,
		my: getInstalledModules,
		find: getModule
	};
});