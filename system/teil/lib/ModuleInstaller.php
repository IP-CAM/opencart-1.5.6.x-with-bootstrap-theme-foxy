<?php 


/**
* Copy files and executes needs `Command`s to install module
*/
class ModuleInstaller 
{
	private $moduleName;
	private $filename;
	private $path;
	private $dir;

	private $db;

	
	// Store module info
	function __construct($db, $moduleName, $filename, $dir)
	{
		$this->db = $db;

		$this->moduleName = $moduleName;
		$this->filename = $filename;
		$this->dir = $dir;

		$this->path = $this->dir . $this->filename;
	}


	/**
	 * Here we are going to unzip and copy/replace module files
	 *
	 * @return void
	 */
	public function unzip()
	{
		$zip = new ZipArchive;

		$res = $zip->open($this->path);
		if ($res === TRUE)
		{
			$zip->extractTo(DIR_HOME);
			$zip->close();
		}
		else
		{
			throw new Exception("Error while installing module");
		}
	}


	// Run needle command
	public function boot()
	{
		// Get module command name
		$commandName = $this->moduleName . 'Command';
		$className = $this->moduleName . 'Module';

		// Autoload all the module files
		$this->autoloadModuleFiles();

		// Create new command and pass module to it
		$module = new $className($this->db);
		$command = new $commandName($module);
		
		// Execute ;)
		$command->execute();
	}


	/**
	 * Autoload module files
	 *
	 * @return void
	 */
	private function autoloadModuleFiles()
	{
		$autoload = new TeilAutoload();
		$moduleFiles = $autoload->getLoaderPaths(DIR_TEIL_MODULES . $this->moduleName . '/');

		foreach ($moduleFiles as $file)
		{
			require_once($file);
		}
	}


}