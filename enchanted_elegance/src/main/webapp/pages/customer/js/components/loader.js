document.addEventListener("DOMContentLoaded", function () {
    setTimeout(function () {
        const loaderContainer = document.querySelector(".enchanted-loader-container");
        loaderContainer.classList.add("enchanted-fade-out");

        // Remove from DOM after fade animation completes
        setTimeout(function () {
            loaderContainer.style.display = "none";

            // Here you would show your main content
            const mainContent = document.querySelector(".enchanted-main-content");
            if (mainContent) mainContent.style.display = "block";
        }, 500);
    }, 3000);
});