<?php 


/**
* Copy files and executes needs `Command`s to install module
*/
class ModuleInstaller 
{
	private $classname;
	private $filename;
	private $path;
	private $dir;

	
	// Store module info
	function __construct($classname, $filename, $dir)
	{
		$this->classname = $classname;
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
		$commandName = $this->classname . 'Command';

		// Create new command and pass module to it
		$module = new $this->classname();
		$command = new $commandName($module);
		
		// Execute ;)
		$command->execute(); die();
	}

}