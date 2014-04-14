<?php 


/**
 * Every module should implement this intrface
 *
 * @return void
 */
interface Module {
	public function installDatabase();

	public function uninstallDatabase();
}