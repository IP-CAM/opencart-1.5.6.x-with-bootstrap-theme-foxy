'use strict';

window.teil.controller(
	'CommonController',
	[
		'$scope', 
		'$http', 
		'$compile', 
		'MODULES_LIST_URL', 
		function CommonController($scope, $http, $compile, url) {
			// Parse all the modules
			$http.jsonp(url)
				.success(function(data) {
					$scope.modules = data.apps;
				})
				.error(function(data) {
					console.log('error');
				});

			// Open popup with detail info of module
			$scope.openPopup = function(module) {
				$scope.selectedModule = module;

				// Create popup
				var popup = angular.element('<module-popup module="module"></module-popup>');
				$compile(popup)($scope);

				// Append popup to the body
				angular.element('body').append(popup);
			};
		}
]);