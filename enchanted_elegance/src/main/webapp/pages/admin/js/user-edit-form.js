// Admin forms validation
document.getElementById('userEditForm').addEventListener('submit', function (event) {
    event.preventDefault();

    // Reset previous errors
    resetErrors();

    // Validate fields
    const nameValid = validateName();
    const mobileValid = validateMobile();
    const emailValid = validateEmail();
    const passwordValid = validatePassword();
    const confirmPasswordValid = validateConfirmPassword();

    if (nameValid && mobileValid && emailValid && passwordValid && confirmPasswordValid) {
        // Form is valid, you can submit it or perform other actions
        this.submit(); // Uncomment to actually submit the form
    }
});

function resetErrors() {
    // Remove error classes from all inputs
    const inputs = document.querySelectorAll('#adminForm input');
    inputs.forEach(input => {
        input.classList.remove('error');
    });

    // Clear all error messages
    const errorMessages = document.querySelectorAll('.error-message');
    errorMessages.forEach(message => {
        message.textContent = '';
    });
}

function validateName() {
    const nameInput = document.getElementById('nameInput');
    const nameError = document.getElementById('nameError');
    const name = nameInput.value.trim();

    if (name === '') {
        nameInput.classList.add('error');
        nameError.textContent = 'Name is required';
        return false;
    }

    return true;
}

function validateMobile() {
    const mobileInput = document.getElementById('mobileInput');
    const mobileError = document.getElementById('mobileError');
    const mobile = mobileInput.value.trim();
    const mobileRegex = /^[0-9]{10}$/;

    if (mobile === '') {
        mobileInput.classList.add('error');
        mobileError.textContent = 'Mobile number is required';
        return false;
    }

    if (!mobileRegex.test(mobile)) {
        mobileInput.classList.add('error');
        mobileError.textContent = 'Please enter a valid 10-digit mobile number';
        return false;
    }

    return true;
}

function validateEmail() {
    const emailInput = document.getElementById('emailInput');
    const emailError = document.getElementById('emailError');
    const email = emailInput.value.trim();
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

    if (email === '') {
        emailInput.classList.add('error');
        emailError.textContent = 'Email is required';
        return false;
    }

    if (!emailRegex.test(email)) {
        emailInput.classList.add('error');
        emailError.textContent = 'Please enter a valid email address';
        return false;
    }

    return true;
}

function validatePassword() {
    const passwordInput = document.getElementById('passwordInput');
    const passwordError = document.getElementById('passwordError');
    const password = passwordInput.value;

    // If password is empty, it's allowed (not required)
    if (password === '') {
        return true;
    }

    // Only validate length if password is not empty
    if (password.length < 8) {
        passwordInput.classList.add('error');
        passwordError.textContent = 'Password must be at least 8 characters long';
        return false;
    }

    return true;
}

function validateConfirmPassword() {
    const passwordInput = document.getElementById('passwordInput');
    const confirmPasswordInput = document.getElementById('confirmPasswordInput');
    const confirmPasswordError = document.getElementById('confirmPasswordError');
    const password = passwordInput.value;
    const confirmPassword = confirmPasswordInput.value;

    // If password is empty, confirm password must also be empty
    if (password === '') {
        if (confirmPassword !== '') {
            confirmPasswordInput.classList.add('error');
            confirmPasswordError.textContent = 'Confirm password should be empty when password is empty';
            return false;
        }
        return true;
    }

    if (confirmPassword === '') {
        confirmPasswordInput.classList.add('error');
        confirmPasswordError.textContent = 'Please confirm your password';
        return false;
    }

    if (password !== confirmPassword) {
        confirmPasswordInput.classList.add('error');
        confirmPasswordError.textContent = 'Passwords do not match';
        return false;
    }

    return true;
}