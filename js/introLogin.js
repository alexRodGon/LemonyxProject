let intro = document.querySelector('.intro');
let logo = document.querySelector('.logo');
let logoSpan = document.querySelectorAll('.part-logo');

window.addEventListener('DOMContentLoaded', () => {

    setTimeout(() => {
        logoSpan.forEach((span, index) => {
            setTimeout(() => {
                span.classList.add('active');
            }, (index + 1) * 75);
        });
        
        setTimeout(() => {
            logoSpan.forEach((span, index) => {
                setTimeout(() => {
                    span.classList.remove('active');
                    span.classList.add('fade');
                }, (span + 1) * 35);
            });
        }, 1000);

        setTimeout(() => {
            intro.style.top = '-100vh';
        }, 1300);

    });
});