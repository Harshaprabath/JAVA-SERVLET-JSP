$(document).ready(function () {
    $(".off-carousel-container .owl-carousel").owlCarousel({
        loop: true,          // Infinite loop
        margin: 10,          // Space between items
        nav: false,           // Hide navigation arrows
        dots: false,          // Hide dots navigation
        autoplay: true,      // Auto play enabled
        autoplayTimeout: 5000, // Time before next slide
        responsive: {
            0: { items: 1 },   // 1 item on small screens
            783: { items: 2 }, // 2 items on medium screens
            1015: { items: 2 } // 2 items on large screens
        }
    });
});

$(document).ready(function () {
    $(".feed-carousel-container .owl-carousel").owlCarousel({
        loop: true,
        margin: 10,
        nav: false,
        dots: false,
        autoplay: true,
        autoplayTimeout: 5000,
        responsive: {
            0: { items: 1 },
            783: { items: 2 },
            1015: { items: 2 }
        }
    });
});