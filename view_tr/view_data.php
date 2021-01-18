<table border="1">
	<tr>
		<th>ID</th>
		<th>Name</th>
		<th>Mobile</th>
		<th>Gender</th>
		<th>Road</th>
		<th>District</th>
		<th>Action</th>
	</tr>


<?php 
// ini_set("display_errors",0);
// define('HOST', 'localhost');
// define('USER', 'root');
// define('PASS', '');
// define('DB', 'view');

// $db= new Mysqli(HOST,USER,PASS,DB);

// if ($db->connect_errno) {
// 	echo "Database NOt connect".$db->connect_error;
// }

$db = new mysqli('localhost','root','','view');

$sql = "SELECT * FROM student_detalis_view";

$data = $db->query($sql);

while ($row=$data->fetch_assoc()) {
	?>

	<tr>
		
		<td><?php echo $row['id'] ?></td>
		<td><?php echo $row['name'] ?></td>
		<td><?php echo $row['mobile'] ?></td>
		<td><?php echo $row['gender'] ?></td>
		<td><?php echo $row['road_area'] ?></td>
		<td><?php echo $row['district'] ?></td>
		<td><a href="delete_student.php?id=<?php echo $row['id'] ?>">Delete</a></td>
	</tr>

<?php

}

 ?>
</table>






