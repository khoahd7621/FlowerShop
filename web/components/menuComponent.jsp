<%-- 
    Document   : homeMenuComponent
    Created on : Mar 21, 2022, 8:41:40 AM
    Author     : KhoaHD7621
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<c:url var="homeUrl" value="HomeController"></c:url>
<c:url var="shopUrl" value="ViewAllController"></c:url>
<c:url var="blogUrl" value="blog"></c:url>
<c:url var="aboutUrl" value="AboutUsController"></c:url>
    <!-- Header desktop -->
    <div class="container-menu-desktop">
        <!-- Topbar -->
        <div class="top-bar">
            <div class="content-topbar flex-sb-m h-full container">
                <div class="left-top-bar">
                    Free shipping for standard order over $100
                </div>
                <div class="right-top-bar flex-w h-full">
                    <a class="text-decoration-none flex-c-m trans-04 p-lr-25" href="#"><i class="bi bi-phone me-2"></i>+84 123456789</a>
                    <a class="text-decoration-none flex-c-m trans-04 p-lr-25" href="#"><i class="bi bi-envelope me-2"></i>info@myflower.com</a>
                    <a href="#" class="flex-c-m trans-04 p-lr-25"><i class="bi bi-facebook"></i></a>
                    <a href="#" class="flex-c-m trans-04 p-lr-25"><i class="bi bi-twitter"></i></a>
                    <a href="#" class="flex-c-m trans-04 p-lr-25"><i class="bi bi-instagram"></i></a>
                </div>
            </div>
        </div>

        <div class="wrap-menu-desktop">
            <nav class="limiter-menu-desktop container">
                <!-- Logo desktop -->		
                <a href="${homeUrl}" class="logo">
                <img src="./images/logo-3.png" alt="IMG-LOGO">
            </a>

            <!-- Menu desktop -->
            <div class="menu-desktop">
                <ul class="main-menu">
                    <li class="${sessionScope.destPage eq "home" ? "active-menu" : ""}">
                        <a href="${homeUrl}" class="text-decoration-none">Home</a>
                    </li>

                    <li class="${sessionScope.destPage eq "plant" ? "active-menu" : ""}">
                        <a href="${shopUrl}" class="text-decoration-none">Shop</a>
                    </li>

                    <li class="${sessionScope.destPage eq "blog" ? "active-menu" : ""}">
                        <a href="${blogUrl}" class="text-decoration-none">Blog</a>
                    </li>

                    <li class="${sessionScope.destPage eq "about" ? "active-menu" : ""}">
                        <a href="${aboutUrl}" class="text-decoration-none">About</a>
                    </li>

                    <c:if test="${not empty sessionScope.LOGIN_USER && sessionScope.LOGIN_USER.role eq 0}">
                        <li class="${sessionScope.destPage eq "user" ? "active-menu" : ""}">
                            <a href="UserHomeController" class="text-decoration-none">Personal Page</a>
                        </li>
                        <li class="${sessionScope.destPage eq "order" ? "active-menu" : ""}">
                            <a href="UserViewOrderController" class="text-decoration-none">Orders</a>
                        </li>
                    </c:if>
                </ul>
            </div>	

            <!-- Icon header -->
            <div class="wrap-icon-header flex-w flex-r-m">
                <div class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 js-show-modal-search">
                    <i class="zmdi zmdi-search"></i>
                </div>

                <div id="cartNumPC" class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 icon-header-noti js-show-cart" data-notify="${(sessionScope.carts == null) || (sessionScope.carts.size() == 0) ? "0" : sessionScope.carts.size()}">
                    <i class="zmdi zmdi-shopping-cart"></i>
                </div>

                <div class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 js-show-login">
                    <i class="zmdi zmdi-account-o"></i>
                </div>
            </div>
        </nav>
    </div>	
</div>

<!-- Header Mobile -->
<div class="wrap-header-mobile">
    <!-- Logo Moblie -->		
    <div class="logo-mobile">
        <a href="${homeUrl}"><img src="./images/logo-3.png" alt="IMG-LOGO"></a>
    </div>

    <!-- Icon header -->
    <div class="wrap-icon-header flex-w flex-r-m m-r-15">
        <div class="icon-header-item cl2 hov-cl1 trans-04 p-r-11 js-show-modal-search">
            <i class="zmdi zmdi-search"></i>
        </div>

        <div id="cartNumMB" class="icon-header-item cl2 hov-cl1 trans-04 p-r-11 p-l-10 icon-header-noti js-show-cart" data-notify="${(sessionScope.carts == null) || (sessionScope.carts.size() == 0) ? "0" : sessionScope.carts.size()}">
            <i class="zmdi zmdi-shopping-cart"></i>
        </div>

        <div class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 js-show-login">
            <i class="zmdi zmdi-account-o"></i>
        </div>
    </div>

    <!-- Button show menu -->
    <div class="btn-show-menu-mobile hamburger hamburger--squeeze">
        <span class="hamburger-box">
            <span class="hamburger-inner"></span>
        </span>
    </div>
</div>

<!-- Menu Mobile -->
<div class="menu-mobile">
    <ul class="topbar-mobile p-0">
        <li>
            <div class="left-top-bar">
                Free shipping for standard order over $100
            </div>
        </li>

        <li>
            <div class="right-top-bar flex-w h-full">
                <a class="text-decoration-none flex-c-m trans-04 p-lr-25" href="#"><i class="bi bi-phone me-2"></i>+84 123456789</a>
                <a class="text-decoration-none flex-c-m trans-04 p-lr-25" href="#"><i class="bi bi-envelope me-2"></i>info@myflower.com</a>
            </div>
        </li>
        <li>
            <div class="right-top-bar flex-w h-full">
                <a href="#" class="flex-c-m trans-04 p-lr-25"><i class="bi bi-facebook"></i></a>
                <a href="#" class="flex-c-m trans-04 p-lr-25"><i class="bi bi-twitter"></i></a>
                <a href="#" class="flex-c-m trans-04 p-lr-25"><i class="bi bi-instagram"></i></a>
            </div>
        </li>
    </ul>
    <ul class="main-menu-m">
        <li><a href="${homeUrl}" class="text-decoration-none">Home</a></li>
        <li><a href="${shopUrl}" class="text-decoration-none">Shop</a></li>
        <li><a href="${blogUrl}" class="text-decoration-none">Blog</a></li>
        <li><a href="${aboutUrl}" class="text-decoration-none">About</a></li>
    </ul>
</div>

<!-- Modal Search -->
<div class="modal-search-header flex-c-m trans-04 js-hide-modal-search">
    <div class="container-search-header">
        <button class="flex-c-m btn-hide-modal-search trans-04 js-hide-modal-search">
            <i class="bi bi-x-lg"></i>
        </button>
        <form action="SearchController" class="wrap-search-header flex-w p-l-15">
            <button class="flex-c-m trans-04">
                <i class="zmdi zmdi-search"></i>
            </button>
            <input class="plh3" type="text" name="keyword" value="${requestScope.keyword}" placeholder="Search..." required>
            <select class="plh3" name="searchby">
                <option value="byname" ${requestScope.searchby eq "byname" ? "selected" : ""}>Name</option>
                <option value="bycategory" ${requestScope.searchby eq "bycategory" ? "selected" : ""}>Category</option>
            </select>
            <div class="text-center w-100 mt-4">
                <button type="submit">Search</button>
            </div>
        </form>
    </div>
</div>