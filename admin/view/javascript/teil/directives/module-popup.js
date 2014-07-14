'use strict';


teil.directive('modulePopup', function ($http, TOKEN, ModuleDownloader, $timeout, CONFIG_ADMIN_EMAIL, MODULES_DETAIL_URL, STORE_KEY_URL) {

	var controller = function ($scope) {
		$scope.userLicenseKey = '';
		$scope.purchasedTypePrice = 0;
		$scope.storeKeyStatus = true;

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

		// Load detail module info
		$scope.load = function() {
			var url = MODULES_DETAIL_URL.replace('{module}', $scope.module.code);

			$http.jsonp(url)
				.success(function(module) {
					// Set if module is installed from prev state
					module.installed = $scope.module.installed;
					module.key = $scope.module.key;

					$scope.module = module;
					$scope.init();
				})
				.error(function(data) {
					console.log('Error loading module info');
				});
		};

		// Initialize application
		$scope.init = function() {
			$scope.loading = false;
			$scope.isActiveType = false;
			$scope.isTrialKey = true;

			// Validate key.
			$scope.validateKey();
			
			// Set default selected option
			$scope.selectedType = $scope.module.types[0];

			angular.forEach($scope.module.types, function(el, index) {
				if (el.active) {
					$scope.selectedType = $scope.module.types[index];
					$scope.module.module_type_name = $scope.module.types[index].name;
					return false;
				};
			});

			// Change price depending on module type selected
			$scope.$watch('selectedType', function(value, old) {
				$scope.getPurchasedTypePrice();

				$scope.totalPrice = value.price;
				$scope.isActiveType = false;
				$scope.isTrialKey = true;
				$scope.isGreaterType = false;

				// Check if we should show 'purchase' button
				if (parseFloat($scope.selectedType.price) > parseFloat($scope.purchasedTypePrice)) {
					$scope.isGreaterType = true;
				};

				// Check if current module type is purchased one
				if (value.active) {
					$scope.isActiveType = true;
				};

				// Check if current key is trial
				if ($scope.module.purchased) {
					$scope.isTrialKey = false;
				};
			}, true);
		};


		// Validate license key
		$scope.validateKey = function() {
			// We will compare local key, that is located in module folder
			// and real key from out server
			$scope.keyValid = false;
			$scope.keyValidTrial = false;

			if ($scope.module.purchased_key && $scope.module.purchased_key == $scope.module.key) {
				$scope.keyValid = true;
			};

			// Or if we have trial key
			if ( ! $scope.module.purchased_key && $scope.module.key == 'DEMO') {
				$scope.keyValid = true;
				$scope.keyValidTrial = true;
			};

			// Validate key time
			if ( ! $scope.module.days_left) {
				$scope.keyValid = false;
			};
		};

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
						$scope.module.installed = installed;

						$scope.$parent.modules[i].key = 'DEMO';
						$scope.module.key = 'DEMO';
					};
				});

				// Pull module info
				$scope.load();

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
				'http://dev.website-builder.ru/pay?' + $.param(purchasingData),
				'_blank'
			);

			// Open `enter license key` layer
			$scope.showEnterKeyField = true;
		};


		// Store new license key
		$scope.storeKey = function() {
			$scope.loading = true;

			// Store key
			$http({
				url: STORE_KEY_URL + '&token=' + TOKEN,
				method: 'post',
				responseType: 'json',
				data: $.param({
					module_code: $scope.module.code,
					key: $scope.userLicenseKey
				}),
				headers: {'Content-Type': 'application/x-www-form-urlencoded'}
			})
			.then(function(resp) {
				$scope.storeKeyStatus = resp.data.status;
				$scope.loading = false;

				if ($scope.storeKeyStatus) {
					$scope.module.key = $scope.userLicenseKey;

					// angular.forEach($scope.$parent.modules, function(el, i) {
					// 	if ($scope.module.code == el.code) {
					// 		$scope.$parent.modules[i].key = $scope.userLicenseKey;
					// 	};
					// });

					$scope.showEnterKeyField = false;
					$scope.userLicenseKey = '';

					$scope.load();
				};
			});
		};

		// Get price of current module type
		$scope.getPurchasedTypePrice = function() {
			angular.forEach($scope.module.types, function(el, index) {
				if (el.active) {
					$scope.purchasedTypePrice = el.price;
				};
			});
		};
	};

	// Set selected module
	var link = function($scope) {
		$scope.module = $scope.$parent.selectedModule;

		$scope.loading = true;
		$scope.load();
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