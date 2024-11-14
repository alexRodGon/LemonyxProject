const gridContainerAccio = document.getElementById("gridContainerAccio");

// Realizar una solicitud AJAX para obtener las imágenes desde la base de datos
const xhrAccio = new XMLHttpRequest();
xhrAccio.open("GET", "consultaGridAccio.php", true);
xhrAccio.onload = function() {

    if (xhrAccio.status === 200) {
        document.getElementById("gridContainerAccio").innerHTML = this.responseText;
        
    }
};
xhrAccio.send();