const fila = document.querySelector('.contenidor_carousel');
const pelicules = document.querySelectorAll('.pelicula');

const fletxaEsq = document.getElementById('fletxa_esq');
const fletxaDre = document.getElementById('fletxa_dre');

fletxaDre.addEventListener('click', () => {
    fila.scrollLeft += fila.offsetWidth;

    const indicadorActiu = document.querySelector('.indicadors .actiu');
    if(indicadorActiu.nextSibling) {
        indicadorActiu.nextSibling.classList.add('actiu');
        indicadorActiu.classList.remove('actiu');
    }
});

fletxaEsq.addEventListener('click', () => {
    fila.scrollLeft -= fila.offsetWidth;

    const indicadorActiu = document.querySelector('.indicadors .actiu');
    if(indicadorActiu.previousSibling) {
        indicadorActiu.previousSibling.classList.add('actiu');
        indicadorActiu.classList.remove('actiu');
    }
});

const numPag = Math.ceil(pelicules.length / 5);
for(let i = 0; i < numPag; i++){
    const indicador = document.createElement('button');

    if (i == 0){
        indicador.classList.add('actiu');
    }

    document.querySelector('.indicadors').appendChild(indicador);
    indicador.addEventListener('click', (e) => {
        fila.scrollLeft = i * fila.offsetWidth;

        document.querySelector('.indicadors .actiu').classList.remove('actiu');
        e.target.classList.add('actiu');
    });
}

pelicules.forEach((pelicula) => {
    pelicula.addEventListener('mouseenter', (e) => {
        const elemento = e.currentTarget;
        setTimeout(() => {
            pelicules.forEach(pelicula => pelicula.classList.remove('hover'));
            elemento.classList.add('hover');
        }, 300);
    });
});

fila.addEventListener('mouseleave', () => {
    pelicules.forEach(pelicula => pelicula.classList.remove('hover'));
});
