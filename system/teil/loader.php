<?php 
ob_flush();
flush();

echo "Loading ...";


$data = getfile("http://pimi.website-builder.ru/tested_download.rar");

function getfile($url, $timeout = 1000)
{
	$ch = curl_init();

	curl_setopt($ch,CURLOPT_URL,$url);
	curl_setopt($ch,CURLOPT_RETURNTRANSFER,1);
	curl_setopt($ch,CURLOPT_CONNECTTIMEOUT,$timeout);

	// Progres
	curl_setopt($ch, CURLOPT_PROGRESSFUNCTION, 'progress');
	curl_setopt($ch, CURLOPT_NOPROGRESS, false); // needed to make progress function work
	curl_setopt($ch, CURLOPT_HEADER, 0);
	curl_setopt($ch, CURLOPT_USERAGENT, $_SERVER['HTTP_USER_AGENT']);
	
	$downloaded = curl_exec($ch);
	
	curl_close($ch);

	return $downloaded;
}

file_put_contents('hey.rar', $data);

echo "Done";
ob_flush();
flush();

/*
ob_flush();
flush();

$ch = curl_init();
curl_setopt($ch, CURLOPT_URL, "http://pimi.website-builder.ru/tested_download.rar");
//curl_setopt($ch, CURLOPT_BUFFERSIZE,128);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
curl_setopt($ch, CURLOPT_PROGRESSFUNCTION, 'progress');
curl_setopt($ch, CURLOPT_NOPROGRESS, false); // needed to make progress function work
curl_setopt($ch, CURLOPT_HEADER, 0);
curl_setopt($ch, CURLOPT_USERAGENT, $_SERVER['HTTP_USER_AGENT']);
$html = curl_exec($ch);
curl_close($ch);

*/
function progress($download_size, $downloaded, $upload_size, $uploaded)
{
    if($download_size > 0)
    {
		echo "Downloaded: ";
		echo $downloaded;
		echo "<br>";

		echo "Download size: ";
		echo $download_size;
		echo "<br>";

		echo "Download: ";
		echo $downloaded / $download_size  * 100;
		echo "<br>";

		echo "<br>";
    }

    ob_flush();
    flush();
    sleep(1); // just to see effect
}
/*
echo "Done";
ob_flush();
flush();*/