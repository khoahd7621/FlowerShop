<%-- 
    Document   : plantdetail
    Created on : Mar 5, 2022, 9:50:33 AM
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
        <title>Plant detail</title>
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
        <!-- Sub-nav plant detail page -->
        <div id="search-nav" class="d-flex align-items-center">
            <div class="container text-center">
                <span class="body">
                    <a class="home-page text-white text-decoration-none" href="HomeController">Home page</a>
                    <span class="open-icon txt-m-bold text-white"><i class="bi bi-caret-right-fill"></i></span>
                    <span class="txt-m-bold txt-orange default-cursor text-warning">Plant Detail</span>
                </span>
            </div>
        </div>
        <!-- Plant section-->
        <section>
            <div class="container px-4 px-lg-5 my-5">
                <div class="row gx-4 gx-lg-5 align-items-center">
                    <div class="col-md-6 text-md-end"><img class="card-img-top mb-5 mb-md-0" src="${plant.imgPath}" alt="..." style="width: 70%"/>
                    </div>
                    <div class="col-md-6">
                        <div class="small mb-1 default-cursor">SKU: ${plant.id}</div>
                        <h1 class="display-5 fw-bolder default-cursor">${plant.name}</h1>
                        <div class="fs-1 mb-5 default-cursor">
                            <span class="text-decoration-line-through text-black-50">$45</span>
                            <span class="text-danger">$${plant.price}</span>
                        </div>
                        <p class="lead default-cursor">${plant.description}</p>
                        <div class="d-flex">
                            <c:url var="addLink" value="AddToCartController">
                                <c:param name="pid" value="${plant.id}"></c:param>
                            </c:url>
                            <a href="${addLink}" class="btn btn-outline-dark flex-shrink-0">
                                <i class="bi-cart-fill me-1"></i>
                                Add to cart
                            </a>
                            <a class="btn btn-outline-success ms-2 flex-shrink-0" type="button">
                                <i class="bi-cart-fill me-1"></i>
                                Buy now
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Related items section-->
        <section class="pt-5 bg-light">
            <div class="container px-4 px-lg-5">
                <h2 class="fw-bolder mb-4">Related products</h2>
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                    <!-- Product -->
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Sale badge-->
                            <div class="position-absolute bg-black text-white default-cursor"
                                 style="padding: 5px 15px; left: 15px; top: 15px;">
                                Available
                            </div>
                            <!-- Product image-->
                            <a href="#"><img class="card-img-top"
                                             src="https://upload.wikimedia.org/wikipedia/commons/thumb/3/39/Bachelor%27s_button%2C_Basket_flower%2C_Boutonniere_flower%2C_Cornflower_-_3.jpg/1200px-Bachelor%27s_button%2C_Basket_flower%2C_Boutonniere_flower%2C_Cornflower_-_3.jpg"
                                             alt="..." /></a>
                            <!-- Product details-->
                            <div class="card-body p-2">
                                <div class="text-center product-info">
                                    <div class="category ms-3 mt-3 text-start">
                                        Orchis
                                    </div>
                                    <!-- Product name-->
                                    <div class="name">
                                        <a href="#" class="text-decoration-none text-black">
                                            Kamehameha
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
                                        <span class="text-muted text-decoration-line-through">$20</span>
                                        $50
                                    </div>
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center">
                                    <a class="btn btn-outline-dark mt-auto w-50" href="#"><i
                                            class="bi bi-cart-plus-fill"></i></a>
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