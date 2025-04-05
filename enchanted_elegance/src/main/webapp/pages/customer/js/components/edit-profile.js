document.getElementById("editProfileForm").addEventListener("submit", function (event) {
    event.preventDefault();
    let isValid = true;

    // Validation functions
    const validateEmail = (email) => {
        const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        return emailRegex.test(email);
    };

    const validateMobile = (mobile) => {
        const mobileRegex = /^[0-9]{10,15}$/;
        return mobileRegex.test(mobile);
    };

    const validatePassword = (password) => {
        return password.length >= 8;
    };

    // Clear previous errors
    document.querySelectorAll('.error-message').forEach(el => el.textContent = '');
    document.querySelectorAll('.error').forEach(el => el.classList.remove('error'));

    // Validate name
    const nameInput = document.getElementById("name");
    if (!nameInput.value.trim()) {
        document.getElementById("nameError").textContent = "Name is required";
        nameInput.classList.add("error");
        isValid = false;
    }

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

    // Validate mobile
    const mobileInput = document.getElementById("mobile");
    if (!mobileInput.value.trim()) {
        document.getElementById("mobileError").textContent = "Mobile number is required";
        mobileInput.classList.add("error");
        isValid = false;
    } else if (!validateMobile(mobileInput.value.trim())) {
        document.getElementById("mobileError").textContent = "Please enter a valid mobile number";
        mobileInput.classList.add("error");
        isValid = false;
    }

    // Validate password
    const passwordInput = document.getElementById("password");
    // If password field is empty, allow form submission (no validation)
    if (passwordInput.value.trim() === "") {
        // Do nothing - empty password is allowed
    } else {
        // If password is not empty, check if it meets the 8-character requirement
        if (!validatePassword(passwordInput.value.trim())) {
            document.getElementById("passwordError").textContent = "Password must be at least 8 characters";
            passwordInput.classList.add("error");
            isValid = false;
        }
    }

    // Validate password confirmation
    const confirmPasswordInput = document.getElementById("confirmPassword");
    if (confirmPasswordInput.value.trim() !== passwordInput.value.trim()) {
        document.getElementById("confirmPasswordError").textContent = "Passwords do not match";
        confirmPasswordInput.classList.add("error");
        isValid = false;
    }

    // If all validations pass, submit the form
    if (isValid) {
        this.submit();
    }
});