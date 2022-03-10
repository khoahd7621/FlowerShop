<%-- 
    Document   : adminNavBarComponent
    Created on : Mar 8, 2022, 11:40:09 AM
    Author     : KhoaHD7621
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
    <!-- Navbar Brand-->
    <a class="navbar-brand ps-3" href="AdminHomeController"><i class="bi bi-briefcase"></i> Welcome, ${sessionScope.LOGIN_USER.fullName}!</a>
    <!-- Sidebar Toggle-->
    <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
    <!-- Navbar-->
    <ul class="d-none d-md-inline-block navbar-nav ms-auto me-0 me-md-3 my-2 my-md-0">
        <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
            <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                <li><a class="dropdown-item" href="AdminInfoController">Settings</a></li>
                <li><hr class="dropdown-divider" /></li>
                <li><a class="dropdown-item" href="LogoutController">Logout</a></li>
            </ul>
        </li>
    </ul>
</nav>
