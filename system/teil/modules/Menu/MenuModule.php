<?php 


/**
* Simple menu module
*/
class MenuModule extends ModuleCore 
{
	
	function __construct()
	{
		echo "Hello, from menu";
	}
	

	public function installDatabase()
	{
		// Get abs path(main folder) of the module
		$modulePath = realpath(dirname(__FILE__));
		
		// Get install sql
		
		$file = file_get_contents($modulePath . '/resources/install.sql');
		
		echo "installing db";
	}

	public function uninstallDatabase()
	{
		echo "uninstalling db";
	}


	public function removeFiles()
	{
		echo "removing files";
	}
}