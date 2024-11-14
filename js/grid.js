const gridContainer = document.getElementById("gridContainer");

// Realizar una solicitud AJAX para obtener las imágenes desde la base de datos
const xhr = new XMLHttpRequest();
xhr.open("GET", "consultaGrid.php", true);
xhr.onload = function() {

    if (xhr.status === 200) {
        document.getElementById("gridContainer").innerHTML = this.responseText;
        
    }
};
xhr.send();