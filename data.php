<?php
$q = trim($_GET['q']);

$servername = "localhost";
$username = "root";
$password = "";
$dbname = "test";

$conn = mysqli_connect($servername, $username, $password, $dbname);

if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}

$isNumber = preg_match('/\d+/', $q);

$queryBody = "SELECT s.id, s.name, s.address, p.id, n.number, num_type.shortname
	FROM subscriber as s
	INNER JOIN phone as p ON p.subscriber_id = s.id
	LEFT JOIN number as n ON n.phone_id = p.id
	LEFT JOIN number_type as num_type ON num_type.id = n.type";

$whereByNumber = " WHERE n.number LIKE '%{$q}%'";
$whereNyName = " WHERE UPPER(s.name) LIKE UPPER('%{$q}%')";

$queryBody .= $isNumber ? $whereByNumber : $whereNyName;

$result = $conn->query($queryBody);

if ($result->num_rows > 0) {
	$content = "";
    while ($r = $result->fetch_assoc()) {
      $content .= "<tr><td>0</td><td>".$r["name"]."</td><td>".$r["address"]."</td><td>".$r["number"]."</td><td>".$r["shortname"]."</td></tr>";
    }
    echo "<table><tr><th>#</th><th>Ім'я</th><th>Адреса</th><th>Номер</th><th>Тип</th></tr>".$content."</table>";
} 

$conn->close();
?>