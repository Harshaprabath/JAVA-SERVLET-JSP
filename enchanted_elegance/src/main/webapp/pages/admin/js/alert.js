document.addEventListener("DOMContentLoaded", function () {
    function getUrlParameter(name) {
        return new URLSearchParams(window.location.search).get(name)
            ? decodeURIComponent(new URLSearchParams(window.location.search).get(name).replace(/\+/g, ' '))
            : '';
    }

    const errorMessage = getUrlParameter('error');
    const deleteMessage = getUrlParameter('message');
    const successMessage = getUrlParameter('success');
    const message = errorMessage || deleteMessage || successMessage;

    if (message) {
        const alertContainer = document.createElement('div');
        alertContainer.style.cssText = 'position:fixed;top:0;left:0;width:100%;z-index:9999;text-align:center;padding:5px;';

        const alertDiv = document.createElement('div');
        alertDiv.className = `alert ${errorMessage ? 'alert-danger' : 'alert-success-cus'}`;
        alertDiv.style.cssText = `
            display: inline-block;
            max-width: fit-content;
            margin: 0 auto;
            padding: 10px 20px;
            background-color: ${errorMessage ? '#f8d7da' : '#d4edda'};
            color: ${errorMessage ? '#721c24' : '#155724'};
            border: 1px solid ${errorMessage ? '#f5c6cb' : '#c3e6cb'};
            border-radius: 4px;
            font-size: 1rem;
            line-height: 1.2;
        `;
        alertDiv.role = 'alert';

        const messageSpan = document.createElement('span');
        messageSpan.textContent = message;
        messageSpan.style.cssText = 'margin: 0; padding: 0;';

        alertDiv.appendChild(messageSpan);
        alertContainer.appendChild(alertDiv);
        document.body.appendChild(alertContainer);

        setTimeout(() => alertContainer.remove(), 5000);
    }
});
