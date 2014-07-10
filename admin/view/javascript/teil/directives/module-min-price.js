'use strict';


teil.directive('moduleMinPrice', function () {
	var controller = function ($scope) {

		// Show needle price message
		$scope.formatPrice = function() {
			var minPrice = $scope.getTheCheapestType();

			if (minPrice == 0) {
				return 'FREE';
			};

			return 'from $' + minPrice;
		};

		// Get the cheepes module type
		$scope.getTheCheapestType = function() {
			var minPrice = null;

			angular.forEach($scope.module.types, function(el) {
				if (minPrice == null || el.price < minPrice) {
					minPrice = el.price;
				};
			});

			return minPrice;
		};
	};

	return {
		restrict: 'E',
		replace: true,
		scope: {
			module: '='
		},
		templateUrl: '/admin/view/javascript/teil/templates/directives/module-min-price.html',
		controller: controller
	};
});