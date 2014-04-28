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
 * Security system
 */
$padl = new Padl\License(true, true, true, true);

// copy the server vars (important for security, see note below)
$server_array = $_SERVER;

// set the server vars
// note this doesn't have to be set, however if not all of your app files are encoded
// then there would be a possibility that the end user could modify the server vars
// to fit the key thus making it possible to use your app on any domain
// you should copy your server vars in the first line of your active script so you can
// use the unmodified copy of the vars
$padl->setServerVars($server_array);

$app->instance('padl', $padl);


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