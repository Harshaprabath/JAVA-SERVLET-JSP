
document.addEventListener("DOMContentLoaded", function () {
    const feedbackForm = document.getElementById("feedbackForm");

    if (feedbackForm) {
        feedbackForm.addEventListener("submit", function (event) {
            event.preventDefault();
            let isValid = true;

            // Validation functions
            const validateMessage = (message) => {
                return message.trim().length > 0;
            };


            // Clear previous errors
            document.querySelectorAll('.error-message').forEach(el => el.textContent = '');
            document.querySelectorAll('.error').forEach(el => el.classList.remove('error'));

            // Validate message
            const messageInput = document.getElementById("message");
            if (!validateMessage(messageInput.value)) {
                document.getElementById("messageError").textContent = "Feedback is required";
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
