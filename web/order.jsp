<%-- 
    Document   : order
    Created on : Mar 7, 2022, 8:17:16 PM
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
        <title>Orders</title>
        <!-- Favicon -->
        <link rel="icon" type="image/x-icon" href="./images/favicon.png"/>
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
        <link href="css/my-styles.css" rel="stylesheet">
        <!-- Datepicker -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/css/datepicker.min.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js" type="text/javascript"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/js/bootstrap-datepicker.min.js" type="text/javascript"></script>
    </head>

    <body>
        <!-- Contact Head -->
        <%@include file="components/contactHeadComponent.jsp" %>
        <!-- Navigation -->
        <%@include file="components/navBarComponent.jsp" %>
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
        <!-- Orders List -->
        <div class="container mb-5">
            <h1 class="pb-3 default-cursor">Welcome, <span class="text-warning">${sessionScope.LOGIN_USER.fullName}</span>!</h1>
            <div class="row">
                <div class="col-md-3">
                    <div class="list-group">
                        <a type="button" class="list-group-item list-group-item-action ${((not empty requestScope.orderStatus) and (requestScope.orderStatus == 0)) ? "active" : ""}" href="UserViewOrderController">All orders</a>
                        <c:forEach items="${sessionScope.listOrderStatus}" var="L">
                            <c:url var="mylink" value="UserViewOrderController">
                                <c:param name="orderStatus" value="${L.key}"></c:param>
                            </c:url>
                            <a type="button" class="list-group-item list-group-item-action ${(not empty requestScope.orderStatus) and (L.key eq requestScope.orderStatus) ? "active" : ""}" href="${mylink}">${L.value}</a>
                        </c:forEach>
                    </div>
                    <!-- Search order by date -->
                    <form action="SearchOrderServlet" class="mt-3">
                        <label class="fs-4">Search order</label>
                        <div class="form-group">
                            <label for="dp1">From: </label>
                            <div class="input-group">
                                <div class="input-group-text" id="btnGroupAddon"><i class="bi bi-calendar3"></i></div>
                                <input id="dp1" type="text" class="form-control clickable input-md" id="DtChkIn" name="from" value="${requestScope.from}" required>
                            </div>
                        </div>
                        <div class="form-group mt-2">
                            <label for="dp2">To: </label>
                            <div class="input-group">
                                <div class="input-group-text" id="btnGroupAddon"><i class="bi bi-calendar3"></i></div>
                                <input id="dp2" type="text" class="form-control clickable input-md" id="DtChkOut" name="to" value="${requestScope.to}" required>
                            </div>
                        </div>
                        <button type="submit" class="btn btn-primary mt-2">Search</button>
                    </form>
                </div>
                <div class="col-md-9 default-cursor">
                    <h3 class="text-center mb-4 pt-4 pt-md-0">List Orders</h3>
                    <c:choose>
                        <c:when test="${not empty requestScope.MSG_SUCCESS}">
                            <div class="alert alert-success" role="alert">
                                ${requestScope.MSG_SUCCESS}
                            </div>
                        </c:when>
                        <c:when test="${not empty requestScope.MSG_ERROR}">
                            <div class="alert alert-danger" role="alert">
                                ${requestScope.MSG_ERROR}
                            </div>
                        </c:when>
                    </c:choose>
                    <c:choose>
                        <c:when test="${empty requestScope.NO_ORDER}">
                            <!-- Order List -->
                            <table class="table table-striped table-hover text-center">
                                <thead>
                                    <tr>
                                        <th scope="col">Id</th>
                                        <th scope="col">Order Date</th>
                                        <th scope="col">Ship Date</th>
                                        <th scope="col">Status</th>
                                        <th scope="col">View</th>
                                        <th scope="col">Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${requestScope.orderList}" var="O">
                                        <tr>
                                            <th scope="row">${O.orderId}</th>
                                            <td>${O.orderDate}</td>
                                            <td>${empty O.shipDate ? '<span class="fst-italic">null</span>' : O.shipDate}</td>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${O.status == 1}">
                                                        <div class="text-warning">Processing</div>
                                                    </c:when>
                                                    <c:when test="${O.status == 2}">
                                                        <span class="text-success">Completed</span>
                                                    </c:when>
                                                    <c:when test="${O.status == 3}">
                                                        <div class="text-danger">Canceled</div>
                                                    </c:when>
                                                </c:choose>
                                            </td>
                                            <td>
                                                <c:url var="detailLink" value="UserViewOrderDetailController">
                                                    <c:param name="orderId" value="${O.orderId}"></c:param>
                                                </c:url>
                                                <a href="${detailLink}" class="text-decoration-none">Detail</a>
                                            </td>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${O.status == 1}">
                                                        <!-- Block btn -->
                                                        <span>
                                                            <!-- Button trigger modal -->
                                                            <a type="button" href="" class="text-danger" data-bs-toggle="modal" data-bs-target="#blockBtn${O.orderId}">
                                                                Cancel order
                                                            </a>
                                                            <!-- Modal -->
                                                            <div class="modal fade" id="blockBtn${O.orderId}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                                <div class="modal-dialog modal-dialog-centered">
                                                                    <div class="modal-content">
                                                                        <div class="modal-header">
                                                                            <h5 class="modal-title" id="exampleModalLabel">Warning</h5>
                                                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                                        </div>
                                                                        <div class="p-4 text-center fs-3"
                                                                             style="color: red;">
                                                                            Are you sure you want to cancel this order "<span class="text-dark">${O.orderId}</span>"?
                                                                        </div>
                                                                        <div class="modal-footer">
                                                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                                                                            <c:url var="cancelOrder" value="UpdateOrderController">
                                                                                <c:param name="orderStatuss" value="${O.status}"></c:param>
                                                                                <c:param name="orderId" value="${O.orderId}"></c:param>
                                                                            </c:url>
                                                                            <a href="${cancelOrder}" type="button" class="btn btn-danger">Yes</a>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </span>
                                                    </c:when>
                                                    <c:when test="${O.status == 2}">
                                                        <span class="fst-italic">None</span>
                                                    </c:when>
                                                    <c:when test="${O.status == 3}">
                                                        <!-- Block btn -->
                                                        <span>
                                                            <!-- Button trigger modal -->
                                                            <a type="button" href="" class="text-primary" data-bs-toggle="modal" data-bs-target="#blockBtnS${O.orderId}">
                                                                Order again
                                                            </a>
                                                            <!-- Modal -->
                                                            <div class="modal fade" id="blockBtnS${O.orderId}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                                <div class="modal-dialog modal-dialog-centered">
                                                                    <div class="modal-content">
                                                                        <div class="modal-header">
                                                                            <h5 class="modal-title" id="exampleModalLabel">Warning</h5>
                                                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                                        </div>
                                                                        <div class="p-4 text-center fs-3">
                                                                            Are you sure you want to reorder this order "<span style="color: red;">${O.orderId}</span>"?
                                                                        </div>
                                                                        <div class="modal-footer">
                                                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                                                                            <c:url var="orderAgain" value="UpdateOrderController">
                                                                                <c:param name="orderStatuss" value="${O.status}"></c:param>
                                                                                <c:param name="orderId" value="${O.orderId}"></c:param>
                                                                            </c:url>
                                                                            <a href="${orderAgain}" type="button" class="btn btn-danger">Reorder</a>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </span>
                                                    </c:when>
                                                </c:choose>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </c:when>
                        <c:otherwise>
                            <h3>${requestScope.NO_ORDER}</h3>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>
        <!-- Footer -->
        <%@include file="components/footerComponent.jsp" %>
        <!-- Bootstrap core JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS -->
        <script src="js/my-scripts.js"></script>
        <script>
            let checkin = $('#dp1').datepicker({
                autoclose: true
            }).on('changeDate', function (ev) {
                if (ev.date.valueOf() > checkout.datepicker("getDate").valueOf() || !checkout.datepicker("getDate").valueOf()) {

                    let newDate = new Date(ev.date);
                    newDate.setDate(newDate.getDate() + 1);
                    checkout.datepicker("update", newDate);

                }
                $('#dp2')[0].focus();
            });

            let checkout = $('#dp2').datepicker({
                beforeShowDay: function (date) {
                    if (!checkin.datepicker("getDate").valueOf()) {
                        return date.valueOf() >= new Date().valueOf();
                    } else {
                        return date.valueOf() > checkin.datepicker("getDate").valueOf();
                    }
                },
                autoclose: true

            }).on('changeDate', function (ev) { });
        </script>
    </body>

</html>