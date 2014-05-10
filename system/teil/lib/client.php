<?php
error_reporting(E_ALL ^ E_DEPRECATED);
ini_set('display_errors', 1);

// This is a client example, this code would be encoded in your script or other software
// The client side does not require the Keyauth Class

// This will contact the server, send post data, get a result, and either stop the script
// or continue to run the script
// include the client config file, this would not be encoded
include("client_config.php");

// set the key in the post data array
$key_info['key'] = $config['key'];

// the match key we are using here is the clients
// domain name, this would be saved when they 
// purchase the script/program from your website
$key_info['domain'] = $_SERVER[ 'SERVER_NAME'  ];

// this is the url where you have your server script
$serverurl = "http://website-builder.ru/padl/Keyauth/Implementation/server.php";

// start a curl session
$ch = curl_init ($serverurl);

// return the output, don't print it
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true); 

// set curl to send post data
curl_setopt ($ch, CURLOPT_POST, true);

// set the post data to be sent
curl_setopt ($ch, CURLOPT_POSTFIELDS, $key_info);

// get the server response
$result = curl_exec ($ch);

// convert the json to an array
$result = json_decode($result, true);

// check if the key was valid
if($result['valid'] == true){
	
	// do nothing and let the script to continue running
	// echo "valid";
	
}
else {
	
	// key is not valid so stop it
	die("Invalid Key!");
	
}


?>