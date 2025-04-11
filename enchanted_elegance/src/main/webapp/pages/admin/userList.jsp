<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.enchantedelegance.models.adminmanagement.Admin" %>
<%@ page import="com.enchantedelegance.models.usermanagement.User" %>
<%@ page import="java.util.List" %>
<%
    Admin admin = (Admin) session.getAttribute("admin");
    if (admin == null) {
        response.sendRedirect("/enchanted_elegance/pages/admin/login.jsp?error=Please login first");
        return;
    }

    List<User> allUsers = (List<User>) request.getAttribute("users");
    int currentPage = 1;
    int recordsPerPage = 10;
    
    // Get current page from request parameter
    if(request.getParameter("page") != null) {
        currentPage = Integer.parseInt(request.getParameter("page"));
    }
    
    // Calculate pagination values
    int totalRecords = allUsers != null ? allUsers.size() : 0;
    int totalPages = (int) Math.ceil((double) totalRecords / recordsPerPage);
   
    // If current page is greater than total pages and not page 1, redirect to previous page
    if (currentPage > totalPages && totalPages > 0) {
        response.sendRedirect("?page=" + (currentPage - 1));
        return;
    }
    
    // If no records and not on page 1, redirect to page 1
    if (totalRecords == 0 && currentPage != 1) {
        response.sendRedirect("?page=1");
        return;
    }

    int start = (currentPage - 1) * recordsPerPage;
    int end = Math.min(start + recordsPerPage, totalRecords);
    
    // Get sublist for current page
    List<User> users = allUsers != null ? allUsers.subList(start, end) : null;
%>

<!doctype html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>User List &mdash; Enchanted Elegance</title>
  <link rel="stylesheet" href="/enchanted_elegance/pages/admin/css/styles.min.css" />
</head>

