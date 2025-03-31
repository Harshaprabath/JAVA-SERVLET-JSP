document.addEventListener("DOMContentLoaded", function () {
    // Define the URLs
    const homeUrl = "/enchanted_elegance/pages/customer/index.jsp";
    const servicesUrl = "services.jsp";
    const haircutUrl = "haircut.jsp";
    const bookUrl = "/enchanted_elegance/pages/customer/booking.jsp";
    const contactUrl = "/enchanted_elegance/pages/customer/contact.jsp";
    const aboutUrl = "about.jsp";
    const feedbackUrl = "/enchanted_elegance/pages/customer/feedback.jsp";
    const loginUrl = "/enchanted_elegance/pages/customer/login.jsp";
    const registerUrl = "/enchanted_elegance/pages/customer/register.jsp";
    const bookingsUrl = "/enchanted_elegance/booking-list";
    const logoutUrl = "/enchanted_elegance/logout";
    const privacyPolicyUrl = "/enchanted_elegance/pages/customer/privacypolicy.jsp";

    // Set the hrefs for each link
    if (document.getElementById("homeLink")) document.getElementById("homeLink").href = homeUrl;
    if (document.getElementById("servicesLink")) document.getElementById("servicesLink").href = servicesUrl;
    if (document.getElementById("haircutLink")) document.getElementById("haircutLink").href = haircutUrl;
    if (document.getElementById("bookLink")) document.getElementById("bookLink").href = bookUrl;
    if (document.getElementById("contactLink")) document.getElementById("contactLink").href = contactUrl;
    if (document.getElementById("aboutLink")) document.getElementById("aboutLink").href = aboutUrl;
    if (document.getElementById("feedbackLink")) document.getElementById("feedbackLink").href = feedbackUrl;
    if (document.getElementById("loginLink")) document.getElementById("loginLink").href = loginUrl;
    if (document.getElementById("registerLink")) document.getElementById("registerLink").href = registerUrl;
    if (document.getElementById("myBookinsLink")) document.getElementById("myBookinsLink").href = bookingsUrl;
    if (document.getElementById("logoutLink")) document.getElementById("logoutLink").href = logoutUrl;
    if (document.getElementById("privacyPolicyLink")) document.getElementById("privacyPolicyLink").href = privacyPolicyUrl;
});