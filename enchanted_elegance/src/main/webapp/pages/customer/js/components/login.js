document.getElementById("loginForm").addEventListener("submit", function (event) {
    event.preventDefault();
    let isValid = true;

    // Validation functions
    const validateEmail = (email) => {
        const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        return emailRegex.test(email);
    };

  
    // Clear previous errors
    document.querySelectorAll('.error-message').forEach(el => el.textContent = '');
    document.querySelectorAll('.error').forEach(el => el.classList.remove('error'));

    // Validate email
    const emailInput = document.getElementById("email");
    if (!emailInput.value.trim()) {
        document.getElementById("emailError").textContent = "Email is required";
        emailInput.classList.add("error");
        isValid = false;
    } else if (!validateEmail(emailInput.value.trim())) {
        document.getElementById("emailError").textContent = "Please enter a valid email address";
        emailInput.classList.add("error");
        isValid = false;
    }


    // Validate password
    const passwordInput = document.getElementById("password");
    if (!passwordInput.value.trim()) {
        document.getElementById("passwordError").textContent = "Password is required";
        passwordInput.classList.add("error");
        isValid = false;
    }

    // If all validations pass, submit the form
    if (isValid) {
        this.submit();
    }
});