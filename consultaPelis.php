<?php

$servername = "localhost";
$username = "root";
$password = "1234";
$dbname = "projectelemonyx";

// Crea la conexión
$conn = new mysqli($servername, $username, $password, $dbname);

// Verifica la conexión
if ($conn->connect_error) {
  die("Conexión fallida: " . $conn->connect_error);
}

$sql = "SELECT produccions.caratula FROM produccions";
$result = $conn->query($sql);


if ($result->num_rows > 0) {
  // Mostrar las imágenes en el HTML usando un bucle while
  echo '<div class="contenidor_carousel">';
  echo '<div class="carousel">';
  while ($row = $result->fetch_assoc()) {
    echo '<div class="pelicula"><a href="#"><img src="./imatges/' . $row["caratula"] . '" alt="peli"></a></div>';
  }
  echo '</div>';
  echo '</div>';
} else {
  echo "0 resultados";
}
?>