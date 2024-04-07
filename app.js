document.querySelector('input#name-submit-btn')?.addEventListener('mouseup', () => {
    let name = document.querySelector('input#name-input');
    let greeting = document.querySelector('h1#greeting-message');
    greeting.innerHTML = `Hello, ${name.value.charAt(0).toUpperCase() + name.value.slice(1)} ❤️`;
    name.value = '';
})