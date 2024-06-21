document.addEventListener('DOMContentLoaded', function() {
    const form = document.getElementById('login-form');
    const errorModal = document.getElementById('error-modal');
    const errorMessage = document.getElementById('error-message');
    const closeModal = document.getElementsByClassName('close')[0];

    form.addEventListener('submit', function(event) {
        const selectedRole = document.querySelector('input[name="role"]:checked');
        if (!selectedRole) {
            event.preventDefault();
            showErrorModal('Selecione uma forma de login.');
        }
    });

    closeModal.onclick = function() {
        errorModal.style.display = 'none';
    }

    window.onclick = function(event) {
        if (event.target == errorModal) {
            errorModal.style.display = 'none';
        }
    }

    function showErrorModal(message) {
        errorMessage.textContent = message;
        errorModal.style.display = 'block';
    }
});
