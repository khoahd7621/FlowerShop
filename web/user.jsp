<%-- 
    Document   : user
    Created on : Mar 5, 2022, 6:58:05 PM
    Author     : KhoaHD7621
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content=""/>
        <meta name="author" content=""/>
        <title>Personal</title>
        <!-- Favicon -->
        <link rel="icon" type="image/x-icon" href="./images/favicon.png"/>
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
        <link href="css/my-styles.css" rel="stylesheet">
    </head>

    <body>
        <!-- Contact Head -->
        <%@include file="components/contactHeadComponent.jsp" %>
        <!-- Navigation -->
        <%@include file="components/navBarComponent.jsp" %>
        <!-- Sub-nav personal page -->
        <div id="search-nav" class="d-flex align-items-center">
            <div class="container text-center">
                <span class="body">
                    <a class="home-page text-white text-decoration-none" href="HomeController">Home page</a>
                    <span class="open-icon txt-m-bold text-white"><i class="bi bi-caret-right-fill"></i></span>
                    <span class="txt-m-bold txt-orange default-cursor text-warning">Personal Page</span>
                </span>
            </div>
        </div>
        <!-- Personal Session -->
        <div class="container mb-5">
            <h1 class="pb-3 default-cursor">Welcome, <span class="text-warning">${sessionScope.LOGIN_USER.fullName}</span>!</h1>
            <section>
                <div class="container">
                    <div class="row d-flex justify-content-center align-items-center h-100">
                        <div class="col-12 col-md-9 col-lg-7 col-xl-6 mb-4">
                            <h3 class="text-uppercase text-center mb-4 default-cursor">
                                Your information
                            </h3>
                            <div class="mb-3 fw-bold">
                                Full name: <span class="fw-lighter">${sessionScope.LOGIN_USER.fullName}</span>
                            </div>
                            <div class="mb-3 fw-bold">
                                Email: <span class="fw-lighter">${sessionScope.LOGIN_USER.email}</span>
                            </div>
                            <div class="mb-3 fw-bold">
                                Phone: <span class="fw-lighter">${sessionScope.LOGIN_USER.phone}</span>
                            </div>
                            <!-- Change profile btn -->
                            <span>
                                <!-- Button trigger modal -->
                                <button type="button" class="btn btn-outline-info" data-bs-toggle="modal" data-bs-target="#changeProfileBtn">
                                    Update profile
                                </button>
                                <!-- Modal -->
                                <div class="modal fade" id="changeProfileBtn" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                    <div class="modal-dialog modal-dialog-centered">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="exampleModalLabel">Update profile information</h5>
                                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                            </div>
                                            <div id="update-profile-error" class="form-outline mt-3 fst-italic text-center"
                                                 style="color: red; font-size: 18px;"></div>
                                            <form action="UpdateUserController" method="POST" id="update-form">
                                                <div class="modal-body">
                                                    <!-- Email -->
                                                    <div class="form-outline mb-3">
                                                        <label class="form-label" for="register-mail-input">Your Email</label>
                                                        <input id="update-profile-mail-input" type="text"
                                                               class="form-control form-control-lg" name="email" value="${sessionScope.LOGIN_USER.email}" readonly/>
                                                    </div>
                                                    <!-- Name -->
                                                    <div class="form-outline mb-3">
                                                        <label class="form-label" for="form3Example1cg">Your Name <span
                                                                style="color: red; font-weight: bold">*</span></label>
                                                        <input type="text" id="form3Example1cg" class="form-control form-control-lg"
                                                               required placeholder="Nguyen Van A"
                                                               name="name" value="${sessionScope.LOGIN_USER.fullName}"/>
                                                    </div>
                                                    <!-- Phone -->
                                                    <div class="form-outline mb-5">
                                                        <label class="form-label" for="update-profile-input-phone">Phone number <span
                                                                style="color: red; font-weight: bold">*</span></label>
                                                        <input type="text" id="update-profile-input-phone" class="form-control form-control-lg"
                                                               required placeholder="0791234xx"
                                                               name="phone" value="${sessionScope.LOGIN_USER.phone}"/>
                                                    </div>
                                                    <div id="update-profile-input-phone-error" class="form-outline mb-2 fst-italic"
                                                         style="margin-top: -35px; color: red; font-size: 14px;">
                                                    </div>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                                    <button id="update-profile-btn" type="submit" class="btn btn-primary" name="action" value="updateInfo">Save changes</button>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </span>
                            <!-- Change password btn -->
                            <span>
                                <!-- Button trigger modal -->
                                <button type="button" class="btn btn-outline-secondary" data-bs-toggle="modal" data-bs-target="#exampleModal">
                                    Change password
                                </button>
                                <!-- Modal -->
                                <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                    <div class="modal-dialog modal-dialog-centered">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="exampleModalLabel">Change password</h5>
                                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                            </div>
                                            <div id="change-psw-error" class="form-outline mt-3 fst-italic text-center"
                                                 style="color: red; font-size: 18px;"></div>
                                            <form action="UpdateUserController" method="POST" id="change-psw-form">
                                                <div class="modal-body">
                                                    <!-- Old password -->
                                                    <div class="form-outline mb-3">
                                                        <label class="form-label" for="old-psw-input">Old Password <span
                                                                style="color: red; font-weight: bold">*</span></label>
                                                        <input id="old-psw-input" class="form-control form-control-lg"
                                                               data-toggle="password" class="form-control" type="password" maxlength="50"
                                                               placeholder="Old password" required
                                                               name="oldPassword">
                                                    </div>
                                                    <!-- New Password -->
                                                    <div class="form-outline mb-4">
                                                        <label class="form-label" for="new-psw-input">New Password <span
                                                                style="color: red; font-weight: bold">*</span></label>
                                                        <input id="new-psw-input" class="form-control form-control-lg"
                                                               data-toggle="password" class="form-control" type="password" maxlength="50"
                                                               placeholder="New password" required
                                                               name="newPassword">
                                                    </div>
                                                    <div id="new-psw-input-error" class="form-outline mb-2 fst-italic"
                                                         style="margin-top: -10px; color: red; font-size: 14px;">
                                                    </div>

                                                    <!-- Confirm Password -->
                                                    <div class="form-outline mb-4">
                                                        <label class="form-label" for="rp-new-psw-input">Repeat new password
                                                            <span style="color: red; font-weight: bold">*</span></label>
                                                        <input id="rp-new-psw-input" class="form-control form-control-lg"
                                                               data-toggle="password" class="form-control" type="password" maxlength="50" placeholder="Repeat new password" required>
                                                    </div>
                                                    <div id="rp-new-psw-input-error" class="form-outline mb-2 fst-italic"
                                                         style="margin-top: -10px; color: red; font-size: 14px;">
                                                    </div>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                                    <button id="change-psw-btn" type="submit" class="btn btn-primary" name="action" value="changePassword">Save changes</button>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </span>
                            <!-- Alert -->
                            <c:choose>
                                <c:when test="${not empty requestScope.MSG_SUCCESS}">
                                    <div class="alert alert-success mt-4" role="alert">
                                        ${requestScope.MSG_SUCCESS}
                                    </div>
                                </c:when>
                                <c:when test="${not empty requestScope.MSG_ERROR}">
                                    <div class="alert alert-danger mt-4" role="alert">
                                        ${requestScope.MSG_ERROR}
                                    </div>
                                </c:when>
                            </c:choose>
                        </div>
                    </div>
                </div>
            </section>
        </div>
        <%@include file="components/footerComponent.jsp" %>
        <!-- Bootstrap core JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS -->
        <script src="js/scripts.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="js/my-scripts.js"></script>
        <script src="js/my-user.js"></script>
    </body>

</html>
