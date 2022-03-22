<%-- 
    Document   : blog
    Created on : Mar 20, 2022, 4:05:28 PM
    Author     : KhoaHD7621
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Blog</title>
        <!-- Favicon -->
        <link rel="icon" type="image/x-icon" href="./images/favicon.png"/>
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
        <link href="css/my-styles.css" rel="stylesheet">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="fonts/iconic/css/material-design-iconic-font.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="fonts/linearicons-v1.0.0/icon-font.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
        <!--===============================================================================================-->	
        <link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="vendor/animsition/css/animsition.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="vendor/perfect-scrollbar/perfect-scrollbar.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="css/util.css">
        <link rel="stylesheet" type="text/css" href="css/main.css">
        <!--===============================================================================================-->
    </head>
    <body class="animsition">
        <!-- Home Menu -->
        <%@include file="components/headerComponent.jsp" %>
        <!-- Toast MSG -->
        <div id="toast"></div>

        <!-- Title page -->
        <section class="bg-img1 txt-center p-lr-15 p-tb-92" style="background-image: url('images/bg-02.jpg');">
            <h2 class="ltext-105 cl0 txt-center">
                Blog
            </h2>
        </section>	

        <!-- Content page -->
        <section class="bg0 p-t-62">
            <div class="container">
                <div class="row">
                    <div class="col-md-8 col-lg-9 p-b-80">
                        <div class="p-r-45 p-r-0-lg">
                            <c:forEach items="${requestScope.listBlogs}" var="B">
                                <!-- item blog -->
                                <div class="p-b-63">
                                    <c:url var="linkDetail" value="blogDetail">
                                        <c:param name="bid" value="${B.id}"></c:param>
                                    </c:url>
                                    <a href="${linkDetail}" class="hov-img0 how-pos5-parent">
                                        <img src="${B.coverImgPath}" alt="IMG-BLOG" style="height: 500px;">

                                        <div class="flex-col-c-m size-123 bg9 how-pos5">
                                            <span class="ltext-107 cl2 txt-center">
                                                <fmt:formatDate value="${B.createdDate}" pattern="d"/>
                                            </span>

                                            <span class="stext-109 cl3 txt-center">
                                                <fmt:formatDate value="${B.createdDate}" pattern="M"/> <fmt:formatDate value="${B.createdDate}" pattern="y"/>
                                            </span>
                                        </div>
                                    </a>

                                    <div class="p-t-32">
                                        <h4 class="p-b-15">
                                            <a href="${linkDetail}" class="ltext-108 cl2 hov-cl1 trans-04 text-decoration-none">
                                                ${B.title}
                                            </a>
                                        </h4>

                                        <p class="stext-117 cl6">
                                            ${B.description}
                                        </p>

                                        <div class="flex-w flex-sb-m p-t-18">
                                            <span class="flex-w flex-m stext-111 cl2 p-r-30 m-tb-10">
                                                <span>
                                                    <span class="cl4">By</span> ${B.account.fullName}
                                                    <span class="cl12 m-l-4 m-r-6">|</span>
                                                </span>

                                                <span>
                                                    ${sessionScope.listBlogCategories.get(B.cateId)}
                                                    <span class="cl12 m-l-4 m-r-6">|</span>
                                                </span>

                                                <span>
                                                    ${B.comment.size()} Comments
                                                </span>
                                            </span>
                                            <a href="${linkDetail}" class="stext-101 cl2 hov-cl1 trans-04 m-tb-10 text-decoration-none">
                                                Continue Reading<i class="bi bi-arrow-right"></i>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>

                            <!-- Pagination -->
                            <div class="flex-l-m flex-w w-full p-t-10 m-lr--7">
                                <a href="#" class="flex-c-m how-pagination1 trans-04 m-all-7 active-pagination1 text-decoration-none">
                                    1
                                </a>

                                <a href="#" class="flex-c-m how-pagination1 trans-04 m-all-7 text-decoration-none">
                                    2
                                </a>
                            </div>
                        </div>
                    </div>

                    <!-- Side Menu -->
                    <%@include file="components/sideMenuBlogComponent.jsp" %>
                </div>
            </div>
        </section>
        <c:if test="${empty sessionScope.LOGIN_USER}">
            <!-- Subscribe News Letter -->
            <%@include file="components/subscribeNewsLetterComponent.jsp" %>
        </c:if>
        <!-- Footer -->
        <%@include file="components/footerComponent.jsp" %>
        <!-- Back to top -->
        <div class="btn-back-to-top" id="myBtn">
            <span class="symbol-btn-back-to-top">
                <i class="zmdi zmdi-chevron-up"></i>
            </span>
        </div>
        <!-- Bootstrap core JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
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
        <!--===============================================================================================-->
        <script src="vendor/animsition/js/animsition.min.js"></script>
        <!--===============================================================================================-->
        <script src="vendor/bootstrap/js/popper.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.min.js"></script>
        <!--===============================================================================================-->
        <script src="vendor/select2/select2.min.js"></script>
        <script>
            $(".js-select2").each(function () {
                $(this).select2({
                    minimumResultsForSearch: 20,
                    dropdownParent: $(this).next('.dropDownSelect2')
                });
            })
        </script>
        <!--===============================================================================================-->
        <script src="vendor/MagnificPopup/jquery.magnific-popup.min.js"></script>
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
        <!--===============================================================================================-->
        <script src="js/main.js"></script>

    </body>
</html>
