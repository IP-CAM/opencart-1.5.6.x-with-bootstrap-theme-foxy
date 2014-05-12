<?php 


/**
 * Abstract class to every single service provider
 *
 */
abstract class ServiceProvider {

	protected $MODULE_CODE = NULL;


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
	protected function register() {

		// Validate module license key
		try {
			$this
				->app
				->make('security')
				->validate(
					$_SERVER['SERVER_NAME'],
					$this->MODULE_CODE
				);
		} catch (Exception $e) {
			echo "License file not found! Module name is - <b>" . $this->MODULE_CODE . "</b>";
		}
	}


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