<?php 


/**
* Download .zip file
*/
class TeilLoader 
{
	// path of the progress file
	private $progress_container_file;

	// path to the download dir
	private $download_directory;

	// local name of the file (name_of_the_file)
	private $local_filename;

	// name of the file with extension (name_of_the_file.zip)
	private $full_filename;

	// Url to the sourse
	private $url;


	/**
	 * All the instalable modules should be .zip
	 * They should be in the $url directory
	 * Than url will be like $url . $filename.zip
	 *
	 * @return void
	 */
	function __construct ($url, $filename, $download_directory = 'downloads')
	{
		$this->url = $url;

		$download_directory_hash = md5($download_directory) . '/';
		$this->download_directory = DIR_SYSTEM . "teil/" . $download_directory_hash;

		$this->local_filename = md5($filename);
		$this->full_filename = $this->local_filename . '.zip';

		// temp progress container
		$this->progress_container_file = DIR_SYSTEM . 'teil/' . $download_directory_hash . $this->local_filename . '.txt';

		// create dowlload directory if not exists
		$this->checkDownloadDirectory();
	}


	private function checkDownloadDirectory()
	{
		if ( ! file_exists($this->download_directory))
		{
			mkdir($this->download_directory, 0777, true);
		}
	}


	/**
	 * We have to specifiy only url for the file and filename
	 *
	 * @return void
	 */
	public function load($timeout = 1000)
	{
		$ch = curl_init();

		curl_setopt($ch, CURLOPT_URL, $this->url);
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
		curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, $timeout);

		// Progres
		curl_setopt($ch, CURLOPT_PROGRESSFUNCTION, function ($download_size, $downloaded, $upload_size, $uploaded)
		{
		    if ($download_size > 0)
		    {
		    	$done_percent = $downloaded / $download_size  * 100;

		    	file_put_contents($this->progress_container_file, $done_percent);
		    }
		});

		curl_setopt($ch, CURLOPT_NOPROGRESS, false);
		curl_setopt($ch, CURLOPT_HEADER, 0);
		curl_setopt($ch, CURLOPT_USERAGENT, $_SERVER['HTTP_USER_AGENT']);
		
		$downloaded = curl_exec($ch);
		
		curl_close($ch);

		$this->saveFile($downloaded);
	}


	private function saveFile($data)
	{
		$path = $this->download_directory . $this->full_filename;

		file_put_contents($path, $data);

		$this->installModule($path);
	}


	private function installModule($path)
	{
		$zip = new ZipArchive;

		$res = $zip->open($path);

		if ($res === TRUE) {

			$zip->extractTo(DIR_HOME);
			$zip->close();

			echo 'woot!';
		} else {
			echo 'doh!';
		}
	}
}