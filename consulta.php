<?php

$servername = "localhost:3306";
$username = "root";
$password = "1234";
$dbname = "projectelemonyx";   
// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}
echo "<br><br>";



$sql = "SELECT produccions.nom, pelicules.durada, produccions.caratula, produccions.anys
FROM produccions
JOIN `pelicules` ON produccions.id_produccio = `pelicules`.id_produccio;";
$result = $conn->query($sql);
if ($result->num_rows > 0) {
    // output data of each row
    while($row = $result->fetch_assoc()) {
      echo "<div class='fitxa'>";
      echo "<img src= './imatges/"  . $row["caratula"]. ".jpg' alt='caratula'>";
      echo "<p class='titol'>" . $row["nom"]. " </p>";
      echo "<p>" . $row["anys"]. " </p>";
      echo "<p class='durada'> " . $row["durada"]. " min</p>";
      echo "</div>";
    }
  } else {
    echo "0 results";
  }



?>