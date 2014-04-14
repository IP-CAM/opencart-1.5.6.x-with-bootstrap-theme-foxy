<?php 

$teil_directory = DIR_SYSTEM . 'teil/';
$teil_files = array();

function recurseDirs($main, $count = 0)
{
    GLOBAL $teil_files;

    $dirHandle = opendir($main);

    while($file = readdir($dirHandle))
    {
        if(is_dir($main . $file . "/") AND $file != '.' AND $file != '..')
        {
            $count = recurseDirs($main . $file . "/", $count);
        }
        elseif (preg_match("/\.php$/i", $file))
        {
            $count++;
            $teil_files[] = $main . $file;
        }
    }

    if ($count > 100)
    {
        throw new Exception("Too, many files to include");
    }
}

recurseDirs($teil_directory);

foreach ($teil_files as $file_path)
{
    require_once($file_path);
}