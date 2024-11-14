<?php
											
// Configuración de la conexión a la base de datos
$servername = "localhost:3306";
$username = "root";
$password = "1234";
$dbname = "projectelemonyx";
$err = false;
// Crea la conexión
$conn = new mysqli($servername, $username, $password, $dbname);

// Recibe los datos del formulario
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
$usuari = $_POST['usuari'];
$psswdL = $_POST['psswdL'];

$sql = "SELECT * FROM compte WHERE usuari = '$usuari' AND contrassenya = '$psswdL'";
$result = mysqli_query($conn, $sql);

if (mysqli_num_rows($result) == 1) {
    // Las credenciales son correctas

    session_start();
    $_SESSION['usuari'] = $usuari;
    header("Location: index.html");
    
} else {
    // Las credenciales son incorrectas
    $err = true;
    header("Location: login.view.php?error=true");
    exit();
    
    
}

if(!$err){
    echo "<div style='font-size: 1.5rem; text-align: center; color: white;'>Contrasenya incorrecta.</div>";
}
}

$conn->close();
?>