<?php 


/**
* Every module should extend this class
*/
class ModuleCore implements Module 
{

	// Link to default Opencart DB manager
	protected $db;

	// Here we get the abs path for out current module
	protected $modulePath;

	
	function __construct($file, $db)
	{
		$this->db = $db;

		$this->modulePath = realpath(dirname($file));
	}


	public function installDatabase()
	{
		throw new Exception("You should redeclare `installDatabase` method!");
	}


	public function uninstallDatabase()
	{
		throw new Exception("You should redeclare `uninstallDatabase` method!");
		
	}
}