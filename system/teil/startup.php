<?php 

define("DIR_HOME", $_SERVER['DOCUMENT_ROOT'] . '/');
define("DIR_TEIL_HOME", $_SERVER['DOCUMENT_ROOT'] . '/system/teil/');
define("DIR_TEIL_MODULES", $_SERVER['DOCUMENT_ROOT'] . '/system/teil/modules/');


/**
 * Create basic application instance.
 * It contains all injected instances.
 *
 */
$app = new App();


/**
 * Self-injected application instance
 *
 */
$app->instance('app', $app);


/**
 * Facades setup.
 *
 * Clear all `before resolved` instances
 * Set application to build on.
 *
 */
Facade::clearResolvedInstances();
Facade::setFacadeApplication($app);


/**
 * Register providers.
 * 
 * WARNING: see /vendor/teil/framework/providers.php
 *
 */
$app->getProviderRepository()->load($app);