<?php 


if ( ! empty($_POST['module_code']))
{
	$module_code = $_POST['module_code'];
}

if ( ! empty($_POST['key']))
{
	$key = $_POST['key'];
}

if (isset($key) AND isset($module_code))
{
	file_put_contents('system/teil/modules/' . $module_code . '/resources/license.dat', $key);
}

die();