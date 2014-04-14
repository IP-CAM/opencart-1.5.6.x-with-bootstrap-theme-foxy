<?php 


/**
 * Every module installation program should implement this interface
 *
 * @return void
 */
interface Command {
	public function execute();

	public function undo();
}