<body>
  <!--  Body Wrapper -->
  <div class="page-wrapper" id="main-wrapper" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full"
    data-sidebar-position="fixed" data-header-position="fixed">
    <!-- Sidebar Start -->
    <aside class="left-sidebar">
      <!-- Sidebar scroll-->
      <div>
        <div class="brand-logo d-flex align-items-center justify-content-between">
          <a href="/enchanted_elegance/pages/admin/index.jsp" class="text-nowrap">
            <h4><span class="text-primary">E</span>nchanted <span class="text-primary">E</span>legance</h4>
          </a>
          <div class="close-btn d-xl-none d-block sidebartoggler cursor-pointer" id="sidebarCollapse">
            <i class="ti ti-x fs-8"></i>
          </div>
        </div>
        <!-- Sidebar navigation-->
        <nav class="sidebar-nav scroll-sidebar" data-simplebar="">
          <ul id="sidebarnav">
            <li class="nav-small-cap">
              <i class="ti ti-dots nav-small-cap-icon fs-4"></i>
              <span class="hide-menu">Home</span>
            </li>
            <li class="sidebar-item">
              <a class="sidebar-link" href="/enchanted_elegance/pages/admin/index.jsp" aria-expanded="false">
                <span>
                  <i class="ti ti-layout-dashboard"></i>
                </span>
                <span class="hide-menu">Dashboard</span>
              </a>
            </li>
            <li class="nav-small-cap">
              <i class="ti ti-dots nav-small-cap-icon fs-4"></i>
              <span class="hide-menu">Admin</span>
            </li>
            <li class="sidebar-item">
              <a class="sidebar-link" href="/enchanted_elegance/admin/admin-list" aria-expanded="false">
                <span>
                  <i class="ti ti-user"></i>
                </span>
                <span class="hide-menu">All Admins</span>
              </a>
            </li>
            <li class="sidebar-item">
              <a class="sidebar-link" href="/enchanted_elegance/pages/admin/add-admin.jsp" aria-expanded="false">
                <span>
                  <i class="ti ti-user-plus"></i>
                </span>
                <span class="hide-menu">Add Admin</span>
              </a>
            </li>
            <li class="nav-small-cap">
              <i class="ti ti-dots nav-small-cap-icon fs-4"></i>
              <span class="hide-menu">Customer</span>
            </li>
            <li class="sidebar-item">
              <a class="sidebar-link active" href="/enchanted_elegance/user-list" aria-expanded="false">
                <span>
                  <i class="ti ti-user"></i>
                </span>
                <span class="hide-menu">All Users</span>
              </a>
            </li>
            <li class="nav-small-cap">
              <i class="ti ti-dots nav-small-cap-icon fs-4"></i>
              <span class="hide-menu">Booking</span>
            </li>
            <li class="sidebar-item">
              <a class="sidebar-link" href="/enchanted_elegance/admin/booking-list" aria-expanded="false">
                <span>
                  <i class="ti ti-file-description"></i>
                </span>
                <span class="hide-menu">All Booking</span>
              </a>
            </li>
            <li class="nav-small-cap">
              <i class="ti ti-dots nav-small-cap-icon fs-4"></i>
              <span class="hide-menu">Offer</span>
            </li>
            <li class="sidebar-item">
              <a class="sidebar-link" href="/enchanted_elegance/admin/offer-list" aria-expanded="false">
                <span>
                  <i class="ti ti-cards"></i>
                </span>
                <span class="hide-menu">All Offers</span>
              </a>
            </li>
            <li class="sidebar-item">
              <a class="sidebar-link" href="/enchanted_elegance/pages/admin/add-offer.jsp" aria-expanded="false">
                <span>
                  <i class="ti ti-plus"></i>
                </span>
                <span class="hide-menu">Add Offers</span>
              </a>
            </li>
            <li class="nav-small-cap">
              <i class="ti ti-dots nav-small-cap-icon fs-4"></i>
              <span class="hide-menu">Contact</span>
            </li>
            <li class="sidebar-item">
              <a class="sidebar-link" href="/enchanted_elegance/admin/contact-list" aria-expanded="false">
                <span>
                  <i class="ti ti-bell-ringing"></i>
                </span>
                <span class="hide-menu">All Contacts</span>
              </a>
            </li>
            <li class="nav-small-cap">
              <i class="ti ti-dots nav-small-cap-icon fs-4"></i>
              <span class="hide-menu">Feedback</span>
            </li>
            <li class="sidebar-item">
              <a class="sidebar-link" href="/enchanted_elegance/admin/feedback-list" aria-expanded="false">
                <span>
                  <i class="ti ti-mood-happy"></i>
                </span>
                <span class="hide-menu">All Feedbacks</span>
              </a>
            </li>
          </ul>
          </nav>
        <!-- End Sidebar navigation -->
      </div>
      <!-- End Sidebar scroll-->
    </aside>
    <!--  Sidebar End -->
    <!--  Main wrapper -->
    <div class="body-wrapper">
      <!--  Header Start -->
      <header class="app-header">
        <nav class="navbar navbar-expand-lg navbar-light">
          <ul class="navbar-nav">
            <li class="nav-item d-block d-xl-none">
              <a class="nav-link sidebartoggler nav-icon-hover" id="headerCollapse" href="javascript:void(0)">
                <i class="ti ti-menu-2"></i>
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link nav-icon-hover" href="javascript:void(0)">
                <i class="ti ti-bell-ringing"></i>
                <div class="notification bg-primary rounded-circle"></div>
              </a>
            </li>
          </ul>
          <div class="navbar-collapse justify-content-end px-0" id="navbarNav">
            <ul class="navbar-nav flex-row ms-auto align-items-center justify-content-end">
              <a href="/enchanted_elegance" target="_blank" class="btn btn-primary">Visi Site</a>
              <li class="nav-item dropdown">
                <a class="nav-link nav-icon-hover" href="javascript:void(0)" id="drop2" data-bs-toggle="dropdown"
                  aria-expanded="false">
                  <img src="/enchanted_elegance/pages/admin/images/profile/user-1.jpg" alt="" width="35" height="35" class="rounded-circle">
                </a>
                <div class="dropdown-menu dropdown-menu-end dropdown-menu-animate-up" aria-labelledby="drop2">
                  <div class="message-body">
                  <%-- active --%>
                    <a href="/enchanted_elegance/admin/profile?id=<%= admin.getId() %>" class="d-flex align-items-center gap-2 dropdown-item">
                      <i class="ti ti-user fs-6"></i>
                      <p class="mb-0 fs-3">My Profile</p>
                    </a>
                    <a href="javascript:void(0)" class="d-flex align-items-center gap-2 dropdown-item">
                      <i class="ti ti-mail fs-6"></i>
                      <p class="mb-0 fs-3">My Account</p>
                    </a>
                    <a href="javascript:void(0)" class="d-flex align-items-center gap-2 dropdown-item">
                      <i class="ti ti-list-check fs-6"></i>
                      <p class="mb-0 fs-3">My Task</p>
                    </a>
                    <a href="/enchanted_elegance/admin/logout" class="btn btn-outline-primary mx-3 mt-2 d-block">Logout</a>
                  </div>
                </div>
              </li>
            </ul>
          </div>
        </nav>
      </header>
      <div class="container-fluid">
          <!-- Row 1 -->
          <div class="row">
              <div class="col-lg-12 d-flex align-items-strech">
                  <div class="card w-100">
                      <div class="card-body">
                          <div class="d-sm-flex d-block align-items-center justify-content-between mb-3 mb-lg-4">
                              <div class="mb-2 mb-sm-0">
                                  <h5 class="card-title fw-semibold mb-0">Customer List</h5>
                              </div>
                          </div>
                        <div class="table-responsive">
                            <div class="ad-taade-container">
                                <table class="ad-taade table table-hover mb-0">
                                    <thead class="ad-thead">
                                        <tr>
                                            <th class="ad-th text-nowrap">ID</th>
                                            <th class="ad-th text-nowrap">Name</th>
                                            <th class="ad-th text-nowrap">Mobile</th>
                                            <th class="ad-th text-nowrap">Email</th>
                                            <th class="ad-th text-nowrap">Password</th>
                                            <th class="ad-th text-center text-nowrap">Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%
                                            if (users != null && !users.isEmpty()) {
                                                for (User user : users) {
                                        %>
                                        <tr class="align-middle">
                                            <td class="ad-td fs-sm"><%= user.getId() %></td>
                                            <td class="ad-td fs-sm text-nowrap"><%= user.getName() %></td>
                                            <td class="ad-td fs-sm"><%= user.getMobile() %></td>
                                            <td class="ad-td fs-sm"><%= user.getEmail() %></td>
                                            <td class="ad-td fs-sm text-truncate"><%= user.getPassword() %></td>
                                            <td class="ad-td-action">
                                                <div class="d-flex justify-content-center gap-2">
                                                    <a href="pages/admin/edit-user-adminaccess.jsp?id=<%= user.getId() %>&page=<%= currentPage %>" 
                                                      class="ad-btn ad-edit text-decoration-none d-flex align-items-center justify-content-center"
                                                      style="width: 30px; height: 30px;">
                                                      <i class="ti ti-pencil fs-xs"></i>
                                                    </a>
                                                    <form action="delete-account" method="post" class="d-inline m-0">
                                                        <input type="hidden" name="id" value="<%= user.getId() %>">
                                                        <input type="hidden" name="from" value="admin">
                                                        <input type="hidden" name="page" value="<%= currentPage %>">
                                                        <button type="submit" 
                                                                class="ad-btn ad-delete d-flex align-items-center justify-content-center"
                                                                style="width: 30px; height: 30px;"
                                                                onclick="return confirm('Are you sure?')">
                                                            <i class="ti ti-trash fs-xs"></i>
                                                        </button>
                                                    </form>
                                                </div>
                                            </td>
                                        </tr>
                                        <%
                                                }
                                            } else {
                                        %>
                                        <tr>
                                            <td colspan="6" class="text-center py-4 fs-sm">No users found.</td>
                                        </tr>
                                        <% } %>
                                    </tbody>
                                </table>
                            </div>
                            
                            <%-- Pagination --%>
                            <% if (totalPages > 1) { %>
                            <nav aria-label="Page navigation" class="mt-3">
                                <ul class="pagination justify-content-center">
                                    <%-- Previous button --%>
                                    <li class="page-item <%= currentPage == 1 ? "disabled" : "" %>">
                                        <a class="page-link" href="?page=<%= currentPage - 1 %>" aria-label="Previous">
                                            <span aria-hidden="true">&laquo;</span>
                                        </a>
                                    </li>
                                    
                                    <%-- Page numbers --%>
                                    <% for (int i = 1; i <= totalPages; i++) { %>
                                        <li class="page-item <%= i == currentPage ? "active" : "" %>">
                                            <a class="page-link" href="?page=<%= i %>"><%= i %></a>
                                        </li>
                                    <% } %>
                                    
                                    <%-- Next button --%>
                                    <li class="page-item <%= currentPage == totalPages ? "disabled" : "" %>">
                                        <a class="page-link" href="?page=<%= currentPage + 1 %>" aria-label="Next">
                                            <span aria-hidden="true">&raquo;</span>
                                        </a>
                                    </li>
                                </ul>
                            </nav>
                            <% } %>
                        </div>
                      </div>
                  </div>
              </div>
          </div>
      </div>  
    </div>
  </div>
  <script src="/enchanted_elegance/pages/admin/libs/jquery/dist/jquery.min.js"></script>
  <script src="/enchanted_elegance/pages/admin/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
  <script src="/enchanted_elegance/pages/admin/js/sidebarmenu.js"></script>
  <script src="/enchanted_elegance/pages/admin/js/app.min.js"></script>
  <script src="/enchanted_elegance/pages/admin/libs/apexcharts/dist/apexcharts.min.js"></script>
  <script src="/enchanted_elegance/pages/admin/libs/simplebar/dist/simplebar.js"></script>
  <script src="/enchanted_elegance/pages/admin/js/dashboard.js"></script>
  <script src="/enchanted_elegance/pages/admin/js/alert.js"></script>
</body>

</html>