'use strict';


// Declare app level module which depends on filters, and services
window.teil = angular.module('teil', [])
	.value('TOKEN', angular.element('#token').val())
	.value('CONFIG_ADMIN_EMAIL', angular.element('#admin-email').val())
	.value('MODULES_LIST_URL', 'http://dev.website-builder.ru/modules?callback=JSON_CALLBACK')
	.value('INSTALLED_MODULES_LIST_URL', '/admin/index.php?route=teil/home/my');