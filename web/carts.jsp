<%-- 
    Document   : carts
    Created on : Mar 5, 2022, 5:06:06 PM
    Author     : KhoaHD7621
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="tag" uri="/WEB-INF/tlds/mytaglib.tld" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content=""/>
        <meta name="author" content=""/>
        <title>Carts</title>
        <!-- Favicon -->
        <link rel="icon" type="image/x-icon" href="./images/favicon.png"/>
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
        <link href="css/my-styles.css" rel="stylesheet">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="fonts/iconic/css/material-design-iconic-font.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="vendor/animsition/css/animsition.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="vendor/slick/slick.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="css/util.css">
        <link rel="stylesheet" type="text/css" href="css/main.css">
    </head>

    <body class="animsition">
        <!-- Home Menu -->
        <%@include file="components/headerComponent.jsp" %>
        <!-- Sub-nav cart page -->
        <div id="search-nav" class="d-flex align-items-center">
            <div class="container text-center">
                <span class="body">
                    <a class="home-page text-white text-decoration-none" href="HomeController">Home page</a>
                    <span class="open-icon txt-m-bold text-white"><i class="bi bi-caret-right-fill"></i></span>
                    <span class="txt-m-bold txt-orange default-cursor text-warning">Cart</span>
                </span>
            </div>
        </div>
        <!-- Cart Session -->
        <section class="mb-5" style="min-height: 250px">
            <div class="container">
                <c:choose>
                    <c:when test="${sessionScope.carts == null || sessionScope.carts.size() == 0}">
                        <h1>Cart is empty!</h1>
                    </c:when>
                    <c:otherwise>
                        <h3 class="text-black mb-3" style="font-size: 45px;">List Products</h3>
                        <table class="table text-center">
                            <thead>
                                <tr>
                                    <th scope="col">#</th>
                                    <th scope="col">Image</th>
                                    <th scope="col">Name</th>
                                    <th scope="col">Price</th>
                                    <th scope="col">Quantity</th>
                                    <th scope="col">Total Price</th>
                                    <th scope="col">Action</th>
                                </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${carts}" var="C">
                                <tag:productCart id="${C.value.plant.id}" imgpath="${C.value.plant.imgPath}" name="${C.value.plant.name}" price="${C.value.plant.price}" quantity="${C.value.quantity}"/>
                            </c:forEach>
                            </tbody>
                        </table>
                        <div class="row">
                            <h3 class="col-6 text-black">Total Amount: $${totalMoney}</h3>
                            <div class="col-6 text-end">
                                <c:url var="checkOut" value="CheckOutController"></c:url>
                                <a class="btn btn-success text-white btn-lg" href="${checkOut}">Check out</a>
                            </div>
                        </div>
                    </c:otherwise>
                </c:choose>
                <c:if test="${not empty requestScope.MSG_SUCCESS}">
                    <div class="row p-4">
                        <div class="alert alert-success col-12 col-md-8 col-lg-6" role="alert">
                            ${requestScope.MSG_SUCCESS}
                        </div>
                    </div>
                </c:if>
                <c:if test="${not empty requestScope.MSG_ERROR}">
                    <div class="row p-4">
                        <div class="alert alert-danger col-12 col-md-8 col-lg-6" role="alert">
                            ${requestScope.MSG_ERROR}
                        </div>
                    </div>
                </c:if>
            </div>
        </section>
        <!-- Subscribe News Letter -->
        <%@include file="components/subscribeNewsLetterComponent.jsp" %>
        <!-- Footer -->
        <%@include file="components/footerComponent.jsp" %>
        <!-- Bootstrap core JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS -->
        <script src="js/scripts.js"></script>
        <!-- Jquery -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <!-- Toast Alert script -->
        <script src="js/toast-alert.js"></script>
        <script src="js/subscribe-newsletter.js"></script>
        <!-- Home Slider JS -->
        <script src="vendor/slick/slick.min.js"></script>
        <script src="js/slick-custom.js"></script>
        <!--===============================================================================================-->
        <script src="vendor/animsition/js/animsition.min.js"></script>
        <!--===============================================================================================-->
        <script src="vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
        <script>
                                                    $('.js-pscroll').each(function () {
                                                        $(this).css('position', 'relative');
                                                        $(this).css('overflow', 'hidden');
                                                        var ps = new PerfectScrollbar(this, {
                                                            wheelSpeed: 1,
                                                            scrollingThreshold: 1000,
                                                            wheelPropagation: false,
                                                        });

                                                        $(window).on('resize', function () {
                                                            ps.update();
                                                        })
                                                    });
        </script>
        <!-- Main -->
        <script src="js/main.js"></script>
    </body>

</html>
