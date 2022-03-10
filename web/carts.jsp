<%-- 
    Document   : carts
    Created on : Mar 5, 2022, 5:06:06 PM
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
        <title>Carts</title>
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
                        <h3>List Products</h3>
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
                                <form action="UpdateCartQuantityController">
                                    <tr>
                                        <td>${C.value.plant.id}</td><input type="hidden" name="pid" value="${C.value.plant.id}">
                                    <td><img src="${C.value.plant.imgPath}" width="100"></td>
                                    <td>${C.value.plant.name}</td>
                                    <td>$${C.value.plant.price}</td>
                                    <td><input onchange="this.form.submit()" type="number" min="1" name="quantity" value="${C.value.quantity}"></td>
                                    <td>$${C.value.plant.price * C.value.quantity}</td>
                                    <td>
                                        <!-- Block btn -->
                                        <span>
                                            <!-- Button trigger modal -->
                                            <button type="button" class="btn btn-outline-danger" data-bs-toggle="modal" data-bs-target="#blockBtn${C.value.plant.id}">
                                                <i class="bi bi-trash"></i> Delete
                                            </button>
                                            <!-- Modal -->
                                            <div class="modal fade" id="blockBtn${C.value.plant.id}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                <div class="modal-dialog modal-dialog-centered">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <h5 class="modal-title" id="exampleModalLabel">Warning</h5>
                                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                        </div>
                                                        <div class="p-4 text-center fs-3"
                                                             style="color: red;">
                                                            Are you sure you want to remove plant "<span class="text-dark">${C.value.plant.name}</span>" from your cart?
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                                                            <c:url var="deleteLink" value="DeleteCartController">
                                                                <c:param name="pid" value="${C.value.plant.id}"></c:param>
                                                            </c:url>
                                                            <a href="${deleteLink}" class="btn btn-danger">Delete</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </span>
                                    </td>
                                    </tr>
                                </form>
                            </c:forEach>
                            </tbody>
                        </table>
                        <h3>Total Amount: $${totalMoney}</h3>
                        <c:url var="checkOut" value="CheckOutController"></c:url>
                        <a class="btn btn-outline-success" href="${checkOut}">Check out</a>
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
