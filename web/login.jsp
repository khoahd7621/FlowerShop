<%-- 
    Document   : login
    Created on : Mar 5, 2022, 5:42:56 PM
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
        <title>Login</title>
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
        <%@include file="components/loginHeaderComponent.jsp" %>
        <!-- Login Session -->
        <section class="vh-100" style="background-color: #9A616D;">
            <div class="container py-5 h-100">
                <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col col-xl-10">
                        <div class="card" style="border-radius: 1rem;">
                            <div class="row g-0">
                                <div class="col-md-6 col-lg-5 d-none d-md-block">
                                    <img
                                        src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-login-form/img1.webp"
                                        alt="login form"
                                        class="img-fluid" style="border-radius: 1rem 0 0 1rem;"
                                        />
                                </div>
                                <div class="col-md-6 col-lg-7 d-flex align-items-center">
                                    <div class="card-body p-4 p-lg-5 text-black">
                                        <form action="LoginController" method="POST">
                                            <div class="d-flex align-items-center mb-3 pb-1 default-cursor">
                                                <i class="bi bi-flower1 fa-2x fa-cubes me-3" style="color: #ff6219;"></i>
                                                <span class="h1 fw-bold mb-0">Flower Shop</span>
                                            </div>
                                            <h5 class="fw-normal pb-3 default-cursor" style="letter-spacing: 1px;">Sign into your account</h5>
                                            <c:if test="${not empty requestScope.ERROR_MASSEGE}">
                                                <!-- Error MSG -->
                                                <div class="alert alert-danger" role="alert">
                                                    ${requestScope.ERROR_MASSEGE}
                                                </div>
                                            </c:if>
                                            <c:if test="${not empty requestScope.MSG_SUCCESS}">
                                                <!-- Error MSG -->
                                                <div class="alert alert-success" role="alert">
                                                    ${requestScope.MSG_SUCCESS}
                                                </div>
                                            </c:if>
                                            <div class="form-outline mb-2">
                                                <label class="form-label" for="form2Example17">Email address</label>
                                                <input type="email" id="form2Example17" class="form-control form-control-lg" name="email" value="${requestScope.email}" required placeholder="example@gmail.com"/>
                                            </div>
                                            <div class="form-outline mb-2">
                                                <label class="form-label" for="form2Example27">Password</label>
                                                <input type="password" id="form2Example27" class="form-control form-control-lg" name="password" required placeholder="password"/>
                                            </div>
                                            <!-- Checkbox -->
                                            <div class="form-check d-flex justify-content-start mb-4">
                                                <input class="form-check-input me-2" type="checkbox" name="remember" value="true" id="form1Example3"/>
                                                <label class="form-check-label" for="form1Example3"> Remember me </label>
                                            </div>
                                            <div class="pt-1 mb-4">
                                                <button class="btn btn-dark btn-lg btn-block" type="submit">Login</button>
                                            </div>

                                            <a class="small text-muted" href="#!">Forgot password?</a>
                                            <p class="mb-3 pb-lg-2" style="color: #393f81;">
                                                Don't have an account?
                                                <c:url var="regisLink" value="RegistrationController"></c:url>
                                                <a href="${regisLink}" style="color: #393f81;">Register here</a></p>
                                            <a href="#!" class="small text-muted">Terms of use.</a>
                                            <a href="#!" class="small text-muted">Privacy policy</a>
                                        </form>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Footer -->
        <%@include file="components/footerComponent.jsp" %>
        <!-- Bootstrap core JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS -->
        <script src="js/scripts.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="js/my-scripts.js"></script>
    </body>

</html>
