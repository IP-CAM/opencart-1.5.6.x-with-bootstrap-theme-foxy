'use strict';

window.teil.controller(
	'CommonController',
	[
		'$scope', 
		'$http', 
		'$compile', 
		'$timeout', 
		'MODULES_LIST_URL', 
		'INSTALLED_MODULES_LIST_URL', 
		'TOKEN', 
		function CommonController($scope, $http, $compile, $timeout, url, installedUrl, token) {
			// Parse all the modules
			$http.jsonp(url)
				.success(function(data) {
					$scope.modules = data;
				})
				.error(function(data) {
					console.log('Error loading module list');
				});

			// Get list of already installed apps
			$http.get(installedUrl + '&token=' + token)
				.success(function(data) {
					var installedModules = data;

					console.log(installedModules);

					angular.forEach($scope.modules, function(el, index) {
						if (installedModules[el.code] != undefined) {
							$scope.modules[index].installed = true;
							$scope.modules[index].key = installedModules[el.code].key;
						};
					});
				})
				.error(function(data) {
					console.log('Error loading module list');
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

			$scope.$watch('modules', function() {
				console.log('Controller changed');
			}, true);
		}
]);