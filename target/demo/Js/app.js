const toggler = document.querySelector('.toggler');
const sidebar = document.querySelector('.sidebar');
const content = document.querySelector('.content');

toggler.addEventListener('click', (e) => {
    e.preventDefault();
    sidebar.classList.toggle('show');
    // content.classList.toggle('show');
});