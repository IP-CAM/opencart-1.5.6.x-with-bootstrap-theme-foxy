<?php 


/**
 * Menu module command
 *
 * @return void
 */
class MenuModuleCommand implements Command {
	
	private $module;
	private $modulePath;


	public function __construct($module)
	{
		$this->module = $module;
	}


	public function execute()
	{
		$this->module->installDatabase();
	}


	public function undo()
	{
		$this->module->removeFiles();
		$this->module->uninstallDatabase();
	}
}