<?php 
$db = new mysqli('localhost','root','','view');

$id = $_GET['id'];

$sql = "DELETE FROM student_info WHERE id = '$id'";
$db->query($sql);
header("Location: view_data.php");

 ?>