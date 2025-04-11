document.addEventListener('DOMContentLoaded', function () {
    const form = document.getElementById('feedback-form');

    form.addEventListener('submit', function (event) {
        let isValid = true;

        // Clear previous errors
        document.querySelectorAll('.error-message').forEach(el => el.textContent = '');
        document.querySelectorAll('.form-control').forEach(el => el.classList.remove('error'));

        // Name validation
        const nameInput = document.getElementById('nameInput');
        if (!nameInput.value.trim()) {
            document.getElementById('nameError').textContent = 'Name is required';
            nameInput.classList.add('error');
            isValid = false;
        }

        // Email validation
        const emailInput = document.getElementById('emailInput');
        const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        if (!emailInput.value.trim()) {
            document.getElementById('emailError').textContent = 'Email is required';
            emailInput.classList.add('error');
            isValid = false;
        } else if (!emailRegex.test(emailInput.value)) {
            document.getElementById('emailError').textContent = 'Please enter a valid email';
            emailInput.classList.add('error');
            isValid = false;
        }

        // Mobile validation
        const mobileInput = document.getElementById('mobileInput');
        const mobileRegex = /^[0-9]{10,15}$/;
        if (!mobileInput.value.trim()) {
            document.getElementById('mobileError').textContent = 'Mobile is required';
            mobileInput.classList.add('error');
            isValid = false;
        } else if (!mobileRegex.test(mobileInput.value)) {
            document.getElementById('mobileError').textContent = 'Please enter a valid mobile number';
            mobileInput.classList.add('error');
            isValid = false;
        }

        // Message validation
        const messageInput = document.getElementById('messageInput');
        if (!messageInput.value.trim()) {
            document.getElementById('messageError').textContent = 'Message is required';
            messageInput.classList.add('error');
            isValid = false;
        }

        // Date validation
        const dateInput = document.getElementById('dateInput');
        if (!dateInput.value) {
            document.getElementById('dateError').textContent = 'Date is required';
            dateInput.classList.add('error');
            isValid = false;
        }

        if (!isValid) {
            event.preventDefault();
        }
    });
});