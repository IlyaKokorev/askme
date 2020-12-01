document.addEventListener('DOMContentLoaded', () => {
    const askButton = document.getElementById('ask-button')
    const askForm = document.getElementById('ask-form')
    askButton.addEventListener('click', (event) => {
        event.preventDefault()
        setTimeout(() => {
            askForm.style.display = askForm.style.display === 'block' ? 'none' : 'block'
        }, 300);
    })
})
