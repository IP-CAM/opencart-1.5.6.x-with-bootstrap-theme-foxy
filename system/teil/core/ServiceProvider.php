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
		$this->validate();
	}


	/**
	 * Validate module license key
	 *
	 * @return bool
	 */
	private function validate()
	{
		// this is the url where you have your server script
		$serverurl = "http://website-builder.ru/padl/Keyauth/Implementation/server.php";

		// start a curl session
		$ch = curl_init ($serverurl);
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, true); 
		curl_setopt ($ch, CURLOPT_POST, true);
		curl_setopt ($ch, CURLOPT_POSTFIELDS, array(
			'key' => 'DEMO',
			'domain' => 'opencart.dev',
			'module_code' => $this->MODULE_CODE
		));
		$result = curl_exec($ch);

		// convert the json to an array
		$result = json_decode($result, true);

		// check if the key was valid
		if(empty($result['valid']) OR $result['valid'] == false)
		{
			die("Invalid Key!");
		}
		else
		{
			// print_r($result); die();
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