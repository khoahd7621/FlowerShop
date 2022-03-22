<%-- 
    Document   : Home
    Created on : Mar 4, 2022, 1:05:46 PM
    Author     : KhoaHD7621
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <title>Home</title>
        <!-- Favicon -->
        <link rel="icon" type="image/x-icon" href="./images/favicon.png"/>
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
        <link href="css/my-styles.css" rel="stylesheet">
        <link href="css/responsive.css" rel="stylesheet">
        <link rel="stylesheet" href="css/ionicons.min.css">
        <!-- Wow Library for animate -->
        <link rel='stylesheet' href='https://cdn.rawgit.com/daneden/animate.css/v3.1.0/animate.min.css'>
        <script src='https://cdn.rawgit.com/matthieua/WOW/1.0.1/dist/wow.min.js'></script>
        <script> new WOW().init();</script>
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
        <%@include file="components/homeHeaderComponent.jsp" %>
        <!-- Home Slider -->
        <%@include file="components/homeSliderComponent.jsp" %>
        <!-- Toast MSG -->
        <div id="toast"></div>
        <!-- Section Deal of the Day -->
        <section class="pt-5">
            <div class="text-black d-flex align-items-center justify-content-center fs-1 section-title wow fadeInDown" data-wow-duration="1s" data-wow-delay="0s">
                <hr class="d-inline-block me-3" width="20%" />
                Our Products
                <hr class="d-inline-block ms-3" width="20%" />
            </div>
            <div class="container px-4 px-lg-5 mt-4">
                <div id="home-all-product" class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                    <c:forEach items="${requestScope.listPlants}" var="LPS">
                        <!-- Product -->
                        <div class="col mb-5 product-all">
                            <div class="card h-100">
                                <!-- Sale badge-->
                                <div class="position-absolute bg-black text-white default-cursor"
                                     style="padding: 5px 15px; left: 15px; top: 15px;">
                                    ${LPS.status == 1 ? "Available" : "Sold out"}
                                </div>
                                <!-- Product image-->
                                <c:url var="linkImg" value="PlantDetailController">
                                    <c:param name="pid" value="${LPS.id}"></c:param>
                                </c:url>
                                <a href="${linkImg}" class="img-h-350"><img src="${LPS.imgPath}" alt="Plant IMG" /></a>
                                <!-- Product details-->
                                <div class="card-body p-2">
                                    <div class="text-center product-info">
                                        <div class="category ms-3 mt-3 text-start">
                                            ${sessionScope.listCategories.get(LPS.categoryId)}
                                        </div>
                                        <!-- Product name-->
                                        <div class="name">
                                            <c:url var="linkName" value="PlantDetailController">
                                                <c:param name="pid" value="${LPS.id}"></c:param>
                                            </c:url>
                                            <a href="${linkName}" class="text-decoration-none text-black">
                                                ${LPS.name}
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
                                            <span class="text-muted text-decoration-line-through">$100</span>
                                            $${LPS.price}
                                        </div>
                                    </div>
                                </div>
                                <!-- Product actions-->
                                <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                    <div class="text-center">
                                        <a onclick="addToCartAsync(${LPS.id})" class="btn btn-outline-dark mt-auto w-50"><i
                                                class="bi bi-cart-plus-fill"></i></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
                <div class="w-100 text-end">
                    <div class="btn-group mb-5" role="group" aria-label="Basic example">
                        <button onclick="loadMore('loadMoreOurProduct', this)" class="btn btn-primary me-2">View more</button>
                        <a href="ViewAllController" type="button" class="btn btn-primary">View all</a>
                    </div>
                </div>
            </div>
        </section>
        <!-- Banner 2 -->
        <%@include file="components/homeBanner2Component.jsp" %>
        <!-- Section Loyalty -->
        <%@include file="components/loyaltyComponent.jsp" %>
        <!-- Section Best Seller -->
        <section class="pt-5 text-black">
            <div style="background-color: #f3f3f3;">
                <div class="pt-5 d-flex align-items-center justify-content-center fs-1 section-title">
                    <hr class="d-inline-block me-3" width="15%" />
                    Best Seller
                    <hr class="d-inline-block ms-3" width="15%" />
                </div>
                <div class="container px-4 px-lg-5 mt-3">
                    <div class="btn-group mb-5" role="group" aria-label="Basic radio toggle button group">
                        <c:forEach items="${sessionScope.listCategories}" var="T3C" begin="0" end="2" step="1" varStatus="theCount">
                            <input onclick="loadMore('loadProductsById', this)" type="radio" class="btn-check category-btn-${theCount.index + 1}" name="btnradio" id="btnradio${theCount.index + 1}" autocomplete="off" value="${T3C.key}" ${theCount.index == 0 ? "checked" : ""}>
                            <label class="btn btn-outline-primary" for="btnradio${theCount.index + 1}">${T3C.value}</label>
                        </c:forEach>
                    </div>
                    <div id="home-best-seller" class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                        <c:forEach items="${requestScope.listBestSellerPlants}" var="LBSP">
                            <!-- Product -->
                            <div class="col mb-5">
                                <div class="card h-100">
                                    <!-- Sale badge-->
                                    <div class="position-absolute bg-black text-white default-cursor"
                                         style="padding: 5px 15px; left: 15px; top: 15px;">
                                        ${LBSP.status == 1 ? "Available" : "Sold out"}
                                    </div>
                                    <!-- Product image-->
                                    <c:url var="linkImg" value="PlantDetailController">
                                        <c:param name="pid" value="${LBSP.id}"></c:param>
                                    </c:url>
                                    <a href="${linkImg}" class="img-h-350"><img src="${LBSP.imgPath}" alt="Plant IMG" /></a>
                                    <!-- Product details-->
                                    <div class="card-body p-2">
                                        <div class="text-center product-info">
                                            <div class="category ms-3 mt-3 text-start">
                                                ${sessionScope.listCategories.get(LBSP.categoryId)}
                                            </div>
                                            <!-- Product name-->
                                            <div class="name">
                                                <c:url var="linkName" value="PlantDetailController">
                                                    <c:param name="pid" value="${LBSP.id}"></c:param>
                                                </c:url>
                                                <a href="${linkName}" class="text-decoration-none text-black">
                                                    ${LBSP.name}
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
                                            <div class="price text-center fs-4 fw-bold default-cursor">
                                                <span class="text-muted text-decoration-line-through">$100</span>
                                                $${LBSP.price}
                                            </div>
                                        </div>
                                    </div>
                                    <!-- Product actions-->
                                    <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                        <div class="text-center">
                                            <a onclick="addToCartAsync(${LBSP.id})" class="btn btn-outline-dark mt-auto w-50"><i
                                                    class="bi bi-cart-plus-fill"></i></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                    <div class="w-100 text-end pb-3">
                        <div class="btn-group mb-4" role="group" aria-label="Basic example">
                            <a href="ViewAllController" type="button" class="btn btn-primary">View all</a>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Shop By Category -->
        <%@include file="components/shopByCategoryComponents.jsp" %>
        <!-- Latest Blog -->
        <%@include file="components/homeLatestBlogComponent.jsp" %>
        <!-- Client Review -->
        <%@include file="components/clientReviewComponent.jsp" %>
        <!-- Subscribe News Letter -->
        <%@include file="components/subscribeNewsLetterComponent.jsp" %>
        <!-- Footer -->
        <%@include file="components/footerComponent.jsp" %>
        <!-- Bootstrap core JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <script src="js/bootstrap.js"></script>
        <!-- Jquery -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <!-- Toast Alert script -->
        <script src="js/toast-alert.js"></script>
        <!-- Axios Async -->
        <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
        <!-- Add-to-cart async script -->
        <script src="js/add-to-cart-async.js"></script>
        <!-- Load-more script -->
        <script src="js/load-more.js"></script>
        <!-- Subscribe News Letter script -->
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
        <!-- -->
        <script src="js/main.js"></script>
    </body>

</html>
