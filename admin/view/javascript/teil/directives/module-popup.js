'use strict';


teil.directive('modulePopup', function (TOKEN, ModuleDownloader, $timeout, CONFIG_ADMIN_EMAIL) {

	var controller = function ($scope) {
		// Open popup
		$.magnificPopup.open({
			midClick: true,
			items: {
				src: '#module-popup',
				type: 'inline'
			},
			callbacks: {
				beforeOpen: function() {
					this.st.mainClass = 'mfp-zoom-in';
				},
				afterClose: function() {
					$('#module-popup').remove();
				}
			}
		});

		// Perform action on button click (install or remove module)
		$scope.action = function(e) {
			var $btn = angular.element(e.currentTarget);

			if ($scope.module.installed) {
				$scope.removeModule($btn);
			} else {
				$scope.downloadModule($btn);
			};
		};

		// Download module
		$scope.downloadModule = function($btn) {
			var downloader = ModuleDownloader.make($btn, $scope.module.code, TOKEN);
			
			// Perform download
			downloader.download()
				.success(function() { $scope.moduleFinished(true) })
				.error(function() { console.log("Module `" + $scope.module.code + "` failed") });

			// Get install process progress
			downloader.progress();
		};

		// Remove module from th system
		$scope.removeModule = function($btn) {
			var downloader = ModuleDownloader.make($btn, $scope.module.code, TOKEN);
			downloader.remove()
				.success(function() { $scope.moduleFinished(false) })
				.error(function() { console.log("Module `" + $scope.module.code + "` failed") });
		};

		// Module was installed successfully
		$scope.moduleFinished = function(installed) {
			var changeModuleInfoTimer = $timeout(function() {
				// Set module attribute `installed` to be true
				angular.forEach($scope.$parent.modules, function(el, i) {
					if ($scope.module.code == el.code) {
						$scope.$parent.modules[i].installed = installed;
					};
				});

				// Clear timeout
				$timeout.cancel(changeModuleInfoTimer);
			}, 2800);
		};

		// Open billing page
		$scope.purchase = function(e) {
			var $btn = angular.element(e.currentTarget);

			var purchasingData = {
				module_code: $scope.module.code,
				module_type: $scope.selectedType.id,
				price: $scope.selectedType.price,
				domain: window.location.hostname,
				email: CONFIG_ADMIN_EMAIL
			};

			window.open(
				'http://dev.website-builder.ru/pay?' + $.param(purchasingData)
			);

			console.log($.param(purchasingData));
		};
	};

	// Set selected module
	var link = function($scope) {
		$scope.module = $scope.$parent.selectedModule;
		
		$scope.isActiveType = false;
		$scope.isTrialKey = false;
		
		// Set default selected option
		angular.forEach($scope.module.types, function(el, index) {
			if (el.active) {
				$scope.selectedType = $scope.module.types[index];
				return false;
			};
		});

		// Change price depending on module type selected
		$scope.$watch('selectedType', function(value, old) {
			$scope.totalPrice = value.price;
			$scope.isActiveType = false;
			$scope.isTrialKey = false;

			// Check if current module type is purchased one
			if (value.active) {
				$scope.isActiveType = true;
			};

			// Check if current key is trial
			if (value.is_trial) {
				$scope.isTrialKey = true;
			};
		}, true);
	};

	return {
		restrict: 'E',
		replace: true,
		link: link,
		scope: {
			module: '='
		},
		templateUrl: '/admin/view/javascript/teil/templates/directives/module-popup.html',
		controller: controller
	};
});