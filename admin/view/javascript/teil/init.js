'use strict';


// Declare app level module which depends on filters, and services
window.teil = angular.module('teil', [])
	.value('TOKEN', angular.element('#token').val())
	.value('MODULES_LIST_URL', 'http://dev.website-builder.ru/modules?callback=JSON_CALLBACK');