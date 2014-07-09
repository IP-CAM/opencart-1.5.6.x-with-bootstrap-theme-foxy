<?php 


// $key string (is our case - 'Menu') is not required
$GLOBALS['TeilServiceProviders']['menu'] = 'MenuServiceProvider';


use Teil\Lib\ModuleCore;


/**
* Simple menu module
*/
class MenuModule extends ModuleCore 
{

	public function __construct($db)
	{
		parent::__construct(__FILE__, $db);
	}

	public function installDatabase()
	{
		// Get install sql
		$installSql = file_get_contents($this->modulePath . '/resources/install.sql');
		$unInstallSql = file_get_contents($this->modulePath . '/resources/uninstall.sql');

		$this->db->query($unInstallSql);
		$this->db->query($installSql);
	}


	public function uninstallDatabase()
	{
		// Get install sql
		$unInstallSql = file_get_contents($this->modulePath . '/resources/uninstall.sql');

		$this->db->query($unInstallSql);
	}

	
}