<?php 
if ($_SERVER['REQUEST_METHOD']=='POST') {
	$username = $_POST['username'];
	$pass = $_POST['pass'];
	$pass = md5($pass);

	$db = new mysqli("localhost","root","","jquery_evidance");

	$sql= "SELECT * FROM users WHERE username='$username' AND password='$pass'";
	// $db->query($sql); when use affected_rows
	$data = $db->query($sql);
	//if ($db->affected_rows>0) {
	if ($data->num_rows>0) {
	
		echo "User valid";
	}else{
		echo "User Unvalid";
	}
}


 ?>

<table>
	<form action="" method="POST">
	<tr>
		<td>Username</td>
		<td><input type="text" name="username"></td>
	</tr>
	<tr>
		<td>Password</td>
		<td><input type="text" name="pass"></td>
	</tr>
	<tr>
		<td></td>
		<td><input type="submit" name="submit" value="submit"></td>
	</tr>
	</form>
</table>