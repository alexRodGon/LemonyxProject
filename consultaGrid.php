<?php
// Conexión a la base de datos
$conn = mysqli_connect("localhost:3306", "root", "1234", "projectelemonyx");

// Verificar si la conexión fue exitosa
if (!$conn) {
    die("Error de conexión: " . mysqli_connect_error());
}

// Consulta para seleccionar las rutas de las imágenes desde la base de datos

$genereDrama = "Drama";
$sql = "SELECT produccions.caratula FROM produccions 
JOIN `genere` ON produccions.id_categoria = genere.id_categoria WHERE genere.nom = '$genereDrama'";

// Ejecutar la consulta
$resultado = mysqli_query($conn, $sql);

if ($resultado) {
    $num_filas = mysqli_num_rows($resultado);
    if ($num_filas > 0) {
        // Procesar los resultados
    } else {
        echo "No se encontraron imágenes";
    }
} else {
    echo "Error en la consulta: " . mysqli_error($conn);
}


// Verificar si se encontraron registros
if (mysqli_num_rows($resultado) > 0){

    // Recorrer los resultados y guardar las rutas en un array
    while ($fila = mysqli_fetch_assoc($resultado)) {

        echo "<img src= './imatges/" .$fila["caratula"]. ".jpg'>";
    }

    // Imprimir las rutas separadas por un delimitador 
    
} else {
    echo "No se encontraron imágenes";
}

// Cerrar la conexión a la base de datos
mysqli_close($conn);
?>