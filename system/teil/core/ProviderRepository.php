<?php


/**
 * Store and register providers
 *
 */
class ProviderRepository {


	/**
	 * List of all avalible service prividers
	 *
	 */
	protected $providers;


	/**
	 * Store all the service providers
	 *
	 * @return void
	 */
	public function __construct($providers)
	{
		$this->providers = $providers['TeilServiceProviders'];
	}


	/**
	 * Register the application service providers.
	 *
	 * @return void
	 */
	public function load(App $app)
	{
		foreach ($this->providers as $provider)
		{
			$app->register($provider);
		}
	}

	
}