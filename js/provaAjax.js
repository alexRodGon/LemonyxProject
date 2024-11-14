document.addEventListener('DOMContentLoaded', inici);

function inici() {
  console.log('estic dins de inici');

  document.getElementById("resposta").style.display = "none";

  const xmlhttp = new XMLHttpRequest();
  xmlhttp.onload = function() {
    document.getElementById("resposta").innerHTML = this.responseText;
  }
  xmlhttp.open("GET", "consulta.php");
  xmlhttp.send();

  document.getElementById("myInput").addEventListener('keyup', myFunction);
}

function myFunction() {
  var input, filter, resposta, fitxa, titol, i, txtValue;
  input = document.getElementById("myInput");
  filter = input.value.toUpperCase();

  resposta = document.getElementById("resposta");
  fitxa = resposta.getElementsByClassName("fitxa");

  var found = false;
  var html = "";
  for (i = 0; i < fitxa.length; i++) {

    titol = fitxa[i].getElementsByTagName("p")[0];

    txtValue = titol.textContent || titol.innerText;

    if (txtValue.toUpperCase().indexOf(filter) > -1) {
      fitxa[i].style.display = "";
      found = true;
      html += fitxa[i].outerHTML;
    } else {
      fitxa[i].style.display = "none";
    }
  }

  if (!found) {
    html = "<p>No se encontraron resultados</p>";
  }

  resposta.innerHTML = html;
  resposta.style.display = found ? "block" : "none";
}
