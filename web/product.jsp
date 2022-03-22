<%-- 
    Document   : product
    Created on : Mar 4, 2022, 6:03:27 PM
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
        <title>Plant</title>
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
        <!-- Toast MSG -->
        <div id="toast"></div>
        <!-- Sub-nav product page -->
        <div id="search-nav" class="d-flex align-items-center">
            <div class="container text-center">
                <span class="body">
                    <a class="home-page text-white text-decoration-none" href="HomeController">Home page</a>
                    <span class="open-icon txt-m-bold text-white"><i class="bi bi-caret-right-fill"></i></span>
                    <span class="txt-m-bold txt-orange default-cursor text-warning">All products</span>
                </span>
            </div>
        </div>
        <!-- Product List -->
        <div class="container mb-5">
            <div class="row">
                <div class="col-md-3">
                    <h3 class="mb-4 default-cursor text-black">List Categories</h3>
                    <div class="list-group">
                        <a type="button" class="list-group-item list-group-item-action ${(empty requestScope.category)? "active" : ""}" href="ViewAllController">All plants</a>
                        <c:forEach items="${sessionScope.listCategories}" var="L">
                            <c:url var="mylink" value="ViewAllController">
                                <c:param name="category" value="${L.key}"></c:param>
                            </c:url>
                            <a type="button" class="list-group-item list-group-item-action ${(not empty requestScope.category) and (L.key eq requestScope.category) ? "active" : ""}" href="${mylink}">${L.value}</a>
                        </c:forEach>
                    </div>
                </div>
                <div class="col-md-9 default-cursor">
                    <div class="d-flex align-items-center justify-content-center section-title mb-4 pt-4 pt-md-0 text-black" style="font-size: 35px !important;">
                        <hr class="d-inline-block me-3" width="15%" />
                        List Products
                        <hr class="d-inline-block ms-3" width="15%" />
                    </div>
                    <c:choose>
                        <c:when test="${empty requestScope.NO_PRODUCT}">
                            <!-- Products List -->
                            <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-lg-3 justify-content-center">
                                <c:forEach items="${requestScope.listPlants}" var="LP">
                                    <!-- Product -->
                                    <div class="col mb-5">
                                        <div class="card h-100">
                                            <!-- Sale badge-->
                                            <div class="position-absolute bg-black text-white default-cursor"
                                                 style="padding: 5px 15px; left: 15px; top: 15px;">
                                                ${LP.status == 1 ? "Available" : "Sold out"}
                                            </div>
                                            <!-- Product image-->
                                            <c:url var="linkImg" value="PlantDetailController">
                                                <c:param name="pid" value="${LP.id}"></c:param>
                                            </c:url>
                                            <a href="${linkImg}" class="img-h-350"><img src="${LP.imgPath}" alt="Plant IMG" /></a>
                                            <!-- Product details-->
                                            <div class="card-body p-2">
                                                <div class="text-center product-info">
                                                    <div class="category ms-3 mt-3 text-start">
                                                        ${sessionScope.listCategories.get(LP.categoryId)}
                                                    </div>
                                                    <!-- Product name-->
                                                    <div class="name">
                                                        <c:url var="linkName" value="PlantDetailController">
                                                            <c:param name="pid" value="${LP.id}"></c:param>
                                                        </c:url>
                                                        <a href="${linkName}" class="text-decoration-none text-black">
                                                            ${LP.name}
                                                        </a>
                                                    </div>
                                                    <!-- Product reviews-->
                                                    <div class="d-flex justify-content-center small text-warning mb-2">
                                                        <div class="bi-star-fill"></div>
                                                        <div class="bi-star-fill"></div>
                                                        <div class="bi-star-fill"></div>
                                                        <div class="bi-star-fill"></div>
                                                        <div class="bi-star-fill"></div>
                                                    </div>
                                                    <!-- Product price-->
                                                    <div class="price text-center fs-4 fw-bold default-cursor text-black">
                                                        <span class="text-muted text-decoration-line-through">$20</span>
                                                        $${LP.price}
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- Product actions-->
                                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                                <div class="text-center">
                                                    <a onclick="addToCartAsync(${LP.id})" class="btn btn-outline-dark mt-auto w-50"><i
                                                            class="bi bi-cart-plus-fill"></i></a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                            <!-- Pagging -->
                            <nav class="d-flex justify-content-center" aria-label="Page navigation">
                                <ul class="pagination">
                                    <c:url var="prepagelink" value="ViewAllController">
                                        <c:param name="pagenumber" value="${page - 1}"></c:param>
                                        <c:param name="category" value="${requestScope.category}"></c:param>
                                    </c:url>
                                    <li class="page-item ${page == 1 ? "disabled" : ""}"><a class="page-link" href="${prepagelink}">Previous</a></li>
                                        <c:forEach begin="1" end="${requestScope.totalPage}" var="i">
                                            <c:url var="curpagelink" value="ViewAllController">
                                                <c:param name="pagenumber" value="${i}"></c:param>
                                                <c:param name="category" value="${requestScope.category}"></c:param>
                                            </c:url>
                                        <li class="page-item ${i == page ? "active" : ""}"><a class="page-link" href="${curpagelink}">${i}</a></li>
                                        </c:forEach>
                                        <c:url var="nextpagelink" value="ViewAllController">
                                            <c:param name="pagenumber" value="${page + 1}"></c:param>
                                            <c:param name="category" value="${requestScope.category}"></c:param>
                                        </c:url>
                                    <li class="page-item ${page == totalPage ? "disabled" : ""}"><a class="page-link" href="${nextpagelink}">Next</a></li>
                                </ul>
                            </nav>
                        </c:when>
                        <c:otherwise>
                            <h3>${requestScope.NO_PRODUCT}</h3>
                        </c:otherwise>
                    </c:choose>

                </div>
            </div>
        </div>
        <!-- Subscribe News Letter -->
        <%@include file="components/subscribeNewsLetterComponent.jsp" %>
        <!-- Footer -->
        <%@include file="components/footerComponent.jsp" %>
        <!-- Bootstrap core JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Axios Async -->
        <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
        <script src="js/toast-alert.js"></script>
        <script src="js/add-to-cart-async.js"></script>
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