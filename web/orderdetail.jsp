<%-- 
    Document   : orderdetail
    Created on : Mar 7, 2022, 11:25:10 PM
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
        <title>Order detail</title>
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
        <!-- Sub-nav Order page -->
        <div id="search-nav" class="d-flex align-items-center">
            <div class="container text-center">
                <span class="body">
                    <a class="home-page text-white text-decoration-none" href="HomeController">Home page</a>
                    <span class="open-icon txt-m-bold text-white"><i class="bi bi-caret-right-fill"></i></span>
                    <span class="txt-m-bold txt-orange default-cursor text-warning">Orders</span>
                </span>
            </div>
        </div>
        <!-- Orders Detail -->
        <div class="container mb-5">
            <h1 class="pb-3 default-cursor text-black">Welcome, <span class="text-warning">${sessionScope.LOGIN_USER.fullName}</span>!</h1>
            <div class="row">
                <div class="col-lg-3">
                    <div class="list-group">
                        <a type="button" class="list-group-item list-group-item-action" href="UserViewOrderController">All orders</a>
                        <c:forEach items="${sessionScope.listOrderStatus}" var="L">
                            <c:url var="mylink" value="UserViewOrderController">
                                <c:param name="orderStatus" value="${L.key}"></c:param>
                            </c:url>
                            <a type="button" class="list-group-item list-group-item-action" href="${mylink}">${L.value}</a>
                        </c:forEach>
                    </div>
                </div>
                <div id="order-detail-body" class="col-lg-9 default-cursor position-relative mt-4 mt-lg-0 text-black">
                    <div class="title">
                        Order details #<span class="orderid">${requestScope.order.orderId}</span>
                    </div>
                    <div class="date">
                        <div class="order-date">
                            Order Date: <span>${requestScope.order.orderDate}</span>
                        </div>
                        <div class="ship-date">
                            Ship Date: <span>
                                <c:choose>
                                    <c:when test="${empty requestScope.order.shipDate}">
                                        <span class="fst-italic">null</span>
                                    </c:when>
                                    <c:otherwise>
                                        ${requestScope.order.shipDate}
                                    </c:otherwise>
                                </c:choose>
                            </span>
                        </div>
                    </div>
                    <div class="order-status">
                        Order Status: <span>
                            <c:choose>
                                <c:when test="${requestScope.order.status eq 1}">
                                    <span style="color: orange">Processing</span>
                                </c:when>
                                <c:when test="${requestScope.order.status eq 2}">
                                    <span style="color: blue">Completed</span>
                                </c:when>
                                <c:when test="${requestScope.order.status eq 3}">
                                    <span style="color: red">Canceled</span>
                                </c:when>
                            </c:choose>
                        </span>
                    </div>
                    <div class="order-info row pt-4 pb-4">
                        <div class="col-md-6">
                            <label class="ps-4 pb-2 text-uppercase">Delivery address</label>
                            <div class="info p-3 border border-1 rounded">
                                <div class="fw-bold">${requestScope.shipping.name}</div>
                                <div>Address: ${requestScope.shipping.address}</div>
                                <div>Phone: ${requestScope.shipping.phone}</div>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <label class="ps-4 pb-2 pt-3 pt-md-0 text-uppercase">Payment</label>
                            <div class="ps-1 pe-1">
                                <div class="p-3 border border-1 rounded">Payment on Delivery (COD)</div>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <label class="ps-4 pb-2 pt-3 pt-md-0 text-uppercase">Note</label>
                            <div class="p-3 border border-1 rounded">${requestScope.order.note}</div>
                        </div>
                    </div>
                    <div class="order-table">
                        <table class="table-order-detail">
                            <thead>
                                <tr>
                                    <th>Product</th>
                                    <th>Price</th>
                                    <th>Quantity</th>
                                    <th>Total</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${requestScope.listOrdersDetail}" var="D">
                                    <tr>
                                        <c:forEach items="${requestScope.listPlantOrder}" var="P">
                                            <c:if test="${D.plantId eq P.id}">
                                                <td>
                                                    <img class="product-img" src="${P.imgPath}" alt="">
                                                    <div class="product-brand">
                                                        <div class="product-name">
                                                            <c:url var="plantD" value="PlantDetailController">
                                                                <c:param name="pid" value="${P.id}"></c:param>
                                                            </c:url>
                                                            <a href="${plantD}">${P.name}</a>
                                                        </div>
                                                        <div class="product-category">
                                                        <c:forEach items="${sessionScope.listCategories}" var="C">
                                                           <c:if test="${C.key eq P.categoryId}">${C.value}</c:if>
                                                        </c:forEach>
                                                        </div>
                                                        <div class="product-id">Product id: <span class="product-id-value">${P.id}</span></div>
                                                    </div>
                                               </td>
                                            </c:if>
                                        </c:forEach>
                                        <td>${D.price} <span>$</span></td>
                                        <td>${D.quantity}</td>
                                        <td>${D.price * D.quantity} <span>$</span></td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                            <tfoot>
                                <tr>
                                    <td colspan="3">Total money:</td>
                                    <td><span class="total-money fs-4 text-danger">${requestScope.order.totalPrice} <span>$</span></span></td>
                                </tr>
                            </tfoot>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <!-- Footer -->
        <%@include file="components/footerComponent.jsp" %>
        <!-- Bootstrap core JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS -->
        <script src="js/scripts.js"></script>
        <!-- Jquery -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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



