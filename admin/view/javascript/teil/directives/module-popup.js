'use strict';


teil.directive('modulePopup', function (TOKEN, ModuleDownloader) {

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

		// Download module
		$scope.download = function(e, module) {
			var $btn = angular.element(e.currentTarget);

			var downloader = ModuleDownloader.make($btn, module.code, TOKEN);
			
			// Perform download
			downloader.download()
				.success(function() {
					console.log("Module `" + module.code + "` has been installed");

					angular.forEach($scope.$parent.modules, function(el, i) {
						if (module.code == el.code) {
							$scope.$parent.modules[i].installed = true;
						};
					});
				})
				.error(function() {
					console.log("Module `" + module.code + "` failed");
				});;

			// Get install process progress
			downloader.progress();
		};
	};

	// Set selected module
	var link = function($scope) {
		$scope.module = $scope.$parent.selectedModule;
		
		$scope.isActiveType = false;
		
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

			// Check if current module type is purchased one
			if (value.active) {
				$scope.isActiveType = true;
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