
document.addEventListener("DOMContentLoaded", function () {
    const bookingForm = document.getElementById("bookingForm");

    if (bookingForm) {
        bookingForm.addEventListener("submit", function (event) {
            event.preventDefault();
            let isValid = true;

            // Validation functions
            const validateName = (name) => {
                return name.trim().length > 0;
            };

            const validateEmail = (email) => {
                const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
                return emailRegex.test(email);
            };

            const validatePhone = (phone) => {
                const phoneRegex = /^[0-9]{10,15}$/;
                return phoneRegex.test(phone);
            };

            const validateDate = (date) => {
                return date.trim().length > 0;
            };

            const validateService = (service) => {
                return service !== "";
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

            // Validate date
            const dateInput = document.getElementById("date");
            if (!validateDate(dateInput.value)) {
                document.getElementById("dateError").textContent = "Please select a date";
                dateInput.classList.add("error");
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

            // Validate service selection
            const serviceInput = document.getElementById("treatment");
            if (!validateService(serviceInput.value)) {
                document.getElementById("serviceError").textContent = "Please select a service";
                serviceInput.classList.add("error");
                isValid = false;
            }

            // If all validations pass, submit the form
            if (isValid) {
                this.submit();
            }
        });
    }

    // Initialize datepicker
    $('.datepicker').datepicker({
        format: 'yyyy-mm-dd',
        autoclose: true,
        todayHighlight: true,
        startDate: new Date()
    });
});
