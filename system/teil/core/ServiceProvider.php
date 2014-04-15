<?php 


use ReflectionClass;


/**
 * Abstract class to every single service provider
 *
 */
abstract class ServiceProvider {


	/**
	 * The application instance.
	 *
	 */
	protected $app;

	
	/**
	 * Create a new service provider instance.
	 *
	 * @return void
	 */
	public function __construct($app)
	{
		$this->app = $app;
	}


	/**
	 * Bootstrap the application events.
	 *
	 * @return void
	 */
	public function boot() {}


	/**
	 * Register the service provider.
	 *
	 * @return void
	 */
	abstract public function register();


	/**
	 * Get the services provided by the provider.
	 *
	 * @return array
	 */
	public function provides()
	{
		return array();
	}


}