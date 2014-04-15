<?php 


class MenuBuilder 
{
	private $app;


	public function __construct(App $app)
	{
		$this->app = $app;
	}


	public function test()
	{
		// $this->app->make('registry')->get('db')->query("select * from product");

		
		echo "testing menu module";
	}

}