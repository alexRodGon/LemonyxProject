<?php
// Conexión a la base de datos
$conn = mysqli_connect("localhost:3306", "root", "1234", "projectelemonyx");

// Verificar si la conexión fue exitosa
if (!$conn) {
    die("Error de conexión: " . mysqli_connect_error());
}

// Consulta para seleccionar las rutas de las imágenes desde la base de datos

$genereComedia = "Comedia";
$sqlComedia = "SELECT produccions.caratula FROM produccions 
JOIN `genere` ON produccions.id_categoria = genere.id_categoria WHERE genere.nom = '$genereComedia'";

// Ejecutar la consulta
$resultatComedia = mysqli_query($conn, $sqlComedia);

if ($resultatComedia) {
    $num_filasComedia = mysqli_num_rows($resultatComedia);
    if ($num_filasComedia > 0) {
        // Procesar los resultados
    } else {
        echo "No se encontraron imágenes";
    }
} else {
    echo "Error en la consulta: " . mysqli_error($conn);
}


if (mysqli_num_rows($resultatComedia) > 0){

    // Recorrer los resultados y guardar las rutas en un array
    while ($filaComedia = mysqli_fetch_assoc($resultatComedia)) {

        echo "<img src= './imatges/" .$filaComedia["caratula"]. ".jpg'>";
       
    }
    // Imprimir las rutas separadas por un delimitador 
    
} else {
    echo "No se encontraron imágenes";
}


// Cerrar la conexión a la base de datos
mysqli_close($conn);
?>