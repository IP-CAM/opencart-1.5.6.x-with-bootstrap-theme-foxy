'use strict';


teil.directive('modulePopup', function () {

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

		// Change price depending on module type selected
		$scope.$watch('selectedType', function(value, old) {
			$scope.totalPrice = value.price;
		}, true);
	};

	// Set selected module
	var link = function($scope) {
		$scope.module = $scope.$parent.selectedModule;
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