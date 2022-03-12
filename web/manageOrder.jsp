<%-- 
    Document   : manageOrder
    Created on : Mar 8, 2022, 6:57:53 PM
    Author     : KhoaHD7621
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <%@include file="components/adminHeadComponent.jsp" %>
        <title>Manage Order</title>
        <!-- Datepicker -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/css/datepicker.min.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js" type="text/javascript"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/js/bootstrap-datepicker.min.js" type="text/javascript"></script>
    </head>
    <body class="sb-nav-fixed">
        <!-- Admin navbar -->
        <%@include file="components/adminNavBarComponent.jsp" %>
        <div id="layoutSidenav">
            <!-- Admin Slidenav -->
            <%@include file="components/adminSlideNavComponent.jsp" %>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">Manage Orders</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">All current orders in system</li>
                        </ol>
                        <c:choose>
                            <c:when test="${not empty requestScope.MSG_SUCCESS}">
                                <div class="alert alert-success fs-3" role="alert">
                                    ${requestScope.MSG_SUCCESS}
                                </div>
                            </c:when>
                            <c:when test="${not empty requestScope.MSG_ERROR}">
                                <div class="alert alert-danger fs-3" role="alert">
                                    ${requestScope.MSG_ERROR}
                                </div>
                            </c:when>
                        </c:choose>
                        <!-- Search order by date -->
                        <form action="AdminSearchOrderController" class="mt-3 mb-3 row">
                            <label class="fs-4">Search order</label>
                            <div class="form-group col-md-6">
                                <label for="dp1">From: </label>
                                <div class="input-group">
                                    <div class="input-group-text" id="btnGroupAddon"><i class="bi bi-calendar3"></i></div>
                                    <input id="dp1" type="text" class="form-control clickable input-md" id="DtChkIn" name="from" value="${requestScope.from}" required>
                                </div>
                            </div>
                            <div class="form-group col-md-6">
                                <label for="dp2">To: </label>
                                <div class="input-group">
                                    <div class="input-group-text" id="btnGroupAddon"><i class="bi bi-calendar3"></i></div>
                                    <input id="dp2" type="text" class="form-control clickable input-md" id="DtChkOut" name="to" value="${requestScope.to}" required>
                                </div>
                            </div>
                            <div class="form-group col-md-2 pt-3">
                                <button type="submit" class="btn btn-primary">Search</button>
                            </div>
                        </form>
                        <!-- Table Order Processing -->
                        <div class="card mb-4">
                            <div class="card-header fw-bold">
                                <i class="bi bi-table"></i>
                                Processing Order Table
                            </div>
                            <div class="card-body">
                                <table id="processingOrderTable">
                                    <thead>
                                        <tr>
                                            <th>Id</th>
                                            <th>Order Date</th>
                                            <th>Ship Date</th>
                                            <th>Note</th>
                                            <th>Total Price</th>
                                            <th>Acc Id</th>
                                            <th>Status</th>
                                            <th>Shipping Id</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>Id</th>
                                            <th>Order Date</th>
                                            <th>Ship Date</th>
                                            <th>Note</th>
                                            <th>Total Price</th>
                                            <th>Status</th>
                                            <th>Acc Id</th>
                                            <th>Shipping Id</th>
                                            <th>Action</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                        <c:forEach items="${requestScope.listOrders}" var="LO">
                                            <c:if test="${LO.status == 1}">
                                                <tr>
                                                    <td>${LO.orderId}</td>
                                                    <td>${LO.orderDate}</td>
                                                    <td>${not empty LO.shipDate ? LO.shipDate : "Null"}</td>
                                                    <td>${LO.note}</td>
                                                    <td>$${LO.totalPrice}</td>
                                                    <td>${LO.accId}</td>
                                                    <td><span class="text-warning">Processing</span></td>
                                                    <td>${LO.shippingId}</td>
                                                    <td>
                                                        <!-- Block btn -->
                                                        <span>
                                                            <!-- Button trigger modal -->
                                                            <button type="button" class="btn btn-outline-success w-100" data-bs-toggle="modal" data-bs-target="#blockBtn${LO.orderId}">
                                                                Complete
                                                            </button>
                                                            <!-- Modal -->
                                                            <div class="modal fade" id="blockBtn${LO.orderId}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                                <div class="modal-dialog modal-dialog-centered">
                                                                    <div class="modal-content">
                                                                        <div class="modal-header">
                                                                            <h5 class="modal-title" id="exampleModalLabel">Alert</h5>
                                                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                                        </div>
                                                                        <div class="p-4 text-center fs-3"
                                                                             style="color: red;">
                                                                            You are confirming order completion with order id "<span class="text-dark">${LO.orderId}</span>"
                                                                        </div>
                                                                        <form action="ChangeOrderController" method="POST">
                                                                            <input type="hidden" name="orderId" value="${LO.orderId}"/>
                                                                            <div class="modal-footer">
                                                                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">No</button>
                                                                                <button id="update-profile-btn" type="submit" class="btn btn-danger" name="action" value="completeOrder">Yes</button>
                                                                            </div>
                                                                        </form>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </span>
                                                    </td>
                                                </tr>
                                            </c:if>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <!-- Table Order Completed -->
                        <div class="card mb-4">
                            <div class="card-header fw-bold">
                                <i class="bi bi-table"></i>
                                Completed Order Table
                            </div>
                            <div class="card-body">
                                <table id="completedOrderTable">
                                    <thead>
                                        <tr>
                                            <th>Id</th>
                                            <th>Order Date</th>
                                            <th>Ship Date</th>
                                            <th>Note</th>
                                            <th>Total Price</th>
                                            <th>Acc Id</th>
                                            <th>Status</th>
                                            <th>Shipping Id</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>Id</th>
                                            <th>Order Date</th>
                                            <th>Ship Date</th>
                                            <th>Note</th>
                                            <th>Total Price</th>
                                            <th>Status</th>
                                            <th>Acc Id</th>
                                            <th>Shipping Id</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                        <c:forEach items="${requestScope.listOrders}" var="LO">
                                            <c:if test="${LO.status == 2}">
                                                <tr>
                                                    <td>${LO.orderId}</td>
                                                    <td>${LO.orderDate}</td>
                                                    <td>${not empty LO.shipDate ? LO.shipDate : "Null"}</td>
                                                    <td>${LO.note}</td>
                                                    <td>$${LO.totalPrice}</td>
                                                    <td>${LO.accId}</td>
                                                    <td><span class="text-success">Completed</span></td>
                                                    <td>${LO.shippingId}</td>
                                                </tr>
                                            </c:if>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <!-- Table Order Canceled -->
                        <div class="card mb-4">
                            <div class="card-header fw-bold">
                                <i class="bi bi-table"></i>
                                Canceled Order Table
                            </div>
                            <div class="card-body">
                                <table id="canceledOrderTable">
                                    <thead>
                                        <tr>
                                            <th>Id</th>
                                            <th>Order Date</th>
                                            <th>Ship Date</th>
                                            <th>Note</th>
                                            <th>Total Price</th>
                                            <th>Acc Id</th>
                                            <th>Status</th>
                                            <th>Shipping Id</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>Id</th>
                                            <th>Order Date</th>
                                            <th>Ship Date</th>
                                            <th>Note</th>
                                            <th>Total Price</th>
                                            <th>Status</th>
                                            <th>Acc Id</th>
                                            <th>Shipping Id</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                        <c:forEach items="${requestScope.listOrders}" var="LO">
                                            <c:if test="${LO.status == 3}">
                                                <tr>
                                                    <td>${LO.orderId}</td>
                                                    <td>${LO.orderDate}</td>
                                                    <td>${not empty LO.shipDate ? LO.shipDate : "Null"}</td>
                                                    <td>${LO.note}</td>
                                                    <td>$${LO.totalPrice}</td>
                                                    <td>${LO.accId}</td>
                                                    <td><span class="text-danger">Canceled</span></td>
                                                    <td>${LO.shippingId}</td>
                                                </tr>
                                            </c:if>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </main>
                <!-- Footer -->
                <jsp:include page="components/adminFooter.jsp"></jsp:include>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="js/datatables-simple-demo.js"></script>
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

