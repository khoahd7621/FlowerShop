<%-- 
    Document   : search
    Created on : Mar 4, 2022, 9:22:49 PM
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
        <title>Search</title>
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
        <!-- Sub-nav search page -->
        <div id="search-nav" class="d-flex align-items-center">
            <div class="container text-center">
                <span class="body">
                    <a class="home-page text-white text-decoration-none" href="HomeController">Home page</a>
                    <span class="open-icon txt-m-bold text-white"><i class="bi bi-caret-right-fill"></i></span>
                    <span class="txt-m-bold txt-orange default-cursor text-warning">Searching</span>
                </span>
            </div>
        </div>
        <!-- Toast MSG -->
        <div id="toast"></div>
        <!-- Search Session -->
        <c:if test="${not empty requestScope.NO_RESULT}">
            <!-- No Result -->
            <div id="no-result" class="mb-5">
                <div class="container">
                    <span class="sub-title fs-3 text-black">Couldn't find any results for the above keywords.</span>
                    <div class="main-title">Enter keywords to search</div>
                    <div class="row">
                        <div class="col-lg-4 col-md-6 col-sm-9">
                            <form class="py-md-2" action="SearchController">
                                <div class="mb-3">
                                    <input class="form-control " type="text" placeholder="Search" name="keyword" value="${requestScope.keyword}">
                                </div>
                                <div class="mb-3">
                                    <select class="form-select" name="searchby" style="width: 100%;">
                                        <option value="byname" ${requestScope.searchby eq "byname" ? "selected" : ""}>By Name</option>
                                        <option value="bycategory" ${requestScope.searchby eq "bycategory" ? "selected" : ""}>By Category</option>
                                    </select>
                                </div>
                                <button type="submit" value="search" class="btn btn-outline-danger">Search</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </c:if>
        <c:if test="${not empty requestScope.listPlants}">
            <!-- Have result -->
            <div id="result" class="pt-4">
                <div class="container">
                    <div class="main-title text-black">
                        There are <span>${requestScope.totalPlants}</span> matching search results
                    </div>
                    <div class="container px-4 px-lg-5 mt-4">
                        <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                            <c:forEach items="${requestScope.listPlants}" var="L">
                                <!-- Product -->
                                <div class="col mb-5">
                                    <div class="card h-100">
                                        <!-- Sale badge-->
                                        <div class="position-absolute bg-black text-white default-cursor"
                                             style="padding: 5px 15px; left: 15px; top: 15px;">
                                            ${L.status == 1 ? "Available" : "Sold out"}
                                        </div>
                                        <!-- Product image-->
                                        <c:url var="linkImg" value="PlantDetailController">
                                            <c:param name="pid" value="${L.id}"></c:param>
                                        </c:url>
                                        <a href="${linkImg}" class="img-h-350"><img src="${L.imgPath}" alt="Plant Img" /></a>
                                        <!-- Product details-->
                                        <div class="card-body p-2">
                                            <div class="text-center product-info">
                                                <div class="category ms-3 mt-3 text-start">
                                                    ${sessionScope.listCategories.get(L.categoryId)}
                                                </div>
                                                <!-- Product name-->
                                                <div class="name">
                                                    <c:url var="linkName" value="PlantDetailController">
                                                        <c:param name="pid" value="${L.id}"></c:param>
                                                    </c:url>
                                                    <a class="text-decoration-none text-black" href="${linkName}">
                                                        ${L.name}
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
                                                    $${L.price}
                                                </div>
                                            </div>
                                        </div>
                                        <!-- Product actions-->
                                        <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                            <div class="text-center">
                                                <a onclick="addToCartAsync(${L.id})" class="btn btn-outline-dark mt-auto w-50"><i
                                                        class="bi bi-cart-plus-fill"></i></a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                        <nav class="d-flex justify-content-center mb-5" aria-label="Page navigation">
                            <ul class="pagination">
                                <c:url var="prepagelink" value="SearchController">
                                    <c:param name="pagenumber" value="${page - 1}"></c:param>
                                    <c:param name="keyword" value="${requestScope.keyword}"></c:param>
                                    <c:param name="searchby" value="${requestScope.searchby}"></c:param>
                                </c:url>
                                <li class="page-item ${page == 1 ? "disabled" : ""}"><a class="page-link" href="${prepagelink}">Previous</a></li>
                                    <c:forEach begin="1" end="${requestScope.totalPage}" var="i">
                                        <c:url var="curpagelink" value="SearchController">
                                            <c:param name="pagenumber" value="${i}"></c:param>
                                            <c:param name="keyword" value="${requestScope.keyword}"></c:param>
                                            <c:param name="searchby" value="${requestScope.searchby}"></c:param>
                                        </c:url>
                                    <li class="page-item ${i == page ? "active" : ""}"><a class="page-link" href="${curpagelink}">${i}</a></li>
                                    </c:forEach>
                                    <c:url var="nextpagelink" value="SearchController">
                                        <c:param name="pagenumber" value="${page + 1}"></c:param>
                                        <c:param name="keyword" value="${requestScope.keyword}"></c:param>
                                        <c:param name="searchby" value="${requestScope.searchby}"></c:param>
                                    </c:url>
                                <li class="page-item ${page == totalPage ? "disabled" : ""}"><a class="page-link" href="${nextpagelink}">Next</a></li>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
        </c:if>
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

