const gridContainerComedia = document.getElementById("gridContainerComedia");

// Realizar una solicitud AJAX para obtener las imágenes desde la base de datos
const xhrComedia = new XMLHttpRequest();
xhrComedia.open("GET", "consultaGridComedia.php", true);
xhrComedia.onload = function() {

    if (xhrComedia.status === 200) {
        document.getElementById("gridContainerComedia").innerHTML = this.responseText;
        
    }
};
xhrComedia.send();