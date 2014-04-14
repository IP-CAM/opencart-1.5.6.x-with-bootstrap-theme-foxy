<?php 


/**
* Every module should extend this class
*/
class ModuleCore implements Module 
{
	
	function __construct() {}


	public function installDatabase()
	{
		# code...
	}


	public function uninstallDatabase()
	{
		# code...
	}
}