<%-- 
    Document   : sendMail
    Created on : Mar 10, 2022, 2:44:55 PM
    Author     : KhoaHD7621
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <%@include file="components/adminHeadComponent.jsp" %>
        <title>Admin - Mail</title>
    </head>
    <body class="sb-nav-fixed">
        <!-- Admin navbar -->
        <%@include file="components/adminNavBarComponent.jsp" %>
        <div id="layoutSidenav">
            <!-- Admin Slidenav -->
            <%@include file="components/adminSlideNavComponent.jsp" %>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container mt-5 mb-5">
                        <h2>Send Email</h2>
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
                        <form action="SendEmailController">
                            <div class="form-group pt-3">
                                <h4 for="exampleFormControlInput1">To email: </h4>
                                <input name="email" type="email" class="form-control" id="exampleFormControlInput1" placeholder="name@example.com" required>
                            </div>
                            <div class="form-group pt-3">
                                <h4 for="subjectFormControlInput1">Subject: </h4>
                                <input name="subject" type="text" class="form-control" id="subjectFormControlInput1" placeholder="Congratulation ..." required>
                            </div>
                            <div class="form-group pt-3">
                                <h4 for="exampleFormControlTextarea1">Message: </h4>
                                <textarea name="message" class="form-control" id="exampleFormControlTextarea1" rows="10" required>
Dear Mr/Ms ....,
                                    
...
Sincrely thank you!
                                </textarea>
                            </div>
                            <button type="submit" name="action" value="sendEmailToCust" class="btn btn-primary mt-4" style="width: 100px;">Send</button>
                        </form>
                    </div>
                </main>
                <!-- Footer -->
                <jsp:include page="components/adminFooter.jsp"></jsp:include>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="js/scripts.js"></script>
    </body>
</html>
