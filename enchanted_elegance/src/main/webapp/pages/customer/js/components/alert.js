document.addEventListener("DOMContentLoaded", function () {
    
    function getUrlParameter(name) {
        return new URLSearchParams(window.location.search).get(name)
            ? decodeURIComponent(new URLSearchParams(window.location.search).get(name).replace(/\+/g, ' '))
            : '';
    }

    // Check for any message parameters
    const errorMessage = getUrlParameter('error');
    const deleteMessage = getUrlParameter('message');
    const successMessage = getUrlParameter('success');

    // If any message exists, show an alert
    const message = errorMessage || deleteMessage || successMessage;

    if (message) {
        // Create alert container
        const alertContainer = document.createElement('div');
        alertContainer.style.cssText = 'position:fixed;top:0;left:0;width:100%;z-index:9999;text-align:center;padding:5px;';

        // Create alert div
        const alertDiv = document.createElement('div');
        alertDiv.className = `alert ${errorMessage ? 'alert-danger' : 'alert-success'} alert-dismissible`;
        alertDiv.style.cssText = 'display:inline-block;max-width:80%;margin:0 auto;';
        alertDiv.role = 'alert';

        // Add close button and message
        alertDiv.innerHTML = `${message} <button type="button" class="close" aria-label="Close">&times;</button>`;

        // Append to DOM
        alertContainer.appendChild(alertDiv);
        document.body.appendChild(alertContainer);

        // Add event listener to close button
        alertDiv.querySelector('.close').addEventListener('click', function () {
            alertContainer.remove();
        });

        // Auto-remove after 5 seconds
        setTimeout(() => alertContainer.remove(), 5000);
    }
});