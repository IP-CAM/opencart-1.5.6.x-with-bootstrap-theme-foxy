'use strict';


teil.directive('btnProgress', function ($timeout) {
	var controller = function ($scope) {
		$scope.disabled = false;
		$scope.btnText = 'Preview module - FREE';
		$scope.btnAnimationFinished = false;

		$scope.disable = function() {
			$scope.disabled = true;
		};
	};

	var link = function($scope, element, attrs) {
		// Here we are going to watch if progress attribute will be changed
        $scope.$watch(
			function() {
		    	return element.attr('progress');
		    },
		    function(val, old) {
		        $scope.progress = val;
	      	}
      	);

      	// Progress was changed
		$scope.$watch('progress', function(val) {
			if (val >= 100) {
				$scope.loaded(element);
			};

			element.attr('data-progress', val);
		});

		// Animate loaded state of button
		$scope.loaded = function(element) {
			$scope.btnAnimationFinished = true;

			var promise = $timeout(function() {
				$scope.disabled = false;
				$scope.btnAnimationFinished = false;
				$scope.btnText = 'Remove module';
				element.attr('progress', 0);

				// Clear timeout
				$timeout.cancel(promise);
			}, 1500);
		};
	};

	return {
		restrict: 'E',
		replace: true,
		scope: {},
		templateUrl: '/admin/view/javascript/teil/templates/directives/btn-progress.html',
		link: link,
		controller: controller
	};
});