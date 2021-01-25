<?php 

ini_set("display_error", 0);
define("HOST", "localhost");
define("USER", "root");
define("PASS", "");
define("bd", "class71p");

$bd = new mysqli(HOST,USER,PASS,bd);

if ($bd->connect_errno) {
	echo "Database NOt fund".$bd->connect_error;
}

 ?>