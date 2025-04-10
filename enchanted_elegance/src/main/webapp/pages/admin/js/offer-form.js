// Function to load and display the image preview
function loadImagePreview() {
    const imageUrl = document.getElementById('imageUrlInput').value;
    const imagePreview = document.getElementById('imagePreview');

    if (imageUrl) {
        imagePreview.src = imageUrl;
        imagePreview.style.display = 'block';
    } else {
        imagePreview.style.display = 'none';
    }
}
// Offer Form validation
document.getElementById('offerForm').addEventListener('submit', function (event) {
    let isValid = true;

    // Clear previous errors
    document.querySelectorAll('.error-message').forEach(el => el.textContent = '');
    document.querySelectorAll('.form-control').forEach(el => el.classList.remove('error'));

    // Validate title (required only)
    const titleInput = document.getElementById('titleInput');
    if (!titleInput.value.trim()) {
        document.getElementById('titleError').textContent = 'Title is required';
        titleInput.classList.add('error');
        isValid = false;
    }

    // Validate discount (required only)
    const discountInput = document.getElementById('discountInput');
    if (!discountInput.value.trim()) {
        document.getElementById('discountError').textContent = 'Discount is required';
        discountInput.classList.add('error');
        isValid = false;
    }

    // Validate image URL (keeps full validation)
    const imageUrlInput = document.getElementById('imageUrlInput');
    if (!imageUrlInput.value.trim()) {
        document.getElementById('imageUrlError').textContent = 'Image URL is required';
        imageUrlInput.classList.add('error');
        isValid = false;
    } else if (!isValidUrl(imageUrlInput.value.trim())) {
        document.getElementById('imageUrlError').textContent = 'Enter a valid URL';
        imageUrlInput.classList.add('error');
        isValid = false;
    }

    // Validate description (required only)
    const descriptionInput = document.getElementById('descriptionInput');
    if (!descriptionInput.value.trim()) {
        document.getElementById('descriptionError').textContent = 'Description is required';
        descriptionInput.classList.add('error');
        isValid = false;
    }

    if (!isValid) {
        event.preventDefault();
    }
});

// URL validation helper (kept for image URL validation)
function isValidUrl(string) {
    try {
        new URL(string);
        return true;
    } catch (_) {
        return false;
    }
}
// Initialize image preview on page load if there's already a URL
document.addEventListener('DOMContentLoaded', function () {
    const imageUrlInput = document.getElementById('imageUrlInput');
    if (imageUrlInput.value.trim()) {
        loadImagePreview();
    }
});