<%-- 
    Document   : admin
    Created on : Mar 5, 2022, 6:58:11 PM
    Author     : KhoaHD7621
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <%@include file="components/adminHeadComponent.jsp" %>
        <title>Admin - Dashboard</title>
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
                        <h1 class="mt-4">Dashboard</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">Overview</li>
                        </ol>
                        <div class="row">
                            <div class="col-xl-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-area me-1"></i>
                                        Area Chart Example
                                    </div>
                                    <div class="card-body"><canvas id="myAreaChart" width="100%" height="40"></canvas></div>
                                </div>
                            </div>
                            <div class="col-xl-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-bar me-1"></i>
                                        Bar Chart Example
                                    </div>
                                    <div class="card-body"><canvas id="myBarChart" width="100%" height="40"></canvas></div>
                                </div>
                            </div>
                        </div>
                        <!-- Account Table -->
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="bi bi-table"></i>
                                Accounts table
                            </div>
                            <div class="card-body">
                                <table id="accountsTable">
                                    <thead>
                                        <tr>
                                            <th>Id</th>
                                            <th>Email</th>
                                            <th>Name</th>
                                            <th>Password</th>
                                            <th>Phone</th>
                                            <th>Status</th>
                                            <th>Role</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>Id</th>
                                            <th>Email</th>
                                            <th>Name</th>
                                            <th>Password</th>
                                            <th>Phone</th>
                                            <th>Status</th>
                                            <th>Role</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                        <c:forEach items="${requestScope.listAccounts}" var="LA">
                                            <tr>
                                                <td>${LA.accId}</td>
                                                <td>${LA.email}</td>
                                                <td>${LA.fullName}</td>
                                                <td>${LA.password}</td>
                                                <td>${LA.phone}</td>
                                                <c:choose>
                                                    <c:when test="${LA.status == 1}">
                                                        <td style="color: blue;">Active</td>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <td style="color: red;">inActive</td>
                                                    </c:otherwise>
                                                </c:choose>
                                                <c:choose>
                                                    <c:when test="${LA.role == 1}">
                                                        <td style="color: purple;">Admin</td>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <td>User</td>
                                                    </c:otherwise>
                                                </c:choose>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <!-- Orders Table -->
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="bi bi-table"></i>
                                Orders table
                            </div>
                            <div class="card-body">
                                <table id="ordersTable">
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
                                            <tr>
                                                <td>${LO.orderId}</td>
                                                <td>${LO.orderDate}</td>
                                                <td>
                                                    <c:choose>
                                                        <c:when test="${not empty LO.shipDate}">
                                                            ${LO.shipDate}
                                                        </c:when>
                                                        <c:otherwise>
                                                            <span class="fst-italic">Null</span>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </td>
                                                <td>${LO.note}</td>
                                                <td>$${LO.totalPrice}</td>
                                                <td>${LO.accId}</td>
                                                <td>
                                                    <c:choose>
                                                        <c:when test="${LO.status == 1}">
                                                            <span class="text-warning">Processing</span>
                                                        </c:when>
                                                        <c:when test="${LO.status == 2}">
                                                            <span class="text-primary">Completed</span>
                                                        </c:when>
                                                        <c:when test="${LO.status == 3}">
                                                            <span class="text-danger">Canceled</span>
                                                        </c:when>
                                                    </c:choose>
                                                </td>
                                                <td>${LO.shippingId}</td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <!-- Plant table -->
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="bi bi-table"></i>
                                Plants table
                            </div>
                            <div class="card-body">
                                <table id="plantsTable">
                                    <thead>
                                        <tr>
                                            <th>Id</th>
                                            <th>Name</th>
                                            <th style="width: 100px;">Image</th>
                                            <th>Price</th>
                                            <th>Description</th>
                                            <th>Status</th>
                                            <th>Category</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>Id</th>
                                            <th>Name</th>
                                            <th style="width: 100px;">Image</th>
                                            <th>Price</th>
                                            <th>Description</th>
                                            <th>Status</th>
                                            <th>Category</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                        <c:forEach items="${requestScope.listPlants}" var="LP">
                                            <tr>
                                                <td>${LP.id}</td>
                                                <td>${LP.name}</td>
                                                <td style="width: 100px;"><img src="${LP.imgPath}" style="width: 50%;"></td>
                                                <td>$${LP.price}</td>
                                                <td>${LP.description}</td>
                                                <c:choose>
                                                    <c:when test="${LP.status == 1}">
                                                        <td style="color: blue;">Available</td>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <td style="color: red;">Unavailable</td>
                                                    </c:otherwise>
                                                </c:choose>
                                                <td>
                                                    ${sessionScope.listCategories.get(LP.categoryId)}
                                                </td>
                                            </tr>
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
        <script src="demo/chart-area-demo.js"></script>
        <script src="demo/chart-bar-demo.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="js/datatables-simple-demo.js"></script>
    </body>
</html>
