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
            case 'pending':
                filterId = 2;
                break;
            case 'processing':
                filterId = 3;
                break;
            case 'completed':
                filterId = 4;
                break;
            default:
                filterId = 1;
        }

        // Redirect to the new URL with the filterId
        window.location.href = `/enchanted_elegance/admin/contact-list?filterId=${filterId}`;
    });

    // Set the initial selected value based on the current URL
    const urlParams = new URLSearchParams(window.location.search);
    const currentFilterId = urlParams.get('filterId');

    if (currentFilterId) {
        switch (currentFilterId) {
            case '1':
                filterSelect.value = 'all';
                break;
            case '2':
                filterSelect.value = 'pending';
                break;
            case '3':
                filterSelect.value = 'processing';
                break;
            case '4':
                filterSelect.value = 'completed';
                break;
        }
    }
});