<?php 
ini_set("display_errors",0);

const HOST = "localhost";
const USER = "root";
const PASS = "";
const DB = "pwad_phpcrud";

$db = new mysqli(HOST,USER,PASS,DB);

 if ($db->connect_errno) {
 	echo "Failed to connect to Mysql: " . $db->connect_error;
 	exit();
 }
 // echo "<pre>";
// print_r($db);

 ?>