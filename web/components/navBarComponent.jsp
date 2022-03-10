<%-- 
    Document   : navBarComponent
    Created on : Mar 4, 2022, 1:09:50 PM
    Author     : KhoaHD7621
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container px-4 px-lg-5">
        <a href="HomeController"><img class="img-fluid" width="100px" src="./images/logo.png" alt="Logo"></a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
                aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                <li class="nav-item"><a class="nav-link ${sessionScope.destPage eq "home" ? "active" : ""}" aria-current="page" href="HomeController">Home</a></li>
                <li class="nav-item"><a class="nav-link ${sessionScope.destPage eq "about" ? "active" : ""}" href="AboutUsController">About</a></li>
                <c:if test="${not empty sessionScope.LOGIN_USER && sessionScope.LOGIN_USER.role eq 0}">
                    <li class="nav-item"><a class="nav-link ${sessionScope.destPage eq "user" ? "active" : ""}" href="UserHomeController">Personal Page</a></li>
                    <li class="nav-item"><a class="nav-link ${sessionScope.destPage eq "order" ? "active" : ""}" href="UserViewOrderController">Orders</a></li>
                </c:if>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle ${sessionScope.destPage eq "plant" ? "active" : ""}" id="navbarDropdown" href="#" role="button"
                       data-bs-toggle="dropdown" aria-expanded="false">Shop</a>
                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="ViewAllController">All Products</a></li>
                        <li>
                            <hr class="dropdown-divider" />
                        </li>
                        <li><a class="dropdown-item" href="#!">Popular Items</a></li>
                        <li><a class="dropdown-item" href="#!">New Arrivals</a></li>
                    </ul>
                </li>
            </ul>
            <!-- Search -->
            <form action="SearchController" class="d-flex mx-auto my-2">
                <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search" name="keyword" value="${requestScope.keyword}" required>
                <select class="form-select me-2 w-50" aria-label="Default select example" name="searchby">
                    <option value="byname" ${requestScope.searchby eq "byname" ? "selected" : ""}>Name</option>
                    <option value="bycategory" ${requestScope.searchby eq "bycategory" ? "selected" : ""}>Category</option>
                </select>
                <button class="btn btn-outline-success" type="submit"><i class="bi bi-search"></i></button>
            </form>
            <div class="btn-box d-flex">
                <!-- Cart Button -->
                <div class="cart-btn dropdown-hover position-relative">
                    <c:url var="viewCartLink" value="CartController"></c:url>
                    <a href="${viewCartLink}" class="btn btn-outline-dark me-2">
                        <i class="bi-cart-fill me-1"></i>
                        <span class="badge bg-danger text-white ms-1 rounded-pill">${(sessionScope.carts == null) || (sessionScope.carts.size() == 0) ? "0" : sessionScope.carts.size()}</span>
                    </a>
                    <div class="dropdown-menu" style="width: 350px; margin-right: 6px;">
                        <div class="cart-box">
                            <c:choose>
                                <c:when test="${(sessionScope.carts == null) || (sessionScope.carts.size() == 0)}">
                                    <div class="empty-cart text-center">
                                        <img class="img-fluid" src="images/empty-cart.png" alt="Empty Cart Image">
                                        <p class="pb-3">Your cart is empty</p>
                                    </div>
                                </c:when>
                                <c:otherwise>
                                    <div class="unempty-cart">
                                        <div class="text-start ms-4">New products added</div>
                                        <c:forEach items="${sessionScope.carts}" var="C">
                                            <div class="product row mt-2 w-100 m-0">
                                                <div class="col-3">
                                                    <img class="img-fluid border border-1"
                                                         src="${C.value.plant.imgPath}"
                                                         alt="Product Images">
                                                </div>
                                                <div class="col-6 default-cursor">
                                                    ${C.value.plant.name}
                                                </div>
                                                <div class="col-3 default-cursor text-danger">
                                                    $${C.value.plant.price}
                                                </div>
                                            </div>
                                        </c:forEach>
                                        <div class="text-end pt-3 pe-3">
                                            <c:url var="viewCartLink" value="CartController"></c:url>
                                            <a href="${viewCartLink}" class="btn btn-danger pe-3">View cart</a>
                                        </div>
                                    </div>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                </div>
                <!-- Login Button -->
                <div class="login-btn dropdown-hover position-relative">
                    <c:choose>
                        <c:when test="${not empty sessionScope.LOGIN_USER}">
                            <a href="user.jsp" class="btn btn-outline-primary">
                                <i class="bi bi-person-circle"></i>
                            </a>
                        </c:when>
                        <c:otherwise>
                            <a href="login.jsp" class="btn btn-outline-primary">
                                <i class="bi bi-person-circle"></i>
                            </a>
                        </c:otherwise>
                    </c:choose>
                    <div class="dropdown-menu" style="width: 350px;">
                        <c:choose>
                            <c:when test="${not empty sessionScope.LOGIN_USER}">
                                <!-- Logged in -->
                                <div class="loggedin">
                                    <div class="user-name default-cursor fs-3">
                                        <i class="bi bi-person-fill"></i>Welcome,<span class="nametxt text-warning">${sessionScope.LOGIN_USER.fullName}</span>!
                                    </div>
                                    <div class="dropdown-divider"></div>
                                    <a class="dropdown-item" href="UserHomeController"><i class="bi bi-gear-fill"></i> Profile</a>
                                    <a class="dropdown-item" href="UserViewOrderController"><i class="bi bi-kanban"></i> Orders</a>
                                    <a class="dropdown-item" href="LogoutController"><i class="bi bi-box-arrow-right"></i> Logout</a>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <!-- Unlog in -->
                                <form action="LoginController" method="POST" class="px-4 py-3">
                                    <div class="mb-3">
                                        <label for="exampleDropdownFormEmail1" class="form-label">Email address</label>
                                        <input name="email" type="email" class="form-control" id="exampleDropdownFormEmail1"
                                               placeholder="email@example.com">
                                    </div>
                                    <div class="mb-3">
                                        <label for="exampleDropdownFormPassword1" class="form-label">Password</label>
                                        <input name="password" type="password" class="form-control" id="exampleDropdownFormPassword1"
                                               placeholder="Password">
                                    </div>
                                    <div class="mb-3">
                                        <div class="form-check">
                                            <input name="remember" value="true" type="checkbox" class="form-check-input" id="dropdownCheck">
                                            <label class="form-check-label" for="dropdownCheck">
                                                Remember me
                                            </label>
                                        </div>
                                    </div>
                                    <button type="submit" class="btn btn-primary">Sign in</button>
                                </form>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="RegistrationController">New around here? Sign up</a>
                                <a class="dropdown-item" href="#">Forgot password?</a>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </div>
        </div>
    </div>
</nav>