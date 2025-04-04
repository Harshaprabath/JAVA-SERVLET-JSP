document.addEventListener("DOMContentLoaded", function () {
    const contactForm = document.getElementById("contactForm");

    if (contactForm) {
        contactForm.addEventListener("submit", function (event) {
            event.preventDefault();
            let isValid = true;

            // Validation functions
            const validateName = (name) => {
                return name.trim().length > 0;
            };

            const validatePhone = (phone) => {
                const phoneRegex = /^[0-9]{10,15}$/;
                return phoneRegex.test(phone);
            };

            const validateEmail = (email) => {
                const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
                return emailRegex.test(email);
            };

            const validateSubject = (subject) => {
                return subject.trim().length > 0;
            };

            const validateMessage = (message) => {
                return message.trim().length > 0;
            };

            // Clear previous errors
            document.querySelectorAll('.error-message').forEach(el => el.textContent = '');
            document.querySelectorAll('.error').forEach(el => el.classList.remove('error'));

            // Validate name
            const nameInput = document.getElementById("name");
            if (!validateName(nameInput.value)) {
                document.getElementById("nameError").textContent = "Name is required";
                nameInput.classList.add("error");
                isValid = false;
            }

            // Validate mobile
            const mobileInput = document.getElementById("mobile");
            if (!validatePhone(mobileInput.value.trim())) {
                document.getElementById("mobileError").textContent = "Valid phone number is required (10-15 digits)";
                mobileInput.classList.add("error");
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

            // Validate subject
            const subjectInput = document.getElementById("subject");
            if (!validateSubject(subjectInput.value)) {
                document.getElementById("subjectError").textContent = "Subject is required";
                subjectInput.classList.add("error");
                isValid = false;
            }

            // Validate message
            const messageInput = document.getElementById("message");
            if (!validateMessage(messageInput.value)) {
                document.getElementById("messageError").textContent = "Message is required";
                messageInput.classList.add("error");
                isValid = false;
            }

            // If all validations pass, submit the form
            if (isValid) {
                this.submit();
            }
        });
    }
});