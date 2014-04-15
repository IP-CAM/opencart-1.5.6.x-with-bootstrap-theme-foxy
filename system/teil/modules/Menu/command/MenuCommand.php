<?php 


/**
 * Menu module command
 *
 * @return void
 */
class MenuCommand implements Command {
	
	private $module;


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