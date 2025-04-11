document.addEventListener('DOMContentLoaded', function () {
    const filterSelect = document.getElementById('filter-select');

    filterSelect.addEventListener('change', function () {
        const selectedValue = this.value;
        let filterId;

        // Map the selected value to the corresponding filterId
        switch (selectedValue) {
            case 'all':
                filterId = 1;
                break;
            case 'true':
                filterId = 2;  // Assuming 'Published' is filterId=2 (you had 1 in your example, but it's not clear)
                break;
            case 'false':
                filterId = 3;
                break;
            default:
                filterId = 1;
        }

        // Redirect to the new URL with the filterId
        window.location.href = `/enchanted_elegance/admin/feedback-list?filterId=${filterId}`;
    });

    // Optional: Set the initial selected value based on the current URL
    const urlParams = new URLSearchParams(window.location.search);
    const currentFilterId = urlParams.get('filterId');

    if (currentFilterId) {
        switch (currentFilterId) {
            case '1':
                filterSelect.value = 'all';
                break;
            case '2':
                filterSelect.value = 'true';
                break;
            case '3':
                filterSelect.value = 'false';
                break;
        }
    }
});