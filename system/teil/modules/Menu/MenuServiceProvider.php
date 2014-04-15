<?php 


class MenuProvider extends ServiceProvider {


	/**
	 * Register the service provider.
	 *
	 * @return void
	 */
	public function register()
	{
		$this->registerMenuBuilder();
	}


	/**
	 * Register the HTML builder instance.
	 *
	 * @return void
	 */
	protected function registerMenuBuilder()
	{
		$this->app->instance('Menu', new Menu);
	}


	/**
	 * Get the services provided by this provider.
	 *
	 * @return array
	 */
	public function provides()
	{
		return array('Menu');
	}


}