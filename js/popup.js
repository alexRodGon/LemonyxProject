// Obtener los elementos del DOM
const enlaceMostrarPopup = document.getElementById('mostrarPopup');
const miPopup = document.getElementById('miPopup');
const btnCerrarPopup = document.getElementById('cerrarPopup');

// Agregar un evento de clic al enlace "Mostrar popup"
enlaceMostrarPopup.addEventListener('click', function(e) {
  e.preventDefault(); // Evitar que el enlace abra una nueva página
  miPopup.style.display = 'flex'; // Mostrar el popup
});

// Agregar un evento de clic al botón "Cerrar"
btnCerrarPopup.addEventListener('click', function() {
  miPopup.style.display = 'none'; // Ocultar el popup
});