<%-- 
    Document   : checkout
    Created on : Mar 5, 2022, 5:47:42 PM
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
        <title>Checkout</title>
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
        <!-- Sub-nav checkout page -->
        <div id="search-nav" class="d-flex align-items-center">
            <div class="container text-center">
                <span class="body">
                    <a class="home-page text-white text-decoration-none" href="HomeController">Home page</a>
                    <span class="open-icon txt-m-bold text-white"><i class="bi bi-caret-right-fill"></i></span>
                    <a class="home-page text-white text-decoration-none" href="CartController">Cart</a>
                    <span class="open-icon txt-m-bold text-white"><i class="bi bi-caret-right-fill"></i></span>
                    <span class="txt-m-bold txt-orange default-cursor text-warning">Check out</span>
                </span>
            </div>
        </div>
        <!-- Checkout Session -->
        <section class="mb-5" style="min-height: 250px">
            <div class="container">
                <h1 class="pb-3 default-cursor">Checkout</h1>
                <div class="row">
                    <div class="col-lg-8 p-0 pb-3 pe-0 pe-lg-2 pb-lg-0">
                        <div class="rounded shadow p-3 bg-body">
                            <h3 class="default-cursor">List Products</h3>
                            <table class="table text-center default-cursor">
                                <thead>
                                    <tr>
                                        <th scope="col">#</th>
                                        <th scope="col">Image</th>
                                        <th scope="col">Name</th>
                                        <th scope="col">Price</th>
                                        <th scope="col">Quantity</th>
                                        <th scope="col">Total Price</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:set var="total" scope="request" value="${0}"/>
                                    <c:forEach items="${carts}" var="C">
                                    <tr>
                                    <td>
                                        <c:url var="linkPlant" value="PlantDetailController">
                                            <c:param name="pid" value="${C.value.plant.id}"></c:param>
                                        </c:url>
                                        <a href="${linkPlant}" class="text-decoration-none">${C.value.plant.id}</a>
                                    </td><input type="hidden" name="productId" value="${C.value.plant.id}">
                                    <td>
                                        <a href="${linkPlant}">
                                            <img src="${C.value.plant.imgPath}" width="100">
                                        </a>
                                    </td>
                                    <td>${C.value.plant.name}</td>
                                    <td>$${C.value.plant.price}</td>
                                    <td>${C.value.quantity}</td>
                                    <td>$${C.value.plant.price * C.value.quantity}</td>
                                    <c:set var="total" scope="request" value="${total + C.value.plant.price * C.value.quantity}"/>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                            <h3 class="default-cursor">Total Amount: $${not empty totalMoney ? totalMoney : total}</h3>
                        </div>
                    </div>
                    <div class="col-lg-4 rounded shadow p-3 bg-body">
                        <h3>Information Customer</h3>
                        <form action="CheckOutController" method="POST">
                            <div class="mb-3">
                                <label for="name" class="form-label">Name</label>
                                <input type="text" class="form-control" id="name" name="name" value="${sessionScope.LOGIN_USER.fullName}">
                            </div>
                            <div class="mb-3">
                                <label for="phone" class="form-label">Phone</label>
                                <input type="text" class="form-control" id="phone" name="phone" value="${sessionScope.LOGIN_USER.phone}">
                            </div>
                            <div class="mb-3">
                                <label for="address" class="form-label">Address</label>
                                <input type="text" class="form-control" id="address" name="address" required="">
                            </div>
                            <div class="mb-3">
                                <label for="note" class="form-label">Note</label>
                                <textarea type="text" class="form-control" id="note" name="note"></textarea>
                            </div>
                            <button type="submit" class="btn btn-primary w-100">Check out</button>
                        </form>
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
    </body>

</html>
