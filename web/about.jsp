<%-- 
    Document   : about
    Created on : Mar 7, 2022, 7:42:05 PM
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
        <title>About us</title>
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
        <!-- About -->
        <div class="bg-white">
            <div class="container py-3">
                <div class="row align-items-center">
                    <div class="col-lg-5 px-5 mx-auto"><img src="https://bootstrapious.com/i/snippets/sn-about/img-2.jpg" alt="" class="img-fluid mb-4 mb-lg-0"></div>
                    <div class="col-lg-6"><i class="fa fa-leaf fa-2x mb-3 text-primary"></i>
                        <h2 class="font-weight-light">Lorem ipsum dolor sit amet</h2>
                        <p class="font-italic text-muted mb-4">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p><a href="#" class="btn btn-light px-5 rounded-pill shadow-sm">Learn More</a>
                    </div>
                </div>
                <div class="row align-items-center mb-5">
                    <div class="col-lg-6 order-2 order-lg-1"><i class="fa fa-bar-chart fa-2x mb-3 text-primary"></i>
                        <h2 class="font-weight-light">FPT University Ho Chi Minh campus</h2>
                        <p class="font-italic text-muted mb-4">The mission of ✴️ FPT University is to ✴️ train high-quality human resources in the integration period, ✴️ provide global competitiveness for people...</p>
                        <a href="https://hcmuni.fpt.edu.vn/" class="btn btn-light px-5 rounded-pill shadow-sm">Learn More</a>
                    </div>
                    <div class="col-lg-5 px-5 mx-auto order-1 order-lg-2"><iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3918.605334621169!2d106.80785771483009!3d10.841484592277386!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752731176b07b1%3A0xb752b24b379bae5e!2sFPT%20University%20HCMC!5e0!3m2!1sen!2s!4v1646899026195!5m2!1sen!2s" width="400" height="300" style="border:0;" allowfullscreen="" loading="lazy"></iframe></div>
                </div>
            </div>
        </div>
        <div class="bg-light">
            <div class="container py-3">
                <div class="row mb-4">
                    <div class="col-lg-5">
                        <h2 class="display-4 font-weight-light">Our team</h2>
                        <p class="font-italic text-muted">Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
                    </div>
                </div>
                <div class="row text-center">
                    <!-- Team item-->
                    <div class="col-xl-3 col-sm-6 mb-5">
                        <div class="bg-white rounded shadow-sm py-5 px-4"><img src="https://avatars.githubusercontent.com/u/77594830?v=4" alt="" width="100" class="img-fluid rounded-circle mb-3 img-thumbnail shadow-sm">
                            <h5 class="mb-0">Khoa Dang Hoang</h5><span class="small text-uppercase text-muted">CEO - Founder</span>
                            <ul class="social mb-0 list-inline mt-3">
                                <li class="list-inline-item"><a href="https://www.facebook.com/khoahd7621/" class="social-link"><i class="bi bi-facebook"></i></a></li>
                                <li class="list-inline-item"><a href="https://github.com/khoahd7621" class="social-link"><i class="bi bi-github"></i></a></li>
                                <li class="list-inline-item"><a href="https://www.instagram.com/khoahd7621/" class="social-link"><i class="bi bi-instagram"></i></a></li>
                                <li class="list-inline-item"><a href="https://www.linkedin.com/in/khoahd7621/?fbclid=IwAR2mB1D7HMm83CI1r7icI9xdkp436ZBc42VABtbttL7YXqHa7lZ4mGuK7NI" class="social-link"><i class="bi bi-linkedin"></i></a></li>
                            </ul>
                        </div>
                    </div>
                    <!-- End-->
                </div>
            </div>
        </div>
        <!-- Footer -->
        <%@include file="components/footerComponent.jsp" %>
        <!-- Bootstrap core JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>

